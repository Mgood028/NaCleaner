#' Report Missing Values
#'
#' Returns counts and percentages of NAs for each column in a data frame.
#'
#' @param data A data frame
#' @return A data frame of class "na_report" with columns variable, missing, percent
#' @export
#' @examples
#' na_report(airquality)
na_report <- function(data) {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  counts <- sapply(data, function(x) sum(is.na(x)))
  pct <- round((counts / nrow(data)) * 100, 1)
  out <- data.frame(
    variable = names(data),
    missing = counts,
    percent = pct,
    row.names = NULL
  )
  attr(out, "n_rows") <- nrow(data)
  class(out) <- c("na_report", "data.frame")
  return(out)
}

#' Print method for na_report
#'
#' @param x An na_report object
#' @param ... Unused
#' @export
print.na_report <- function(x, ...) {
  n <- attr(x, "n_rows")
  cat("NA Report (", n, " rows)\n\n", sep = "")
  print.data.frame(x, row.names = FALSE)
  invisible(x)
}
