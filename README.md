<h1 align="center">R for Spatial Data and Its Visualization</h1>

<p align="center">
  <img src="https://img.shields.io/badge/R-4.6.1-276DC3?logo=r&logoColor=white" alt="R">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/Data-BPS_Indonesia-green.svg" alt="Data Source">
</p>

Spatial data analysis and visualization project using R, featuring administrative boundaries of East Java, Indonesia.

## Overview

This repository contains weekly spatial programming exercises covering fundamental R concepts applied to geospatial data, including data structures, coordinate systems, spatial operations, and interactive/static visualization.

## Tools & Technologies

- **R** (≥ 4.1.0) — Core programming language
- **RStudio** — Integrated development environment
- **Git & GitHub** — Version control

## R Packages

| Package | Purpose |
|---------|---------|
| `sf` | Simple Features — spatial data handling |
| `terra` | Raster data analysis |
| `tidyverse` | Data manipulation (dplyr, ggplot2, tidyr, readr) |
| `ggplot2` | Static visualization |
| `tmap` | Thematic mapping |
| `leaflet` | Interactive web maps |
| `glue` | String interpolation |
| `stringr` | String manipulation |
| `rmarkdown` | Report generation |

## Project Structure

```
├── data/
│   └── Provinsi Jawa Timur-KAB_KOTA.geojson    # East Java admin boundaries
├── output/
│   └── week01_kategori_luas_jatim.png          # Classification map output
├── Code_Week_1 and 2.R                         # Main analysis script
├── Laporan_Week_1_2.Rmd                        # R Markdown report
└── README.md
```

## Data

| Attribute | Description |
|-----------|-------------|
| `kab_kota` | Regency/Municipality name |
| `nama` | Full administrative name |
| `kode_kk` | BPS region code |
| `provinsi` | Province name |
| `geometry` | MultiPolygon boundary (WGS 84) |

**Source**: Badan Pusat Statistik (BPS) Indonesia

## Installation

```r
install.packages(c("sf", "terra", "tidyverse", "leaflet", "tmap", "glue", "stringr", "rmarkdown"))
```

## Usage

### Run the analysis script

```r
source("Code_Week_1 and 2.R")
```

## Output

The workflow produces a thematic map classifying regencies/municipalities by area (above/below median) with labeled boundaries.

## License

Data: BPS Indonesia (public domain). Code: MIT License.

## Contact

Maintained by [Attaftazayn](https://github.com/Attaftazayn)
