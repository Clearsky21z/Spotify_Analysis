#### Preamble ####
# Purpose: Exploratory data
# Author: John Zhang, Heyucheng Zhang
# Date: 10 October 2024
# Contact: junhan.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-download_data.R
# Any other information needed? None



#### Workspace setup ####
library(tidyverse)


####  Exploratory data ####

# Read RDS files for each artist
jj_lin <- readRDS("data/01-raw_data/jj_lin.rds")
leehom_wang <- readRDS("data/01-raw_data/leehom_wang.rds")
joker_xue <- readRDS("data/01-raw_data/joker_xue.rds")

# Convert the data to tibble format
jj_lin <- as_tibble(jj_lin)
leehom_wang <- as_tibble(leehom_wang)
joker_xue <- as_tibble(joker_xue)

# Combine data from all three artists by selecting common columns
combined_data <- bind_rows(
  select(jj_lin, artist_name, album_release_date, valence),
  select(leehom_wang, artist_name, album_release_date, valence),
  select(joker_xue, artist_name, album_release_date, valence)
)

# Create a plot to visualize valence over time for each artist
combined_data %>%
  mutate(album_release_date = ymd(album_release_date)) %>%
  ggplot(aes(x = album_release_date, y = valence, color = artist_name)) +
  geom_point(alpha = 0.3) +
  geom_smooth() +
  theme_minimal() +
  facet_wrap(facets = vars(artist_name), dir = "v") +
  labs(
    x = "Album release date",
    y = "Valence",
    color = "Artist"
  ) +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")

# Combine data for another feature: duration_ms
combined_data_duration <- bind_rows(
  select(jj_lin, artist_name, album_release_date, duration_ms),
  select(leehom_wang, artist_name, album_release_date, duration_ms),
  select(joker_xue, artist_name, album_release_date, duration_ms)
)

# Plot duration (ms) over time for each artist
combined_data_duration %>%
  mutate(album_release_date = ymd(album_release_date)) %>%
  ggplot(aes(x = album_release_date, y = duration_ms, color = artist_name)) +
  geom_point(alpha = 0.3) +
  geom_smooth() +
  theme_minimal() +
  facet_wrap(facets = vars(artist_name), dir = "v") +
  labs(
    x = "Album release date",
    y = "Duration (ms)",
    color = "Artist"
  ) +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")


# Combine data for another feature: energy
combined_data_energy <- bind_rows(
  select(jj_lin, artist_name, album_release_date, energy),
  select(leehom_wang, artist_name, album_release_date, energy),
  select(joker_xue, artist_name, album_release_date, energy)
)

# Plot energy over time for each artist
combined_data_energy %>%
  mutate(album_release_date = ymd(album_release_date)) %>%
  ggplot(aes(x = album_release_date, y = energy, color = artist_name)) +
  geom_point(alpha = 0.3) +
  geom_smooth() +
  theme_minimal() +
  facet_wrap(facets = vars(artist_name), dir = "v") +
  labs(
    x = "Album release date",
    y = "Energy",
    color = "Artist"
  ) +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")

