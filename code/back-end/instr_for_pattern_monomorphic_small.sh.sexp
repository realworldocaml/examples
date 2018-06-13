(Other
  "$ ocamlc -dinstr pattern_monomorphic_small.ml 2>&1\
 \n\tbranch L2\
 \nL1:\tacc 0\
 \n\tpush\
 \n\tconst 0\
 \n\tneqint\
 \n\tbranchifnot L3\
 \n\tconst 101\
 \n\treturn 1\
 \nL3:\tconst 100\
 \n\treturn 1\
 \nL2:\tclosure L1, 0\
 \n\tpush\
 \n\tacc 0\
 \n\tmakeblock 1, 0\
 \n\tpop 1\
 \n\tsetglobal Pattern_monomorphic_small!\
 \n\
 \n")
