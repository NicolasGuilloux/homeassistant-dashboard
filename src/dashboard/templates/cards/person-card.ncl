let Card = import "../../../../lib/types/card.ncl" in

let Config = {
  name | String,
  entity | String,
  driving_entity
    | String
    | default
    = "",
  battery_entity
    | String
    | default
    = "",
  battery_state_entity
    | String
    | default
    = "",
  area_entity
    | String
    | default
    = "",
}
in

fun input =>
  let config = input | Config in
  {
    type = '"custom:button-card",
    template = "card_person_info_extra",
    name = config.name,
    variables = {
      ulm_card_person_entity = config.entity,
      ulm_card_person_use_entity_picture = true,
      ulm_multiline = false,
      ulm_card_person_driving_entity = config.driving_entity,
      ulm_card_person_battery_entity = config.battery_entity,
      ulm_card_person_battery_state_entity = config.battery_state_entity,
      ulm_card_person_area_entity = config.area_entity,
    },
  } | Card
