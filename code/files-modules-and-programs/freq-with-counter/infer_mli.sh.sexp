(Other
  "$ corebuild counter.inferred.mli\
 \nocamlfind ocamldep -package core -ppx 'ppx-jane -as-ppx' -modules counter.ml > counter.ml.depends\
 \nocamlfind ocamlc -i -thread -short-paths -package core -ppx 'ppx-jane -as-ppx' counter.ml > counter.inferred.mli\
 \n$ cat _build/counter.inferred.mli\
 \nval touch :\
 \n  (string, int) Base__List.Assoc.t ->\
 \n  string -> (string, int) Base__List.Assoc.t\
 \n")
