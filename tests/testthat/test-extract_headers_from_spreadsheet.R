test_that("two args", {
    expect_equal(
        function_args(extract_headers_from_spreadsheet),
        c(".spreadsheet", ".nrows")
    )
})
