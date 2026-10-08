
library(tidyverse)

dat <- read.csv("data/plot_diversity.csv")

site_mean <- dat |>
  group_by(siteID) |>
  summarise(rich_site = mean(richness_observed))

site_mean

dat2 <- dat |>
  left_join(site_mean, by ="siteID")

dat2 <- dat2 |>
  mutate(diff = richness_observed - rich_site)

dat |> filter(siteID == "HARV")
dat |> filter(richness_observed >= 10)

dat |> arrange(desc(richness_observed))

dat |> mutate(stems_per_sp = n_stems / richness_observed)
