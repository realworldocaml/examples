(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet get_inchan = function\
    \n  | \"-\"      -> In_channel.stdin\
    \n  | filename -> In_channel.create ~binary:true filename\
    \n\
    \nlet do_hash filename () =\
    \n  let open Cryptokit in\
    \n  get_inchan filename\
    \n  |> hash_channel (Hash.md5 ())\
    \n  |> transform_string (Hexa.encode ())\
    \n  |> print_endline\
    \n\
    \nlet command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    ~readme:(fun () -> \"More detailed information\")\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (maybe_with_default \"-\" (\"filename\" %: file))\
    \n    )\
    \n    do_hash\
    \n\
    \nlet () =\
    \n  Command.run ~version:\"1.0\" ~build_info:\"RWO\" command"))))
