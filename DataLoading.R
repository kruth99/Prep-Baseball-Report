library(tidyverse)
library(baseballr)
library(dplyr)

#Function to read through all the data from the baseballr library since 2015
statcast_bind_rows <- function(start_date, end_date, player_type) {
  print(start_date)
  start <- as.Date(start_date)
  end <- as.Date(end_date) - 1
  range <- seq(start, end, "2 days")
  range_offset <- seq(start + 2, end + 2, "2 days")
  
  if (range_offset[length(range_offset)] != end + 1) {
    range_offset[length(range_offset)] <- end + 1
  }
  
  stats_list <- map2_df(range, range_offset, function(x, y) {
    baseballr::statcast_search(
      start_date = x,
      end_date = y,
      player_type = player_type
    )
  })
  
  return(stats_list)
  
}

#Functions to read the data and save it for each year
df_data2023 <- statcast_bind_rows(start_date = "2023-03-30", end_date = "2023-05-24", player_type = "pitcher")
saveRDS(df_data2023, file='data2023.RData')
df_data2022_firstHalf <- statcast_bind_rows(start_date = "2022-04-07", end_date = "2022-07-17", player_type = "pitcher")
saveRDS(df_data2022_firstHalf, file='data2022_firstHalf.RData')
df_data2022_secondHalf <- statcast_bind_rows(start_date = "2022-07-21", end_date = "2022-10-05", player_type = "pitcher")
saveRDS(df_data2022_secondHalf, file='data2022_secondHalf.RData')
df_data2021_firstHalf <- statcast_bind_rows(start_date = "2021-04-01", end_date = "2021-07-12", player_type = "pitcher")
saveRDS(df_data2021_firstHalf, file='data2021_firstHalf.RData')
df_data2021_secondHalf <- statcast_bind_rows(start_date = "2021-07-15", end_date = "2021-10-03", player_type = "pitcher")
saveRDS(df_data2021_secondHalf, file='data2021_secondHalf.RData')
df_data2020 <- statcast_bind_rows(start_date = "2020-07-23", end_date = "2020-09-27", player_type = "pitcher")
saveRDS(df_data2020, file='data2020.RData')
df_data2019_firstHalf <- statcast_bind_rows(start_date = "2019-03-28", end_date = "2019-07-07", player_type = "pitcher")
saveRDS(df_data2019_firstHalf, file='data2019_firstHalf.RData')
df_data2019_secondHalf <- statcast_bind_rows(start_date = "2019-07-11", end_date = "2019-09-29", player_type = "pitcher")
saveRDS(df_data2019_secondHalf, file='data2019_secondHalf.RData')
df_data2018_firstHalf <- statcast_bind_rows(start_date = "2018-03-29", end_date = "2018-07-15", player_type = "pitcher")
saveRDS(df_data2018_firstHalf, file='data2018_firstHalf.RData')
df_data2018_secondHalf <- statcast_bind_rows(start_date = "2018-07-19", end_date = "2018-10-01", player_type = "pitcher")
saveRDS(df_data2018_secondHalf, file='data2018_secondHalf.RData')
df_data2017_firstHalf <- statcast_bind_rows(start_date = "2017-04-02", end_date = "2017-07-09", player_type = "pitcher")
saveRDS(df_data2017_firstHalf, file='data2017_firstHalf.RData')
df_data2017_secondHalf <- statcast_bind_rows(start_date = "2017-07-14", end_date = "2017-10-01", player_type = "pitcher")
saveRDS(df_data2017_secondHalf, file='data2017_secondHalf.RData')
df_data2016_firstHalf <- statcast_bind_rows(start_date = "2016-04-03", end_date = "2016-07-10", player_type = "pitcher")
saveRDS(df_data2016_firstHalf, file='data2016_firstHalf.RData')
df_data2016_secondHalf <- statcast_bind_rows(start_date = "2016-07-15", end_date = "2016-10-02", player_type = "pitcher")
saveRDS(df_data2016_secondHalf, file='data2016_secondHalf.RData')
df_data2015_firstHalf <- statcast_bind_rows(start_date = "2015-04-05", end_date = "2015-07-12", player_type = "pitcher")
saveRDS(df_data2015_firstHalf, file='data2015_firstHalf.RData')
df_data2015_secondHalf <- statcast_bind_rows(start_date = "2015-07-17", end_date = "2015-10-04", player_type = "pitcher")
saveRDS(df_data2015_secondHalf, file='data2015_secondHalf.RData')

#Read the saved data back in
df_data2023             <- readRDS("data2023.RData")
df_data2022_firstHalf   <- readRDS("data2022_firstHalf.RData")
df_data2022_secondHalf  <- readRDS("data2022_secondHalf.RData")
df_data2021_firstHalf   <- readRDS("data2021_firstHalf.RData")
df_data2021_secondHalf  <- readRDS("data2021_secondHalf.RData")
df_data2020             <- readRDS("data2020.RData")
df_data2019_firstHalf   <- readRDS("data2019_firstHalf.RData")
df_data2019_secondHalf  <- readRDS("data2019_secondHalf.RData")
df_data2018_firstHalf   <- readRDS("data2018_firstHalf.RData")
df_data2018_secondHalf  <- readRDS("data2018_secondHalf.RData")
df_data2017_firstHalf   <- readRDS("data2017_firstHalf.RData")
df_data2017_secondHalf  <- readRDS("data2017_secondHalf.RData")
df_data2016_firstHalf   <- readRDS("data2016_firstHalf.RData")  
df_data2016_secondHalf  <- readRDS("data2016_secondHalf.RData")
df_data2015_firstHalf   <- readRDS("data2015_firstHalf.RData")  
df_data2015_secondHalf  <- readRDS("data2015_secondHalf.RData")

#Combine all the data together and save only the information that we need
totalDf <- rbind(df_data2023,df_data2022_firstHalf,df_data2022_secondHalf, df_data2021_firstHalf,df_data2021_secondHalf,df_data2020, df_data2019_firstHalf,df_data2019_secondHalf, 
                 df_data2018_firstHalf,df_data2018_secondHalf, df_data2017_firstHalf,df_data2017_secondHalf,df_data2016_firstHalf,df_data2016_secondHalf,  df_data2015_firstHalf,df_data2015_secondHalf)
pitchingData <- data.frame(select(totalDf, pitch_type , player_name , batter,release_speed,release_spin_rate))

saveRDS(pitchingData, file='pitchingData.RData')

pitchingData <- readRDS("pitchingData.RData")

colnames(pitchingData)[2] <- "pitcher_name"

#Group the data by hitter and use the baseballr playername_lookup function to find the batter name
split_pitching_data <- split(pitchingData, f = pitchingData$batter)

split_pitching_data <- readRDS("split_pitching_data.RData")
for (i in 1327:length(split_pitching_data)) {
  print(i)
  tempFrame <- data.frame(split_pitching_data[i])
  firstValue <- tempFrame[1,][,3]
  batterID <- playername_lookup(firstValue)
  batter_name <- paste(batterID["name_last"], batterID["name_first"], sep= ",")
  tempFrame$batter_name <- batter_name
  split_pitching_data[[i]] <- tempFrame
}

saveRDS(split_pitching_data, file='split_pitching_data.RData')
