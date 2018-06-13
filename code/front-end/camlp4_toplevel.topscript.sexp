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
       ((ocaml_code "#silent false;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code "#use \"topfind\" ;;")
        (toplevel_responses
         ((OCaml "- : unit = ()")
          (Raw
            "Findlib has been successfully loaded. Additional directives:\
           \n  #require \"package\";;      to load a package\
           \n  #list;;                   to list the available packages\
           \n  #camlp4o;;                to load camlp4 (standard syntax)\
           \n  #camlp4r;;                to load camlp4 (revised syntax)\
           \n  #predicates \"p,q,...\";;   to set these predicates\
           \n  Topfind.reset();;         to force that packages will be reloaded\
           \n  #thread;;                 to enable threads\
           \n")
          (OCaml "- : unit = ()"))))
       ((ocaml_code "#camlp4o ;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code "#require \"comparelib.syntax\" ;;")
        (toplevel_responses ((Raw "No such package: comparelib.syntax"))))
       ((ocaml_code "type t = { foo: string; bar : t } ;;")
        (toplevel_responses ((OCaml "type t = { foo : string; bar : t; }"))))
       ((ocaml_code
         "type t = { foo: string; bar: t } [@@deriving compare] ;;")
        (toplevel_responses
         ((Raw  "Characters 16-22:\
               \nError: Unbound value compare_string")))))))))
  (matched true)))
