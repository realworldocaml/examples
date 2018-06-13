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
          "let memoize f =\
         \n  let memo_table = Hashtbl.Poly.create () in\
         \n  (fun x ->\
         \n     Hashtbl.find_or_add memo_table x ~default:(fun () -> f x))\
         \n;;")
        (toplevel_responses
         ((OCaml "val memoize : ('a -> 'b) -> 'a -> 'b = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let rec edit_distance s t =\
         \n  match String.length s, String.length t with\
         \n  | (0,x) | (x,0) -> x\
         \n  | (len_s,len_t) ->\
         \n    let s' = String.drop_suffix s 1 in\
         \n    let t' = String.drop_suffix t 1 in\
         \n    let cost_to_drop_both =\
         \n      if s.[len_s - 1] = t.[len_t - 1] then 0 else 1\
         \n    in\
         \n    List.reduce_exn ~f:Int.min\
         \n      [ edit_distance s' t  + 1\
         \n      ; edit_distance s  t' + 1\
         \n      ; edit_distance s' t' + cost_to_drop_both\
         \n      ]\
         \n;;")
        (toplevel_responses
         ((OCaml "val edit_distance : string -> string -> int = <fun>"))))
       ((ocaml_code "edit_distance \"OCaml\" \"ocaml\";;")
        (toplevel_responses ((OCaml "- : int = 2")))))))
    ((name 3)
     (chunks
      (((ocaml_code "#require \"mtime.os.top\";;")
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
           \nHint: Did you mean Time?")))))))
    ((name 4)
     (chunks
      (((ocaml_code "time (fun () -> edit_distance \"OCaml\" \"ocaml\");;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time"))))
       ((ocaml_code
         "time (fun () -> edit_distance \"OCaml 4.01\" \"ocaml 4.01\");;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))
    ((name 5)
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
    ((name 6)
     (chunks
      (((ocaml_code
          "let edit_distance = memo_rec (fun edit_distance (s,t) ->\
         \n  match String.length s, String.length t with\
         \n  | (0,x) | (x,0) -> x\
         \n  | (len_s,len_t) ->\
         \n    let s' = String.drop_suffix s 1 in\
         \n    let t' = String.drop_suffix t 1 in\
         \n    let cost_to_drop_both =\
         \n      if s.[len_s - 1] = t.[len_t - 1] then 0 else 1\
         \n    in\
         \n    List.reduce_exn ~f:Int.min\
         \n      [ edit_distance (s',t ) + 1\
         \n      ; edit_distance (s ,t') + 1\
         \n      ; edit_distance (s',t') + cost_to_drop_both\
         \n      ]) ;;")
        (toplevel_responses
         ((OCaml "val edit_distance : string * string -> int = <fun>")))))))
    ((name 7)
     (chunks
      (((ocaml_code
         "time (fun () -> edit_distance (\"OCaml 4.01\",\"ocaml 4.01\"));;")
        (toplevel_responses
         ((Raw  "Characters 0-4:\
               \nError: Unbound value time")))))))))
  (matched true)))
