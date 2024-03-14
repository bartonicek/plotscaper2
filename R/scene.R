#' Create an Interactive Scene
#'
#' Function that creates a skeleton of an interactive visual scene.
#'
#' @param data A dataframe (will be converted to JSON)
#' @param width Width of the scene
#' @param height Height of the scene
#'
#' @import htmlwidgets
#' @export
set_scene <- function(data,
                      width = NULL,
                      height = NULL,
                      elementId = NULL,
                      layout = NULL) {

  typeMap <- list(
    numeric = "continuous",
    integer = "continuous",
    character = "discrete",
    factor = "discrete"
  )

  types <- lapply(as.list(data), function(x) {
    typeMap[[class(x)[which(class(x) %in% names(typeMap))]]]
  })

  # forward options using x
  x = list(data = data,
           types = types,
           plots = list())

  # create widget
  htmlwidgets::createWidget(
    name = 'plotscaper',
    x,
    width = width,
    height = height,
    package = 'plotscaper',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      padding = 0,
      browser.fill = TRUE
    )
  )
}
