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
          "let create_number_file filename numbers =\
         \n  let outc = Out_channel.create filename in\
         \n  List.iter numbers ~f:(fun x -> fprintf outc \"%d\\n\" x);\
         \n  Out_channel.close outc\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val create_number_file : string -> int list -> unit = <fun>"))))
       ((ocaml_code
          "let sum_file filename =\
         \n  let file = In_channel.create filename in\
         \n  let numbers = List.map ~f:Int.of_string (In_channel.input_lines file) in\
         \n  let sum = List.fold ~init:0 ~f:(+) numbers in\
         \n  In_channel.close file;\
         \n  sum\
         \n;;")
        (toplevel_responses ((OCaml "val sum_file : string -> int = <fun>"))))
       ((ocaml_code "create_number_file \"numbers.txt\" [1;2;3;4;5];;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "sum_file \"numbers.txt\";;")
        (toplevel_responses ((OCaml "- : int = 15")))))))
    ((name 2)
     (chunks
      (((ocaml_code "sum_file \"/etc/hosts\";;")
        (toplevel_responses
         ((Raw
           "Exception: (Failure \"Int.of_string: \\\"::1\\\\t ip6-localhost ip6-loopback\\\"\").")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "for i = 1 to 10000 do try ignore (sum_file \"/etc/hosts\") with _ -> () done;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "sum_file \"numbers.txt\";;")
        (toplevel_responses
         ((Raw
            "File \"file.topscript\", line 1:\
           \nError: I/O error: /var/folders/z3/7h_5sgf933952482gktqg_gh0000gn/T/camlppxc637c7: Too many open files")))))))))
  (matched false)))
