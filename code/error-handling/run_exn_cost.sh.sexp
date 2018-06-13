(Other
  "$ jbuilder build exn_cost.exe\
 \n    ocamldep exn_cost.depends.ocamldep-output\
 \n      ocamlc exn_cost.{cmi,cmo,cmt}\
 \n    ocamlopt exn_cost.{cmx,o}\
 \n    ocamlopt exn_cost.exe\
 \n$ ./_build/default/exn_cost.exe -ascii cycles -quota 1\
 \nEstimated testing time 4s (4 benchmarks x 1s). Change using -quota SECS.\
 \n                                                                              \
 \n  Name                           Time/Run   Cycls/Run   mWd/Run   Percentage  \
 \n ------------------------------ ---------- ----------- --------- ------------ \
 \n  simple computation             357.91ns   1_001.39c    84.00w      100.00%  \
 \n  simple computation w/handler   340.27ns     952.17c    84.00w       95.07%  \
 \n  end with exn                   318.19ns     890.45c    84.00w       88.90%  \
 \n  end with exn notrace           284.62ns     796.55c    84.00w       79.52%  \
 \n                                                                              \
 \n")
