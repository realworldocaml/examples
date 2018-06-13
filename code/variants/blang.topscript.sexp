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
      (((ocaml_code
          "type 'a expr =\
         \n  | Base  of 'a\
         \n  | Const of bool\
         \n  | And   of 'a expr list\
         \n  | Or    of 'a expr list\
         \n  | Not   of 'a expr\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type 'a expr =\
           \n    Base of 'a\
           \n  | Const of bool\
           \n  | And of 'a expr list\
           \n  | Or of 'a expr list\
           \n  | Not of 'a expr")))))))
    ((name 1)
     (chunks
      (((ocaml_code "type mail_field = To | From | CC | Date | Subject;;")
        (toplevel_responses
         ((OCaml "type mail_field = To | From | CC | Date | Subject"))))
       ((ocaml_code
          "type mail_predicate = { field: mail_field;\
         \n                        contains: string }\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type mail_predicate = { field : mail_field; contains : string; }")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let test field contains = Base { field; contains };;")
        (toplevel_responses
         ((OCaml
           "val test : mail_field -> string -> mail_predicate expr = <fun>"))))
       ((ocaml_code
          "And [ Or [ test To \"doligez\"; test CC \"doligez\" ];\
         \n      test Subject \"runtime\";\
         \n    ]\
         \n;;")
        (toplevel_responses
         ((OCaml
            "- : mail_predicate expr =\
           \nAnd\
           \n [Or\
           \n   [Base {field = To; contains = \"doligez\"};\
           \n    Base {field = CC; contains = \"doligez\"}];\
           \n  Base {field = Subject; contains = \"runtime\"}]")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let rec eval expr base_eval =\
         \n  (* a shortcut, so we don't need to repeatedly pass [base_eval]\
         \n     explicitly to [eval] *)\
         \n  let eval' expr = eval expr base_eval in\
         \n  match expr with\
         \n  | Base  base  -> base_eval base\
         \n  | Const bool  -> bool\
         \n  | And   exprs -> List.for_all exprs ~f:eval'\
         \n  | Or    exprs -> List.exists  exprs ~f:eval'\
         \n  | Not   expr  -> not (eval' expr)\
         \n;;")
        (toplevel_responses
         ((OCaml "val eval : 'a expr -> ('a -> bool) -> bool = <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let and_ l =\
         \n  if List.mem l (Const false) then Const false\
         \n  else\
         \n    match List.filter l ~f:((<>) (Const true)) with\
         \n    | [] -> Const true\
         \n    | [ x ] -> x\
         \n    | l -> And l\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 18-42:\
           \nError: This expression has type equal:('a expr -> 'a expr -> bool) -> bool\
           \n       but an expression was expected of type bool"))))
       ((ocaml_code
          "let or_ l =\
         \n  if List.mem l (Const true) then Const true\
         \n  else\
         \n    match List.filter l ~f:((<>) (Const false)) with\
         \n    | [] -> Const false\
         \n    | [x] -> x\
         \n    | l -> Or l\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 17-40:\
           \nError: This expression has type equal:('a expr -> 'a expr -> bool) -> bool\
           \n       but an expression was expected of type bool"))))
       ((ocaml_code
          "let not_ = function\
         \n  | Const b -> Const (not b)\
         \n  | e -> Not e\
         \n;;")
        (toplevel_responses
         ((OCaml "val not_ : 'a expr -> 'a expr = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let rec simplify = function\
         \n  | Base _ | Const _ as x -> x\
         \n  | And l -> and_ (List.map ~f:simplify l)\
         \n  | Or l  -> or_  (List.map ~f:simplify l)\
         \n  | Not e -> not_ (simplify e)\
         \n;;")
        (toplevel_responses
         ((Raw  "Characters 72-76:\
               \nError: Unbound value and_")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "simplify (Not (And [ Or [Base \"it's snowing\"; Const true];\
         \n                     Base \"it's raining\"]));;")
        (toplevel_responses
         ((Raw  "Characters 0-8:\
               \nError: Unbound value simplify")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "simplify (Not (And [ Or [Base \"it's snowing\"; Const true];\
         \n                     Not (Not (Base \"it's raining\"))]));;")
        (toplevel_responses
         ((Raw  "Characters 0-8:\
               \nError: Unbound value simplify")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let not_ = function\
         \n  | Const b -> Const (not b)\
         \n  | (Base _ | And _ | Or _ | Not _) as e -> Not e\
         \n;;")
        (toplevel_responses
         ((OCaml "val not_ : 'a expr -> 'a expr = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let not_ = function\
         \n  | Const b -> Const (not b)\
         \n  | Not e -> e\
         \n  | (Base _ | And _ | Or _ ) as e -> Not e\
         \n;;")
        (toplevel_responses
         ((OCaml "val not_ : 'a expr -> 'a expr = <fun>")))))))))
  (matched true)))
