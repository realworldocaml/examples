(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \nlet rec read_and_accumulate accum =\
    \n  let line = In_channel.input_line In_channel.stdin in\
    \n  match line with\
    \n  | None -> accum\
    \n  | Some x -> read_and_accumulate (accum +. Float.of_string x)\
    \n\
    \nlet () =\
    \n  printf \"Total: %F\\n\" (read_and_accumulate 0.)"))))
