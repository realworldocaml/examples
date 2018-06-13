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
    ((name 1)
     (chunks
      (((ocaml_code
         "let v = lazy (print_string \"performing lazy computation\\n\"; sqrt 16.);;")
        (toplevel_responses ((OCaml "val v : float lazy_t = <lazy>"))))
       ((ocaml_code "Lazy.force v;;")
        (toplevel_responses
         ((Raw "performing lazy computation") (OCaml "- : float = 4."))))
       ((ocaml_code "Lazy.force v;;")
        (toplevel_responses ((OCaml "- : float = 4.")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "type 'a lazy_state =\
         \n  | Delayed of (unit -> 'a)\
         \n  | Value of 'a\
         \n  | Exn of exn\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type 'a lazy_state = Delayed of (unit -> 'a) | Value of 'a | Exn of exn")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let create_lazy f = ref (Delayed f);;")
        (toplevel_responses
         ((OCaml
           "val create_lazy : (unit -> 'a) -> 'a lazy_state ref = <fun>"))))
       ((ocaml_code
          "let v = create_lazy\
         \n          (fun () -> print_string \"performing lazy computation\\n\"; sqrt 16.);;")
        (toplevel_responses
         ((OCaml "val v : float lazy_state ref = {contents = Delayed <fun>}")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let force v =\
         \n  match !v with\
         \n  | Value x -> x\
         \n  | Exn e -> raise e\
         \n  | Delayed f ->\
         \n    try\
         \n      let x = f () in\
         \n      v := Value x;\
         \n      x\
         \n    with exn ->\
         \n      v := Exn exn;\
         \n      raise exn\
         \n;;")
        (toplevel_responses
         ((OCaml "val force : 'a lazy_state ref -> 'a = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code "force v;;")
        (toplevel_responses
         ((Raw "performing lazy computation") (OCaml "- : float = 4."))))
       ((ocaml_code "force v;;")
        (toplevel_responses ((OCaml "- : float = 4.")))))))))
  (matched true)))
