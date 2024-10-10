#### Preamble ####
# Purpose: Downloads and saves the data from Spotify API
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(spotifyr)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]
radiohead <- get_artist_audio_features("radiohead")
the_national <- get_artist_audio_features("the national")
ed_sheeran <- get_artist_audio_features("ed sheeran")
jj_lin <- get_artist_audio_features("jj lin")


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
saveRDS(radiohead, "data/01-raw_data/radiohead.rds")
saveRDS(the_national, "data/01-raw_data/the_national.rds")
saveRDS(ed_sheeran, "data/01-raw_data/ed_sheeran.rds")
saveRDS(jj_lin, "data/01-raw_data/jj_lin.rds")
