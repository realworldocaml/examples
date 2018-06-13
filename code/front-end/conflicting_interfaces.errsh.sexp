(Other
  "$ ocamlc -c conflicting_interface.mli conflicting_interface.ml\
 \nFile \"conflicting_interface.ml\", line 1:\
 \nError: The implementation conflicting_interface.ml\
 \n       does not match the interface conflicting_interface.cmi:\
 \n       Type declarations do not match:\
 \n         type t = Foo\
 \n       is not included in\
 \n         type t = Bar\
 \n       File \"conflicting_interface.ml\", line 1, characters 0-12:\
 \n         Actual declaration\
 \n       Fields number 1 have different names, Foo and Bar.\
 \n")
