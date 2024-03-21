
# Plotscaper

`plotscaper` is an R package designed for making interactive figures for data exploration. All plots in `plotscaper` support linked selection, which makes it easy to see how different aspects of your data relate to each other.

## Quick start

To get started, install `plotscaper` using the `devtools` package:

```r
devtools::install_github("https://github.com/bartonicek/plotscaper2.git")
```

Now you should be ready to create your first interactive figure! Here using the `mpg` dataset from the `ggplot2` package:

```r
library(plotscaper)

set_scene(ggplot2::mpg) |>
  add_scatterplot(encode("displ", "hwy")) |>
  add_histogram(encode("cty")) |>
  add_barplot(encode("manufacturer")) |>
  add_fluctplot(encode("class", "drv")) |>
  add_parcoords(encode("displ", "hwy", "cty")) |>
  add_histogram2d(encode("displ", "cty"))
```

This figure shows the currently available plots. Try clicking-and-dragging on one of the plots to select some objects in it. You should see the corresponding cases get highlighted across all other plots, allowing you to compare trends across different parts of your data.

There are many other ways of interacting with the plots, including changing size of objects, alpha, ordering, etc... Click the question mark symbol in the top right of the viewer panel to see these options.

## Performance

While `plotscaper` wasn't built specifically for performance, it can achieve decent rendering speed with moderately-sized datasets. For example, if you want to put `plotscaper` to a stress-test, try the `diamonds` dataset:

```r
set_scene(ggplot2::diamonds) |>
  add_scatterplot(encode("carat", "price")) |>
  add_fluctplot(encode("cut", "color")) |>
  add_barplot(encode("clarity"))
```

With 50,000 cases, my machine can render the interactions with this figure at an okay rate, a bit laggy but still good enough to feel like "an interactive figure" and not "a slideshow". Your mileage may differ. Take note, however, that most of the performance comes down to rendering, and so plots which render a lot of objects (such as scatterplots and parallel coordinates plots) will make the figure slower than plots which show summaries like bar charts (i.e. removing the scatterplot from the figure above makes it a lot more responsive). If your interactions get slow, either try to rely on the summary plots more or subsample your data.

