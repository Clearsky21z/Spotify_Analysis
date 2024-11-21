#### Preamble ####
# Purpose: Downloads and saves the data from Spotify API
# Author: John Zhang, Heyucheng Zhang
# Date: 10 October 2024
# Contact: junhan.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(spotifyr)


#### Download data ####

# Download data from spotifyr
jj_lin <- get_artist_audio_features("jj lin")
leehom_wang <- get_artist_audio_features("leehom wang")
joker_xue <- get_artist_audio_features("joker xue")

#### Save data #### ####

# change the_raw_data to whatever name you assigned when you downloaded it.
saveRDS(radiohead, "data/01-raw_data/radiohead.rds")
saveRDS(the_national, "data/01-raw_data/the_national.rds")
saveRDS(ed_sheeran, "data/01-raw_data/ed_sheeran.rds")

# Save data
saveRDS(jj_lin, "data/01-raw_data/jj_lin.rds")
saveRDS(leehom_wang, "data/01-raw_data/leehom_wang.rds")
saveRDS(joker_xue, "data/01-raw_data/joker_xue.rds")
