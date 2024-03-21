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

  n_complete <- sum(complete.cases(data))
  n_missing <- nrow(data) - n_complete

  if (n_missing > 0) {
    warning(paste("Removed", n_missing, "rows with missing values from the data"))
    data <- na.omit(data)
  }

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
