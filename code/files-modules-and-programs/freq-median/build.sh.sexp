(Other
  "$ jbuilder build freq.bc use_median_1.bc use_median_2.bc\
 \n    ocamldep freq.depends.ocamldep-output\
 \n    ocamldep freq.dependsi.ocamldep-output\
 \n      ocamlc counter.{cmi,cmti}\
 \n      ocamlc use_median_2.{cmi,cmo,cmt}\
 \n      ocamlc use_median_1.{cmi,cmo,cmt}\
 \n      ocamlc freq.{cmi,cmo,cmt}\
 \n      ocamlc counter.{cmo,cmt}\
 \n      ocamlc use_median_2.bc\
 \n      ocamlc freq.bc\
 \n      ocamlc use_median_1.bc\
 \n")
