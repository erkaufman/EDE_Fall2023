# Package ID: knb-lter-ntl.9.23 Cataloging System:https://pasta.edirepository.org.
# Data set title: North Temperate Lakes LTER: Groundwater Levels 1984 - current.
# Data set creator:  John Magnuson - University of Wisconsin 
# Data set creator:  Stephen Carpenter - University of Wisconsin 
# Data set creator:  Emily Stanley - University of Wisconsin 
# Metadata Provider:  NTL Information Manager - University of Wisconsin 
# Contact:    -  NTL LTER  - ntl.infomgr@gmail.com
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/9/23/14ace49dc3939cb736c90c8ae08593ce" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")

                   
 dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "year4",     
                    "sampledate",     
                    "wellid",     
                    "well_level",     
                    "flag"    ), check.names=TRUE)
               
unlink(infile1)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt1$year4)=="factor") dt1$year4 <-as.numeric(levels(dt1$year4))[as.integer(dt1$year4) ]               
if (class(dt1$year4)=="character") dt1$year4 <-as.numeric(dt1$year4)                                   
# attempting to convert dt1$sampledate dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp1sampledate<-as.Date(dt1$sampledate,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp1sampledate) == length(tmp1sampledate[!is.na(tmp1sampledate)])){dt1$sampledate <- tmp1sampledate } else {print("Date conversion failed for dt1$sampledate. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp1sampledate) 
if (class(dt1$wellid)!="factor") dt1$wellid<- as.factor(dt1$wellid)
if (class(dt1$well_level)=="factor") dt1$well_level <-as.numeric(levels(dt1$well_level))[as.integer(dt1$well_level) ]               
if (class(dt1$well_level)=="character") dt1$well_level <-as.numeric(dt1$well_level)
if (class(dt1$flag)!="factor") dt1$flag<- as.factor(dt1$flag)
                
# Convert Missing Values to NA for non-dates
                


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(year4)
summary(sampledate)
summary(wellid)
summary(well_level)
summary(flag) 
                # Get more details on character variables
                 
summary(as.factor(dt1$wellid)) 
summary(as.factor(dt1$flag))
detach(dt1)               
         

inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/9/23/a7a38bcfebc74b46e8efb26c133b12ef" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")

                   
 dt2 <-read.csv(infile2,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "wellid",     
                    "lat_decimal",     
                    "long_decimal"    ), check.names=TRUE)
               
unlink(infile2)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt2$wellid)!="factor") dt2$wellid<- as.factor(dt2$wellid)
if (class(dt2$lat_decimal)=="factor") dt2$lat_decimal <-as.numeric(levels(dt2$lat_decimal))[as.integer(dt2$lat_decimal) ]               
if (class(dt2$lat_decimal)=="character") dt2$lat_decimal <-as.numeric(dt2$lat_decimal)
if (class(dt2$long_decimal)=="factor") dt2$long_decimal <-as.numeric(levels(dt2$long_decimal))[as.integer(dt2$long_decimal) ]               
if (class(dt2$long_decimal)=="character") dt2$long_decimal <-as.numeric(dt2$long_decimal)
                
# Convert Missing Values to NA for non-dates
                


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(wellid)
summary(lat_decimal)
summary(long_decimal) 
                # Get more details on character variables
                 
summary(as.factor(dt2$wellid))
detach(dt2)               
        




