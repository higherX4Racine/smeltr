test_that("two args", {
    expect_equal(
        function_args(extract_cells_from_sheet),
        c(".spreadsheet", ".sheet")
    )
})
