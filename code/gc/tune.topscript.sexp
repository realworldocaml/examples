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
       ((ocaml_code "#silent false;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "let c = Gc.get () ;;")
        (toplevel_responses
         ((OCaml
            "val c : Gc.control =\
           \n  {Core_kernel.Gc.Control.minor_heap_size = 262144;\
           \n   major_heap_increment = 15; space_overhead = 80; verbose = 0;\
           \n   max_overhead = 500; stack_limit = 1048576; allocation_policy = 0;\
           \n   window_size = 1}"))))
       ((ocaml_code "Gc.tune ~minor_heap_size:(262144 * 2) () ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))
    ((name 1)
     (chunks
      (((ocaml_code "Gc.tune ~major_heap_increment:(1000448 * 4) () ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))
    ((name 2)
     (chunks
      (((ocaml_code "Gc.major_slice 0 ;;")
        (toplevel_responses ((OCaml "- : int = 0"))))
       ((ocaml_code "Gc.full_major () ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))
    ((name 3)
     (chunks
      (((ocaml_code "Gc.tune ~max_overhead:0 () ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))))
  (matched true)))
