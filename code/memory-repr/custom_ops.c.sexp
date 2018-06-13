(Other
  "struct custom_operations {\
 \n  char *identifier;\
 \n  void (*finalize)(value v);\
 \n  int (*compare)(value v1, value v2);\
 \n  intnat (*hash)(value v);\
 \n  void (*serialize)(value v,\
 \n                    /*out*/ uintnat * wsize_32 /*size in bytes*/,\
 \n                    /*out*/ uintnat * wsize_64 /*size in bytes*/);\
 \n  uintnat (*deserialize)(void * dst);\
 \n  int (*compare_ext)(value v1, value v2);\
 \n};\
 \n")
