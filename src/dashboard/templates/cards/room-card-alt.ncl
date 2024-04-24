let Area = import "../../../../lib/types/area.ncl" in

fun input =>
  let config = input | Area in
  {
    type = '"custom:vertical-stack-in-card",
    cards = [
      {
        type = "custom:mushroom-template-card",
        name = config.name,
        entity = config.light_entity,
        icon = config.icon,
        icon_color = config.color,
        layout = "horizontal",
        secondary_info =
          if config.temperature_entity != null && config.humidity_entity != null then
            "{{ states('" ++ config.temperature_entity ++ "') }}°C | {{ states('" ++ confighumidity_entitytemperature_entity ++ "') }}%"
          else
            "",
        tap_action =
          if config.url != null then
            {
              action = "navigate",
              navigation_path = config.url,
            }
          else
            { action = "toggle" },
        double_tap_action.action = "toggle",
        hold_action.action = "toggle",
      },
      # {
      #   type = "custom:mushroom-chips-card",
      #   alignment = "center",
      #   chips =
      #     std.array.filter
      #       (fun x => x.entity != null)
      #       [
      #         {
      #           type = "entity",
      #           entity = config.temperature_entity,
      #           icon_color = "red",
      #         },
      #         {
      #           type = "entity",
      #           entity = config.humidity_entity,
      #           icon_color = "blue",
      #         },
      #       ]
      # }
    ],
  }
