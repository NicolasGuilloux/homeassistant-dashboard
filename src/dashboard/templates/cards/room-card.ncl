let Area = import "../../../../lib/types/area.ncl" in

fun input =>
  let config = input | Area in
  let entities_button =
    [
      {
        entity_id = config.light_entity,
        templates = ["yellow_on"],
        tap_action.action = "toggle",
      },
      {
        entity_id = config.speaker_entity,
        templates = ["blue_on"],
        tap_action.action = "more-info",
      },
      {
        entity_id = config.television_entity,
        templates = ["red_on"],
        tap_action.action = "more-info",
      },
    ]
    |> std.array.filter (fun x => x.entity_id != null)
  in
  {
    type = '"custom:button-card",
    name = config.name,
    icon = config.icon,
    template = [
      "card_room",
      config.color ++ "_on",
    ],
    entity =
      if config.light_entity != null then
        config.light_entity
      else if config.temperature_entity != null then
        config.temperature_entity
      else
        null,
    tap_action =
      if config.url != null then
        {
          action = "navigate",
          navigation_path = config.url,
        }
      else
        { action = "none" },
    variables =
      (std.array.length entities_button)
      |> std.array.generate
        (
          fun index =>
            let element = std.array.at index entities_button in
            {
              field = "entity_" ++ std.string.from_number (index + 1),
              value = element,
            }
        )
      |> std.record.from_array
      |> std.record.insert "label_use_brightness" (config.light_entity != null)
      |> std.record.insert
        "label_use_temperature"
        (
          config.light_entity == null
          && config.temperature_entity != null
        ),
  }
