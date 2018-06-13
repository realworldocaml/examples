(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Ctypes\
    \nopen PosixTypes\
    \nopen Foreign\
    \n\
    \nlet compare_t = ptr void @-> ptr void @-> returning int\
    \n\
    \nlet qsort = foreign \"qsort\"\
    \n    (ptr void @-> size_t @-> size_t @-> funptr compare_t @->\
    \n       returning void)\
    \n\
    \nlet qsort' cmp arr =\
    \n  let open Unsigned.Size_t in\
    \n  let ty = CArray.element_type arr in\
    \n  let len = of_int (CArray.length arr) in\
    \n  let elsize = of_int (sizeof ty) in\
    \n  let start = to_voidp (CArray.start arr) in\
    \n  let compare l r = cmp (!@ (from_voidp ty l)) (!@ (from_voidp ty r)) in\
    \n  qsort start len elsize compare;\
    \n  arr\
    \n\
    \nlet sort_stdin () =\
    \n  In_channel.input_lines In_channel.stdin\
    \n  |> List.map ~f:int_of_string\
    \n  |> CArray.of_list int\
    \n  |> qsort' Int.compare\
    \n  |> CArray.to_list\
    \n  |> List.iter ~f:(fun a -> printf \"%d\\n\" a)\
    \n\
    \nlet () =\
    \n  Command.basic ~summary:\"Sort integers on standard input\"\
    \n    Command.Spec.empty sort_stdin\
    \n  |> Command.run"))))
