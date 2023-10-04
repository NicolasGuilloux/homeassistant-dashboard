let Card = import "../../types/card.ncl" in

let Config = {
  entity
    | String
    | doc "This is your battery entity",
  battery_name
    | String
    | doc "Customize name"
    | optional,
  battery_attribute
    | String
    | doc "If your entity provides the battery percent in an attribute (= not as an own sensor), fill in the attribute's name here. E.g. if you have sensor.livingroom_thermometer and the attribute for your battery power is sensor.livingroom_thermometer.attributes.battery_percent, you fill in battery_percent here."
    | optional,
  battery_state_entity
    | String
    | doc "Entity that holds the battery state (charging/discharging). If provided, the Icon will display the current status."
    | optional,
  charger_type_entity
    | String
    | doc "Entity that holds the charger type (ac/wireless/none). This Entity replaces the need for the ulm_card_battery_battery_state_entity_id entity. If provided, the Icon will display the current charger type. This is only useful if you charge your devices Wireless and with cable."
    | optional,
  charging_animation
    | Bool
    | doc "Weather to show charging animation or not. If set to true, ulm_card_battery_battery_state_entity_id needs to be defined and ulm_card_battery_charger_type_entity_id will be ignored."
    | default
    = false,
  battery_level_danger
    | String
    | doc "Changes the color of the Icon, if the battery level falls below the provided value. Must be higher than ulm_card_battery_battery_level_waring"
    | default
    = 10,
  battery_level_warning
    | String
    | doc "Changes the color of the Icon, if the battery level falls below the provided value."
    | default
    = 20,
  color_danger
    | String
    | doc "Color of icon if battery level is within the 'danger' zone."
    | default
    = "var(--google-red)",
  color_warning
    | String
    | doc "Color of icon if battery level is within the 'warning' zone."
    | default
    = "var(--google-yellow)",
  color_ok
    | String
    | doc "Color of icon if battery level is not within the 'danger' or 'warning' zone."
    | default
    = "var(--google-green)",
}
in

fun input =>
  let config = input | Config in
  {
    type = '"custom:button-card",
    template = "card_battery",
    entity = config.entity,
    variables = {
      ulm_card_battery_name = config.battery_name,
      ulm_card_battery_attribute = config.battery_attribute,
      ulm_card_battery_battery_state_entity_id = config.battery_state_entity,
      ulm_card_battery_charger_type_entity_id = config.charger_type_entity,
      ulm_card_battery_charging_animation = config.charging_animation,
      ulm_card_battery_battery_level_danger = config.battery_level_danger,
      ulm_card_battery_battery_level_waring = config.battery_level_warning,
      ulm_card_battery_color_battery_level_danger = config.color_danger,
      ulm_card_battery_color_battery_level_warning = config.color_warning,
      ulm_card_battery_color_battery_level_ok = config.color_ok,
    },
  } | Card
