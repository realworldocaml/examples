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
          "let sum_file filename =\
         \n  let file = In_channel.create filename in\
         \n  protect ~f:(fun () ->\
         \n    let numbers = List.map ~f:Int.of_string (In_channel.input_lines file) in\
         \n    List.fold ~init:0 ~f:(+) numbers)\
         \n    ~finally:(fun () -> In_channel.close file)\
         \n;;")
        (toplevel_responses ((OCaml "val sum_file : string -> int = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
         "for i = 1 to 10000 do try ignore (sum_file \"/etc/hosts\") with _ -> () done;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "sum_file \"numbers.txt\";;")
        (toplevel_responses ((OCaml "- : int = 15")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let sum_file filename =\
         \n  In_channel.with_file filename ~f:(fun file ->\
         \n    let numbers = List.map ~f:Int.of_string (In_channel.input_lines file) in\
         \n    List.fold ~init:0 ~f:(+) numbers)\
         \n;;")
        (toplevel_responses ((OCaml "val sum_file : string -> int = <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let sum_file filename =\
         \n  In_channel.with_file filename ~f:(fun file ->\
         \n    In_channel.fold_lines file ~init:0 ~f:(fun sum line ->\
         \n      sum + Int.of_string line))\
         \n;;")
        (toplevel_responses ((OCaml "val sum_file : string -> int = <fun>")))))))))
  (matched true)))
