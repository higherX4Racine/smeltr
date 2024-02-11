extract_cells_from_spreadsheet <- function(.spreadsheet){
    .spreadsheet |>
        readxl::excel_sheets() |>
        rlang::set_names() |>
        purrr::map(
            ~ extract_cells_from_sheet(.spreadsheet, .)
        ) |>
        purrr::list_rbind(
            names_to = "Sheet"
        )
}