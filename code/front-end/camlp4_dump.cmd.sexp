(Other
  "#!/bin/sh\
 \n\
 \nOCAMLFIND=\"ocamlfind query -predicates syntax,preprocessor -r\"\
 \nINCLUDE=`$OCAMLFIND -i-format comparelib.syntax`\
 \nARCHIVES=`$OCAMLFIND -a-format comparelib.syntax`\
 \ncamlp4o -printer o $INCLUDE $ARCHIVES $1\
 \n")
