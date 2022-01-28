if (!require(pacman)) install.packages("pacman")

#install.packages('devtools')
#devtools::install_github('iguacel/bbplot', force = T)

#Load

pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot', 'tidyverse', 'extrafont', 'glue')

#Globals
selected_country <- "Brazil"

#Data for chart from gapminder package
line_df <- gapminder %>%
  filter( gapminder$country == selected_country)

#View(gapminder)

#Make plot
p <- ggplot(line_df, aes(x = line_df$year, y = line_df$lifeExp)) +
  geom_line(size = 1, color = c$woman) +
  geom_hline(yintercept = 0, size = .2) +
  bbc_style() +
  labs(title = "Living longer",
       subtitle = glue("Life expectancy in {selected_country} 1952-2007"))

#Print plot
p

finalise_plot(plot_name = p,
              source = "Fuente: Gapminder. EL PAÍS",
              save_filepath = glue("output/{selected_country}AMP.png"))

#Save pdf (units in inches)
movil <- 3.8889
movil2 <- 4.6528
tableta <- 8.3333
desktop <- 12.5
height <- 1.5

ggsave(p, filename = glue("output/{selected_country}_movil.pdf"), device = cairo_pdf,
       width = movil, height = movil * height, units = "in"
)
ggsave(p, filename = glue("output/{selected_country}_movil2.pdf"), device = cairo_pdf,
       width = movil2, height = movil2 * height, units = "in"
)
ggsave(p, filename = glue("output/{selected_country}_tableta.pdf"), device = cairo_pdf,
       width = tableta, height = tableta * height, units = "in"
)
ggsave(p, filename =  glue("output/{selected_country}_desktop.pdf"), device = cairo_pdf,
       width = desktop, height = desktop * height, units = "in"
)
