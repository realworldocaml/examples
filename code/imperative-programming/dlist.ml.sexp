(OCaml
 (((name 6)
   (content
     "let iter t ~f =\
    \n  let rec loop = function\
    \n    | None -> ()\
    \n    | Some el -> f (value el); loop (next el)\
    \n  in\
    \n  loop !t\
    \n\
    \nlet find_el t ~f =\
    \n  let rec loop = function\
    \n    | None -> None\
    \n    | Some elt ->\
    \n      if f (value elt) then Some elt\
    \n      else loop (next elt)\
    \n  in\
    \n  loop !t"))
  ((name 5)
   (content
     "let remove t elt =\
    \n  let { prev; next; _ } = elt in\
    \n  begin match prev with\
    \n  | Some prev -> prev.next <- next\
    \n  | None -> t := next\
    \n  end;\
    \n  begin match next with\
    \n  | Some next -> next.prev <- prev;\
    \n  | None -> ()\
    \n  end;\
    \n  elt.prev <- None;\
    \n  elt.next <- None\
    \n\
    \n"))
  ((name 4)
   (content
     "let insert_after elt value =\
    \n  let new_elt = { value; prev = Some elt; next = elt.next } in\
    \n  begin match elt.next with\
    \n  | Some old_next -> old_next.prev <- Some new_elt\
    \n  | None -> ()\
    \n  end;\
    \n  elt.next <- Some new_elt;\
    \n  new_elt\
    \n\
    \n"))
  ((name 3)
   (content
     "let insert_first t value =\
    \n  let new_elt = { prev = None; next = !t; value } in\
    \n  begin match !t with\
    \n  | Some old_first -> old_first.prev <- Some new_elt\
    \n  | None -> ()\
    \n  end;\
    \n  t := Some new_elt;\
    \n  new_elt\
    \n\
    \n"))
  ((name 2)
   (content
     "let create () = ref None\
    \nlet is_empty t = !t = None\
    \n\
    \nlet value elt = elt.value\
    \n\
    \nlet first t = !t\
    \nlet next elt = elt.next\
    \nlet prev elt = elt.prev\
    \n\
    \n"))
  ((name 1)
   (content
     "(* file: dlist.ml *)\
    \nopen Core_kernel\
    \n\
    \ntype 'a element =\
    \n  { value : 'a;\
    \n    mutable next : 'a element option;\
    \n    mutable prev : 'a element option\
    \n  }\
    \n\
    \ntype 'a t = 'a element option ref\
    \n\
    \n"))
  ((name "") (content "\n"))))
