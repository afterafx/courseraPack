#' Creates a summary of each year passed.
#'
#' This function reads in a list of years and each year is
#' indivdually summarized of the number of fatal accidents.
#'
#' @param years a list containing the different years
#'
#' @return This function returns a summary of the accidents of each year passed in the parameter..
#'
#' @note An error will be thrown if a filename with a specific year does not exist
#'
#' @importFrom ("dplyr", "bind_rows", "group_by", "summarize")
#' @importFrom ("tidyr", "spread")
#'
#' @examples
#' \dontrun{
#' years <- c(2013, 2014)
#' fars_summarize_years(years)
#' }

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
