


library(ggplot2)
library(showtext) # for the font
library(magick)


# the plot ----------------------------------------------------------------


## required for image rendering in RStudio
trace(grDevices::png, exit = quote({
  showtext::showtext_begin()
}), print = FALSE)

## font settings
showtext_auto()
font_add_google("IBM Plex Sans Condensed", "ibm", regular.wt = 400)

## summary text, as given in resumes.
summary = "SUMMARY
R developer and aficionado, hoping to become a connoisseur.
Have a thing for Shiny. Looking to work with Shiny in production.
I believe that a man's measure is his will, not his degree."

## creating the data frame by hand
current_year <- 2020

df = data.frame(
  xmin = c(0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6,
           7.7, 8.8, 9.9, 11, 12.1),
  xmax = c(1, 2.1, 3.2, 4.3, 5.4, 6.5, 7.6,
           8.7, 9.8, 10.9, 12, 13.1),
  ymin = c(1994, 1994, 2006, 2011, 2013, 2013, 2014,
           2017, 2017, 2018, 2019, 2020),
  ymax = c(current_year, current_year, current_year, 2013, 2018, current_year, current_year,
           current_year, current_year, 2019, current_year, 2020),
  who = c("_", "family", "maestros", "ndc", "du", "cavaliers", "started coding in R",
          "shiny", "freelance", "nadine_west", "open_source", "shiny_contest")
)


## font-size in annotations
size2 = 5.5

## the plot
p1 <- ggplot(df, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax)) +
  geom_rect(aes(fill = who), show.legend = FALSE) +
  theme_classic(base_family = "ibm") +
  #theme_void() +
  scale_fill_manual(values = c("_" = "#08283C",
                               "family" = "#CCD3E3",
                               "maestros" = "#7E8EB2",
                               "ndc" = "#7E8EB2",#2F4159
                               "du" = "#50707B",
                               "cavaliers" = "#50707B",
                               "started coding in R" = "#447099",
                               "shiny" = "#4E94CF",
                               "freelance" = "#61C073",
                               "nadine_west" = "#EF476F",
                               "open_source" = "#C2A370",
                               "shiny_contest" = "#4E94CF")) +
  annotate(
    geom = "segment", x = 2.7, y = 2006, xend = 2.7, yend = 2002,
    color = "#7E8EB2", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 3.8, y = 2011, xend = 3.8, yend = 2004,
    color = "#7E8EB2", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 4.9, y = 2013, xend = 4.9, yend = 2006,
    color = "#50707B", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 6, y = 2013, xend = 6, yend = 2008,
    color = "#50707B", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 7.1, y = 2014, xend = 7.1, yend = 2010,
    color = "#447099", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 8.2, y = 2017, xend = 8.2, yend = 2012,
    color = "#4E94CF", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 9.3, y = 2017, xend = 9.3, yend = 2014,
    color = "#61C073", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 10.4, y = 2018, xend = 10.4, yend = 2016,
    color = "#EF476F", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 11.5, y = 2019, xend = 11.5, yend = 2018,
    color = "#C2A370", size = .1
  ) +
  scale_y_continuous(breaks = c(1994, 2020)) +
  #scale_x_continuous(limits = c(0, 70), expand = expansion(mult = 0)) +
  xlim(0, 30) +
  #ylim(1985, 2050) +
  annotate(geom = "text", x = 5.2, y = 2023.2, label = "Resume Plot of Zauad Shahreer Abeer",
           hjust = .01, family = "ibm", size = 6, color = "#918D8F") +
  
  annotate(geom = "text", x = 5.2, y = 2022, label = "R & Shiny Developer",
           hjust = .01, family = "ibm", size = 6, color = "#918D8F") +
  
  annotate(geom = "text", x = 2.6, y = 2001, label = "2006, Maestros",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 3.7, y = 2003, label = "2011 - 13, NDC",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 4.8, y = 2005, label = "2013 - 18, Graduation in Statistics",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 5.9, y = 2007, label = "2013, Cavaliers",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 7, y = 2009, label = "2014, Introduced to R, liked Python better",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 8.1, y = 2011, label = "2017, First Shiny App",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 9.2, y = 2013, label = "2017, Freelance Data Analyst",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 10.3, y = 2015, label = "2018 - 19, Data Analyst/ Statistician @ Nadine West",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 11.4, y = 2017, label = "2019, Started with git properly, afraid of merge conflicts",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 12.5, y = 2019, label = "2020, Shiny Contest Honorable Mentions,\n Shiny for Production with {golem}, first CRAN package*",
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 3.2, y = 1997, label = summary,
           hjust = 0, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 1.1, y = 1993, label = '"I like the {tidyverse} ecosystem, but {data.table} just feels right."',
           hjust = .01, family = "ibm", size = size2, color = "#918D8F") +
  
  annotate(geom = "text", x = 13, y = 1991.5, label = "*Scheduled for October, Inn Shaa Allah",
           hjust = .01, family = "ibm", size = (size2 - 1.5), color = "#918D8F") +
  
  #coord_cartesian(xlim = c(0, 40), ylim = c(1985, 2040), expand = FALSE) +
  theme(
    axis.line.y.left = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 12),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    plot.background = element_rect(fill = "#07283C"),
    panel.background = element_rect(fill = "#07283C")
  )


## creating the image using magick
fig <- image_graph(width = 700, height = 700)
p1
dev.off()

## ggplot2 hex
hex_raw <- image_read("http://hexb.in/hexagons/ggplot2.png") 
hex <- image_scale(hex_raw, "70")

## adding the two
fig2 <- image_composite(fig, hex, offset="+550+440", operator = "blend")
fig2 <- image_trim(fig2)

## saving the image.
image_write(fig2, "../my_blog/themes/hugo-ivy/static/img/the-resume-plot.jpeg", format = "jpeg")



