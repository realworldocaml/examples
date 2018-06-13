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
      (((ocaml_code "for i = 0 to 3 do printf \"i = %d\\n\" i done;;")
        (toplevel_responses
         ((Raw  "i = 0\
               \ni = 1\
               \ni = 2\
               \ni = 3") (OCaml "- : unit = ()")))))))
    ((name 2)
     (chunks
      (((ocaml_code "for i = 3 downto 0 do printf \"i = %d\\n\" i done;;")
        (toplevel_responses
         ((Raw  "i = 3\
               \ni = 2\
               \ni = 1\
               \ni = 0") (OCaml "- : unit = ()")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let rev_inplace ar =\
         \n  let i = ref 0 in\
         \n  let j = ref (Array.length ar - 1) in\
         \n  (* terminate when the upper and lower indices meet *)\
         \n  while !i < !j do\
         \n    (* swap the two elements *)\
         \n    let tmp = ar.(!i) in\
         \n    ar.(!i) <- ar.(!j);\
         \n    ar.(!j) <- tmp;\
         \n    (* bump the indices *)\
         \n    incr i;\
         \n    decr j\
         \n  done\
         \n;;")
        (toplevel_responses
         ((OCaml "val rev_inplace : 'a array -> unit = <fun>"))))
       ((ocaml_code "let nums = [|1;2;3;4;5|];;")
        (toplevel_responses
         ((OCaml "val nums : int array = [|1; 2; 3; 4; 5|]"))))
       ((ocaml_code "rev_inplace nums;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "nums;;")
        (toplevel_responses ((OCaml "- : int array = [|5; 4; 3; 2; 1|]")))))))))
  (matched true)))
