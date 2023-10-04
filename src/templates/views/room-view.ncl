let Config = {
  chips
    | Array Dyn
    | default
    = [],
  cards
    | Array Dyn
    | default
    = [],
}
in

fun mArea mConfig =>
  let area = mArea | (import "../../../lib/types/area.ncl") in
  let config = mConfig | Config in

  let appendIfHas | forall a. String -> a -> Array a -> Array a = fun field element list =>
      if std.record.has_field field area then
        std.array.append element list
      else
        list
    in
  {
    title = area.name,
    path = area.url,
    type = '"custom:vertical-layout",
    subview = true,
    cards =
      config.cards
      |> std.array.prepend
        {
          type = '"custom:mushroom-chips-card",
          alignment = "center",
          chips =
            std.array.concat
              (
                [{ type = '"back" }]
                |> appendIfHas
                  "temperature_entity"
                  {
                    type = '"entity",
                    icon_color = "red",
                    entity = area.temperature_entity,
                  }
                |> appendIfHas
                  "humidity_entity"
                  {
                    type = '"entity",
                    icon_color = "cyan",
                    entity = area.humidity_entity,
                  }
              )
              config.chips,
        }
  }
