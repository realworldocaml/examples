(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#use \"topfind\";;")
        (toplevel_responses
         ((OCaml "- : unit = ()")
          (Raw
            "Findlib has been successfully loaded. Additional directives:\
           \n  #require \"package\";;      to load a package\
           \n  #list;;                   to list the available packages\
           \n  #camlp4o;;                to load camlp4 (standard syntax)\
           \n  #camlp4r;;                to load camlp4 (revised syntax)\
           \n  #predicates \"p,q,...\";;   to set these predicates\
           \n  Topfind.reset();;         to force that packages will be reloaded\
           \n  #thread;;                 to enable threads\
           \n")
          (OCaml "- : unit = ()"))))
       ((ocaml_code "#thread;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/threads: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/threads/threads.cma: loaded"))))
       ((ocaml_code "#camlp4o;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/dynlink.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma: loaded\
           \nCannot find file /home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma."))))
       ((ocaml_code "#require \"core\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/base/caml: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/caml/caml.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib/shadow_stdlib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/0: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/base.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/fieldslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/fieldslib/fieldslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib/ppx_compare_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib/variantslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape/bin_shape_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/bin_prot.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib/ppx_hash_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config/inline_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib/ppx_inline_test_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests/base_for_tests.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers: added to search path\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers/jane_street_headers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/nums.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num-top: added to search path\
           \n/home/travis/.opam/4.04.2/lib/num-top/num_top.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib/ppx_assert_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib/ppx_bench_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common/expect_test_common.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config/expect_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector/expect_test_collector.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/stdio: added to search path\
           \n/home/travis/.opam/4.04.2/lib/stdio/stdio.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/typerep: added to search path\
           \n/home/travis/.opam/4.04.2/lib/typerep/typerep_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/core_kernel.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix: added to search path\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix/sexplib_unix.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/spawn: added to search path\
           \n/home/travis/.opam/4.04.2/lib/spawn/spawn.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core/core.cma: loaded"))))
       ((ocaml_code "#require \"ppx_jane\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ppx_jane: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_jane/./ppx.exe --as-ppx: activated"))))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code
          "type 'a compact_array = \
         \n  | Array of 'a array\
         \n  | Bytes of bytes\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type 'a compact_array = Array of 'a array | Bytes of Core_kernel.bytes")))))))
    ((name 1.1)
     (chunks
      (((ocaml_code
          "let of_bytes x = Bytes x\
         \nlet of_array x = Array x\
         \n\
         \nlet length = function\
         \n  | Array a -> Array.length a\
         \n  | Bytes s -> Bytes.length s\
         \n\
         \nlet get t i =\
         \n  match t with\
         \n  | Array a -> a.(i)\
         \n  | Bytes s -> s.[i]\
         \n\
         \nlet set t i v =\
         \n  match t with\
         \n  | Array a -> a.(i) <- v\
         \n  | Bytes s -> s.[i] <- v\
         \n\
         \n[%%expect];;")
        (toplevel_responses
         ((Raw
            "Characters 294-300:\
           \nError: Extension `expect' was not translated.\
           \nHint: `expect' is available for expressions but is used here in the context\
           \nof a structure item.\
           \nDid you put it at the wrong level?")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "type 'a gadt_compact_array =\
         \n  | Array : 'a array -> 'a t\
         \n  | Bytes : bytes -> 'a t\
         \n;;")
        (toplevel_responses
         ((Raw  "Characters 54-58:\
               \nError: Unbound type constructor t")))))))
    ((name 2.1)
     (chunks
      (((ocaml_code "Array [|1;2;3|];;")
        (toplevel_responses
         ((OCaml "- : int compact_array = Array [|1; 2; 3|]"))))
       ((ocaml_code "Array [|1.0;2.0;3.0|];;")
        (toplevel_responses
         ((OCaml "- : float compact_array = Array [|1.; 2.; 3.|]"))))
       ((ocaml_code  "# part 2.2\
                    \n\
                    \n  Bytes \"foo\";;")
        (toplevel_responses
         ((Raw  "Characters 8-11:\
               \nError: Syntax error")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "type 'a t = | Array : 'a array -> 'a t\
         \n            | Bytes : bytes -> char t\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type 'a t = Array : 'a array -> 'a t | Bytes : Core_kernel.bytes -> char t")))))))
    ((name 3.1)
     (chunks
      (((ocaml_code
          "let length t = \
         \n  match t with\
         \n  | Bytes b -> Bytes.length b\
         \n  | Array a -> Array.length a\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 60-61:\
           \nError: This expression has type Core_kernel.bytes\
           \n       but an expression was expected of type string")))))))
    ((name 3.2)
     (chunks
      (((ocaml_code
          "let length (type el) (t:el t) = \
         \n  match t with\
         \n  | Bytes b -> Bytes.length b\
         \n  | Array a -> Array.length a\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 77-78:\
           \nError: This expression has type Core_kernel.bytes\
           \n       but an expression was expected of type string")))))))
    ((name 3.3)
     (chunks
      (((ocaml_code
          "module Compact_array = struct\
         \n\
         \n  type 'a t = | Array : 'a array -> 'a t\
         \n              | Bytes : bytes -> char t\
         \n\
         \n  let of_bytes x = Bytes x\
         \n  let of_array x = Array x\
         \n\
         \n  let length (type el) (t:el t) =\
         \n    match t with\
         \n    | Array a -> Array.length a\
         \n    | Bytes s -> Bytes.length s\
         \n\
         \n  let get (type el) (t:el t) i : el =\
         \n    match t with\
         \n    | Array a -> Array.get a i\
         \n    | Bytes s -> Bytes.get s i\
         \n\
         \n  let set (type el) (t:el t) i (v:el) =\
         \n    match t with\
         \n    | Array a -> Array.set a i v\
         \n    | Bytes s -> Bytes.set s i v\
         \n\
         \nend;;")
        (toplevel_responses
         ((Raw
            "Characters 282-283:\
           \nError: This expression has type Core_kernel.bytes\
           \n       but an expression was expected of type string")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "type value =\
         \n  | Int of int\
         \n  | Bool of bool\
         \n\
         \ntype expr = \
         \n  | Value of value\
         \n  | If    of expr * expr * expr\
         \n  | Gt    of expr * expr\
         \n  | Plus  of expr * expr\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type value = Int of int | Bool of bool\
           \ntype expr =\
           \n    Value of value\
           \n  | If of expr * expr * expr\
           \n  | Gt of expr * expr\
           \n  | Plus of expr * expr")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let max_expr x y =\
         \n  let i x = Value (Int x) in\
         \n  let x = i x in\
         \n  let y = i y in\
         \n  If (Gt (x,y), x, y)\
         \n;;")
        (toplevel_responses
         ((OCaml "val max_expr : int -> int -> expr = <fun>"))))
       ((ocaml_code "max_expr 3 4;;")
        (toplevel_responses
         ((OCaml
            "- : expr =\
           \nIf (Gt (Value (Int 3), Value (Int 4)), Value (Int 3), Value (Int 4))")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let ill_typed x y =\
         \n  let i x = Value (Int x) in\
         \n  let x = i x in\
         \n  let y = i y in\
         \n  Plus (Gt (x,y), y)\
         \n;;")
        (toplevel_responses
         ((OCaml "val ill_typed : int -> int -> expr = <fun>"))))
       ((ocaml_code "ill_typed 3 4;;")
        (toplevel_responses
         ((OCaml
           "- : expr = Plus (Gt (Value (Int 3), Value (Int 4)), Value (Int 4))")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "let rec eval expr =\
         \n  let eval_int expr =\
         \n    match eval expr with\
         \n    | Int x -> x\
         \n    | Bool _ -> failwith \"expected int, found bool\"\
         \n  in\
         \n  let eval_bool expr =\
         \n    match eval expr with\
         \n    | Bool x -> x\
         \n    | Int _ -> failwith \"expected bool, found int\"\
         \n  in\
         \n  match expr with\
         \n  | Value v    -> v\
         \n  | If (c,t,e) -> if eval_bool c then eval t else eval e\
         \n  | Gt (x,y)   -> Bool (eval_int x > eval_int y)\
         \n  | Plus (x,y) -> Int (eval_int x + eval_int y)\
         \n;;")
        (toplevel_responses ((OCaml "val eval : expr -> value = <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code "eval (max_expr  3 4);;")
        (toplevel_responses ((OCaml "- : value = Int 4"))))
       ((ocaml_code "eval (ill_typed 3 4);;")
        (toplevel_responses
         ((Raw "Exception: Failure \"expected int, found bool\".")))))))
    ((name 15)
     (chunks
      (((ocaml_code
          "type _ value =\
         \n  | Int  : int  -> int value\
         \n  | Bool : bool -> bool value\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type _ value = Int : int -> int value | Bool : bool -> bool value"))))
       ((ocaml_code
          "type _ expr =\
         \n  | Value : 'a value                      -> 'a expr\
         \n  | If    : bool expr * 'a expr * 'a expr -> 'a expr\
         \n  | Gt    : 'a expr * 'a expr             -> bool expr\
         \n  | Plus  : int expr * int expr           -> int expr\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type _ expr =\
           \n    Value : 'a value -> 'a expr\
           \n  | If : bool expr * 'a expr * 'a expr -> 'a expr\
           \n  | Gt : 'a expr * 'a expr -> bool expr\
           \n  | Plus : int expr * int expr -> int expr")))))))
    ((name 16)
     (chunks
      (((ocaml_code
          "let max_expr x y =\
         \n  let i x = Value (Int x) in\
         \n  let x = i x in\
         \n  let y = i y in\
         \n  If (Gt (x,y), x, y)\
         \n;;")
        (toplevel_responses
         ((OCaml "val max_expr : int -> int -> int expr = <fun>"))))
       ((ocaml_code "max_expr 3 4;;")
        (toplevel_responses
         ((OCaml
            "- : int expr =\
           \nIf (Gt (Value (Int 3), Value (Int 4)), Value (Int 3), Value (Int 4))")))))))
    ((name 17)
     (chunks
      (((ocaml_code
          "let ill_typed x y =\
         \n  let i x = Value (Int x) in\
         \n  let x = i x in\
         \n  let y = i y in\
         \n  Plus (Gt (x,y), y)\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 92-100:\
           \nError: This expression has type bool expr\
           \n       but an expression was expected of type int expr\
           \n       Type bool is not compatible with type int ")))))))
    ((name 18)
     (chunks
      (((ocaml_code
          "let rec eval = function\
         \n  | Value (Int x)  -> x\
         \n  | Value (Bool x) -> x\
         \n  | If    (c,t,e)  -> if eval c then eval t else eval e\
         \n  | Gt    (x,y)    -> eval x > eval y\
         \n  | Plus  (x,y)    -> eval x + eval y\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 59-67:\
           \nError: This pattern matches values of type bool value\
           \n       but a pattern was expected which matches values of type int value\
           \n       Type bool is not compatible with type int ")))))))
    ((name 19)
     (chunks
      (((ocaml_code
          "let rec eval : type a . a expr -> a = function\
         \n  | Value (Int x)  -> x\
         \n  | Value (Bool x) -> x\
         \n  | If    (c,t,e)  -> if eval c then eval t else eval e\
         \n  | Gt    (x,y)    -> eval x > eval y\
         \n  | Plus  (x,y)    -> eval x + eval y\
         \n;;")
        (toplevel_responses ((OCaml "val eval : 'a expr -> 'a = <fun>")))))))))
  (matched false)))
