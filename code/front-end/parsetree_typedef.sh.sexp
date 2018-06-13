(Other
  "$ ocamlc -dparsetree typedef.ml 2>&1\
 \n[\
 \n  structure_item (typedef.ml[1,0+0]..[1,0+18])\
 \n    Pstr_type Rec\
 \n    [\
 \n      type_declaration \"t\" (typedef.ml[1,0+5]..[1,0+6]) (typedef.ml[1,0+0]..[1,0+18])\
 \n        ptype_params =\
 \n          []\
 \n        ptype_cstrs =\
 \n          []\
 \n        ptype_kind =\
 \n          Ptype_variant\
 \n            [\
 \n              (typedef.ml[1,0+9]..[1,0+12])\
 \n                \"Foo\" (typedef.ml[1,0+9]..[1,0+12])\
 \n                []\
 \n                None\
 \n              (typedef.ml[1,0+13]..[1,0+18])\
 \n                \"Bar\" (typedef.ml[1,0+15]..[1,0+18])\
 \n                []\
 \n                None\
 \n            ]\
 \n        ptype_private = Public\
 \n        ptype_manifest =\
 \n          None\
 \n    ]\
 \n  structure_item (typedef.ml[2,19+0]..[2,19+11])\
 \n    Pstr_value Nonrec\
 \n    [\
 \n      <def>\
 \n        pattern (typedef.ml[2,19+4]..[2,19+5])\
 \n          Ppat_var \"v\" (typedef.ml[2,19+4]..[2,19+5])\
 \n        expression (typedef.ml[2,19+8]..[2,19+11])\
 \n          Pexp_construct \"Foo\" (typedef.ml[2,19+8]..[2,19+11])\
 \n          None\
 \n    ]\
 \n]\
 \n\
 \n")
