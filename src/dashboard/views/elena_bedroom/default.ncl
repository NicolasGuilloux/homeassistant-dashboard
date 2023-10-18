let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

roomView
  areas.elena_bedroom
  {
    cards = [
      {
        type = '"custom:button-card",
        name = "Chauffage",
        template = "card_thermostat",
        entity = "climate.elena_bedroom",
        variables = {
          ulm_card_thermostat_name = "Chauffage",
          ulm_card_thermostat_icon = "mdi:radiator",
          ulm_card_thermostat_enable_collapse = true,
          ulm_card_thermostat_enable_controls = true,
          ulm_card_thermostat_enable_popup = true,
          ulm_card_thermostat_enable_background_color = true,
        },
      },
      {
        type = '"picture-entity",
        entity = "camera.g3_instant_high",
        camera_view = "live",
        camera_image = "camera.g3_instant_high",
        tap_action.action = "more-info",
        show_state = false,
        show_name = false,
      },
    ],
  }
