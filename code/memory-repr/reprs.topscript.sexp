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
      (((ocaml_code "Obj.is_block (Obj.repr (1,2,3)) ;;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code "Obj.is_block (Obj.repr 1) ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 1)
     (chunks
      (((ocaml_code "Obj.tag (Obj.repr 1.0) ;;")
        (toplevel_responses ((OCaml "- : int = 253"))))
       ((ocaml_code "Obj.double_tag ;;")
        (toplevel_responses ((OCaml "- : int = 253")))))))
    ((name 2)
     (chunks
      (((ocaml_code "Obj.double_tag ;;")
        (toplevel_responses ((OCaml "- : int = 253"))))
       ((ocaml_code "Obj.double_array_tag ;;")
        (toplevel_responses ((OCaml "- : int = 254")))))))
    ((name 3)
     (chunks
      (((ocaml_code "Obj.tag (Obj.repr [| 1.0; 2.0; 3.0 |]) ;;")
        (toplevel_responses ((OCaml "- : int = 254"))))
       ((ocaml_code "Obj.tag (Obj.repr (1.0, 2.0, 3.0) ) ;;")
        (toplevel_responses ((OCaml "- : int = 0"))))
       ((ocaml_code "Obj.double_field (Obj.repr [| 1.1; 2.2; 3.3 |]) 1 ;;")
        (toplevel_responses ((OCaml "- : float = 2.2"))))
       ((ocaml_code "Obj.double_field (Obj.repr 1.234) 0 ;;")
        (toplevel_responses ((OCaml "- : float = 1.234")))))))
    ((name 4)
     (chunks
      (((ocaml_code "type t = Apple | Orange | Pear ;;")
        (toplevel_responses ((OCaml "type t = Apple | Orange | Pear"))))
       ((ocaml_code "((Obj.magic (Obj.repr Apple)) : int) ;;")
        (toplevel_responses ((OCaml "- : int = 0"))))
       ((ocaml_code "((Obj.magic (Obj.repr Pear)) : int) ;;")
        (toplevel_responses ((OCaml "- : int = 2"))))
       ((ocaml_code "Obj.is_block (Obj.repr Apple) ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 5)
     (chunks
      (((ocaml_code
         "type t = Apple | Orange of int | Pear of string | Kiwi ;;")
        (toplevel_responses
         ((OCaml "type t = Apple | Orange of int | Pear of string | Kiwi"))))
       ((ocaml_code "Obj.is_block (Obj.repr (Orange 1234)) ;;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code "Obj.tag (Obj.repr (Orange 1234)) ;;")
        (toplevel_responses ((OCaml "- : int = 0"))))
       ((ocaml_code "Obj.tag (Obj.repr (Pear \"xyz\")) ;;")
        (toplevel_responses ((OCaml "- : int = 1"))))
       ((ocaml_code
         "(Obj.magic (Obj.field (Obj.repr (Orange 1234)) 0) : int) ;;")
        (toplevel_responses ((OCaml "- : int = 1234"))))
       ((ocaml_code
         "(Obj.magic (Obj.field (Obj.repr (Pear \"xyz\")) 0) : string) ;;")
        (toplevel_responses ((OCaml "- : string = \"xyz\"")))))))
    ((name 6)
     (chunks
      (((ocaml_code "Pa_type_conv.hash_variant \"Foo\" ;;")
        (toplevel_responses
         ((Raw  "Characters 0-25:\
               \nError: Unbound module Pa_type_conv"))))
       ((ocaml_code "(Obj.magic (Obj.repr `Foo) : int) ;;")
        (toplevel_responses ((OCaml "- : int = 3505894")))))))))
  (matched true)))
