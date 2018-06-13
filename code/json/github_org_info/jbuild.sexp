(Other
  "(jbuild_version 1)\
 \n\
 \n(rule\
 \n ((targets (github_org_j.ml github_org_j.mli))\
 \n  (deps    (github_org.atd))\
 \n  (action  (run atdgen -j ${<}))))\
 \n\
 \n(rule\
 \n ((targets (github_org_t.ml github_org_t.mli))\
 \n  (deps    (github_org.atd))\
 \n  (action  (run atdgen -t ${<}))))\
 \n\
 \n(executable\
 \n  ((name github_org_info)\
 \n   (libraries (core yojson atdgen core_extended))\
 \n   (modules (github_org_info github_org_t github_org_j))\
 \n  )\
 \n)\
 \n")
