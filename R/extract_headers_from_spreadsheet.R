extract_headers_from_spreadsheet <- function(.spreadsheet,
                                             .nrows) {
    .sheets <- .spreadsheet |>
        readxl::excel_sheets() |>
        rlang::set_names() |>
        purrr::map(
            ~ extract_headers_from_sheet(.spreadsheet,
                                         .,
                                         .nrows)
        ) |>
        purrr::list_rbind(
            names_to = "Sheet"
        )
}