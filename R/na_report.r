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
