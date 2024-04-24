let Config = {
  temperature_entity
    | String
    | optional,
  humidity_entity
    | String
    | optional,
  extraChips
    | Array Dyn
    | default
    = [],
}
in

fun input =>
  let config = input | Config in
  let appendIfHas = fun field element list =>
    if std.record.has_field field config then
      std.array.append element list
    else
      list
  in
  {
    type = '"custom:mushroom-chips-card",
    alignment = "center",
    chips =
      std.array.concat
        (
          [{ type = "back" }]
          |> appendIfHas
            "temperature_entity"
            {
              type = '"entity",
              icon_color = "red",
              entity = config.temperature_entity,
            }
          |> appendIfHas
            "humidity_entity"
            {
              type = '"entity",
              icon_color = "cyan",
              entity = config.humidity_entity,
            }
        )
        config.extraChips,
  }
