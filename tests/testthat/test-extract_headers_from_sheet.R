test_that("three args", {
    expect_equal(
        function_args(extract_headers_from_sheet),
        c(".spreadsheet", ".sheet", ".nrows")
    )
})
