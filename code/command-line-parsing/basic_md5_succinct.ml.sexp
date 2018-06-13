(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet do_hash file () =\
    \n  In_channel.with_file file ~f:(fun ic ->\
    \n    let open Cryptokit in\
    \n    hash_channel (Hash.md5 ()) ic\
    \n    |> transform_string (Hexa.encode ())\
    \n    |> print_endline\
    \n  )\
    \n\
    \nlet command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    ~readme:(fun () -> \"More detailed information\")\
    \n    Command.Spec.(empty +> anon (\"filename\" %: string))\
    \n    do_hash\
    \n\
    \nlet () =\
    \n  Command.run ~version:\"1.0\" ~build_info:\"RWO\" command"))))
