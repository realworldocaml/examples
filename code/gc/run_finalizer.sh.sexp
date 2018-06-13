(Other
  "$ jbuilder build finalizer.exe\
 \n    ocamldep finalizer.depends.ocamldep-output\
 \n      ocamlc finalizer.{cmi,cmo,cmt}\
 \n    ocamlopt finalizer.{cmx,o}\
 \n    ocamlopt finalizer.exe\
 \n$ ./_build/default/finalizer.exe\
 \n       immediate int: FAIL\
 \n     immediate float: FAIL\
 \n   immediate variant: FAIL\
 \n    immediate string: FAIL\
 \n    immediate record: FAIL\
 \n      allocated bool: FAIL\
 \n    allocated record: OK\
 \n    allocated string: OK\
 \n   allocated variant: OK\
 \n")
