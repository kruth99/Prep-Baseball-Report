library(shinyjs)

final_batter <- readRDS("final_batter_organized.RData")
final_pitch <- readRDS("final_pitch_organized.RData")
final_pitcher <- readRDS("final_pitcher_organized.RData")


batter_names <- names(final_batter)
pitch_names <- names(final_pitch)
pitcher_names <- names(final_pitcher)


function(input, output) {
  output$playerData <- shiny::renderTable({
    if(input$rawData == "Pitchers"){
      currentValue <- input$pitchersStats
      value <- as.data.frame(final_pitcher[currentValue])[, -3]
      colnames(value) <- c("Pitch_Type", "Pitcher_Name", "Release_Speed", "Release_Spin_Rate", "Batter_Name")
    }
    if(input$rawData == "Batters"){
      currentValue <- input$battersStats
      value <- as.data.frame(final_batter[currentValue])[,-3]
      colnames(value) <- c("Pitch_Type", "Pitcher_Name", "Release_Speed", "Release_Spin_Rate", "Batter_Name")
    }
    if(input$rawData == "Pitches") {
      currentValue <- input$pitchesStats
      temp <- as.data.frame(final_pitch[currentValue])[, c(4,5)]
      value <- apply(temp, 2, function(x) mean(x, na.rm= TRUE))
      value <- data.frame(t(value))
      colnames(value) <- c("Average_Release_Speed", "Average_Release_Spin_Rate")
    }
    value
  })
  output$releaseSpeed <- shiny::renderPlot({
    print(input$plots)
    if(input$plots == "Pitchers"){
      currentValue <- input$pitchersStats2
      value <- as.data.frame(final_pitcher[currentValue])[, -3]
      colnames(value) <- c("Pitch_Type", "Pitcher_Name", "Release_Speed", "Release_Spin_Rate", "Batter_Name")
      boxplot(Release_Speed ~ Pitch_Type, data = value, main = "Release Speed", xlab = "Pitch Type", ylab = "Release Speed")
      output$spinRate <- shiny::renderPlot ({
        boxplot(Release_Spin_Rate ~ Pitch_Type, data = value, main = "Release Spin Rate", xlab = "Pitch Type", ylab = "Release Spin Rate")
      })
    }
    if(input$plots == "Batters"){
      currentValue <- input$battersStats2
      value <- as.data.frame(final_batter[currentValue])[,-3]
      colnames(value) <- c("Pitch_Type", "Pitcher_Name", "Release_Speed", "Release_Spin_Rate", "Batter_Name")
      boxplot(Release_Speed ~ Pitch_Type, data = value, main = "Release Speed", xlab = "Pitch Type", ylab = "Release Speed")
      output$spinRate <- shiny::renderPlot ({
        boxplot(Release_Spin_Rate ~ Pitch_Type, data = value, main = "Release Spin Rate", xlab = "Pitch Type", ylab = "Release Spin Rate")
      })
    }
  })
}