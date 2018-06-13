(Other
  "$ jbuilder build cal_add_sub_days.exe\
 \n    ocamldep cal_add_sub_days.depends.ocamldep-output\
 \n      ocamlc cal_add_sub_days.{cmi,cmo,cmt}\
 \n    ocamlopt cal_add_sub_days.{cmx,o}\
 \n    ocamlopt cal_add_sub_days.exe\
 \n$ ./_build/default/cal_add_sub_days.exe -help\
 \nManipulate dates\
 \n\
 \n  cal_add_sub_days.exe SUBCOMMAND\
 \n\
 \n=== subcommands ===\
 \n\
 \n  add      Add [days] to the [base] date\
 \n  diff     Show days between [date1] and [date2]\
 \n  version  print version information\
 \n  help     explain a given subcommand (perhaps recursively)\
 \n\
 \n")
