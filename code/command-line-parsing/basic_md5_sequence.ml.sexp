(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet do_hash filename ic =\
    \n  let open Cryptokit in\
    \n  hash_channel (Hash.md5 ()) ic\
    \n  |> transform_string (Hexa.encode ())\
    \n  |> fun md5 -> printf \"MD5 (%s) = %s\\n\" filename md5\
    \n\
    \nlet command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    ~readme:(fun () -> \"More detailed information\")\
    \n    Command.Spec.(empty +> anon (sequence (\"filename\" %: file)))\
    \n    (fun files () ->\
    \n       match files with\
    \n       | [] -> do_hash \"-\" In_channel.stdin\
    \n       | _  ->\
    \n         List.iter files ~f:(fun file ->\
    \n           In_channel.with_file ~f:(do_hash file) file\
    \n         )\
    \n    )\
    \n\
    \nlet () =\
    \n  Command.run ~version:\"1.0\" ~build_info:\"RWO\" command"))))
