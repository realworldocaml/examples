(Other
  "$ jbuilder build blow_up.bc\
 \n    ocamldep blow_up.depends.ocamldep-output\
 \n      ocamlc blow_up.{cmi,cmo,cmt}\
 \n      ocamlc blow_up.bc\
 \n$ ./_build/default/blow_up.bc\
 \n3\
 \nUncaught exception:\
 \n  \
 \n  Blow_up.Empty_list\
 \n\
 \nRaised at file \"blow_up.ml\", line 5, characters 16-26\
 \nCalled from file \"blow_up.ml\", line 10, characters 16-29\
 \n")
