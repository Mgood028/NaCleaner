#' Fill Missing Values with Mean or Median
#'
#' Replaces NA values in numeric columns using the column mean
#' or median. Non-numeric columns are left alone.
#'
#' @param data A data frame
#' @param method Either "mean" or "median"
#' @return A data frame with NAs filled in numeric columns
#' @importFrom stats median
#' @export
#' @examples
#' filled <- fill_na(airquality, method = "median")
#' sum(is.na(filled$Ozone))
fill_na <- function(data, method = "mean") {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  if (!method %in% c("mean", "median")) {
    stop("Method must be 'mean' or 'median'")
  }

  for (col in names(data)) {
    if (is.numeric(data[[col]])) {
      missing <- is.na(data[[col]])
      if (any(missing)) {
        if (method == "mean") {
          data[[col]][missing] <- mean(data[[col]], na.rm = TRUE)
        } else {
          data[[col]][missing] <- median(data[[col]], na.rm = TRUE)
        }
      }
    }
  }
  return(data)
}
