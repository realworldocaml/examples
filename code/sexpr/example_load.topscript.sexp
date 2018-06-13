(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#use \"topfind\";;") (toplevel_responses ()))
       ((ocaml_code "#thread;;") (toplevel_responses ()))
       ((ocaml_code "#camlp4o;;") (toplevel_responses ()))
       ((ocaml_code "#require \"core\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"core.top\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"ppx_jane\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code "Sexp.load_sexp \"example.scm\";;")
        (toplevel_responses
         ((OCaml
           "- : Sexp.t = ((foo 3.3) (bar \"this is () an \\\" atom\"))")))))))
    ((name 1)
     (chunks
      (((ocaml_code "Sexp.load_sexp \"comment_heavy.scm\" ;;")
        (toplevel_responses
         ((OCaml
           "- : Sexp.t = ((this is included) (this stays) (and now we're done))")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "Exn.handle_uncaught ~exit:false (fun () ->\
         \n  ignore (Sexp.load_sexp \"example_broken.scm\")) ;;")
        (toplevel_responses
         ((Raw
            "Uncaught exception:\
           \n  \
           \n  (Sexplib.Sexp.Parse_error\
           \n   ((location parse) (err_msg \"unexpected character: ')'\") (text_line 4)\
           \n    (text_char 29) (global_offset 78) (buf_pos 78)))\
           \n")
          (OCaml "- : unit = ()")))))))))
  (matched true)))
