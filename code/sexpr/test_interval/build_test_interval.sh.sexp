(Other
  "$ jbuilder build test_interval.exe\
 \n    ocamlopt .ppx/ppx_sexp_conv/ppx.exe\
 \n         ppx test_interval.pp.ml\
 \n         ppx int_interval.pp.ml\
 \n    ocamldep test_interval.depends.ocamldep-output\
 \n         ppx int_interval.pp.mli\
 \n    ocamldep test_interval.dependsi.ocamldep-output\
 \n      ocamlc int_interval.{cmi,cmti}\
 \n    ocamlopt int_interval.{cmx,o}\
 \n      ocamlc test_interval.{cmi,cmo,cmt}\
 \n    ocamlopt test_interval.{cmx,o}\
 \n    ocamlopt test_interval.exe\
 \n$ ./_build/default/test_interval.exe\
 \n((Range 3 4) Empty (Range 2 3) (Range 1 6))\
 \n")
