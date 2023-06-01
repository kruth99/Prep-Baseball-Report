library(shiny)

mlb_selections <- c("Batters", "Pitchers", "Pitches")
mlb_selections2 <- c("Batters", "Pitchers")

final_batter <- readRDS("final_batter_organized.RData")
final_pitch <- readRDS("final_pitch_organized.RData")
final_pitcher <- readRDS("final_pitcher_organized.RData")


batter_names <- names(final_batter)
pitch_names <- names(final_pitch)
pitcher_names <- names(final_pitcher)



#build UI:
shiny::fluidPage(
  theme = shinythemes::shinytheme("cerulean"),
  
  #title
  shiny::titlePanel("PBR Project"),
  shiny::navbarPage("Pitching Statistics",
                    shiny::tabPanel(icon("home"),
                                    fluidRow(
                                      column(
                                        br(),
                                        p("Here is my final project for the 
                                          Exercise of taking the data from baseball savant for pitchers and analyzing it",
                                          style="text-align:justify;color:black;background-color:lavender;padding:15px;border-radius:10px"),
                                        br(),
                                        width = 8),
                                
                                    )
                      ),
                    shiny::tabPanel(("Pitch Data"),
                                  shiny::sidebarPanel(
                                      shiny::selectInput(
                                        inputId <- "rawData",
                                        label <- "Pitcher/Batter/Pitches",
                                        choices <- mlb_selections,
                                        selected <- "Batters",
                                    ),
                                    shiny::conditionalPanel(
                                      condition = "input.rawData == 'Pitchers'",
                                      shiny::selectInput(
                                        inputId <- "pitchersStats",
                                        label <- "MLB pitchers",
                                        choices <- pitcher_names
                                      ),
                                    ),
                                    shiny::conditionalPanel(
                                      condition = "input.rawData == 'Batters'",
                                      shiny::selectInput(
                                        inputId <- "battersStats",
                                        label <- "MLB batters",
                                        choices <- batter_names
                                      ),
                                    ),
                                    shiny::conditionalPanel(
                                      condition = "input.rawData == 'Pitches'",
                                      shiny::selectInput(
                                        inputId <- "pitchesStats",
                                        label <- "Pitches",
                                        choices <- pitch_names
                                      ),
                                    ),
                                  ),
                                  shiny::mainPanel(
                                    tableOutput("playerData"),
                                  )
                  
                    ),
                    shiny::tabPanel(("Pitch Graphs"),
                                    shiny::sidebarPanel(
                                      shiny::selectInput(
                                        inputId <- "plots",
                                        label <- "Pitcher/Batter/Pitches",
                                        choices <- mlb_selections2,
                                        selected <- "Batters",
                                      ),
                                      shiny::conditionalPanel(
                                        condition = "input.plots == 'Pitchers'",
                                        shiny::selectInput(
                                          inputId <- "pitchersStats2",
                                          label <- "MLB pitchers",
                                          choices <- pitcher_names
                                        ),
                                      ),
                                      shiny::conditionalPanel(
                                        condition = "input.plots == 'Batters'",
                                        shiny::selectInput(
                                          inputId <- "battersStats2",
                                          label <- "MLB batters",
                                          choices <- batter_names
                                        ),
                                      ),
                                      shiny::conditionalPanel(
                                        condition = "input.plots == 'Pitches'",
                                        shiny::selectInput(
                                          inputId <- "pitchesStats2",
                                          label <- "Pitches",
                                          choices <- pitch_names
                                        ),
                                      ),
                                    ),
                                    shiny::mainPanel(
                                      plotOutput("releaseSpeed"),
                                      plotOutput("spinRate")
                                    )
                    )),
  
)

