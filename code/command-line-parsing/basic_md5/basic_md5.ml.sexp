(OCaml
 (((name 4) (content ""))
  ((name 3)
   (content
     "let () =\
    \n  Command.run ~version:\"1.0\" ~build_info:\"RWO\" command"))
  ((name 2)
   (content
     "let command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    ~readme:(fun () -> \"More detailed information\")\
    \n    spec\
    \n    (fun filename () -> do_hash filename)"))
  ((name 1)
   (content
     "let spec =\
    \n  let open Command.Spec in\
    \n  empty\
    \n  +> anon (\"filename\" %: string)"))
  ((name "")
   (content
     "open Core\
    \n\
    \nlet do_hash file =\
    \n  In_channel.with_file file ~f:(fun ic ->\
    \n    let open Cryptokit in\
    \n    hash_channel (Hash.md5 ()) ic\
    \n    |> transform_string (Hexa.encode ())\
    \n    |> print_endline\
    \n  )"))))
