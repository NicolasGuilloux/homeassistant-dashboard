let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

roomView
  areas.office
  {
    cards = [
      {
        type = '"custom:mushroom-light-card",
        entity = "light.aqara_wall_switch_a",
        name = "Plafonier"
      },
      #       {
      #         type = '"custom:button-card",
      #         name = "Chauffage",
      #         template = "card_thermostat",
      #         entity = "climate.aqara_tvr_e1_thermostat",
      #         variables = {
      #           ulm_card_thermostat_name = "Chauffage",
      #           ulm_card_thermostat_icon = "mdi:radiator",
      #           ulm_card_thermostat_enable_collapse = false,
      #           ulm_card_thermostat_enable_controls = false,
      #           ulm_card_thermostat_enable_popup = true,
      #           ulm_card_thermostat_enable_background_color = true,
      #         },
      #       },
      {
        type = '"custom:mushroom-entity-card",
        entity = "switch.windows_vm",
        icon_color = "cyan",
        name = "Windows VM",
      },
      {
        type = '"custom:button-card",
        entity = "camera.office_high_resolution_channel",
        template = "custom_card_camera",
        show_icon = false,
        variables = {
          ulm_custom_card_camera_title = false,
          ulm_custom_card_camera_aspect_ratio = "16:9",
        },
      }
    ],
  }
