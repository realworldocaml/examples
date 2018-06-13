(Other
  "$ jbuilder build short_parser.mli\
 \nWarning: Module Prog in . doesn't have a corresponding .ml file.\
 \nModules without an implementation are not recommended, see this discussion:\
 \n\
 \n  https://github.com/ocaml/dune/issues/9\
 \n\
 \nIn the meantime I'm implicitely adding this rule:\
 \n\
 \n(rule (with-stdout-to prog.ml\
 \n       (progn\
 \n        (echo \"[@@@warning \\\"-a\\\"]\\nmodule rec HACK : sig\\n\")\
 \n        (cat prog.mli)\
 \n        (echo \"\\nend = HACK\\ninclude HACK\\n\"))))\
 \n\
 \nAdd it to your jbuild file to remove this warning.\
 \n      menhir short_parser.{ml,mli}\
 \n")
