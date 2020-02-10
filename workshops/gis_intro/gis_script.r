# author: Abby Stamm
# date: 9 February 2020
# purpose: full script for GIS workshop
# ftp://ftp2.census.gov/geo/tiger/TIGER2010/COUNTY/2010/tl_2010_36_county10.zip
# https://data.census.gov/cedsci/table?q=United%20States&table=DP05&tid=ACSST1Y2010.S0101&g=0100000US_0400000US36.050000&lastDisplayedRow=29&vintage=2018&layer=state&cid=DP05_0001E&t=Age%20and%20Sex%3APopulations%20and%20People&y=2010&hidePreview=true&moe=false


# check these from open data ny
# https://health.data.ny.gov/Health/New-York-State-Population-Data-Beginning-2003/e9uj-s3sf
# https://data.ny.gov/Government-Finance/Annual-Population-Estimates-for-New-York-State-and/krt9-ym2k

# load packages
library(rgdal); library(sp)

# load shapefile
path <- "public/shapefiles/NYS_counties"
shp <- rgdal::readOGR(dsn = path, layer = "tl_2010_36_county10")

head(shp@data)

# remove all variables except geoid10, name10, namelsad10, aland10, awater10, intptlat10, intptlon10

mysubset <- subset(shp, shp@data$NAME10 %in% 
                     c("Albany", "Schenectady", "Rensselaer"))
sp::plot(shp)
sp::plot(mysubset, border = "blue", lwd = 2, add = TRUE)


# subset NYC only (or ROS only)
# create choropleths
# go over creating cut points (options)
# note selecting colors and link to colorbrewer
# http://colorbrewer2.org/


