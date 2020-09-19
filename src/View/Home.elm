module View.Home exposing (view)


import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont

import Palette

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
    let
        colorRows =
            E.row
                [ E.height <| E.px 500
                , E.width E.fill
                ]
                <| List.map toBar cols
        leftSide =
            E.column
                [ E.width E.fill
                , E.height E.fill
                ]
                [ E.none
                ]
        rightSide =
            E.column
                [ E.width E.fill
                , E.height E.fill
                , EBackground.color Palette.color0
                ]
                [ E.none
                ]
    in
    E.column
        [ EBackground.color <| E.rgb255 80 80 80
        , E.height E.fill
        , E.width E.fill
        ]
        [ E.row
            [ E.width E.fill
            , E.height <| E.px 700
            ]
            [ leftSide
            , rightSide
            ]
        , colorRows
        ]

toBar col =
    E.el
        [ E.height E.fill
        , E.width E.fill
        , EBackground.color col
        ]
        <| E.none

cols =
    [ Palette.color0
    , Palette.color1
    , Palette.color2
    ]

