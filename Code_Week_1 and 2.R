rm(list = ls())

setwd("C:/Users/user/Downloads/semester 5/Pemspa/Weekly_code")

.libPaths("E:/Research/MyLibrary")
.libPaths()

cat("\n============================================\n")
cat("SPATIAL PROGRAMMING WITH R - WEEK 1\n")
cat("============================================\n\n")

required_packages <- c(
  "tidyverse",
  "sf",
  "terra",
  "leaflet",
  "tmap",
  "glue"
)

installed <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed)

if (length(missing_packages) > 0) {
  message("Installing missing packages: ", paste(missing_packages, collapse = ", "))
  install.packages(missing_packages, dependencies = TRUE)
}

suppressPackageStartupMessages({
  library(tidyverse)
  library(sf)
  library(terra)
  library(leaflet)
  library(tmap)
})

cat("Packages loaded successfully.\n")

cat("\n--- WORKSPACE CHECK ---\n")
cat("Current working directory:\n")
print(getwd())

cat("\nFiles in current directory:\n")
print(list.files())

cat("\nR session information:\n")
print(sessionInfo())

cat("\n--- PROJECT DIRECTORY ---\n")

dir.create("Week_1 and 2/data", showWarnings = FALSE, recursive = TRUE)
dir.create("Week_1 and 2/scripts", showWarnings = FALSE, recursive = TRUE)
dir.create("Week_1 and 2/output", showWarnings = FALSE, recursive = TRUE)

cat("Folder structure prepared:\n")
print(c("data/", "scripts/", "output/"))

cat("\n--- FIRST SPATIAL OBJECT ---\n")

jatim_path <- file.path("Week_1 and 2", "data", "Provinsi Jawa Timur-KAB_KOTA.geojson")

if (!file.exists(jatim_path)) {
  stop("File GeoJSON tidak ditemukan: ", jatim_path)
}

jatim <- st_read(jatim_path, quiet = TRUE)

cat("Class of jatim:\n")
print(class(jatim))

cat("\nFirst rows:\n")
print(head(jatim))

cat("\nCoordinate Reference System:\n")
print(st_crs(jatim))

cat("\nGeometry type:\n")
print(unique(st_geometry_type(jatim)))

cat("\nJumlah kabupaten/kota:\n")
print(nrow(jatim))

plot(st_geometry(jatim), main = "Batas Administrasi Kabupaten/Kota - Jawa Timur")

cat("\n--- VARIABLES ---\n")

kab_kota <- "Surabaya"
kode_provinsi <- "35"
jumlah_kabkota <- 28L
luas_wilayah_km2 <- 47800.45
provinsi_pesisir <- TRUE

print(kab_kota)
print(kode_provinsi)
print(jumlah_kabkota)
print(luas_wilayah_km2)
print(provinsi_pesisir)

Kab_Kota <- "Surabaya"
KAB_KOTA <- "SURABAYA"

cat("\nCase-sensitive variable names:\n")
print(c(kab_kota = kab_kota, Kab_Kota = Kab_Kota, KAB_KOTA = KAB_KOTA))

kab_terluas <- "Malang"
penduduk_surabaya <- 3000000
ketinggian_malang_mdpl <- 468.45

cat("\n--- DATA TYPES ---\n")

luas_kab_malang_km2 <- 3530.65
jumlah_kec_mojokerto <- 18L
status_kota <- "Kota"
kota_pesisir <- TRUE
nilai_kompleks <- 1 + 4i
data_hilang <- NA
objek_kosong <- NULL
bukan_angka <- NaN

atomic_objects <- list(
  luas_kab_malang_km2 = luas_kab_malang_km2,
  jumlah_kec_mojokerto = jumlah_kec_mojokerto,
  status_kota = status_kota,
  kota_pesisir = kota_pesisir,
  nilai_kompleks = nilai_kompleks,
  data_hilang = data_hilang,
  objek_kosong = objek_kosong,
  bukan_angka = bukan_angka
)

for (nm in names(atomic_objects)) {
  x <- atomic_objects[[nm]]
  cat("\n", nm, "\n", sep = "")
  print(x)
  cat("class :", paste(class(x), collapse = ", "), "\n")
  cat("typeof:", typeof(x), "\n")
}

cat("\n--- IDENTIFYING TYPES ---\n")

print(class(10.5))
print(typeof(10L))
print(is.numeric("10"))
print(is.numeric(10))
print(is.character("10"))
print(is.logical(TRUE))

cat("\n--- DATA STRUCTURES ---\n")

lintang_kab <- c(-7.26, -7.97, -8.12, -7.54)
kabupaten <- c("Surabaya", "Malang", "Kediri", "Mojokerto")

print(lintang_kab)
print(kabupaten)
print(class(kabupaten))

campuran <- c(5.7, 4, "ya", TRUE)
cat("\nMixed vector:\n")
print(campuran)
print(typeof(campuran))

kota <- list(
  nama = "Malang",
  jumlah_kecamatan = 33,
  ketinggian_mdpl = 468.45,
  lintang_bujur = c(-7.97, 112.63)
)

print(kota)

matriks_3x3 <- matrix(1:9, nrow = 3, ncol = 3)
print(matriks_3x3)

kab_df <- data.frame(
  kabupaten = c("Surabaya", "Malang", "Kediri", "Mojokerto"),
  lintang = c(-7.26, -7.97, -8.12, -7.54),
  bujur = c(112.75, 112.63, 112.01, 112.43),
  status = c("Kota", "Kota", "Kabupaten", "Kabupaten")
)
print(kab_df)

kab_tbl <- tibble(
  kabupaten = c("Surabaya", "Malang", "Kediri", "Mojokerto"),
  lintang = c(-7.26, -7.97, -8.12, -7.54),
  bujur = c(112.75, 112.63, 112.01, 112.43),
  status = c("Kota", "Kota", "Kabupaten", "Kabupaten")
)
print(kab_tbl)

cat("\n--- INDEXING ---\n")

nilai_campuran <- c(5.7, 4, "ya", TRUE)

cat("First element: ")
print(nilai_campuran[1])

cat("Third element: ")
print(nilai_campuran[3])

cat("Elements 1 to 3: ")
print(nilai_campuran[1:3])

cat("\nNamed list indexing:\n")
print(kota$nama)
print(kota[["jumlah_kecamatan"]])

cat("\nData-frame column indexing:\n")
print(kab_df$status)
print(kab_df[1, ])
print(kab_df[, "kabupaten"])

cat("\nsf attribute and geometry access:\n")
print(head(jatim$kab_kota))
print(head(st_geometry(jatim), 2))

cat("\n--- TYPE CONVERSION ---\n")

numeric_dari_teks <- as.numeric("468.45")
teks_dari_angka <- as.character(2026)
logical_dari_angka <- as.logical(1)
nilai_tanggal <- as.Date("2026-09-07")
status_faktor <- factor(c("Kota", "Kabupaten", "Kota", "Kabupaten"))

print(numeric_dari_teks)
print(teks_dari_angka)
print(logical_dari_angka)
print(nilai_tanggal)
print(status_faktor)

bad_numeric <- suppressWarnings(as.numeric("468 mdpl"))
cat("\nConverting '468 mdpl' directly to numeric gives:\n")
print(bad_numeric)

clean_numeric <- as.numeric(gsub(" mdpl", "", "468 mdpl"))
print(clean_numeric)

cat("\n--- ARITHMETIC OPERATORS ---\n")

print(4 + 3)
print(4 - 3)
print(4 * 3)
print(7 / 2)
print(7 %% 2)
print(7 %/% 2)
print(7 ^ 2)

cat("\nOperator precedence:\n")
print(4 + 3 ^ 2)
print((4 + 3) ^ 2)
print(16 ^ 2 / 4)

cat("\n--- COMPARISON OPERATORS ---\n")

x <- 5

print(x == 5)
print(x != 5)
print(x < 7)
print(x > 7)
print(x <= 5)
print(x >= 5)

kode_prov <- "35"
print(kode_prov %in% c("35", "33", "32"))

luas_kab <- 3530
kepadatan <- 1200
status_kawasan <- "Kota"
jarak_ke_pesisir <- 15

print(luas_kab > 2000)
print(kepadatan >= 1000)
print(status_kawasan != "Kabupaten")

cat("\n--- LOGICAL OPERATORS ---\n")

x <- 14
y <- 42

x_genap <- (x %% 2) == 0
y_habis_dibagi_3 <- (y %% 3) == 0

cat("x genap:", x_genap, "\n")
cat("y habis dibagi 3:", y_habis_dibagi_3, "\n")

print(x_genap & y_habis_dibagi_3)
print(x_genap | FALSE)
print(!x_genap)
print(!(x_genap & y_habis_dibagi_3))

kota_padat <- status_kawasan == "Kota" & kepadatan > 1000
kota_dekat_pesisir <- status_kawasan == "Kota" & jarak_ke_pesisir < 50

cat("Kota padat:", kota_padat, "\n")
cat("Kota dekat pesisir:", kota_dekat_pesisir, "\n")

cat("\n--- VECTORISED FILTERING ---\n")

kawasan_df <- tibble(
  kabupaten = c("Surabaya", "Malang", "Kediri", "Mojokerto", "Bondowoso"),
  luas_km2 = c(374.17, 3530.65, 2371.88, 692.10, 1647.47),
  kepadatan = c(7973, 744, 1629, 1843, 526),
  status = c("Kota", "Kota", "Kabupaten", "Kabupaten", "Kabupaten")
)

print(kawasan_df)

kota_luas <- kawasan_df %>%
  filter(status == "Kota" & luas_km2 > 1000)

cat("\nKota dengan luas > 1000 km2:\n")
print(kota_luas)

cat("\n--- STRING OPERATIONS ---\n")

x <- "R"
y <- "spatial"

print(paste(x, y))
print(paste0(x, "-", y))
print(strrep("jatim ", 3))

print(stringr::str_to_upper("pemrograman spasial"))
print(stringr::str_detect("pemrograman spasial", "spasial"))

nama_provinsi <- "Jawa Timur"
print(glue::glue("Study area: {nama_provinsi}"))

wrong_string_operation <- try("R" + "spatial", silent = TRUE)
cat("\nAttempting 'R' + 'spatial' in R produces:\n")
print(wrong_string_operation)

cat("\n--- STRINGS + NUMBERS ---\n")

x <- 6
answer <- (x * 5345) %/% 763

print(answer)
print(paste("The answer is", answer))
print(glue::glue("The answer is {answer}"))

penduduk_jatim <- 41150000
popup <- paste("Populasi:", format(penduduk_jatim, big.mark = ","))
print(popup)

cat("\n--- MINI LAB: sf OBJECT ---\n")

jatim_lab <- jatim %>%
  mutate(
    luas_km2 = as.numeric(st_area(geometry)) / 1e6
  )

jatim_lab <- jatim_lab %>%
  mutate(
    kelas_luas = if_else(
      luas_km2 > median(luas_km2, na.rm = TRUE),
      "Luas",
      "Kecil"
    )
  )

cat("Class of jatim_lab:\n")
print(class(jatim_lab))

cat("\nNew variable kelas_luas:\n")
print(table(jatim_lab$kelas_luas, useNA = "ifany"))

cat("\nCRS:\n")
print(st_crs(jatim_lab))

cat("\nStructure:\n")
glimpse(jatim_lab)

cat("\nRingkasan luas kabupaten/kota (km2):\n")
print(jatim_lab %>%
        st_drop_geometry() %>%
        select(kab_kota, luas_km2, kelas_luas) %>%
        arrange(desc(luas_km2)))

plot(jatim_lab["kelas_luas"], main = "Kategori Luas Wilayah - Jawa Timur")

map_plot <- ggplot(jatim_lab) +
  geom_sf(aes(fill = kelas_luas)) +
  geom_sf_text(aes(label = kab_kota), size = 2, check_overlap = TRUE) +
  labs(
    title = "Kategori Luas Wilayah Kabupaten/Kota",
    subtitle = "Provinsi Jawa Timur - Berdasarkan median luas wilayah",
    fill = "Kategori Luas"
  ) +
  theme_minimal()

print(map_plot)

ggsave(
  filename = file.path("Week_1 and 2", "output", "week01_kategori_luas_jatim.png"),
  plot = map_plot,
  width = 10,
  height = 8,
  dpi = 150
)

cat("\nMap saved to: Week_1 and 2/output/week01_kategori_luas_jatim.png\n")
