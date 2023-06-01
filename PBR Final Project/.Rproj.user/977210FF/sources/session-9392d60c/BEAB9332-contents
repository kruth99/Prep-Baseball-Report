library(dplyr)
library(data.table)
# Read the data in organized by batter
batter_organized <- readRDS("split_pitching_data.RData")

# Get the list back in one
final_list <- data.frame(rbindlist(batter_organized))
final_list <- final_list %>% rename("pitch_type" = "X112526.pitch_type", 
                                   "pitcher_name" = "X112526.pitcher_name",
                                    "batter_id" = "X112526.batter",
                                   "release_speed" = "X112526.release_speed",
                                   "release_spin_rate" = "X112526.release_spin_rate")
#Replace all spaces with NA
final_list <- replace(final_list, final_list == '', NA)
saveRDS(final_list, file='final_list.RData')

#Final time organizing the data into list based off pitcher, batter and pitch
final_batter_organized <- split(final_list, f = final_list$batter_name)
saveRDS(final_batter_organized, file='final_batter_organized.RData')
final_pitcher_organized <- split(final_list, f = final_list$pitcher_name)
saveRDS(final_pitcher_organized, file='final_pitcher_organized.RData')
final_pitch_organized <- split(final_list, f = final_list$pitch_type)
saveRDS(final_pitch_organized, file='final_pitch_organized.RData')


