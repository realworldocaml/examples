(Other
  "$ jbuilder build query_handler_loader.exe\
 \n    ocamlopt .ppx/ppx_sexp_conv/ppx.exe\
 \n         ppx query_handler_loader.pp.ml\
 \n         ppx query_handler_core.pp.ml\
 \n         ppx query_handler.pp.ml\
 \n    ocamldep query_handler_loader.depends.ocamldep-output\
 \n      ocamlc query_handler_core.{cmi,cmo,cmt}\
 \n      ocamlc query_handler_loader.{cmi,cmo,cmt}\
 \n    ocamlopt query_handler_core.{cmx,o}\
 \n    ocamlopt query_handler_loader.{cmx,o}\
 \n    ocamlopt query_handler_loader.exe\
 \n")
