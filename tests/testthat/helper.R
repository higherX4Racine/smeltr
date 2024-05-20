function_args <- function(.closure){
    .closure |>
        formals() |>
        names()
}