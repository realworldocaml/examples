(Other
  "$ jbuilder build read_foo_better_errors.exe\
 \n    ocamlopt .ppx/ppx_sexp_conv/ppx.exe\
 \n         ppx read_foo_better_errors.pp.ml\
 \n    ocamldep read_foo_better_errors.depends.ocamldep-output\
 \n      ocamlc read_foo_better_errors.{cmi,cmo,cmt}\
 \n    ocamlopt read_foo_better_errors.{cmx,o}\
 \n    ocamlopt read_foo_better_errors.exe\
 \n$ ./_build/default/read_foo_better_errors.exe foo_example_broken.scm\
 \nUncaught exception:\
 \n  \
 \n  (Sexplib.Conv.Of_sexp_error\
 \n   (Sexplib.Sexp.Annotated.Conv_exn foo_broken_example.scm:2:5\
 \n    (Failure \"int_of_sexp: (Failure int_of_string)\"))\
 \n   not-an-integer)\
 \n\
 \nRaised at file \"src/pre_sexp.ml\", line 1094, characters 6-58\
 \nCalled from file \"read_foo_better_errors.ml\", line 10, characters 10-68\
 \nCalled from file \"src/exn.ml\", line 110, characters 6-10\
 \n")
