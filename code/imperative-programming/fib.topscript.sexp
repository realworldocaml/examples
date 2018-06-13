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
         \n  let table = Hashtbl.Poly.create () in\
         \n  (fun x ->\
         \n     match Hashtbl.find table x with\
         \n     | Some y -> y\
         \n     | None ->\
         \n       let y = f x in\
         \n       Hashtbl.add_exn table ~key:x ~data:y;\
         \n       y\
         \n  );;")
        (toplevel_responses
         ((OCaml "val memoize : ('a -> 'b) -> 'a -> 'b = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "let rec fib i =\
         \n  if i <= 1 then 1 else fib (i - 1) + fib (i - 2);;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "time (fun () -> fib 20);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time"))))
       ((ocaml_code "time (fun () -> fib 40);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let fib = memoize fib;;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>"))))
       ((ocaml_code "time (fun () -> fib 40);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time"))))
       ((ocaml_code "time (fun () -> fib 40);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let fib_norec fib i =\
         \n  if i <= 1 then i\
         \n  else fib (i - 1) + fib (i - 2) ;;")
        (toplevel_responses
         ((OCaml "val fib_norec : (int -> int) -> int -> int = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code "let rec fib i = fib_norec fib i;;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>"))))
       ((ocaml_code "fib 20;;")
        (toplevel_responses ((OCaml "- : int = 6765")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "let make_rec f_norec =\
         \n  let rec f x = f_norec f x in\
         \n  f\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val make_rec : (('a -> 'b) -> 'a -> 'b) -> 'a -> 'b = <fun>"))))
       ((ocaml_code "let fib = make_rec fib_norec;;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>"))))
       ((ocaml_code "fib 20;;")
        (toplevel_responses ((OCaml "- : int = 6765")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "let memo_rec f_norec x =\
         \n  let fref = ref (fun _ -> assert false) in\
         \n  let f = memoize (fun x -> f_norec !fref x) in\
         \n  fref := f;\
         \n  f x\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val memo_rec : (('a -> 'b) -> 'a -> 'b) -> 'a -> 'b = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code "let fib = memo_rec fib_norec;;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>"))))
       ((ocaml_code "time (fun () -> fib 40);;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let fib = memo_rec (fun fib i ->\
         \n  if i <= 1 then 1 else fib (i - 1) + fib (i - 2));;")
        (toplevel_responses ((OCaml "val fib : int -> int = <fun>")))))))))
  (matched true)))
