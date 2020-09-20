module Msg exposing 
    ( Msg(..)
    , ButtonAction(..)
    )


type Msg
    = NoOp
    | MouseEnteredButton Int
    | MouseLeftButton Int
    | ButtonPressed ButtonAction

type ButtonAction 
    = Refinance
    | Purchase



