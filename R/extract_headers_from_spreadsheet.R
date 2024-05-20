#' Pull header information from every sheet in a workbook
#'
#' @param .spreadsheet the full path to the workbook file
#' @param .nrows the number of rows to read as headers
#'
#' @return a tibble with 2 + `.nrows` columns
#' * **Sheet** <chr> the name of the sheet the headers come from
#' * **Column** <int> which column the headers come from
#' * **Row\[i\]** <chr> the value of the header in row $i$ of the column
#' @export
#' @seealso [extract_headers_from_sheet()]
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