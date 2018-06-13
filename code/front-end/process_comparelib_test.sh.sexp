(Other
  "$ ocamlfind ocamlc -package ppx_compare -package core_kernel -dsource -linkpkg comparelib_test.ml\
 \nopen Core_kernel\
 \ntype t = {\
 \n  foo: string ;\
 \n  bar: t }\
 \nlet _ = fun (_ : t)  -> () \
 \nlet rec compare : t -> t -> int =\
 \n  fun a__001_  ->\
 \n    fun b__002_  ->\
 \n      if Ppx_compare_lib.phys_equal a__001_ b__002_\
 \n      then 0\
 \n      else\
 \n        (match compare_string a__001_.foo b__002_.foo with\
 \n         | 0 -> compare a__001_.bar b__002_.bar\
 \n         | n -> n)\
 \n  \
 \nlet _ = compare \
 \n")
