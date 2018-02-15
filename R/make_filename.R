#' Creates filename based on year
#'
#' This function takes in a year as its parameter and returns a character vector
#' with the name of the data set that is wanted in use.
#'
#'  @param year The year of the dataset
#'
#'  @return A character vector of the name of the dataset with associated year
#'
#'  @note parameter must be a valid year number or else when running function to find
#'  the file, file doesn't exist error will be given.
#'
#'  @examples
#'  \dontrun{
#'  make_filename(2013)
#'  }

make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d", year)
}
