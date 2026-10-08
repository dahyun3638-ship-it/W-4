
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


dat |> summarise( n = n(), 
                  rich_mean = mean(richness_observed),
                  stems_mean = mean(n_stems))

dat |> group_by(siteID) |>
  summarise(n = n(), 
            rich = mean(richness_observed)) |>
  arrange(desc(rich))


library(ggplot2)
ggplot(dat, aes(n_stems, richness_observed)) +
  geom_point()


ggplot(dat, aes(n_stems, richness_observed)) +
  geom_jitter(width = 0, height = 0.28, alpha = 0.1)


ggplot(dat, aes(n_stems, richness_observed)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm")


ggplot(dat, aes(n_stems, richness_observed,
                color = siteID)) +
  geom_point(alpha = 0.7)

dat |> filter(siteID %in% c("DELA","GRSM","ABBY","YELL")) |>
  ggplot(aes(n_stems,
             richness_observed,
             colour = siteID)) +
  geom_point(alpha = 0.7)



g <- ggplot(dat, aes(n_stems, richness_observed)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm") +
  labs(x = "줄기 수", y = "관찰 종수",
       title = "조사구별 줄기 수와 종수") +
  theme_bw()

g

ggsave("output/fig3.png", g, width = 7, height = 4.5, dpi = 150)


