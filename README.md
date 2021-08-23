# Analyzing space-time satellite data for disease ecology applications with GRASS GIS and R

In this session we will explore the combined use of GRASS GIS and R following an example of habitat suitability modeling. We will use a daily time series of LST to extract relevant environmental variables for a mosquito species that transmits West Nile virus in Northern Italy. Particularly, we will use TGRASS to estimate bioclimatic variables such as those from Worldclim, autumnal cooling, spring warming, number of consecutive days with a certain LST value, number of potential mosquito generations, etc. We will then import our vector and raster maps into R and proceed with the habitat suitability modeling and prediction.

## Software

### GRASS GIS

We will use **GRASS GIS 7.8+**. It can be installed either 
through standalone installers/binaries or through
[OSGeo-Live](https://live.osgeo.org/en/index.html) 
(a linux based virtual machine which includes all OSGeo software and packages).

##### MS Windows

There are two different options:
1. [Standalone installer 64-bit](https://grass.osgeo.org/grass78/binary/mswindows/native/x86_64/WinGRASS-7.8.5-2-Setup-x86_64.exe) 
2. [OSGeo4W 64-bit](http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe) 

For Windows users, **we strongly recommend installing GRASS GIS through the OSGeo4W package** (second option), 
since it allows to install all OSGeo software. See this 
[**installation guide**](https://gitlab.com/veroandreo/grass-gis-conae/-/blob/master/pdf/00_installation.pdf) 
for details (Follow only the GRASS GIS part).

##### Ubuntu Linux

Install GRASS GIS 7.8.5 from the "unstable" package repository:

```
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
sudo apt-get install grass grass-gui grass-dev
```

##### Fedora, openSuSe Linux

For other Linux distributions including **Fedora** and **openSuSe**, simply install GRASS GIS with the respective package manager. See also [here](https://grass.osgeo.org/download/)

##### Mac OS

Have a look at: http://grassmac.wikidot.com/downloads

#### GRASS GIS Add-on that will be used during the demo

* [r.bioclim](https://grass.osgeo.org/grass7/manuals/addons/r.bioclim.html): Calculates bioclimatic indices as those in [WorldClim](https://www.worldclim.org/bioclim).

Install with `g.extension extension=name_of_addon`

**Attention UNIX-like users:** `g.extension` is currently failing in GRASS. See
alternative solutions 
[here](https://grass.osgeo.org/news/2021_08_01_g_extension_currently_not_working/) or 
[download](https://github.com/OSGeo/grass-addons/archive/refs/heads/grass7.zip) the addons
repo and use: `g.extension extension=name_of_addon url=path/to/addon/folder`.

## R and R-Studio

Well, you know and you'll have it installed for sure :smile: 
The following packages should be installed beforehand:

```r
  install.packages(c("rgrass7","raster","sf","mapview","biomod2"))
```

## Other software

We will use the software **MaxEnt** to model habitat suitability. The software can be downloaded from: https://biodiversityinformatics.amnh.org/open_source/maxent/

## Data

Please, create a folder in your `$HOME` directory, or under `Documents` if in Windows, and name it **grassdata_ogh**. Then, download the following ready to use *location* and unzip  within `grassdata_ogh`:

* [Northern Italy (1.7 Gb)](https://drive.google.com/file/d/1z1b2NLC4Z6yzz_57RddTdRRK_gUkd7fU/view?usp=sharing)

In the end, your `grassdata` folder should look like this:

```
  grassdata/
  └── eu_laea
      ├── italy_LST_daily
      └── PERMANENT
```


## Bio

[**Verónica Andreo**](https://veroandreo.gitlab.io/) is a biologist. She holds a PhD in
Biological Sciences and an MSc in Remote Sensing and GIS applications. She works as a 
researcher for [CONICET](https://www.conicet.gov.ar/) and lecturer at
[Gulich Institute](http://ig.conae.unc.edu.ar/) - Argentinian Space
Agency [(CONAE)](https://www.argentina.gob.ar/ciencia/conae) in Córdoba, Argentina.
Her research is focused on uncovering **environmental drivers of vector-borne disease outbreaks**. 
She is mostly interested in those environmental features that can be derived 
**by means of satellite image analysis, remote sensing time series and GIS-based techniques**. 

Verónica is part of the [GRASS GIS](https://grass.osgeo.org/) Development team and has 
recently become [the new PSC chair](https://grass.osgeo.org/news/2021_02_05_new_grass_psc/). 
She is a strong advocate for [OSGeo](https://www.osgeo.org/) and free and open 
source software for geo-spatial (FOSS4G), currently serving as Program Committee chair 
for [**FOSS4G 2021**](2021.foss4g.org/). Among other things, she has volunteered as a 
mentor for GRASS GIS in the [Google Code-In contest](https://codein.withgoogle.com/)
introducing high school students into the Open Source world.

## GRASS References

- Neteler, M. and Mitasova, H. (2008): *Open Source GIS: A GRASS GIS Approach*. Third edition. ed. Springer, New York. [Book site](https://grassbook.org/)
- Neteler, M., Bowman, M.H., Landa, M. and Metz, M. (2012): *GRASS GIS: a multi-purpose Open Source GIS*. Environmental Modelling & Software, 31: 124-130 [DOI](http://dx.doi.org/10.1016/j.envsoft.2011.11.014)
- Gebbert, S. and Pebesma, E. (2014). *A temporal GIS for field based environmental modeling*. Environmental Modelling & Software, 53, 1-12. [DOI](https://doi.org/10.1016/j.envsoft.2013.11.001)
- Gebbert, S. and Pebesma, E. (2017). *The GRASS GIS temporal framework*. International Journal of Geographical Information Science, 31, 1273-1292. [DOI](http://dx.doi.org/10.1080/13658816.2017.1306862)
- Gebbert, S., Leppelt, T. and Pebesma, E. (2019). *A Topology Based Spatio-Temporal Map Algebra for Big Data Analysis*. Data, 4, 86. [DOI](https://doi.org/10.3390/data4020086)

## License

All the course material is under 
[![Creative Commons License](assets/img/ccbysa.png)](http://creativecommons.org/licenses/by-sa/4.0/) Creative Commons Attribution-ShareAlike 4.0 International License
