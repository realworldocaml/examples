(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \nlet build_counts () =\
    \n  In_channel.fold_lines In_channel.stdin ~init:[] ~f:(fun counts line ->\
    \n    let count =\
    \n      match List.Assoc.find ~equal:String.equal counts line with\
    \n      | None -> 0\
    \n      | Some x -> x\
    \n    in\
    \n    List.Assoc.add ~equal:String.equal counts line (count + 1)\
    \n  )\
    \n\
    \nlet () =\
    \n  build_counts ()\
    \n  |> List.sort ~cmp:(fun (_,x) (_,y) -> Int.descending x y)\
    \n  |> (fun l -> List.take l 10)\
    \n  |> List.iter ~f:(fun (line,count) -> printf \"%3d: %s\\n\" count line)"))))
