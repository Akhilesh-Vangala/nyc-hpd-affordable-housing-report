url_projects <- "https://data.cityofnewyork.us/api/views/hq68-rnsi/rows.csv?accessType=DOWNLOAD"
url_buildings <- "https://data.cityofnewyork.us/api/views/hg8x-zxpr/rows.csv?accessType=DOWNLOAD"
path_raw <- here::here("data", "raw")
path_projects <- file.path(path_raw, "hpd_projects.csv")
path_buildings <- file.path(path_raw, "hpd_buildings.csv")

if (file.exists(path_projects)) {
  df_projects <- readr::read_csv(path_projects, show_col_types = FALSE)
} else {
  df_projects <- readr::read_csv(url_projects, show_col_types = FALSE)
  if (!dir.exists(path_raw)) dir.create(path_raw, recursive = TRUE)
  readr::write_csv(df_projects, path_projects)
}

if (file.exists(path_buildings)) {
  df_buildings <- readr::read_csv(path_buildings, show_col_types = FALSE)
} else {
  df_buildings <- readr::read_csv(url_buildings, show_col_types = FALSE)
  if (!dir.exists(path_raw)) dir.create(path_raw, recursive = TRUE)
  readr::write_csv(df_buildings, path_buildings)
}
