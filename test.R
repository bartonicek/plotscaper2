
library(plotscaper)


set_scene(ggplot2::mpg) |>
  add_scatterplot(encode("displ", "hwy")) |>
  add_histogram(encode("cty")) |>
  add_barplot(encode("manufacturer")) |>
  add_fluctplot(encode("class", "drv")) |>
  add_parcoords(encode("displ", "hwy", "cty")) |>
  add_histogram2d(encode("displ", "cty"))

set_scene(ggplot2::diamonds) |>
  add_scatterplot(encode("carat", "price")) |>
  add_fluctplot(encode("cut", "color")) |>
  add_barplot(encode("clarity"))
