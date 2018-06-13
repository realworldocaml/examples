(Other
  "$ jbuilder build shapes.exe\
 \n    ocamldep shapes.depends.ocamldep-output\
 \n      ocamlc shapes.{cmi,cmo,cmt}\
 \nFile \"shapes.ml\", line 161, characters 10-14:\
 \nWarning 3: deprecated: Core.atan\
 \n[since 2016-07] Use [Float.atan]\
 \nFile \"shapes.ml\", line 170, characters 14-17:\
 \nWarning 3: deprecated: Core.sin\
 \n[since 2016-07] Use [Float.sin]\
 \n    ocamlopt shapes.{cmx,o}\
 \nFile \"shapes.ml\", line 161, characters 10-14:\
 \nWarning 3: deprecated: Core.atan\
 \n[since 2016-07] Use [Float.atan]\
 \nFile \"shapes.ml\", line 170, characters 14-17:\
 \nWarning 3: deprecated: Core.sin\
 \n[since 2016-07] Use [Float.sin]\
 \n    ocamlopt shapes.exe\
 \n")
