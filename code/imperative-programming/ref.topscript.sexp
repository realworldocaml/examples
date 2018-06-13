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
    ((name 1)
     (chunks
      (((ocaml_code "type 'a ref = { mutable contents : 'a };;")
        (toplevel_responses
         ((OCaml "type 'a ref = { mutable contents : 'a; }")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let ref x = { contents = x };;")
        (toplevel_responses ((OCaml "val ref : 'a -> 'a ref = <fun>"))))
       ((ocaml_code "let (!) r = r.contents;;")
        (toplevel_responses ((OCaml "val ( ! ) : 'a ref -> 'a = <fun>"))))
       ((ocaml_code "let (:=) r x = r.contents <- x;;")
        (toplevel_responses
         ((OCaml "val ( := ) : 'a ref -> 'a -> unit = <fun>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let x = ref 1;;")
        (toplevel_responses ((OCaml "val x : int ref = {contents = 1}"))))
       ((ocaml_code "!x;;") (toplevel_responses ((OCaml "- : int = 1"))))
       ((ocaml_code "x := !x + 1;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "!x;;") (toplevel_responses ((OCaml "- : int = 2")))))))))
  (matched true)))
