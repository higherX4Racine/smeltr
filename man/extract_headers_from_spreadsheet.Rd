% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_headers_from_spreadsheet.R
\name{extract_headers_from_spreadsheet}
\alias{extract_headers_from_spreadsheet}
\title{Pull header information from every sheet in a workbook}
\usage{
extract_headers_from_spreadsheet(.spreadsheet, .nrows)
}
\arguments{
\item{.spreadsheet}{\verb{<chr>} the full path to the workbook file}

\item{.nrows}{\verb{<int>} the number of rows to read as headers}
}
\value{
a tibble with 2 + \code{.nrows} columns
\describe{
\item{Sheet}{\verb{<chr>} the name of the sheet the headers come from}
\item{Column}{\verb{<int>} which column the headers come from}
\item{Row\verb{[i]}}{\verb{<chr>} the value of the header in row \code{i} of the column}
}
}
\description{
Pull header information from every sheet in a workbook
}
\seealso{
\code{\link[=extract_headers_from_sheet]{extract_headers_from_sheet()}}
}
