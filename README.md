# NYC Affordable Housing Data: Quality Checks and Exploratory Analysis

Reproducible R Markdown report on NYC HPD Housing New York data: data quality checks, cleaning, exploratory analysis, and geographic visualization. Two datasets (project-level and building-level) joined for borough-level breakdown.

**Data sources:**
- **Project-level:** [Housing New York Units by Project](https://data.cityofnewyork.us/Housing-Development/Housing-New-York-Units-by-Project/hq68-rnsi) (HPD) – project ID, program, dates, unit counts.
- **Building-level:** [Housing New York Units by Building](https://data.cityofnewyork.us/Housing-Development/Housing-New-York-Units-by-Building/hg8x-zxpr) (HPD) – address, BBL, BIN, borough. Join on project_id for borough per project; aggregate to borough for map.
Projects started after January 1, 2014; Housing New York (2014–2021) and Housing Our Neighbors (2022–present).

---

## How to run

**From terminal:** From this folder run `./run_all.sh` (or `python3 download_data.py` then `Rscript run_report.R`).

**From R or RStudio:** Set working directory to this folder, then `source("run_report.R")`. Data is downloaded from NYC Open Data if not in `data/raw/`; required R packages are installed if missing; the report is knitted to HTML.

**Requirements:** R 4.2+, `Rscript` on PATH. Python 3 for the download script. Optional: run `source("init_renv.R")` once for an `renv` lockfile; thereafter use `renv::restore()` before `run_report.R`.

Code: snake_case, no comments in R; narrative in the report. EDA: univariate, bivariate, temporal, geographic.

---

## Project structure

```
nyc-hpd-affordable-housing-report/
├── data/raw/
├── data/processed/
├── outputs/figures/
├── outputs/tables/
├── report.Rmd
├── run_report.R
├── run_all.sh
├── init_renv.R
├── download_data.py
├── R/01_load.R
├── README.md
└── .gitignore
```

The report walks through data source and description, quality checks on both tables, cleaning and join, exploratory analysis (univariate through geographic), and a short summary. Data from NYC Open Data (links above).
