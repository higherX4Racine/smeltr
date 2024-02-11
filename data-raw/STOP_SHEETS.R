## code to prepare `STOP_SHEETS` dataset goes here

STOP_SHEETS <- c(
    "Cover",
    "Key",
    "Waitlist"
) |>
    sort()
    
usethis::use_data(STOP_SHEETS, overwrite = TRUE)

