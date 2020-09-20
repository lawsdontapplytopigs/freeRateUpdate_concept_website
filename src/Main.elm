module Main exposing (..)

import Browser
import Dict
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)
import Msg
import View.Home


---- MODEL ----


type alias Button =
    { mouseOver : Bool }

updateMouseOver : Bool -> Button -> Button
updateMouseOver bool button =
    { button
        | mouseOver = bool
    }

defaultButton = { mouseOver = False }

type alias Model =
    { buttons : Dict.Dict Int Button
    }

init : () -> ( Model, Cmd Msg.Msg )
init flags =
    let
        model_ = 
            { buttons = Dict.fromList 
                [ (0, defaultButton)
                , (1, defaultButton)
                ]
            }
        cmd_ = Cmd.none
    in
    ( model_, cmd_ )


---- UPDATE ----


update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.NoOp ->
            ( model, Cmd.none )
        Msg.MouseEnteredButton id ->
            let
                model_ =
                    { model 
                        | buttons = Dict.update id (Maybe.map (updateMouseOver True)) model.buttons
                    }
            in (model_, Cmd.none)
        Msg.MouseLeftButton id ->
            let
                model_ =
                    { model 
                        | buttons = Dict.update id (Maybe.map (updateMouseOver False)) model.buttons
                    }
            in (model_, Cmd.none)
        Msg.ButtonPressed btnType ->
            case btnType of
                Msg.Refinance ->
                    (model, Cmd.none)
                Msg.Purchase ->
                    (model, Cmd.none)


---- VIEW ----


view : Model -> Browser.Document Msg.Msg
view model =
    View.Home.view "hey" model



---- PROGRAM ----


main : Program () Model Msg.Msg
main =
    Browser.document
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
