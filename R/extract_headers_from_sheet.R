extract_headers_from_sheet <- function(.spreadsheet,
                                       .sheet,
                                       .nrows) {
    .result <- .spreadsheet |>
        readxl::read_excel(
            .sheet,
            n_max = .nrows,
            col_names = FALSE,
            col_types = "text"
        ) |>
        suppressMessages()
    
    if (nrow(.result) == 0L) {
        return(.result)
    }
    
    .result |>
        dplyr::mutate(
            Row = dplyr::row_number()
        ) |>
        tidyr::pivot_longer(
            cols = !"Row",
            names_to = "Column",
            names_prefix = "...",
            names_transform = list(Column = as.integer),
            values_to = "Value",
            values_drop_na = FALSE
        ) |>
        tidyr::pivot_wider(
            names_from = "Row",
            values_from = "Value",
            names_prefix = "Row"
        )
}