#' Read every cell in a single sheet and save them with their addresses
#'
#' @inheritParams extract_headers_from_sheet
#'
#' @return a tibble with 3 columns
#' \describe{
#'   \item{Row}{`<int>` The row number of the cell}
#'   \item{Column}{`<int>` The column number of the cell}
#'   \item{Value}{`<chr>` The literal contents of the cell}
#' }
#' @export
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