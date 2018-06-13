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
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "#require \"yojson\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/easy-format: added to search path\
           \n/home/travis/.opam/4.04.2/lib/easy-format/easy_format.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/biniou: added to search path\
           \n/home/travis/.opam/4.04.2/lib/biniou/biniou.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/yojson: added to search path\
           \n/home/travis/.opam/4.04.2/lib/yojson/yojson.cma: loaded"))))
       ((ocaml_code "let json = Yojson.Basic.from_file \"book.json\" ;;")
        (toplevel_responses
         ((OCaml
            "val json : Yojson.Basic.json =\
           \n  `Assoc\
           \n    [(\"title\", `String \"Real World OCaml\");\
           \n     (\"tags\",\
           \n      `List\
           \n        [`String \"functional programming\"; `String \"ocaml\";\
           \n         `String \"algorithms\"]);\
           \n     (\"pages\", `Int 450);\
           \n     (\"authors\",\
           \n      `List\
           \n        [`Assoc\
           \n           [(\"name\", `String \"Jason Hickey\");\
           \n            (\"affiliation\", `String \"Google\")];\
           \n         `Assoc\
           \n           [(\"name\", `String \"Anil Madhavapeddy\");\
           \n            (\"affiliation\", `String \"Cambridge\")];\
           \n         `Assoc\
           \n           [(\"name\", `String \"Yaron Minsky\");\
           \n            (\"affiliation\", `String \"Jane Street\")]]);\
           \n     (\"is_online\", `Bool true)]")))))))
    ((name 1)
     (chunks
      (((ocaml_code "open Yojson.Basic.Util ;;") (toplevel_responses ()))
       ((ocaml_code "let title = json |> member \"title\" |> to_string ;;")
        (toplevel_responses
         ((OCaml "val title : string = \"Real World OCaml\"")))))))
    ((name 2)
     (chunks
      (((ocaml_code
         "let tags = json |> member \"tags\" |> to_list |> filter_string ;;")
        (toplevel_responses
         ((OCaml
           "val tags : string list = [\"functional programming\"; \"ocaml\"; \"algorithms\"]"))))
       ((ocaml_code "let pages = json |> member \"pages\" |> to_int ;;")
        (toplevel_responses ((OCaml "val pages : int = 450")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "let is_online = json |> member \"is_online\" |> to_bool_option ;;")
        (toplevel_responses
         ((OCaml "val is_online : bool option = Some true"))))
       ((ocaml_code
         "let is_translated = json |> member \"is_translated\" |> to_bool_option ;;")
        (toplevel_responses
         ((OCaml "val is_translated : bool option = None")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let authors = json |> member \"authors\" |> to_list ;;")
        (toplevel_responses
         ((OCaml
            "val authors : Yojson.Basic.json list =\
           \n  [`Assoc\
           \n     [(\"name\", `String \"Jason Hickey\"); (\"affiliation\", `String \"Google\")];\
           \n   `Assoc\
           \n     [(\"name\", `String \"Anil Madhavapeddy\");\
           \n      (\"affiliation\", `String \"Cambridge\")];\
           \n   `Assoc\
           \n     [(\"name\", `String \"Yaron Minsky\");\
           \n      (\"affiliation\", `String \"Jane Street\")]]")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let names =\
         \n  json |> member \"authors\" |> to_list \
         \n  |> List.map ~f:(fun json -> member \"name\" json |> to_string) ;;")
        (toplevel_responses
         ((OCaml
            "val names : string list =\
           \n  [\"Jason Hickey\"; \"Anil Madhavapeddy\"; \"Yaron Minsky\"]")))))))))
  (matched false)))
