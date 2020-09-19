module View.Home exposing (view)


import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont


view title model =
    let
        body = E.layout
            [
            ]
            <| mainDocumentColumn model
    in
        { title = title
        , body = [ body ]
        }

mainDocumentColumn model =
    E.column
        [ EBackground.color <| E.rgb255 80 80 80
        , E.height E.fill
        , E.width E.fill
        ]
        [ E.row
            [ E.height E.fill
            , E.width E.fill
            ]
            <| List.map toBar cols
        ]

toBar col =
    E.el
        [ E.height E.fill
        , E.width E.fill
        , EBackground.color col
        ]
        <| E.none

cols =
    [ E.rgb255 20 100 40
    , E.rgb255 60 140 80
    , E.rgb255 120 220 140
    ]

