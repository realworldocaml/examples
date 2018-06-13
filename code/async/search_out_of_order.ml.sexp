(OCaml
 (((name 1)
   (content
     "(* Run many searches in parallel, printing out the results as you go *)\
    \nlet search_and_print words =\
    \n  Deferred.all_unit (List.map words ~f:(fun word ->\
    \n    get_definition word >>| print_result))"))
  ((name "") (content  "open Core\
                      \nopen Async\
                      \n"))))
