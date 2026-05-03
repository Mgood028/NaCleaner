# nacleaner

A small R package for handling missing values in data frames.
BLOG: https://masons-programming-journal.blogspot.com/2026/05/new-and-improved-na-cleaner.html

# What It Does

Three functions for the most common NA tasks:

`na_report()` shows where NAs are, with counts and percentages
`drop_na_rows()` removes rows containing any NA
`fill_na()` replaces NAs with column mean or median

# Install

```r
# install devtools first if needed
install.packages("devtools")

devtools::install_github("Mgood028/NaCleaner")
```

# Example 

```r
library(nacleaner)

# airquality has real missing values, no setup needed
na_report(airquality)

# remove rows with NAs (loses 42 rows from airquality)
clean <- drop_na_rows(airquality)

# or fill them in
filled <- fill_na(airquality, method = "median")
```



# Documentation

See `man/nacleaner_guide.Rmd` for a full guide on the package using airquality dataset.

