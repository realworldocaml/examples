(Other
  "$ ocamlfind ocamlc -package ppx_compare -package core_kernel -dsource -linkpkg comparelib_test.mli\
 \nopen Core_kernel\
 \ntype t = {\
 \n  foo: string ;\
 \n  bar: t }\
 \ninclude sig [@@@ocaml.warning \"-32\"] val compare : t -> t -> int end\
 \n")
