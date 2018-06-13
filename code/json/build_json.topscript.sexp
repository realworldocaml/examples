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
           \n/home/travis/.opam/4.04.2/lib/yojson/yojson.cma: loaded")))))))
    ((name 1)
     (chunks
      (((ocaml_code
         "let person = `Assoc [ (\"name\", `String \"Anil\") ] ;;")
        (toplevel_responses
         ((OCaml
            "val person : [> `Assoc of (string * [> `String of string ]) list ] =\
           \n  `Assoc [(\"name\", `String \"Anil\")]")))))))
    ((name 2)
     (chunks
      (((ocaml_code "Yojson.Basic.pretty_to_string ;;")
        (toplevel_responses
         ((OCaml "- : ?std:bool -> Yojson.Basic.json -> string = <fun>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "Yojson.Basic.pretty_to_string person ;;")
        (toplevel_responses
         ((OCaml "- : string = \"{ \\\"name\\\": \\\"Anil\\\" }\""))))
       ((ocaml_code "Yojson.Basic.pretty_to_channel stdout person ;;")
        (toplevel_responses
         ((Raw "{ \"name\": \"Anil\" }") (OCaml "- : unit = ()")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let person = `Assoc (\"name\", `String \"Anil\");;")
        (toplevel_responses
         ((OCaml
            "val person : [> `Assoc of string * [> `String of string ] ] =\
           \n  `Assoc (\"name\", `String \"Anil\")"))))
       ((ocaml_code "Yojson.Basic.pretty_to_string person ;;")
        (toplevel_responses
         ((Raw
            "Characters 30-36:\
           \nError: This expression has type\
           \n         [> `Assoc of string * [> `String of string ] ]\
           \n       but an expression was expected of type Yojson.Basic.json\
           \n       Types for tag `Assoc are incompatible")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let (person : Yojson.Basic.json) =\
         \n  `Assoc (\"name\", `String \"Anil\");;")
        (toplevel_responses
         ((Raw
            "Characters 44-68:\
           \nError: This expression has type 'a * 'b\
           \n       but an expression was expected of type\
           \n         (string * Yojson.Basic.json) list")))))))))
  (matched false)))
