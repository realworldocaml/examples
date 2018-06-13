(Other
  "$ jbuilder build barrier_bench.exe\
 \n    ocamldep barrier_bench.depends.ocamldep-output\
 \n      ocamlc barrier_bench.{cmi,cmo,cmt}\
 \n    ocamlopt barrier_bench.{cmx,o}\
 \n    ocamlopt barrier_bench.exe\
 \n$ ./_build/default/barrier_bench.exe -ascii alloc -quota 1\
 \nEstimated testing time 2s (2 benchmarks x 1s). Change using -quota SECS.\
 \n                                                                     \
 \n  Name        Time/Run   mWd/Run   mjWd/Run   Prom/Run   Percentage  \
 \n ----------- ---------- --------- ---------- ---------- ------------ \
 \n  mutable       7.41ms    2.00Mw     20.34w     20.34w      100.00%  \
 \n  immutable     4.53ms    5.00Mw                             61.06%  \
 \n                                                                     \
 \n")
