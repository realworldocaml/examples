(Other
  "$ jbuilder build qsort.exe\
 \n    ocamldep qsort.depends.ocamldep-output\
 \n    ocamldep qsort.dependsi.ocamldep-output\
 \n      ocamlc qsort.{cmi,cmti}\
 \n    ocamlopt qsort.{cmx,o}\
 \n    ocamlopt qsort.exe\
 \n$ cat input.txt\
 \n2\
 \n4\
 \n1\
 \n3\
 \n$ ./_build/default/qsort.exe < input.txt\
 \n1\
 \n2\
 \n3\
 \n4\
 \n$ corebuild -pkg ctypes.foreign qsort.inferred.mli\
 \nocamlfind ocamldep -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' -modules qsort.ml > qsort.ml.depends\
 \nocamlfind ocamlc -i -thread -short-paths -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' qsort.ml > qsort.inferred.mli\
 \n$ cp _build/qsort.inferred.mli qsort.mli\
 \n")
