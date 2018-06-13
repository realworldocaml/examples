(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet rec take =\
    \n  function\
    \n  |[] -> []\
    \n  |hd::tl -> hd :: (skip tl)\
    \nand skip =\
    \n  function\
    \n  |[] -> []\
    \n  |_::tl -> take tl\
    \n\
    \nlet () =\
    \n  take [1;2;3;4;5;6;7;8;9]\
    \n  |> List.map ~f:string_of_int\
    \n  |> String.concat ~sep:\",\"\
    \n  |> print_endline"))))
