(Other
  "$ jbuilder build alternate_list.exe\
 \n    ocamldep alternate_list.depends.ocamldep-output\
 \n      ocamlc alternate_list.{cmi,cmo,cmt}\
 \n    ocamlopt alternate_list.{cmx,o}\
 \n    ocamlopt alternate_list.exe\
 \n$ ./_build/default/alternate_list.exe -ascii -quota 1\
 \n1,3,5,7,9\
 \n")
