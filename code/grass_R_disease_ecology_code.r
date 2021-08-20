########################################################################
# R commands for the session:
# "Analysis of space-time satellite data for disease ecology
# applications with GRASS GIS and R stats" at OpenGeoHub Summer School
#
# Modelling Aedes albopictus potential distribution in Northern Italy
#
# Original example contributed by Carol Garzon Lopez
# Adapted by Veronica Andreo
#
# Updated: August, 2021
########################################################################


#
# Install and load required packages
#


# Install packages
install.packages("rgrass7")
install.packages("raster")
install.packages("sf")
install.packages("mapview")
install.packages("biomod2")

# Load libraries
library(rgrass7)
library(raster)
library(sf)
library(mapview)
library(biomod2)


#
# Read vector data
#


# Use sf for vectors
use_sf()

# Read vector layers
Aa_pres <- readVECT("aedes_albopictus")
background <- readVECT("background_points")

# Quick visualization in mapview
mapview(Aa_pres) +
  mapview(background, col.regions=NA, cex=2)


#
# Read raster data
#


# Use sp for rasters (stars support on the way)
use_sp()

# List rasters by pattern
worldclim <- execGRASS("g.list",
                        parameters = list(
                        type = "raster",
                        pattern = "worldclim*"))

avg <- execGRASS("g.list",
                  parameters = list(
                  type = "raster",
                  pattern = "avg*"))

median <- execGRASS("g.list",
                     parameters = list(
                     type = "raster",
                     pattern = "median*",
                     exclude = "*[1-5]"))

# Concatenate map lists
to_import <- c(attributes(worldclim)$resOut,
               attributes(avg)$resOut,
               attributes(median)$resOut)

# Read raster layers
predictors <- list()
for (i in to_import){
  predictors[i] <- raster(readRAST(i))
}

# Quick visualization in mapview
mapview(predictors[['worldclim_bio01']]) + Aa_pres


#
# Data preparation and formatting
#


# Response variable
n_pres <- dim(Aa_pres)[1]
n_backg <- dim(background)[1]

myRespName <- 'Aedes.albopictus'

pres <- rep(1, n_pres)
backg <- rep(0, n_backg)
myResp <- c(pres, backg)

myRespXY <- rbind(st_coordinates(Aa_pres),
		          st_coordinates(background))


# Explanatory variables

# Stack raster layers
myExpl <- raster::stack(predictors)
names(myExpl)

# # Format data as required by biomod
myBiomodData <- BIOMOD_FormatingData(resp.var = myResp,
                                     expl.var = myExpl,
                                     resp.xy = myRespXY,
                                     resp.name = myRespName)

# Inspect data
myBiomodData

# Plot data
plot(myBiomodData)


#
# Run model
#


# Set options
# Change path to MaxEnt accordingly
myBiomodOption <- BIOMOD_ModelingOptions(
  MAXENT.Phillips =
    list(path_to_maxent.jar = "/home/veroandreo/software/maxent/maxent.jar",
         lq2lqptthreshold = 100,
         l2lqthreshold = 100,
         l2lqthreshold = 100))

# Inspect all configs for MaxEnt
myBiomodOption@MAXENT.Phillips

# Run model
myBiomodModelOut <- BIOMOD_Modeling(
  myBiomodData,
  models = c('MAXENT.Phillips'),
  models.options = myBiomodOption,
  NbRunEval=5,
  DataSplit=80,
  VarImport=10,
  models.eval.meth = c('ROC','ACCURACY'),
  SaveObj = TRUE,
  rescal.all.models = FALSE,
  do.full.models = FALSE,
  modeling.id = paste(myRespName,"FirstModeling",sep="_"))

# Inspect the model
myBiomodModelOut


#
# Model evaluation
#


# Extract evaluation data
myBiomodModelEval <- get_evaluations(myBiomodModelOut)

# Accuracy
myBiomodModelEval["ACCURACY","Testing.data",,,]

# ROC: Receiver-operator curve
myBiomodModelEval["ROC","Testing.data",,,]

# Save run with max ROC
max_roc <- which.max(myBiomodModelEval["ROC","Testing.data",,,])

# Plot model evaluation metrics
models_scores_graph(myBiomodModelOut,
                    by = "cv_run",
                    metrics = c("ROC", "ACCURACY"))

# Variable importance
vi <- get_variables_importance(myBiomodModelOut)

# Let's see the first part
head(vi[1:13,1, ,], n = 10L)

# ... and estimate the mean
head(apply(vi, c(1,2), mean))

# Response curves
# Extract model of interest
Aa_maxent <- BIOMOD_LoadModels(myBiomodModelOut, models = "MAXENT.Phillips")

# Plot response curves
resp_curves <- biomod2::response.plot2(models = Aa_maxent,
                                       Data = get_formal_data(myBiomodModelOut,
                                                              "expl.var"),
                                       show.variables = get_formal_data(myBiomodModelOut,
                                                                        "expl.var.names"),
                                       do.bivariate = FALSE,
                                       fixed.var.metric = "median")


#
# Model predictions
#


# Set parameters for model projection
myBiomodProj <- BIOMOD_Projection(
                modeling.output = myBiomodModelOut,
                new.env = myExpl,
                proj.name = "current",
                selected.models = "all",
                compress = FALSE,
                build.clamping.mask = FALSE)

# Obtain predictions
mod_proj <- get_predictions(myBiomodProj)

# Plot predicted model with highest ROC
mapview(mod_proj[[max_roc]])


#
# Optionally, write data back to GRASS GIS
#


# Only one layer
g <- as(mod_proj[[4]], 'SpatialGridDataFrame')
writeRAST(g, "maxent_albopictus", flags = "overwrite")

# Export all MaxEnt runs
for(i in seq_along(1:length(mod_proj@layers))){
  writeRAST(as(mod_proj[[i]], 'SpatialGridDataFrame'),
            paste0("maxent_albopictus_", i, sep=""))
}

# Check it's there
execGRASS("g.list", parameters = list(type = "raster",
                                      pattern = "maxent*"))
