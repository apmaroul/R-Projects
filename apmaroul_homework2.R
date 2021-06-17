################################################;
#Author:Lexi Maroulakis;
#Collaborators; worked with Joe Arulappan
#Program Purpose:homework 2 assignment  ;
#Date: 2/13/2021;
################################################;

#Installed
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
install.packages("tidyverse")
install.packages("readxl")

################################################

###Car Depreciation Data
#1. Read the CarDepreciation.xlsx dataset into an R object called cars using the readxl package. Be sure to include any library calls here as well.
library(readxl)
car <- read_excel("C:\\Users\\lexi\\Documents\\Homework 2\\data\\CarDepreciation.xlsx")

#2. Write code that will print the Depreciation column to the console.
car[,"Depreciation"]

###Education Data
#3. Read in the EDU01D sheet using the readxl package and save it as an object called education.
education <- read_excel("C:\\Users\\lexi\\Documents\\Homework 2\\data\\censusED.xlsx", sheet= "EDU01D")

#4) Write code to print the first 3 rows of this dataset to the console.
education[1:3,]

###Scores Data
#5. Read this dataset in using the read_csv function from the readr package and save it as an R object called scores.
scores <- read.csv("C:\\Users\\lexi\\Documents\\Homework 2\\data\\scoresFull.csv")


###Air Quality Data
#6. Read in the AirQualityUCI.csv dataset from the URL https://www4.stat.ncsu.edu/~online/datasets/AirQualityUCI.csv and save it as an R object called air. 
air <- read.csv2("https://www4.stat.ncsu.edu/~online/datasets/AirQualityUCI.csv")

###Religion Data
#7. Read in this file using the appropriate function from the readr package and 
crabs <- read.delim("C:\\Users\\lexi\\Documents\\Homework 2\\data\\crabs.txt")
crabs$X7 <- NULL

###Pokemon API (no key required)
#1. Install and load the httr and jsonlite packages.
install.packages("jsonlite", type = "source")
install.packages("httr")
require("httr")
require("jsonlite")

#2. Go to https://pokeapi.co/docs/v2 and look at the documentation for this API. What are some of the endpoints (tables) that we can access from it? Put your answer in a comment.
#Berries, Berry flavors, Contest types, Contest effects

#3. Start with a base_URL of https://pokeapi.co/api/v2 (save this URL as a character string). We want to pull the “pikachu” attribute from the “pokemon” table. Create an object called tab_name that is “pokemon” and an object called poke_name that is “pikachu”. Once you’ve done so, you can create a full URL by pasting the pieces together:
base_url <- "https://pokeapi.co/api/v2"
tab_name <- "pokemon"
poke_name <- "pikachu"
  full_url <- paste0(base_url, "/",tab_name,"/", poke_name)
  
#4) Use a GET command to retrieve the pikachu information in raw form (save this as an object). Then use content() to turn it into JSON text form (save this as an object). Finally, convert it to a list using fromJSON with flatten=TRUE (save this as an object).
pickachu <- GET(full_url)
content (pickachu, "text")
pickachulist <- fromJSON(full_url, flatten=TRUE)
  
#5) The moves list element contains a dataframe that has a column called move.name. Print this column to the console. According to this database, how many moves can Pikachu learn (hint it is the number of elements printed out)? Answer this in a comment below your code.
pickachulist[["moves","move.name"]]
#81

