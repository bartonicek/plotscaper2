#' Create a plotscape encoding
#'
#' @export
encode <- function(v1 = NULL, v2 = NULL, v3 = NULL, ...) {
  encoding <- list(v1 = v1, v2 = v2)
  encoding[!sapply(encoding, is.null)]
}

plot_types <- c("scatter", "histo", "bar", "fluct", "pcoords", "histo2d")


#' Add an interactive plot to a scene
#'
#' Function that adds an interactive plot to a scene
#'
#' @param scene A scene object
#'
#' @import htmlwidgets
#' @export
add_plot <- function(scene, type = NULL, encoding = NULL) {
  if (is.null(type) || !(type %in% plot_types)) {
    message <- paste("Please provide a valid plot type:",
                     paste(plot_types, collapse = ', '))
    stop(message)
  }

  if (is.null(encoding)) stop("Please provide encodings")

  scene$x$plots[[length(scene$x$plots) + 1]] <- list(type = type, encoding = encoding)
  scene
}
