(OCaml
 (((name "")
   (content
     "type t = [\
    \n  | `Add of t * t\
    \n  | `Sub of t * t\
    \n  | `Mul of t * t\
    \n  | `Num of int\
    \n]\
    \n\
    \nlet rec algebra (x:t) =\
    \n  match x with\
    \n  | `Add (x,y) -> (algebra x) + (algebra y)\
    \n  | `Sub (x,y) -> (algebra x) - (algebra y)\
    \n  | `Mul (x,y) -> (algebra x) * (algebra y)\
    \n  | `Num x     -> x\
    \n\
    \nlet _ =\
    \n  algebra (\
    \n    `Add (\
    \n      (`Num 0),\
    \n      (`Sub (\
    \n          (`Num 1),\
    \n          (`Mul (\
    \n              (`Nu 3),(`Num 2)\
    \n            ))\
    \n        ))\
    \n    ))"))))
