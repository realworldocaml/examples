open Core

let get_inchan = function
  | None | Some "-" ->
    In_channel.stdin
  | Some filename ->
    In_channel.create ~binary:true filename

let do_hash filename () =
  let open Cryptokit in
  get_inchan filename
  |> hash_channel (Hash.md5 ())
  |> transform_string (Hexa.encode ())
  |> print_endline

let command =
  let open Command.Let_syntax in
  Command.basic
    ~summary:"Generate an MD5 hash of the input data"
    ~readme:(fun () -> "More detailed information")
    [%map_open
      let filename = anon (maybe ("filename" %: file)) in
      do_hash filename
    ]

let () =
  Command.run ~version:"1.0" ~build_info:"RWO" command
