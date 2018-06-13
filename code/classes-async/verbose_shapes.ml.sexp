(OCaml
 (((name 2)
   (content
     "class circle r x y = object(self)\
    \n  val mutable x: int = x\
    \n  method x = x\
    \n\
    \n  val mutable y: int = y\
    \n  method y = y\
    \n\
    \n  val mutable radius = r\
    \n  method radius = radius\
    \n\
    \n  method draw = fill_circle x y radius\
    \n\
    \n  method private contains x' y' =\
    \n    let dx = abs (x' - x) in\
    \n    let dy = abs (y' - y) in\
    \n    let dist = sqrt (Float.of_int ((dx * dx) + (dy * dy))) in\
    \n      dist <= (Float.of_int radius)\
    \n\
    \n  method on_click ?start ?stop f =\
    \n    on_click ?start ?stop\
    \n      (fun ev ->\
    \n         if self#contains ev.mouse_x ev.mouse_y then\
    \n           f ev.mouse_x ev.mouse_y)\
    \nend"))
  ((name 1)
   (content
     "class square w x y = object(self)\
    \n  val mutable x: int = x\
    \n  method x = x\
    \n\
    \n  val mutable y: int = y\
    \n  method y = y\
    \n\
    \n  val mutable width = w\
    \n  method width = width\
    \n\
    \n  method draw = fill_rect x y width width\
    \n\
    \n  method private contains x' y' =\
    \n    x <= x' && x' <= x + width &&\
    \n      y <= y' && y' <= y + width\
    \n\
    \n  method on_click ?start ?stop f =\
    \n    on_click ?start ?stop\
    \n      (fun ev ->\
    \n         if self#contains ev.mouse_x ev.mouse_y then\
    \n           f ev.mouse_x ev.mouse_y)\
    \nend\
    \n\
    \n"))
  ((name "") (content "\n"))))
