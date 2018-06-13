(Other
  "// Abstract class definition in C++.\
 \ntemplate<typename T>\
 \nclass Iterator {\
 \n public:\
 \n  virtual ~Iterator() {}\
 \n  virtual T get() const = 0;\
 \n  virtual bool has_value() const = 0;\
 \n  virtual void next() = 0;\
 \n};\
 \n")
