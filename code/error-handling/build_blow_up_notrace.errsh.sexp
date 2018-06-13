(Other
  "$ jbuilder build blow_up.bc\
 \n    ocamldep blow_up.depends.ocamldep-output\
 \n      ocamlc blow_up.{cmi,cmo,cmt}\
 \n      ocamlc blow_up.bc\
 \n$ OCAMLRUNPARAM= ./_build/default/blow_up.bc\
 \n3\
 \nUncaught exception:\
 \n  \
 \n  Blow_up.Empty_list\
 \n\
 \n")
