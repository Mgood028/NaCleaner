#' Drop Rows Containing Missing Values
#'
#' Removes rows from a data frame that contain any NA values.
#'
#' @param data A data frame
#' @return A data frame with NA rows removed
#' @importFrom stats complete.cases
#' @export
#' @examples
#' clean <- drop_na_rows(airquality)
#' nrow(clean)
drop_na_rows <- function(data) {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  data[complete.cases(data), ]
}
