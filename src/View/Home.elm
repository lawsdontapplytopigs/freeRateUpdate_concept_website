module View.Home exposing (view)


import Dict
import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Element.Input as EInput
import Element.Events as EEvents

import Html.Attributes

import Icons

import Msg
import Palette

view title model =
    let
        body = E.layout
            [ EFont.family
                [ EFont.typeface Palette.font0
                ]
            ]
            <| mainDocumentColumn model
    in
        { title = title
        , body = [ body ]
        }

mainDocumentColumn model =
    let
        cols =
            [ Palette.color1
            , Palette.color2
            , Palette.color3
            ]
        colorRows =
            E.row
                [ E.height <| E.px 500
                , E.width E.fill
                ]
                <| List.map toBar cols

        siteSecuredMessage =
            E.row
                [ E.spacing 5
                , E.htmlAttribute <| Html.Attributes.style "text-align" "left"
                , EFont.size 12
                , EFont.color <| Palette.color0
                , EFont.regular
                ]
                [ E.el
                    [ E.width <| E.px 15
                    , E.height <| E.px 15
                    ]
                    <| E.html (Icons.lock "#0a3020")
                , E.paragraph
                    [
                    ]
                    [ E.text "This site is secure. Encrypted with 128-bit SSL."
                    ]
                ]
        leftSide =
            E.column
                [ E.height E.fill
                , E.width E.fill
                , E.inFront
                    <| leftNavbar model
                ]
                [ E.el
                    [ E.width E.fill
                    , E.height E.fill
                    , E.htmlAttribute <| Html.Attributes.style "text-align" "left"
                    , EFont.bold
                    -- , EFont.color Palette.color0
                    , EFont.color Palette.color0
                    , EFont.size Palette.fontSize5
                    ]
                    <| E.column
                        [ E.paddingXY 30 0
                        , E.height E.fill
                        , E.width E.fill
                        , E.inFront
                            <| E.el
                                [ E.paddingEach { top = 440, right = 30, bottom = 0, left = 30 }
                                ]
                                <| siteSecuredMessage
                        ]          
                        [ E.column
                            [ E.centerY
                            ]
                            -- [ E.paragraph
                            --     [
                            --     ]
                            --     [ E.text "No hidden fees."
                            --     ]

                            -- , E.paragraph
                            --     [
                            --     ]
                            --     [ E.text "Just a good deal."
                            --     ]
                            -- ]

                            [ E.paragraph
                                [
                                ]
                                [ E.text "No SSN required to get started."
                                ]

                            , E.paragraph
                                [
                                ]
                                [ E.text "Only reputable lenders."
                                ]
                            ]
                        ]
                ]
        rightSide =
            let
                wrap color_ element =
                    E.el
                        [ EBackground.color color_
                        , EBorder.rounded 999999
                        , E.centerX
                        , E.centerY
                        , E.padding 5
                        ]
                        element
                coolI size =
                    E.el 
                        [ E.centerX
                        , E.centerY
                        , EFont.color <| Palette.color2
                        , EFont.size size
                        , E.width <| E.px size
                        , E.height <| E.px size
                        ] <| E.text "i"
                infoCard = 
                    let
                        wrappedI =
                            coolI 20
                                |> wrap Palette.color4
                                |> wrap Palette.color3
                    in
                        E.el
                            [ E.paddingEach { top = 0, right = 30, bottom = 30, left = 30 }
                            , E.alignRight
                            , E.alignBottom
                            ]
                            <| E.row
                                [ EFont.size Palette.fontSize0
                                , EBackground.color Palette.color2
                                , EBorder.roundEach { topLeft = 200, bottomLeft = 200, bottomRight = 999, topRight = 999 }
                                ]
                                [ E.paragraph
                                    [ E.paddingXY 10 0
                                    -- , EFont.color Palette.color4
                                    -- , EFont.color <| E.rgb255 255 255 255
                                    , EFont.color Palette.color5
                                    ]
                                    [ E.text "Today's mortgage rates are at an all time low of 2.17% APR!"
                                    ]
                                , E.el 
                                    [ E.alignRight 
                                    , E.paddingXY 5 5
                                    ]
                                    <| wrappedI
                                ]
            in
            E.el
                [ E.width E.fill
                , E.height E.fill
                , EBackground.color Palette.color1
                , E.paddingXY 30 0
                , E.inFront
                    <| infoCard
                ]
                <| E.column
                    [ E.spacing 20
                    , E.centerY
                    ]
                    [ E.el
                        [
                        ]
                        <| E.paragraph
                            [ EFont.size Palette.fontSize3
                            , EFont.color <| E.rgb255 255 255 255
                            , EFont.medium
                            , E.htmlAttribute <| Html.Attributes.style "text-align" "left"
                            ]
                            [ E.text "Choose a loan type to start comparing rates!"
                            ]
                    , E.wrappedRow
                        [ E.spacing 10
                        , EFont.medium
                        , EFont.size Palette.fontSize0
                        ]
                        [ regularRoundedButton model.buttons 0 (Msg.ButtonPressed Msg.Refinance) Icons.dollar "Refinance"
                        , regularRoundedButton model.buttons 1 (Msg.ButtonPressed Msg.Purchase) Icons.home "Purchase"
                        ]
                    ]
    in
    E.column
        -- [ EBackground.color 
        [ E.height E.fill
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


regularRoundedButton buttons id msg icon text =
    let
        btn = Dict.get id buttons |> Maybe.withDefault { mouseOver = False }
        ic =
            case btn.mouseOver of
                False ->
                    icon "#ffffff"
                True ->
                    icon "#000000"
    in
    EInput.button
        [ EBorder.width 3
        -- , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
        , EBorder.rounded 99999999
        , EBorder.color <| E.rgb255 255 255 255
        , EBackground.color
            <| case btn.mouseOver of
                False ->
                    E.rgba255 0 0 0 0
                True ->
                    E.rgb255 255 255 255
                    
        , EFont.color
            <| case btn.mouseOver of
                False ->
                    E.rgb255 255 255 255
                True ->
                    E.rgb255 0 0 0 
        , EEvents.onMouseEnter <| Msg.MouseEnteredButton id
        , EEvents.onMouseLeave <| Msg.MouseLeftButton id
        ]
        { onPress = Just msg
        , label = E.row
            [
            ] 
            [ E.el
                [ E.width <| E.px 20
                , E.height <| E.px 20
                , E.paddingEach { top = 0, right = 0, bottom = 0, left = 10 }
                ]
                <| E.html ic
            , E.el 
                [ E.paddingXY 20 10
                ]
                <| E.text text
            ]
        }

leftNavbar model =
    let
        -- logo =
        --     E.el
        --         [
        --         ]
        --         <| E.image
        --             [ E.height <| E.px 40
        --             ]
        --             { description = "logo"
        --             , src = "./logo.webp"
        --             }
        logo =
            E.el
                -- [ E.height <| E.px 60
                -- , E.width <| E.px 100
                -- ]
                [ E.paddingXY 10 0
                -- , EBackground.color <| E.rgb255 80 80 80
                ]
                <| E.el [ E.htmlAttribute <| Html.Attributes.style "transform" "scale(1.2)"] <| E.html Icons.logo
            
        links =
            [ { url = "https://www.freerateupdate.com/mortgage-rates", txt = "Mortgage Rates" }
            , { url = "https://www.freerateupdate.com/lender-reviews", txt = "Lender Reviews" }
            , { url = "https://www.freerateupdate.com/contact", txt = "Contact Us" }
            ]

        makeLink { url, txt } =
            E.link
                [ EFont.size Palette.fontSize1
                , EFont.medium
                , EFont.color Palette.color0
                , E.paddingXY 10 0
                ]
                { url = url
                , label = E.el [] <| E.text txt
                }
    in
        E.row
            [ E.width E.fill
            , E.height <| E.px 70
            , E.paddingXY 20 0
            -- , EBackground.color <| E.rgb255 80 80 80
            ]
            [ logo
            , E.row
                
                [ E.centerY
                -- , EBackground.color <| E.rgb255 80 80 80
                , E.alignRight
                ]
                <| List.map makeLink links
            ]

-- regularRoundedButton mouseOverContactMe text msg =
--     EInput.button
--         [ EBorder.width 3
--         -- , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
--         , EBorder.rounded 99999999
--         , EBorder.color <| E.rgb255 0 0 0
--         , EBackground.color 
--             <| E.fromRgb <| Color.toRgba
--                 <| Animator.color mouseOverContactMe <| 
--                     \btn ->
--                         case btn of
--                             False ->
--                                 Color.rgb255 255 255 255
--                             True ->
--                                 Color.rgb255 0 0 0
                    
--         , EFont.color
--             <| E.fromRgb <| Color.toRgba
--                 <| Animator.color mouseOverContactMe <| 
--                     \btn ->
--                         case btn of
--                             False ->
--                                 Color.rgb255 0 0 0
--                             True ->
--                                 Color.rgb255 255 255 255
--         , EEvents.onMouseEnter <| Msg.MouseEnteredButton
--         , EEvents.onMouseLeave <| Msg.MouseLeftButton
--         ]
--         { onPress = Just msg
--         , label = E.el 
--             [ E.paddingXY 20 10 
--             ] <| E.text text
--         }

