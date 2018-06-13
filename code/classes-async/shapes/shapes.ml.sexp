(OCaml
 (((name 10)
   (content
     "let main () =\
    \n  let shapes = [ \
    \n     (my_circle :> drawable); \
    \n     (new my_square 50 350 :> drawable); \
    \n     (new my_square 50 200 :> drawable);\
    \n     (new growing_circle 20 70 70 :> drawable);\
    \n  ] in\
    \n  let repaint () =\
    \n    clear_graph ();\
    \n    List.iter ~f:(fun s -> s#draw) shapes;\
    \n    synchronize ()\
    \n  in \
    \n    open_graph \"\";\
    \n    auto_synchronize false;\
    \n    Clock.every (Time.Span.of_sec (1.0 /. 24.0)) repaint\
    \n\
    \nlet () = never_returns (Scheduler.go_main ~main ())"))
  ((name 9)
   (content
     "class my_square x y = object\
    \n  inherit square 40 x y\
    \n  inherit draggable\
    \n  inherit animated (Time.Span.of_int_sec 5)\
    \n  inherit linear 5 0\
    \n  inherit harmonic 0.0 7 ~-10\
    \nend\
    \n\
    \nlet my_circle = object\
    \n  inherit circle 30 250 250\
    \n  inherit animated (Time.Span.minute)\
    \n  inherit harmonic 0.0 10 0\
    \n  inherit harmonic (pi /. 2.0) 0 10\
    \nend\
    \n\
    \n"))
  ((name 8)
   (content
     "class virtual linear x' y' = object\
    \n  val virtual mutable updates: (int -> unit) list\
    \n  val virtual mutable x: int\
    \n  val virtual mutable y: int\
    \n\
    \n  initializer\
    \n    let update _ =\
    \n      x <- x + x';\
    \n      y <- y + y'\
    \n    in\
    \n    updates <- update :: updates\
    \nend\
    \n\
    \nlet pi = (atan 1.0) *. 4.0\
    \n\
    \nclass virtual harmonic offset x' y' = object\
    \n  val virtual mutable updates: (int -> unit) list\
    \n  val virtual mutable x: int\
    \n  val virtual mutable y: int\
    \n\
    \n  initializer\
    \n    let update step =\
    \n      let m = sin (offset +. ((Float.of_int step) *. (pi /. 64.))) in\
    \n      let x' = Float.to_int (m *. Float.of_int x') in\
    \n      let y' = Float.to_int (m *. Float.of_int y') in\
    \n      x <- x + x';\
    \n      y <- y + y'\
    \n    in\
    \n    updates <- update :: updates\
    \nend\
    \n\
    \n"))
  ((name 7)
   (content
     "class my_circle = object\
    \n  inherit circle 20 50 50\
    \n  inherit animated Time.Span.second\
    \n  initializer updates <- [fun _ -> x <- x + 5]\
    \nend\
    \n\
    \n"))
  ((name 6)
   (content
     "class virtual animated span = object(self)\
    \n  method virtual on_click: \
    \n    ?start:unit Deferred.t -> \
    \n    ?stop:unit Deferred.t -> \
    \n    (int -> int -> unit) -> unit\
    \n  val mutable updates: (int -> unit) list = []\
    \n  val mutable step = 0\
    \n  val mutable running = false\
    \n\
    \n  method running = running\
    \n\
    \n  method animate =\
    \n    step <- 0;\
    \n    running <- true;\
    \n    let stop =\
    \n      Clock.after span\
    \n      >>| fun () -> running <- false \
    \n    in\
    \n    Clock.every ~stop (Time.Span.of_sec (1.0 /. 24.0))\
    \n      (fun () ->\
    \n         step <- step + 1;\
    \n         List.iter ~f:(fun f -> f step) updates\
    \n      )\
    \n\
    \n  initializer\
    \n    self#on_click (fun _x _y -> if not self#running then self#animate)\
    \nend\
    \n\
    \n"))
  ((name 5)
   (content
     "class small_square = object\
    \n  inherit square 20 40 40\
    \n  inherit draggable \
    \nend\
    \n\
    \n"))
  ((name 4)
   (content
     "class virtual draggable = object(self)\
    \n  method virtual on_mousedown: \
    \n    ?start:unit Deferred.t -> \
    \n    ?stop:unit Deferred.t -> \
    \n    (int -> int -> unit) -> unit\
    \n  val virtual mutable x: int  \
    \n  val virtual mutable y: int  \
    \n\
    \n  val mutable dragging = false\
    \n  method dragging = dragging\
    \n\
    \n  initializer \
    \n    self#on_mousedown \
    \n      (fun mouse_x mouse_y ->\
    \n         let offset_x = x - mouse_x in\
    \n         let offset_y = y - mouse_y in\
    \n         let mouse_up = Ivar.create () in\
    \n         let stop = Ivar.read mouse_up in\
    \n         dragging <- true;\
    \n         on_mouseup ~stop\
    \n           (fun _ ->\
    \n              Ivar.fill mouse_up ();\
    \n              dragging <- false);\
    \n         on_mousemove ~stop\
    \n           (fun ev ->\
    \n              x <- ev.mouse_x + offset_x;\
    \n              y <- ev.mouse_y + offset_y))\
    \nend\
    \n\
    \n"))
  ((name 3)
   (content
     "class growing_circle r x y = object(self)\
    \n  inherit circle r x y\
    \n\
    \n  initializer\
    \n    self#on_click (fun _x _y -> radius <- radius * 2)\
    \nend\
    \n\
    \n"))
  ((name 2)
   (content
     "class square w x y = object\
    \n  inherit shape x y\
    \n\
    \n  val mutable width = w\
    \n  method width = width\
    \n\
    \n  method draw = fill_rect x y width width\
    \n\
    \n  method private contains x' y' = \
    \n    x <= x' && x' <= x + width &&\
    \n    y <= y' && y' <= y + width \
    \nend \
    \n\
    \nclass circle r x y = object\
    \n  inherit shape x y\
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
    \n    dist <= (Float.of_int radius)\
    \nend\
    \n\
    \n"))
  ((name 1)
   (content
     "class virtual shape x y = object(self)\
    \n  method virtual private contains: int -> int -> bool\
    \n\
    \n  val mutable x: int = x\
    \n  method x = x\
    \n\
    \n  val mutable y: int = y\
    \n  method y = y\
    \n\
    \n  method on_click ?start ?stop f =\
    \n    on_click ?start ?stop\
    \n      (fun ev ->  \
    \n         if self#contains ev.mouse_x ev.mouse_y then\
    \n           f ev.mouse_x ev.mouse_y)\
    \n\
    \n  method on_mousedown ?start ?stop f =\
    \n    on_mousedown ?start ?stop\
    \n      (fun ev ->\
    \n         if self#contains ev.mouse_x ev.mouse_y then\
    \n           f ev.mouse_x ev.mouse_y)\
    \nend\
    \n\
    \n"))
  ((name "")
   (content
     "open Core\
    \nopen Async\
    \nopen Async_graphics\
    \n\
    \ntype drawable = < draw: unit >\
    \n\
    \n"))))
