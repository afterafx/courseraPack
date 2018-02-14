#' Reads in data from multiple or even a single year in vector format.
#'
#' This function reads in data from a vector containing a single or multiple years
#' and creates filenames for each year in the vector
#'
#' @param years a list containing the different years
#'
#' @return This function returns the filename/s of the years passed. If a year is passed
#' that does not exist then NULL is returned.
#'
#' @note An error will be thrown if a filename with a specific year does not exist.
#'
#' @importFrom ("dplyr", "mutate", "select")
#'
#' @examples
#' years <- c(2013, 2014, 2015)
#' fars_read_years(years)

fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
