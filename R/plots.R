#' Create a plotscape encoding
#'
#' @export
encode <- function(v1 = NULL, v2 = NULL, v3 = NULL, ...) {
  encoding <- list(v1 = v1, v2 = v2, v3 = v3)
  rest <- list(...)
  for (i in seq_along(rest)) {
    encoding[paste0("v", i + 3)] <- rest[[i]]
  }
  encoding[!sapply(encoding, is.null)]
}

plot_types <- c("scatter", "histo", "bar", "fluct", "pcoords", "histo2d")


#' Add an interactive plot to a scene
#'
#' Function that adds an interactive plot to a scene
#'
#' @param scene A scene object
#' @param type A string representing the plot type
#' @param encoding Encoding of the variables
#'
#' @import htmlwidgets
#' @export
add_plot <- function(scene, type = NULL, encoding = NULL) {
  if (is.null(type) || !(type %in% plot_types)) {
    message <- paste("Please provide a valid plot type:",
                     paste(plot_types, collapse = ', '))
    stop(message)
  }

  if (is.null(encoding)) stop("Please provide a valid encoding")

  scene$x$plots[[length(scene$x$plots) + 1]] <- list(type = type, encoding = encoding)
  scene
}

#' Add a scatterplot to an interactive scene
#'
#' Function that adds a scatterplot to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1` and `v2` (discrete or continuous),
#' `v3` continuous (optional)
#'
#' @import htmlwidgets
#' @export
add_scatterplot <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1' and 'v2', 'v3' optional")
  add_plot(scene, "scatter", encoding)
}

#' Add a barplot to an interactive scene
#'
#' Function that adds a barplot to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1` a discrete variable,
#' `v2` a continuous variable (optional)
#'
#' @import htmlwidgets
#' @export
add_barplot <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1' discrete ('v2' continuous)")
  add_plot(scene, "bar", encoding)
}

#' Add a histogram to an interactive scene
#'
#' Function that adds a histogram to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1` a continuous variable
#'
#' @import htmlwidgets
#' @export
#'
add_histogram <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1' continuous")
  add_plot(scene, "histo", encoding)
}

#' Add a fluctuation diagram to an interactive scene
#'
#' Function that adds a fluctuation diagram to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1` and `v2` discrete variables,
#'
#' @import htmlwidgets
#' @export
add_fluctplot <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1', 'v2' discrete")
  add_plot(scene, "fluct", encoding)
}

#' Add a parallel coordinates plot to an interactive scene
#'
#' Function that adds a parallel coordinates plot to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1`, `v2`, `v3`, ... (continuous or discrete variables)
#'
#' @import htmlwidgets
#' @export
add_parcoords <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1', 'v2', 'v3', ...")
  add_plot(scene, "pcoords", encoding)
}

#' Add a 2D histogram to an interactive scene
#'
#' Function that adds a a 2D histogram to an interactive scene
#'
#' @param scene A scene object
#' @param encoding Encoding of the variables: `v1` and `v2` continuous
#'
#' @import htmlwidgets
#' @export
add_histogram2d <- function(scene, encoding = NULL) {
  if (is.null(encoding)) stop("Please provide a valid encoding: 'v1', 'v2', 'v3', ...")
  add_plot(scene, "histo2d", encoding)
}


