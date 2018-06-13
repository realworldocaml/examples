(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \nlet build_counts () =\
    \n  In_channel.fold_lines In_channel.stdin ~init:[] ~f:Counter.touch\
    \n\
    \nlet () =\
    \n  build_counts ()\
    \n  |> List.sort ~cmp:(fun (_,x) (_,y) -> Int.descending x y)\
    \n  |> (fun l -> List.take l 10)\
    \n  |> List.iter ~f:(fun (line,count) -> printf \"%3d: %s\\n\" count line)"))))
