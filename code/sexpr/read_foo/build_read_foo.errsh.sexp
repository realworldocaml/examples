(Other
  "$ jbuilder build read_foo.exe\
 \n    ocamlopt .ppx/ppx_sexp_conv/ppx.exe\
 \n         ppx read_foo.pp.ml\
 \n    ocamldep read_foo.depends.ocamldep-output\
 \n      ocamlc read_foo.{cmi,cmo,cmt}\
 \n    ocamlopt read_foo.{cmx,o}\
 \n    ocamlopt read_foo.exe\
 \n$ ./_build/default/read_foo.exe foo_example_broken.scm\
 \nUncaught exception:\
 \n  \
 \n  (Sexplib.Conv.Of_sexp_error\
 \n   (Failure \"int_of_sexp: (Failure int_of_string)\") not-an-integer)\
 \n\
 \nRaised at file \"src0/sexp_conv.ml\", line 196, characters 30-72\
 \nCalled from file \"src/int.ml\" (inlined), line 6, characters 49-62\
 \nCalled from file \"src/std_internal.ml\" (inlined), line 144, characters 2-83\
 \nCalled from file \"read_foo.ml\", line 5, characters 2-3\
 \nCalled from file \"read_foo.ml\", line 3, characters 0-73\
 \nCalled from file \"read_foo.ml\", line 11, characters 4-60\
 \nCalled from file \"src/exn.ml\", line 110, characters 6-10\
 \n")
