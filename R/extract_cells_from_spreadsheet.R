#' Read every cell in an entire spreadsheet and save them with their addresses
#'
#' @inheritParams extract_headers_from_sheet
#'
#' @return a tibble with 4 columns
#' \describe{
#'   \item{Sheet}{<chr> The sheet that the cell came from}
#'   \item{Row}{<int> The row number of the cell}
#'   \item{Column}{<int> The column number of the cell}
#'   \item{Value}{<chr> The literal contents of the cell}
#' }
#' @export
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