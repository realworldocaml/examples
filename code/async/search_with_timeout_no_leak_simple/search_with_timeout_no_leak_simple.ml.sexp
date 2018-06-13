(OCaml
 (((name 3)
   (content
     "(* Print out a word/definition pair *)\
    \nlet print_result (word,definition) =\
    \n  printf \"%s\\n%s\\n\\n%s\\n\\n\"\
    \n    word\
    \n    (String.init (String.length word) ~f:(fun _ -> '-'))\
    \n    (match definition with\
    \n     | Error s -> \"DuckDuckGo query failed: \" ^ s\
    \n     | Ok None -> \"No definition found\"\
    \n     | Ok (Some def) ->\
    \n       String.concat ~sep:\"\\n\"\
    \n         (Wrapper.wrap (Wrapper.make 70) def))\
    \n\
    \n(* Run many searches in parallel, printing out the results after they're all\
    \n   done. *)\
    \nlet search_and_print ~servers ~timeout words =\
    \n  let servers = Array.of_list servers in\
    \n  Deferred.all (List.mapi words ~f:(fun i word ->\
    \n    let server = servers.(i mod Array.length servers) in\
    \n    get_definition_with_timeout ~server ~timeout word))\
    \n  >>| fun results ->\
    \n  List.iter results ~f:print_result\
    \n\
    \nlet () =\
    \n  Command.async\
    \n    ~summary:\"Retrieve definitions from duckduckgo search engine\"\
    \n    Command.Spec.(\
    \n      let string_list = Arg_type.create (String.split ~on:',') in\
    \n      empty\
    \n      +> anon (sequence (\"word\" %: string))\
    \n      +> flag \"-servers\"\
    \n           (optional_with_default [\"api.duckduckgo.com\"] string_list)\
    \n           ~doc:\" Specify server to connect to\"\
    \n      +> flag \"-timeout\" (optional_with_default (sec 5.) time_span)\
    \n           ~doc:\" Abandon queries that take longer than this time\"\
    \n    )\
    \n    (fun words servers timeout () -> search_and_print ~servers ~timeout words)\
    \n  |> Command.run"))
  ((name 2)
   (content
     "let get_definition_with_timeout ~server ~timeout word =\
    \n  get_definition ~server ~interrupt:(after timeout) word\
    \n  >>| fun (word,result) ->\
    \n  let result' = match result with\
    \n    | Ok _ as x -> x\
    \n    | Error _ -> Error \"Unexpected failure\"\
    \n  in\
    \n  (word,result')\
    \n"))
  ((name 1)
   (content
     "(* Execute the DuckDuckGo search *)\
    \nlet get_definition ~server ~interrupt word =\
    \n  try_with (fun () ->\
    \n    Cohttp_async.Client.get ~interrupt (query_uri ~server word)\
    \n    >>= fun (_, body) ->\
    \n    Cohttp_async.Body.to_string body\
    \n    >>| fun string ->\
    \n    (word, get_definition_from_json string))\
    \n  >>| function\
    \n  | Ok (word,result) -> (word, Ok result)\
    \n  | Error _          -> (word, Error \"Unexpected failure\")\
    \n"))
  ((name "")
   (content
     "open Core\
    \nopen Async\
    \n\
    \n(* Generate a DuckDuckGo search URI from a query string *)\
    \nlet query_uri ~server query =\
    \n  let base_uri =\
    \n    Uri.of_string (String.concat [\"http://\";server;\"/?format=json\"])\
    \n  in\
    \n  Uri.add_query_param base_uri (\"q\", [query])\
    \n\
    \n(* Extract the \"Definition\" or \"Abstract\" field from the DuckDuckGo results *)\
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
    \n"))))
