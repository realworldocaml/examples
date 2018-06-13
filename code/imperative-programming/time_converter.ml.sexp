(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet () =\
    \n  Out_channel.output_string stdout \"Pick a timezone: \";\
    \n  Out_channel.flush stdout;\
    \n  match In_channel.input_line stdin with\
    \n  | None -> failwith \"No timezone provided\"\
    \n  | Some zone_string ->\
    \n    let zone = Time.Zone.find_exn zone_string in\
    \n    let time_string = Time.to_string_abs (Time.now ()) ~zone in\
    \n    Out_channel.output_string stdout\
    \n      (String.concat\
    \n         [\"The time in \";Time.Zone.to_string zone;\" is \";time_string;\".\\n\"]);\
    \n    Out_channel.flush stdout"))))
