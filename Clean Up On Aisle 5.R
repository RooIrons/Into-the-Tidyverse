
##* This is the updated version of initial code from SAFRING 'diagnostics 2.R' manuscript *##

##* Authors: Alan Lee and Rebecca Irons
  
### Step 1: clear your work space 
rm(list=ls())

### Step 2: install the necessary packages:
#To manipulate the data
install.packages("tidyverse")

#To access the data from SABAP/SAFRING using an api
install.packages("RCurl")
install.packages("rjson")

### Step 3: load the packages that are required 
library(dplyr)
library(ggplot2)
library(broom)
library(RCurl)
library(rjson)

### Step 4: access the SAFRING data for the focal species 
#Make an object for the focal species: Greater Double-collared Sunbird (Ref = 758)
SPP = 758

#Read in the data
ringing_data <- read.csv(paste('https://api.birdmap.africa/safring/species/records_list/',SPP,'?format=csv',sep=""))

### Step 5: make the ages numeric and filter the juveniles from the adult (only working with adults)  

ringing_data$Age <- as.numeric(ringing_data$Age)
ringing_data <- filter(ringing_data, Age>3)

### STep 6: 
# ensure all metric data is numeric
ringing_data$Mass <- as.numeric(as.character(ringing_data$Mass))
ringing_data$Wing <- as.numeric(as.character(ringing_data$Wing))
ringing_data$Culmen <- as.numeric(as.character(ringing_data$Culmen)) 
ringing_data$Head <- as.numeric(as.character(ringing_data$Head))
ringing_data$Tarsus <- as.numeric(as.character(ringing_data$Tarsus))

### Step7: 
# fix a common issue: 0 is entered when value should be blank (these values cannot be 0)
# SAFRING: create sql to fix these in your database: these will not be flagged 
# in the biometric checks
ringing_data$Mass[ringing_data$Mass==0] <- NA
ringing_data$Wing[ringing_data$Wing==0] <- NA
ringing_data$Head[ringing_data$Head==0] <- NA
ringing_data$Culmen[ringing_data$Culmen==0] <- NA
ringing_data$Tarsus[ringing_data$Tarsus==0] <- NA
ringing_data$Tail[ringing_data$Tail==0] <- NA

