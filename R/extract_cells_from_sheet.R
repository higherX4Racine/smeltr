extract_cells_from_sheet <- function(.spreadsheet, .sheet){
    .sheet <- .spreadsheet |>
        readxl::read_excel(
            .sheet,
            col_names = FALSE,
            col_types = "text"
        ) |>
        suppressMessages()
    
    if (nrow(.sheet) > 0L && ncol(.sheet) > 0L) {
        .sheet <- .sheet |>
            dplyr::mutate(
                Row = dplyr::row_number()
            ) |>
            tidyr::pivot_longer(
                cols = !"Row",
                names_to = "Column",
                names_prefix = "...",
                names_transform = list(Column = as.integer),
                values_to = "Value"
            )
    }
    
    .sheet
}