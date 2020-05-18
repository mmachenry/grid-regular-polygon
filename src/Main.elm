module Main exposing (main)

import Browser
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (disabled)

type Msg =
      IncSides
    | DecSides
    | IncRadius
    | DecRadius

type alias Model = {
    sides : Int,
    radius : Int
    }

type alias Flags = {}

main = Browser.document {
    init = init,
    view = view,
    update = update,
    subscriptions = \_ -> Sub.none
    }

init : Flags -> (Model, Cmd Msg)
init flags = ({
    sides = 3,
    radius = 1
    }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    IncSides -> ({model | sides = model.sides + 1}, Cmd.none)
    DecSides -> ({model | sides = model.sides - 1}, Cmd.none)
    IncRadius -> ({model | radius = model.radius + 1}, Cmd.none)
    DecRadius -> ({model | radius = model.radius - 1}, Cmd.none)

view : Model -> Browser.Document Msg
view model = {
    title = "Grid Regular Polygon",
    body = [
        button [ onClick DecSides, disabled (model.sides <= 3) ] [ text "-" ],
        div [] [ text (String.fromInt model.sides) ],
        button [ onClick IncSides ] [ text "+" ],
        button [ onClick DecRadius, disabled (model.radius <= 1) ] [ text "-" ],
        div [] [ text (String.fromInt model.radius) ],
        button [ onClick IncRadius ] [ text "+" ]
        ]
    }
