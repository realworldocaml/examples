(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \nlet build_counts () =\
    \n  In_channel.fold_lines In_channel.stdin ~init:Counter.empty ~f:Counter.touch\
    \n\
    \nlet () =\
    \n  build_counts ()\
    \n  |> Counter.to_list\
    \n  |> List.sort ~cmp:(fun (_,x) (_,y) -> Int.descending x y)\
    \n  |> (fun counts -> List.take counts 10)\
    \n  |> List.iter ~f:(fun (line,count) -> printf \"%3d: %s\\n\" count line)"))))
