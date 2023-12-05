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
        type = '"custom:button-card",
        entity = "camera.g3_instant_high",
        template = "custom_card_camera",
        show_icon = false,
        variables = {
          ulm_custom_card_camera_title = false,
          ulm_custom_card_camera_aspect_ratio = "16:9",
        },
      }
    ],
  }
