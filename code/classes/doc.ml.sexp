(OCaml
 (((name 5)
   (content
     "class counter_with_sig : object\
    \n  method doc : int -> doc -> int\
    \n  method list_item : int -> 'b list_item -> int\
    \n  method text_item : int -> text_item -> int\
    \nend = object\
    \n  inherit [int] folder2 as super\
    \n\
    \n  method list_item acc li = acc\
    \n\
    \n  method private bold acc txt = \
    \n    let acc = super#bold acc txt in\
    \n    acc + 1\
    \nend"))
  ((name 4)
   (content
     "class counter_with_private_method = object\
    \n  inherit [int] folder2 as super\
    \n\
    \n  method list_item acc li = acc\
    \n\
    \n  method private bold acc txt = \
    \n    let acc = super#bold acc txt in\
    \n    acc + 1\
    \nend\
    \n\
    \n"))
  ((name 3)
   (content
     "class ['a] folder2 = object(self)\
    \n  method doc acc = function\
    \n  | Heading str -> self#heading acc str\
    \n  | Paragraph text -> self#paragraph acc text\
    \n  | Definition list -> self#definition acc list\
    \n\
    \n  method list_item: 'b. 'a -> 'b list_item -> 'a =\
    \n    fun acc {tag; text} ->\
    \n      List.fold ~f:self#text_item ~init:acc text\
    \n\
    \n  method text_item acc = function\
    \n  | Raw str -> self#raw acc str\
    \n  | Bold text -> self#bold acc text\
    \n  | Enumerate list -> self#enumerate acc list\
    \n  | Quote doc -> self#quote acc doc\
    \n\
    \n  method private heading acc str = acc\
    \n  method private paragraph acc text =\
    \n    List.fold ~f:self#text_item ~init:acc text\
    \n  method private definition acc list =\
    \n    List.fold ~f:self#list_item ~init:acc list\
    \n\
    \n  method private raw acc str = acc\
    \n  method private bold acc text = \
    \n    List.fold ~f:self#text_item ~init:acc text\
    \n  method private enumerate acc list = \
    \n    List.fold ~f:self#list_item ~init:acc list\
    \n  method private quote acc doc = self#doc acc doc\
    \nend\
    \n\
    \nlet f :\
    \n  < doc : int -> doc -> int;\
    \n    list_item : 'a . int -> 'a list_item -> int;\
    \n    text_item : int -> text_item -> int >  = new folder2\
    \n\
    \n"))
  ((name 2)
   (content
     "class counter = object\
    \n  inherit [int] folder as super\
    \n\
    \n  method list_item acc li = acc\
    \n\
    \n  method text_item acc ti =\
    \n    let acc = super#text_item acc ti in\
    \n    match ti with\
    \n    | Bold _ -> acc + 1\
    \n    | _ -> acc\
    \nend\
    \n\
    \nlet count_doc = (new counter)#doc\
    \n\
    \n"))
  ((name 1)
   (content
     "open Core\
    \n\
    \nclass ['a] folder = object(self)\
    \n  method doc acc = function\
    \n  | Heading _ -> acc\
    \n  | Paragraph text -> List.fold ~f:self#text_item ~init:acc text\
    \n  | Definition list -> List.fold ~f:self#list_item ~init:acc list\
    \n\
    \n  method list_item: 'b. 'a -> 'b list_item -> 'a = \
    \n    fun acc {tag; text} ->\
    \n      List.fold ~f:self#text_item ~init:acc text\
    \n\
    \n  method text_item acc = function\
    \n  | Raw _ -> acc\
    \n  | Bold text -> List.fold ~f:self#text_item ~init:acc text\
    \n  | Enumerate list -> List.fold ~f:self#list_item ~init:acc list\
    \n  | Quote doc -> self#doc acc doc\
    \nend\
    \n\
    \n"))
  ((name "")
   (content
     "type doc =\
    \n  | Heading of string\
    \n  | Paragraph of text_item list\
    \n  | Definition of string list_item list\
    \n\
    \nand text_item =\
    \n  | Raw of string\
    \n  | Bold of text_item list\
    \n  | Enumerate of int list_item list\
    \n  | Quote of doc\
    \n\
    \nand 'a list_item = \
    \n  { tag: 'a;\
    \n    text: text_item list }\
    \n\
    \n"))))
