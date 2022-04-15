
##* This is the updated version of initial code from SAFRING 'diagnostics 2.R' manuscript *##

##* Authors: Alan Lee and Rebecca Irons
  
### Step 1: clear your work space 
rm(list=ls())

### Step 2: install the necessary packages:
#To manipulate the data
install.packages("tidyverse")

#To access the data from SABAP/SAFRING using an api
install.packages("Rcurl")
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
