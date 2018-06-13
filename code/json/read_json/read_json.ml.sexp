(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet () =\
    \n  (* Read JSON file into an OCaml string *)\
    \n  let buf = In_channel.read_all \"book.json\" in\
    \n  (* Use the string JSON constructor *)\
    \n  let json1 = Yojson.Basic.from_string buf in\
    \n  (* Use the file JSON constructor *)\
    \n  let json2 = Yojson.Basic.from_file \"book.json\" in\
    \n  (* Test that the two values are the same *)\
    \n  print_endline (if json1 = json2 then \"OK\" else \"FAIL\")"))))
