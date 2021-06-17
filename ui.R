################################################;
#Author:Lexi Maroulakis;
#Program Purpose:Final project  ;
#Date: 5/5/21;
################################################;

###################################################
## R ui script
###################################################

library(dplyr)
library(Lahman)

#modify the Teams object (creating new teams object) as per instructions
teams <- Teams
    
    ###################################################
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Visualizing Baseball Data Over Time"),
    
    fluidRow(
        
        sidebarLayout(
            sidebarPanel(
                sliderInput("range",
                            label= "Include Years in Range",
                            min= 1901,
                            max= 2020,
                            value= c(1901,2020),
                            step= 0.1),
            br(),
            #4:42 in video
            #create these variables
                selectInput("stat", "Statistic to Plot", 
                            choices = c("WinPct", "WHIP", "rpg", "hrpg", "SO", "X2B", "X3B", "HR", "BB", "SB", "CS", "HBP", "SF", "RA", "ER", "ERA", "CG", "SHO", "SV", "IPouts", "HA", "HRA", "BBA", "SOA", "E", "DP", "FP")),
            br(),
                checkboxInput("leaguecheck", 
                              "Color by League?", 
                              value = c(30:148), 
                              width = NULL),
            br(),
                checkboxInput("trendcheck", "
                          Add in trend across time?", 
                              value = FALSE, 
                              width = NULL)
                
            ),
            mainPanel(
                plotOutput("myplot"),
                
                
                
            )
        )
    )
))

