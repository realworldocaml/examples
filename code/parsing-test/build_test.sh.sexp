(Other
  "$ jbuilder build test.exe\
 \n      menhir parser.{ml,mli}\
 \n    ocamllex lexer.ml\
 \n    ocamldep test.depends.ocamldep-output\
 \n    ocamldep test.dependsi.ocamldep-output\
 \n      ocamlc json.{cmi,cmo,cmt}\
 \n      ocamlc parser.{cmi,cmti}\
 \n      ocamlc lexer.{cmi,cmo,cmt}\
 \n      ocamlc test.{cmi,cmo,cmt}\
 \n    ocamlopt json.{cmx,o}\
 \n    ocamlopt parser.{cmx,o}\
 \n    ocamlopt lexer.{cmx,o}\
 \n    ocamlopt test.{cmx,o}\
 \n    ocamlopt test.exe\
 \n$ ./_build/default/test.exe test1.json\
 \ntrue\
 \nfalse\
 \nnull\
 \n[1, 2, 3.000000, 4.000000, 0.500000, 550000.000000, 6.300000]\
 \n\"Hello World\"\
 \n{ \"field1\": \"Hello\",\
 \n  \"field2\": 170000000000000.000000,\
 \n  \"field3\": [1, 2, 3],\
 \n  \"field4\": { \"fieldA\": 1,\
 \n  \"fieldB\": \"Hello\" } }\
 \n")
