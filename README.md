# GRASS GIS presentations at the OpenGeoHub Summer School 2019, M&uuml;nster


- [GRASS and R for disease ecology applications - Thursday](https://github.com/veroandreo/grass_opengeohub2019/blob/master/pdf/tgrass_rstats_disease_ecology.pdf)

## Software

We will use **GRASS GIS 7.8+**. It can be installed either 
through standalone installers/binaries or through OSGeo-Live (which includes all
OSGeo software and packages). See this 
[**installation guide**](https://gitlab.com/veroandreo/grass-gis-conae/-/blob/master/pdf/00_installation.pdf) 
for details (Follow only the GRASS GIS part).

### Standalone installers for different OS:

##### MS Windows

There are two different options:
1. [Standalone installer 64-bit](https://grass.osgeo.org/grass78/binary/mswindows/native/x86_64/WinGRASS-7.8.5-2-Setup-x86_64.exe) 
2. [OSGeo4W 64-bit](http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe) 

For Windows users, **we strongly recommend installing GRASS GIS through the OSGeo4W package** (second option), 
since it allows to install all OSGeo software.

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

### GRASS GIS Add-ons that will be used during the course

* [v.in.pygbif](https://grass.osgeo.org/grass7/manuals/addons/v.in.pygbif.html): Searches and imports [GBIF](https://www.gbif.org/) species distribution data. It requires [pygbif](https://pygbif.readthedocs.io/en/stable/) library.
* [r.bioclim](https://grass.osgeo.org/grass7/manuals/addons/r.bioclim.html): Calculates bioclimatic indices as those in [WorldClim](https://www.worldclim.org/bioclim).

Install with `g.extension extension=name_of_addon`

## Other software

We will use the software **MaxEnt** to model habitat suitability. The software can be downloaded from: https://biodiversityinformatics.amnh.org/open_source/maxent/

## Data

Please, create a folder in your `$HOME` directory, or under `Documents` if in Windows, and name it **grassdata**. Then, download the following ready to use *location* and unzip them within `grassdata`:

* [Northern Italy (1 Gb)](https://zenodo.org/record/3564515)

In the end, your `grassdata` folder should look like this:

```
  grassdata_ogh/
  └── eu_laea
      ├── italy_LST_daily
      └── PERMANENT
```

## The trainer

[**Verónica Andreo**](https://veroandreo.gitlab.io/) is a researcher for [CONICET](http://www.conicet.gov.ar/?lan=en)
working at the Argentinean Space Agency [(CONAE)](http://ig.conae.unc.edu.ar/)
in Córdoba, Argentina. Her main interests are remote sensing and GIS tools
for disease ecology research fields and applications. 
Vero is an [OSGeo](http://www.osgeo.org/) Charter member and a [FOSS4G](http://foss4g.org/) 
enthusiast and advocate. 
She is part of the [GRASS GIS Development team](https://grass.osgeo.org/home/credits/) 
and she also teaches introductory and advanced courses and workshops, especially 
on GRASS GIS [time series modules](https://grasswiki.osgeo.org/wiki/Temporal_data_processing)
and their applications.

## References

- Neteler, M. and Mitasova, H. (2008): *Open Source GIS: A GRASS GIS Approach*. Third edition. ed. Springer, New York. [Book site](https://grassbook.org/)
- Neteler, M., Bowman, M.H., Landa, M. and Metz, M. (2012): *GRASS GIS: a multi-purpose Open Source GIS*. Environmental Modelling & Software, 31: 124-130 [DOI](http://dx.doi.org/10.1016/j.envsoft.2011.11.014)
- Gebbert, S. and Pebesma, E. (2014). *A temporal GIS for field based environmental modeling*. Environmental Modelling & Software, 53, 1-12. [DOI](https://doi.org/10.1016/j.envsoft.2013.11.001)
- Gebbert, S. and Pebesma, E. (2017). *The GRASS GIS temporal framework*. International Journal of Geographical Information Science, 31, 1273-1292. [DOI](http://dx.doi.org/10.1080/13658816.2017.1306862)
- Gebbert, S., Leppelt, T. and Pebesma, E. (2019). *A Topology Based Spatio-Temporal Map Algebra for Big Data Analysis*. Data, 4, 86. [DOI](https://doi.org/10.3390/data4020086)

## License

All the course material:

[![Creative Commons License](assets/img/ccbysa.png)](http://creativecommons.org/licenses/by-sa/4.0/) Creative Commons Attribution-ShareAlike 4.0 International License

