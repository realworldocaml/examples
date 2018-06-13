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
       ((ocaml_code "#require \"mtime.os.top\";;")
        (toplevel_responses ((Raw "No such package: mtime.os.top"))))
       ((ocaml_code
          "let time f =\
         \n  let counter = Mtime.counter () in\
         \n  let x = f () in\
         \n  let elapsed = Mtime.count counter in\
         \n  printf \"Time: %F ms\\n\" (Mtime.to_ms elapsed);\
         \n  x \
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 29-42:\
           \nError: Unbound module Mtime\
           \nHint: Did you mean Time?"))))
       ((ocaml_code
          "let memoize f =\
         \n  let memo_table = Hashtbl.Poly.create () in\
         \n  (fun x ->\
         \n     Hashtbl.find_or_add memo_table x ~default:(fun () -> f x))\
         \n;;")
        (toplevel_responses
         ((OCaml "val memoize : ('a -> 'b) -> 'a -> 'b = <fun>"))))
       ((ocaml_code
          "let fib_norec fib i =\
         \n  if i <= 1 then i\
         \n  else fib (i - 1) + fib (i - 2) ;;")
        (toplevel_responses
         ((OCaml "val fib_norec : (int -> int) -> int -> int = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "let memo_rec f_norec =\
         \n  let rec f = memoize (fun x -> f_norec f x) in\
         \n  f\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 37-67:\
           \nError: This kind of expression is not allowed as right-hand side of `let rec'")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let rec x = lazy (force x + 1);;")
        (toplevel_responses ((OCaml "val x : int lazy_t = <lazy>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "force x;;")
        (toplevel_responses ((Raw "Exception: Lazy.Undefined.")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let lazy_memo_rec f_norec x =\
         \n  let rec f = lazy (memoize (fun x -> f_norec (force f) x)) in\
         \n  (force f) x\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val lazy_memo_rec : (('a -> 'b) -> 'a -> 'b) -> 'a -> 'b = <fun>"))))
       ((ocaml_code "time (fun () -> lazy_memo_rec fib_norec 40);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))))
  (matched true)))
