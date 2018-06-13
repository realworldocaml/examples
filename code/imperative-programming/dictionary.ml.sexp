(OCaml
 (((name 4)
   (content
     "let bucket_has_key t i key =\
    \n  List.exists t.buckets.(i) ~f:(fun (key',_) -> key' = key)\
    \n\
    \nlet add t ~key ~data =\
    \n  let i = hash_bucket key in\
    \n  let replace = bucket_has_key t i key in\
    \n  let filtered_bucket =\
    \n    if replace then\
    \n      List.filter t.buckets.(i) ~f:(fun (key',_) -> key' <> key)\
    \n    else\
    \n      t.buckets.(i)\
    \n  in\
    \n  t.buckets.(i) <- (key, data) :: filtered_bucket;\
    \n  if not replace then t.length <- t.length + 1\
    \n\
    \nlet remove t key =\
    \n  let i = hash_bucket key in\
    \n  if bucket_has_key t i key then (\
    \n    let filtered_bucket =\
    \n      List.filter t.buckets.(i) ~f:(fun (key',_) -> key' <> key)\
    \n    in\
    \n    t.buckets.(i) <- filtered_bucket;\
    \n    t.length <- t.length - 1\
    \n  )"))
  ((name 3)
   (content
     "let iter t ~f =\
    \n  for i = 0 to Array.length t.buckets - 1 do\
    \n    List.iter t.buckets.(i) ~f:(fun (key, data) -> f ~key ~data)\
    \n  done\
    \n\
    \n"))
  ((name 2)
   (content
     "let num_buckets = 17\
    \n\
    \nlet hash_bucket key = (Hashtbl.hash key) mod num_buckets\
    \n\
    \nlet create () =\
    \n  { length = 0;\
    \n    buckets = Array.create ~len:num_buckets [];\
    \n  }\
    \n\
    \nlet length t = t.length\
    \n\
    \nlet find t key =\
    \n  List.find_map t.buckets.(hash_bucket key)\
    \n    ~f:(fun (key',data) -> if key' = key then Some data else None)\
    \n\
    \n"))
  ((name 1)
   (content
     "(* file: dictionary.ml *)\
    \nopen Core_kernel\
    \n\
    \ntype ('a, 'b) t = { mutable length: int;\
    \n                    buckets: ('a * 'b) list array;\
    \n                  }\
    \n\
    \n"))
  ((name "") (content "\n"))))
