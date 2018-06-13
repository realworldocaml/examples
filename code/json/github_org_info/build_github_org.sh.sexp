(Other
  "$ jbuilder build github_org_info.exe\
 \n      atdgen github_org_j.{ml,mli}\
 \n      atdgen github_org_t.{ml,mli}\
 \n    ocamldep github_org_info.depends.ocamldep-output\
 \n    ocamldep github_org_info.dependsi.ocamldep-output\
 \n      ocamlc github_org_t.{cmi,cmti}\
 \n    ocamlopt github_org_t.{cmx,o}\
 \n      ocamlc github_org_j.{cmi,cmti}\
 \n      ocamlc github_org_info.{cmi,cmo,cmt}\
 \n    ocamlopt github_org_j.{cmx,o}\
 \n    ocamlopt github_org_info.{cmx,o}\
 \n    ocamlopt github_org_info.exe\
 \n")
