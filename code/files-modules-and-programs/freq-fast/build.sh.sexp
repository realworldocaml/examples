(Other
  "$ jbuilder build freq.bc\
 \n    ocamldep freq.depends.ocamldep-output\
 \n    ocamldep freq.dependsi.ocamldep-output\
 \n      ocamlc counter.{cmi,cmti}\
 \n      ocamlc freq.{cmi,cmo,cmt}\
 \n      ocamlc counter.{cmo,cmt}\
 \n      ocamlc freq.bc\
 \n")
