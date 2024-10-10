#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
jj_lin <- readRDS("data/01-raw_data/jj_lin.rds")
leehom_wang <- readRDS("data/01-raw_data/leehom_wang.rds")
joker_xue <- readRDS("data/01-raw_data/joker_xue.rds")

# Convert to tibble
jj_lin <- as_tibble(jj_lin)
leehom_wang <- as_tibble(leehom_wang)
joker_xue <- as_tibble(joker_xue)

# Select common columns and bind rows
combined_data <- bind_rows(
  select(jj_lin, artist_name, album_release_date, valence),
  select(leehom_wang, artist_name, album_release_date, valence),
  select(joker_xue, artist_name, album_release_date, valence)
)

# Create plot
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

combined_data_duration <- bind_rows(
  select(jj_lin, artist_name, album_release_date, duration_ms),
  select(leehom_wang, artist_name, album_release_date, duration_ms),
  select(joker_xue, artist_name, album_release_date, duration_ms)
)

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

combined_data_energy <- bind_rows(
  select(jj_lin, artist_name, album_release_date, energy),
  select(leehom_wang, artist_name, album_release_date, energy),
  select(joker_xue, artist_name, album_release_date, energy)
)

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

