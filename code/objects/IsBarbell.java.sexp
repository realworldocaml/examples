(Other
  "boolean IsBarbell(Shape[] s) {\
 \n  return s.length == 3 && (s[0] instanceof Circle) &&\
 \n    (s[1] instanceof Line) && (s[2] instanceof Circle) &&\
 \n        ((Circle) s[0]).radius() == ((Circle) s[2]).radius();\
 \n}\
 \n")
