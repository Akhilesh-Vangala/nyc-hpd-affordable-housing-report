if (dir.exists("/opt/homebrew/bin")) {
  Sys.setenv(PATH = paste("/opt/homebrew/bin", Sys.getenv("PATH"), sep = ":"))
}
repos <- "https://cloud.r-project.org"
pkgs <- c("here", "readr", "dplyr", "tidyr", "ggplot2", "purrr", "tibble", "forcats",
          "janitor", "kableExtra", "lubridate", "rmarkdown", "knitr")
for (p in pkgs) if (!requireNamespace(p, quietly = TRUE)) install.packages(p, repos = repos)
path_raw <- file.path(getwd(), "data", "raw")
if (!dir.exists(path_raw)) dir.create(path_raw, recursive = TRUE)

url_projects <- "https://data.cityofnewyork.us/api/views/hq68-rnsi/rows.csv?accessType=DOWNLOAD"
url_buildings <- "https://data.cityofnewyork.us/api/views/hg8x-zxpr/rows.csv?accessType=DOWNLOAD"
path_projects <- file.path(path_raw, "hpd_projects.csv")
path_buildings <- file.path(path_raw, "hpd_buildings.csv")

if (!file.exists(path_projects)) {
  df_projects <- readr::read_csv(url_projects, show_col_types = FALSE)
  readr::write_csv(df_projects, path_projects)
}
if (!file.exists(path_buildings)) {
  df_buildings <- readr::read_csv(url_buildings, show_col_types = FALSE)
  readr::write_csv(df_buildings, path_buildings)
}

rmarkdown::render(file.path(getwd(), "report.Rmd"))
