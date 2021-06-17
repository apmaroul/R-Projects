################################################;
#Author:Lexi Maroulakis;
#Program Purpose:Final project  ;
#Date: 5/5/21;
################################################;

####################################################
##R server script 
###################################################

#read in packages we need
library(dplyr)
library(ggplot2)
library(Lahman)

#modify the Teams object (creating new teams object) as per instructions
teams = Teams
teams <- Teams 
teams$WinPct = teams$W/teams$G
teams$rpg= teams$R/ teams$G
teams$hrpg = teams$HR/teams$G

teams$WHIP = (3*(teams$H+teams$BB)/teams$IPouts)
#####################################################
#Basic syntax for a shiny server
shinyServer(function(input, output) {
    
  #main panel
    #generate bins
    output$myplot <-renderPlot({
        bins <- seq(min=30, max=148)
        g <- ggplot(teams, aes_string(x= "yearID", y=input$stat))
        g+geom_point()
        
        
        
    })
    
     
    
        
        


    
    
})



