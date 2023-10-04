let Card = import "../../types/card.ncl" in

let Config = {
  entity
    | String
    | doc "This is your battery entity",
  name
    | String
    | doc "Set custom Name"
    | optional,
  icon
    | String
    | doc "Set custom icon"
    | optional,
  consumption_sensor
    | String
    | doc "If you set this sensor, the power-outlet-card shows the energy consumption next to the state."
    | optional,
  color
    | String
    | doc "Set Custom Color"
    | default
    = "yellow",
  force_background_color
    | Bool
    | doc "Set the color as background color in active state `"
    | default
    = false,
}
in

let f : { _ : _ } -> Card = fun input =>
    let config = input | Config in
    let addIfExist : String -> String -> { _ : _ } -> { _ : _ } = fun configKey variableKey variables =>
        if std.record.has_field configKey input then
          std.record.insert variableKey input."%{configKey}" variables
        else
          variables
      in
    {
      type = '"custom:button-card",
      template = "card_power_outlet",
      entity = config.entity,
      variables =
        {}
        |> addIfExist "name" "ulm_card_power_outlet_name"
        |> addIfExist "icon" "ulm_card_power_outlet_icon"
        |> addIfExist "consumption_sensor" "ulm_card_power_outlet_consumption_sensor"
        |> addIfExist "color" "ulm_card_power_outlet_color"
        |> addIfExist "force_background_color" "ulm_card_power_outlet_force_background_color"
    } | Card
  in f
