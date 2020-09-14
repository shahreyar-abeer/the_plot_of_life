


library(ggplot2)
library(showtext) # for the font


# the plot ----------------------------------------------------------------


## required for image rendering in RStudio
trace(grDevices::png, exit = quote({
  showtext::showtext_begin()
}), print = FALSE)

## font settings
showtext_auto()
font_add_google("IBM Plex Sans", "ibm", regular.wt = 500)

## creating the data frame by hand
c_yr <- 2020
df = data.frame(
  xmin = c(0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8),
  xmax = c(1, 2.1, 3.2, 4.3, 5.4, 6.5, 7.6, 8.7, 9.8),
  ymin = c(1994, 1994, 2006, 2011, 2013, 2013, 2014, 2015, 2019),
  ymax = c(c_yr, 2020, 2020, 2013, 2018, 2020, 2020, 2020, 2020),
  who = c("_", "family", "maestros", "ndc", "du", "cavaliers", "started coding in R", "a new life", "married")
)
## defining the colors
greyColor = "#918D8F"
redColor = "#ed5032"
lighter_color = "#918D8F"
accent = "#ed5032"

## the plot
ggplot(df, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax)) +
  geom_rect(aes(fill = who), show.legend = FALSE) +
  theme_classic(base_family = "ibm", base_size = 24) +
  #theme_void() +
  scale_fill_manual(values = c("_" = "#FCF6EB",
                               "family" = "#CCD3E3",
                               "maestros" = "#7E8EB2",
                               "ndc" = "#7E8EB2",#2F4159
                               "du" = "#50707B",
                               "cavaliers" = "#50707B",
                               "started coding in R" = "#447099",
                               "a new life" = "#C2A370",
                               "married" = "#EF476F")) +
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
    geom = "segment", x = 8.2, y = 2015, xend = 8.2, yend = 2012,
    color = "#C2A370", size = .1
  ) +
  
  annotate(
    geom = "segment", x = 9.3, y = 2019, xend = 9.3, yend = 2014,
    color = "#EF476F", size = .1
  ) +
  scale_y_continuous(breaks = c(1994, 2020)) +
  #scale_x_continuous(limits = c(0, 70), expand = expansion(mult = 0)) +
  xlim(0, 15) +
  #ylim(1985, 2050) +
  annotate(geom = "text", x = 0.2, y = 2022, label = "The 'plot' of life",
           hjust = .01, family = "ibm", size = 7, color = "#918D8F") +
  
  annotate(geom = "text", x = 1, y = 1993, label = "Family",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 2.6, y = 2001, label = "2006, Maestros",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 3.7, y = 2003, label = "2011 - 13, NDC",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 4.8, y = 2005, label = "2013 - 18, DU",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 5.9, y = 2007, label = "2013, Cavaliers",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 7, y = 2009, label = "2014, Started withR",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 8.1, y = 2011, label = "2015, Alhamdulillah",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
  annotate(geom = "text", x = 9.2, y = 2013, label = "2019, Married!",
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  annotate(geom = "text", x = 3.2, y = 1998, label = '"Ghareeb wo hai jis ka koi dost na ho."',
           hjust = .01, family = "ibm", size = 5, color = "#918D8F") +
  
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
    plot.margin = margin(l = 50),
    plot.background = element_rect(fill = "#fcf6ef"),
    panel.background = element_rect(fill = "#fcf6ef")
  )




