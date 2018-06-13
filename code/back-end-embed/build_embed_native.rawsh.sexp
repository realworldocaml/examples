(Other
  "$ ocamlopt -output-obj -o embed_native.o embed_me1.ml embed_me2.ml\
 \n$ gcc -Wall -I `ocamlc -where` -o final.native embed_native.o main.c \\\
 \n   -L `ocamlc -where` -lasmrun -ltermcap -lm -ldl\
 \n$ ./final.native\
 \nBefore calling OCaml\
 \nhello embedded world 1\
 \nhello embedded world 2\
 \nAfter calling OCaml\
 \n")
