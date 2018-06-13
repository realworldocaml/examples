(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet () =\
    \n  (* Read the JSON file *)\
    \n  let json = Yojson.Basic.from_file \"book.json\" in\
    \n\
    \n  (* Locally open the JSON manipulation functions *)\
    \n  let open Yojson.Basic.Util in\
    \n  let title = json |> member \"title\" |> to_string in\
    \n  let tags = json |> member \"tags\" |> to_list |> filter_string in\
    \n  let pages = json |> member \"pages\" |> to_int in\
    \n  let is_online = json |> member \"is_online\" |> to_bool_option in\
    \n  let is_translated = json |> member \"is_translated\" |> to_bool_option in\
    \n  let authors = json |> member \"authors\" |> to_list in\
    \n  let names = List.map authors ~f:(fun json -> member \"name\" json |> to_string) in\
    \n\
    \n  (* Print the results of the parsing *)\
    \n  printf \"Title: %s (%d)\\n\" title pages;\
    \n  printf \"Authors: %s\\n\" (String.concat ~sep:\", \" names);\
    \n  printf \"Tags: %s\\n\" (String.concat ~sep:\", \" tags);\
    \n  let string_of_bool_option =\
    \n    function\
    \n    | None -> \"<unknown>\"\
    \n    | Some true -> \"yes\"\
    \n    | Some false -> \"no\" in\
    \n  printf \"Online: %s\\n\" (string_of_bool_option is_online);\
    \n  printf \"Translated: %s\\n\" (string_of_bool_option is_translated)"))))
