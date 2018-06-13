(OCaml
 (((name 5)
   (content
     "let () =\
    \n  Command.async\
    \n    ~summary:\"Retrieve definitions from duckduckgo search engine\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (sequence (\"word\" %: string))\
    \n    )\
    \n    (fun words () -> search_and_print words)\
    \n  |> Command.run"))
  ((name 4)
   (content
     "(* Run many searches in parallel, printing out the results after they're all\
    \n   done. *)\
    \nlet search_and_print words =\
    \n  Deferred.all (List.map words ~f:get_definition)\
    \n  >>| fun results ->\
    \n  List.iter results ~f:print_result\
    \n\
    \n"))
  ((name 3)
   (content
     "(* Print out a word/definition pair *)\
    \nlet print_result (word,definition) =\
    \n  printf \"%s\\n%s\\n\\n%s\\n\\n\"\
    \n    word\
    \n    (String.init (String.length word) ~f:(fun _ -> '-'))\
    \n    (match definition with\
    \n    | None -> \"No definition found\"\
    \n    | Some def ->\
    \n      String.concat ~sep:\"\\n\"\
    \n        (Wrapper.wrap (Wrapper.make 70) def))\
    \n\
    \n"))
  ((name 2)
   (content
     "(* Execute the DuckDuckGo search *)\
    \nlet get_definition word =\
    \n  Cohttp_async.Client.get (query_uri word)\
    \n  >>= fun (_, body) ->\
    \n  Cohttp_async.Body.to_string body\
    \n  >>| fun string ->\
    \n  (word, get_definition_from_json string)\
    \n\
    \n"))
  ((name 1)
   (content
     "(* Extract the \"Definition\" or \"Abstract\" field from the DuckDuckGo results *)\
    \nlet get_definition_from_json json =\
    \n  match Yojson.Safe.from_string json with\
    \n  | `Assoc kv_list ->\
    \n    let find key =\
    \n      begin match List.Assoc.find ~equal:String.equal kv_list key with\
    \n      | None | Some (`String \"\") -> None\
    \n      | Some s -> Some (Yojson.Safe.to_string s)\
    \n      end\
    \n    in\
    \n    begin match find \"Abstract\" with\
    \n    | Some _ as x -> x\
    \n    | None -> find \"Definition\"\
    \n    end\
    \n  | _ -> None\
    \n\
    \n"))
  ((name "")
   (content
     "open Core\
    \nopen Async\
    \n\
    \n(* Generate a DuckDuckGo search URI from a query string *)\
    \nlet query_uri query =\
    \n  let base_uri = Uri.of_string \"http://api.duckduckgo.com/?format=json\" in\
    \n  Uri.add_query_param base_uri (\"q\", [query])\
    \n\
    \n"))))
