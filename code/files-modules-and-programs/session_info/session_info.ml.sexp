(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \nmodule type ID = sig\
    \n  type t\
    \n  val of_string : string -> t\
    \n  val to_string : t -> string\
    \nend\
    \n\
    \nmodule String_id = struct\
    \n  type t = string\
    \n  let of_string x = x\
    \n  let to_string x = x\
    \nend\
    \n\
    \nmodule Username : ID = String_id\
    \nmodule Hostname : ID = String_id\
    \n\
    \ntype session_info = { user: Username.t;\
    \n                      host: Hostname.t;\
    \n                      when_started: Time.t;\
    \n                    }\
    \n\
    \nlet sessions_have_same_user s1 s2 =\
    \n  s1.user = s2.host"))))
