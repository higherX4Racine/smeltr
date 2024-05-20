test_that("one arg", {
    expect_equal(
        function_args(extract_cells_from_spreadsheet),
        ".spreadsheet"
    )
})
