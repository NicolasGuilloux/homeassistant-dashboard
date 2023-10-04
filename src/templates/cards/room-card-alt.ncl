let Area = import "../../../lib/types/area.ncl" in

fun input =>
  let config = input | Area in
  {
    type = '"grid",
    column = 2,
    cards = [
      {
        type = "custom:mushroom-entity-card",
        name = config.name,
        entity =
          if config.light_entity != null then
            config.light_entity
          else
            config.temperature_entity,
        layout = "vertical",
        secondary_info = "none",
      },
      {
        type = "custom:mushroom-chips-card",
        alignment = "center",
        chips =
          std.array.filter
            (fun x => x.entity != null)
            [
              {
                type = "entity",
                entity = config.temperature_entity,
                icon_color = "red",
              },
              {
                type = "entity",
                entity = config.humidity_entity,
                icon_color = "blue",
              },
            ]
      }
    ],
  }
