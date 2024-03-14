
library(ggplot2)
library(plotscaper)

set_scene(diamonds) |>
  add_plot("scatter", encode("carat", "price")) |>
  add_plot("bar", encode("color"))

set_scene(mpg) |>
  add_plot("scatter", encode("displ", "hwy")) |>
  add_plot("histo", encode("cty")) |>
  add_plot("bar", encode("manufacturer"))

