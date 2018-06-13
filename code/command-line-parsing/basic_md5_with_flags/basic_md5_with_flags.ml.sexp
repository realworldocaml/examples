(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Cryptokit\
    \n\
    \nlet checksum_from_string buf =\
    \n  hash_string (Hash.md5 ()) buf\
    \n  |> transform_string (Hexa.encode ())\
    \n  |> print_endline\
    \n\
    \nlet checksum_from_file filename =\
    \n  let ic = match filename with\
    \n    | \"-\" -> In_channel.stdin\
    \n    | _   -> In_channel.create ~binary:true filename\
    \n  in\
    \n  hash_channel (Hash.md5 ()) ic\
    \n  |> transform_string (Hexa.encode ())\
    \n  |> print_endline\
    \n\
    \nlet command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> flag \"-s\" (optional string) ~doc:\"string Checksum the given string\"\
    \n      +> flag \"-t\" no_arg ~doc:\" run a built-in time trial\"\
    \n      +> anon (maybe_with_default \"-\" (\"filename\" %: file))\
    \n    )\
    \n    (fun use_string trial filename () ->\
    \n       match trial with\
    \n       | true -> printf \"Running time trial\\n\"\
    \n       | false -> begin\
    \n           match use_string with\
    \n           | Some buf -> checksum_from_string buf\
    \n           | None -> checksum_from_file filename\
    \n         end\
    \n    )\
    \n\
    \nlet () = Command.run command"))))
