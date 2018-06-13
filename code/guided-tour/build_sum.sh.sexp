(Other
  "$ jbuilder build sum.exe --dev\
 \n    ocamldep sum.depends.ocamldep-output\
 \n      ocamlc sum.{cmi,cmo,cmt}\
 \n    ocamlopt sum.{cmx,o}\
 \n    ocamlopt sum.exe\
 \n")
