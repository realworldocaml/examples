(Other
  "$ ocamlc -dtypedtree typedef.ml 2>&1\
 \n[\
 \n  structure_item (typedef.ml[1,0+0]..typedef.ml[1,0+18])\
 \n    Tstr_type Rec\
 \n    [\
 \n      type_declaration t/1199 (typedef.ml[1,0+0]..typedef.ml[1,0+18])\
 \n        ptype_params =\
 \n          []\
 \n        ptype_cstrs =\
 \n          []\
 \n        ptype_kind =\
 \n          Ttype_variant\
 \n            [\
 \n              (typedef.ml[1,0+9]..typedef.ml[1,0+12])\
 \n                Foo/1200\
 \n                []\
 \n                None\
 \n              (typedef.ml[1,0+13]..typedef.ml[1,0+18])\
 \n                Bar/1201\
 \n                []\
 \n                None\
 \n            ]\
 \n        ptype_private = Public\
 \n        ptype_manifest =\
 \n          None\
 \n    ]\
 \n  structure_item (typedef.ml[2,19+0]..typedef.ml[2,19+11])\
 \n    Tstr_value Nonrec\
 \n    [\
 \n      <def>\
 \n        pattern (typedef.ml[2,19+4]..typedef.ml[2,19+5])\
 \n          Tpat_var \"v/1202\"\
 \n        expression (typedef.ml[2,19+8]..typedef.ml[2,19+11])\
 \n          Texp_construct \"Foo\"\
 \n          []\
 \n    ]\
 \n]\
 \n\
 \n")
