(Other
  "(jbuild_version 1)\
 \n\
 \n(rule\
 \n ((targets (short_parser.mli short_parser.ml))\
 \n  (deps (short_parser.mly))\
 \n  (action (ignore-stderr (run menhir --external-tokens Json --explain ${<})))))\
 \n")
