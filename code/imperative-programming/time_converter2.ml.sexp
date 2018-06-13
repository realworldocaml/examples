(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet () =\
    \n  printf \"Pick a timezone: %!\";\
    \n  match In_channel.input_line stdin with\
    \n  | None -> failwith \"No timezone provided\"\
    \n  | Some zone_string ->\
    \n    let zone = Zone.find_exn zone_string in\
    \n    let time_string = Time.to_string_abs (Time.now ()) ~zone in\
    \n    printf \"The time in %s is %s.\\n%!\" (Zone.to_string zone) time_string"))))
