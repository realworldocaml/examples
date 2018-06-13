(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#use \"topfind\";;") (toplevel_responses ()))
       ((ocaml_code "#thread;;") (toplevel_responses ()))
       ((ocaml_code "#camlp4o;;") (toplevel_responses ()))
       ((ocaml_code "#require \"core\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"core.top\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"ppx_jane\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code
          "type http_server_config = {\
         \n  web_root: string;\
         \n  port: int;\
         \n  addr: string;\
         \n} [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type http_server_config = { web_root : string; port : int; addr : string; }\
           \nval http_server_config_of_sexp : Sexplib0.Sexp.t -> http_server_config =\
           \n  <fun>\
           \nval sexp_of_http_server_config : http_server_config -> Sexplib0.Sexp.t =\
           \n  <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "type http_server_config = {\
         \n  web_root: string;\
         \n  port: int [@default 80];\
         \n  addr: string [@default \"localhost\"];\
         \n} [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type http_server_config = { web_root : string; port : int; addr : string; }\
           \nval http_server_config_of_sexp : Sexp.t -> http_server_config = <fun>\
           \nval sexp_of_http_server_config : http_server_config -> Sexp.t = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let cfg = http_server_config_of_sexp\
         \n            (Sexp.of_string \"((web_root /var/www/html))\") ;;")
        (toplevel_responses
         ((OCaml
            "val cfg : http_server_config =\
           \n  {web_root = \"/var/www/html\"; port = 80; addr = \"localhost\"}")))))))
    ((name 3)
     (chunks
      (((ocaml_code "sexp_of_http_server_config cfg ;;")
        (toplevel_responses
         ((OCaml
           "- : Sexp.t = ((web_root /var/www/html) (port 80) (addr localhost))")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "type http_server_config = {\
         \n  web_root: string;\
         \n  port: int [@default 80] [@sexp_drop_default];\
         \n  addr: string [@default \"localhost\"] [@sexp_drop_default];\
         \n} [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type http_server_config = { web_root : string; port : int; addr : string; }\
           \nval http_server_config_of_sexp : Sexp.t -> http_server_config = <fun>\
           \nval sexp_of_http_server_config : http_server_config -> Sexp.t = <fun>"))))
       ((ocaml_code
          "let cfg = http_server_config_of_sexp\
         \n            (Sexp.of_string \"((web_root /var/www/html))\") ;;")
        (toplevel_responses
         ((OCaml
            "val cfg : http_server_config =\
           \n  {web_root = \"/var/www/html\"; port = 80; addr = \"localhost\"}"))))
       ((ocaml_code "sexp_of_http_server_config cfg ;;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = ((web_root /var/www/html))")))))))
    ((name 5)
     (chunks
      (((ocaml_code "sexp_of_http_server_config { cfg with port = 8080 } ;;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = ((web_root /var/www/html) (port 8080))"))))
       ((ocaml_code
          "sexp_of_http_server_config\
         \n  { cfg with port = 8080; addr = \"192.168.0.1\" } ;;")
        (toplevel_responses
         ((OCaml
           "- : Sexp.t = ((web_root /var/www/html) (port 8080) (addr 192.168.0.1))")))))))))
  (matched true)))
