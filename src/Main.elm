module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)
import View.Home


---- MODEL ----


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init flags =
    let
        model_ = {}
        cmd_ = Cmd.none
    in
    ( model_, cmd_ )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    View.Home.view "hey" model



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.document
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
