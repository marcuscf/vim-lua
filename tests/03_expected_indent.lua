Lisp = { define { lisp style tbl }
    { let { a = 1, b = 2 }
        { call_something }
        { close_everything } } }

C = C_style_tbl {
    call_something {
        call_something_else {
            arguments
        }
    }
}
