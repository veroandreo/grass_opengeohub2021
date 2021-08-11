library(rgrass7)

# path to GRASS binaries
myGRASS <- "/usr/lib64/grass78"
# path to GRASS database
myGISDbase <- "/home/veroandreo/grassdata_ogh/"
# path to location
myLocation <- "eu_laea"
# path to mapset
myMapset <- "italy_LST_daily"

# start GRASS GIS from R
initGRASS(gisBase = myGRASS, 
          home = tempdir(), 
          gisDbase = myGISDbase, 
          location = myLocation, 
          mapset = myMapset,
          override = TRUE)

gmeta()
