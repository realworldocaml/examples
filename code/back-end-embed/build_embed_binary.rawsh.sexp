(Other
  "$ gcc -fPIC -Wall -I`ocamlc -where` -L`ocamlc -where` -ltermcap -lm -ldl \\\
 \n  -o finalbc.native main.c embed_out.o -lcamlrun\
 \n$ ./finalbc.native\
 \nBefore calling OCaml\
 \nhello embedded world 1\
 \nhello embedded world 2\
 \nAfter calling OCaml\
 \n")
