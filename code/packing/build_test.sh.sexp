(Other
  "$ corebuild test.inferred.mli test.cmi\
 \nocamlfind ocamldep -package core -ppx 'ppx-jane -as-ppx' -modules test.ml > test.ml.depends\
 \nocamlfind ocamldep -package core -ppx 'ppx-jane -as-ppx' -modules A.ml > A.ml.depends\
 \nocamlfind ocamldep -package core -ppx 'ppx-jane -as-ppx' -modules B.ml > B.ml.depends\
 \nocamlfind ocamlc -c -w A-4-33-40-41-42-43-34-44 -strict-sequence -g -bin-annot -short-paths -thread -package core -ppx 'ppx-jane -as-ppx' -o A.cmo A.ml\
 \nocamlfind ocamlc -c -w A-4-33-40-41-42-43-34-44 -strict-sequence -g -bin-annot -short-paths -thread -package core -ppx 'ppx-jane -as-ppx' -o B.cmo B.ml\
 \nocamlfind ocamlc -pack -g -bin-annot A.cmo B.cmo -o X.cmo\
 \nocamlfind ocamlc -i -thread -short-paths -package core -ppx 'ppx-jane -as-ppx' test.ml > test.inferred.mli\
 \nocamlfind ocamlc -c -w A-4-33-40-41-42-43-34-44 -strict-sequence -g -bin-annot -short-paths -thread -package core -ppx 'ppx-jane -as-ppx' -o test.cmo test.ml\
 \n$ cat _build/test.inferred.mli\
 \nval v : string\
 \nval w : int\
 \n$ ocamlobjinfo _build/test.cmi\
 \nFile _build/test.cmi\
 \nUnit name: Test\
 \nInterfaces imported:\
 \n\t1b722de5625cbb841030162be2ad1627\tTest\
 \n\tb3cc0475ed485ece1111c58ca72f1fb6\tX\
 \n\teef96f967b03d53aceb35ab9ee61e6fc\tPervasives\
 \n\tcbd5f2d6b649925222e1e9fb63b89db6\tCamlinternalFormatBasics\
 \n")
