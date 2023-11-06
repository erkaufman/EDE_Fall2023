# Package ID: knb-lter-ntl.10001.4 Cataloging System:https://pasta.edirepository.org.
# Data set title: Globally distributed lake surface water temperatures collected in situ and by 			satellites; 1985-2009.
# Data set creator:  Sapna Sharma -  
# Data set creator:  Derek Gray -  
# Data set creator:  Jordan Read -  
# Data set creator:  Catherine Oreilly -  
# Data set creator:  Philipp Schneider -  
# Data set creator:  Anam Qudrat -  
# Data set creator:  Corinna Gries -  
# Data set creator:  Samantha Stefanoff -  
# Data set creator:  Stephanie Hampton -  
# Data set creator:  Simon Hook -  
# Data set creator:  John Lenters -  
# Data set creator:  David Livingstone -  
# Data set creator:  Peter McIntyre -  
# Data set creator:  Rita Adrian -  
# Data set creator:  Mathew Allan -  
# Data set creator:  Orlane Anneville -  
# Data set creator:  Lauri Arvola -  
# Data set creator:  Jay Austin -  
# Data set creator:  John Bailey -  
# Data set creator:  Jill Baron -  
# Data set creator:  Justin Brookes -  
# Data set creator:  Yuwei Chen -  
# Data set creator:  Robert Daly -  
# Data set creator:  Martin Dokulil -  
# Data set creator:  Bo Dong -  
# Data set creator:  Kye Ewing -  
# Data set creator:  Elvira de Eyto -  
# Data set creator:  David Hamilton -  
# Data set creator:  Karl Havens -  
# Data set creator:  Shane Haydon -  
# Data set creator:  Harald Hetzenauer -  
# Data set creator:  Joceylene Heneberry -  
# Data set creator:  Amy Hetherington -  
# Data set creator:  Scott Higgins -  
# Data set creator:  Eric Hixcon -  
# Data set creator:  Lyubov Izmest'eva -  
# Data set creator:  Benjamin Jones -  
# Data set creator:  Kullli Kangur -  
# Data set creator:  Peter Kasprzak -  
# Data set creator:  Olivier Koster -  
# Data set creator:  Benjamin Kraemer -  
# Data set creator:  Michio Kumagai -  
# Data set creator:  Esko Kuusisto -  
# Data set creator:  George Leshkevich -  
# Data set creator:  Linda May -  
# Data set creator:  Sally MacIntyre -  
# Data set creator:  Doerthe Mueller-Navarra -  
# Data set creator:  Mikhail Naumenko -  
# Data set creator:  Peeter Noges -  
# Data set creator:  Tiina Noges -  
# Data set creator:  Pius Niederhauser -  
# Data set creator:  Ryan North -  
# Data set creator:  Andrew Paterson -  
# Data set creator:  Pierre-Denis Plisnier -  
# Data set creator:  Anna Rigosi -  
# Data set creator:  Alon Rimmer -  
# Data set creator:  Michela Rogora -  
# Data set creator:  Lars Rudstram -  
# Data set creator:  James Rusak -  
# Data set creator:  Nico Salmaso -  
# Data set creator:  Nihar Samal -  
# Data set creator:  Daniel Schindler -  
# Data set creator:  Geoffrey Schladow -  
# Data set creator:  Silke Schmidt -  
# Data set creator:  Tracey Schultz -  
# Data set creator:  Eugene Silow -  
# Data set creator:  Dietmar Straile -  
# Data set creator:  Katrin Teubner -  
# Data set creator:  Piet Verburg -  
# Data set creator:  Ari Voutilainen -  
# Data set creator:  Andrew Watkinson -  
# Data set creator:  Gesa Weyhenmeyer -  
# Data set creator:  Craig Williamson -  
# Data set creator:  Kara Woo -  
# Contact:    -  NTL LTER  - ntl.infomgr@gmail.com
# Contact:  Sapna Sharma -    - sapna.sharma23@gmail.com
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/10001/4/6e52deaa45c1695e7742c923ba04d16b" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")

                   
 dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
        , col.names=c(
                    "recordID",     
                    "variable",     
                    "year",     
                    "siteID",     
                    "value"    ), check.names=TRUE)
               
unlink(infile1)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt1$recordID)!="factor") dt1$recordID<- as.factor(dt1$recordID)
if (class(dt1$variable)!="factor") dt1$variable<- as.factor(dt1$variable)
if (class(dt1$year)=="factor") dt1$year <-as.numeric(levels(dt1$year))[as.integer(dt1$year) ]               
if (class(dt1$year)=="character") dt1$year <-as.numeric(dt1$year)
if (class(dt1$siteID)!="factor") dt1$siteID<- as.factor(dt1$siteID)
if (class(dt1$value)=="factor") dt1$value <-as.numeric(levels(dt1$value))[as.integer(dt1$value) ]               
if (class(dt1$value)=="character") dt1$value <-as.numeric(dt1$value)
                
# Convert Missing Values to NA for non-dates
                


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(recordID)
summary(variable)
summary(year)
summary(siteID)
summary(value) 
                # Get more details on character variables
                 
summary(as.factor(dt1$recordID)) 
summary(as.factor(dt1$variable)) 
summary(as.factor(dt1$siteID))
detach(dt1)               
         

inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/10001/4/6167b9938e8dc99e9ee75251c70776a9" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")

                   
 dt2 <-read.csv(infile2,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "siteID",     
                    "Lake_name",     
                    "Other_names",     
                    "lake_or_reservoir",     
                    "location",     
                    "region",     
                    "latitude",     
                    "longitude",     
                    "geospatial_accuracy_km",     
                    "elevation_m",     
                    "mean_depth_m",     
                    "max_depth_m",     
                    "surface_area_km2",     
                    "volume_km3",     
                    "source",     
                    "sampling_depth",     
                    "sampling_time_of_day",     
                    "time_period",     
                    "contributor"    ), check.names=TRUE)
               
unlink(infile2)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt2$siteID)!="factor") dt2$siteID<- as.factor(dt2$siteID)
if (class(dt2$Lake_name)!="factor") dt2$Lake_name<- as.factor(dt2$Lake_name)
if (class(dt2$Other_names)!="factor") dt2$Other_names<- as.factor(dt2$Other_names)
if (class(dt2$lake_or_reservoir)!="factor") dt2$lake_or_reservoir<- as.factor(dt2$lake_or_reservoir)
if (class(dt2$location)!="factor") dt2$location<- as.factor(dt2$location)
if (class(dt2$region)!="factor") dt2$region<- as.factor(dt2$region)
if (class(dt2$latitude)=="factor") dt2$latitude <-as.numeric(levels(dt2$latitude))[as.integer(dt2$latitude) ]               
if (class(dt2$latitude)=="character") dt2$latitude <-as.numeric(dt2$latitude)
if (class(dt2$longitude)=="factor") dt2$longitude <-as.numeric(levels(dt2$longitude))[as.integer(dt2$longitude) ]               
if (class(dt2$longitude)=="character") dt2$longitude <-as.numeric(dt2$longitude)
if (class(dt2$geospatial_accuracy_km)=="factor") dt2$geospatial_accuracy_km <-as.numeric(levels(dt2$geospatial_accuracy_km))[as.integer(dt2$geospatial_accuracy_km) ]               
if (class(dt2$geospatial_accuracy_km)=="character") dt2$geospatial_accuracy_km <-as.numeric(dt2$geospatial_accuracy_km)
if (class(dt2$elevation_m)=="factor") dt2$elevation_m <-as.numeric(levels(dt2$elevation_m))[as.integer(dt2$elevation_m) ]               
if (class(dt2$elevation_m)=="character") dt2$elevation_m <-as.numeric(dt2$elevation_m)
if (class(dt2$mean_depth_m)=="factor") dt2$mean_depth_m <-as.numeric(levels(dt2$mean_depth_m))[as.integer(dt2$mean_depth_m) ]               
if (class(dt2$mean_depth_m)=="character") dt2$mean_depth_m <-as.numeric(dt2$mean_depth_m)
if (class(dt2$max_depth_m)=="factor") dt2$max_depth_m <-as.numeric(levels(dt2$max_depth_m))[as.integer(dt2$max_depth_m) ]               
if (class(dt2$max_depth_m)=="character") dt2$max_depth_m <-as.numeric(dt2$max_depth_m)
if (class(dt2$surface_area_km2)=="factor") dt2$surface_area_km2 <-as.numeric(levels(dt2$surface_area_km2))[as.integer(dt2$surface_area_km2) ]               
if (class(dt2$surface_area_km2)=="character") dt2$surface_area_km2 <-as.numeric(dt2$surface_area_km2)
if (class(dt2$volume_km3)=="factor") dt2$volume_km3 <-as.numeric(levels(dt2$volume_km3))[as.integer(dt2$volume_km3) ]               
if (class(dt2$volume_km3)=="character") dt2$volume_km3 <-as.numeric(dt2$volume_km3)
if (class(dt2$source)!="factor") dt2$source<- as.factor(dt2$source)
if (class(dt2$sampling_depth)!="factor") dt2$sampling_depth<- as.factor(dt2$sampling_depth)
if (class(dt2$sampling_time_of_day)!="factor") dt2$sampling_time_of_day<- as.factor(dt2$sampling_time_of_day)
if (class(dt2$time_period)!="factor") dt2$time_period<- as.factor(dt2$time_period)
if (class(dt2$contributor)!="factor") dt2$contributor<- as.factor(dt2$contributor)
                
# Convert Missing Values to NA for non-dates
                


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(siteID)
summary(Lake_name)
summary(Other_names)
summary(lake_or_reservoir)
summary(location)
summary(region)
summary(latitude)
summary(longitude)
summary(geospatial_accuracy_km)
summary(elevation_m)
summary(mean_depth_m)
summary(max_depth_m)
summary(surface_area_km2)
summary(volume_km3)
summary(source)
summary(sampling_depth)
summary(sampling_time_of_day)
summary(time_period)
summary(contributor) 
                # Get more details on character variables
                 
summary(as.factor(dt2$siteID)) 
summary(as.factor(dt2$Lake_name)) 
summary(as.factor(dt2$Other_names)) 
summary(as.factor(dt2$lake_or_reservoir)) 
summary(as.factor(dt2$location)) 
summary(as.factor(dt2$region)) 
summary(as.factor(dt2$source)) 
summary(as.factor(dt2$sampling_depth)) 
summary(as.factor(dt2$sampling_time_of_day)) 
summary(as.factor(dt2$time_period)) 
summary(as.factor(dt2$contributor))
detach(dt2)               
        




