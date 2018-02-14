#' Creates graph of accidents by State..
#'
#' This function takes the state number and specific year and produces
#' a graph illustration the fatal accidents of that region.
#'
#' @param state.num The number of the state
#' @param year The year of the dataset
#'
#' @return This function returns a graph of the fatal accidents in the state and year provided or
#' if the state doesn't contain any accidents, then a message "no accidents to plot" will be thrown
#' and no graph will be returned.
#'
#' @note If you pass a state number that doesn't exist, then a "invalid STATE number" error
#' will be thrown.
#'
#' @importFrom ("dplyr", "filter")
#' @importFrom ("maps", "map")
#' @importFrom ("graphics", "points")
#'
#' @examples
#' fars_map_state(1, 2014)

fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
