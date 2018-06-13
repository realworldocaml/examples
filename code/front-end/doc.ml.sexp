(OCaml
 (((name "")
   (content
     "(** example.ml: The first special comment of the file is the comment \
    \n    associated with the whole module. *)\
    \n\
    \n(** Comment for exception My_exception. *)\
    \nexception My_exception of (int -> int) * int\
    \n\
    \n(** Comment for type [weather]  *)\
    \ntype weather =\
    \n  | Rain of int (** The comment for construtor Rain *)\
    \n  | Sun         (** The comment for constructor Sun *)\
    \n\
    \n(** Find the current weather for a country\
    \n    @author Anil Madhavapeddy\
    \n    @param location The country to get the weather for.\
    \n*)\
    \nlet what_is_the_weather_in location =\
    \n  match location with\
    \n  | `Cambridge  -> Rain 100\
    \n  | `New_york   -> Rain 20\
    \n  | `California -> Sun"))))
