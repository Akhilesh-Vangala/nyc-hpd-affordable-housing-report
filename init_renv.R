if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv", repos = "https://cloud.r-project.org")
renv::init()
pkgs <- c("here", "readr", "dplyr", "tidyr", "ggplot2", "purrr", "tibble", "forcats",
          "janitor", "kableExtra", "lubridate", "rmarkdown", "knitr")
for (p in pkgs) if (!requireNamespace(p, quietly = TRUE)) install.packages(p, repos = "https://cloud.r-project.org")
renv::snapshot()
