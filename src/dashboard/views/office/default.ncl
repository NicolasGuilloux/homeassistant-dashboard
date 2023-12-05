let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

roomView
  areas.office
  {
    cards = [
      {
        type = '"custom:mushroom-light-card",
        entity = "light.office_ceiling_lamp",
        name = "Plafonier"
      },
      {
        type = '"custom:button-card",
        name = "Chauffage",
        template = "card_thermostat",
        entity = "climate.aqara_tvr_e1_thermostat",
        variables = {
          ulm_card_thermostat_name = "Chauffage",
          ulm_card_thermostat_icon = "mdi:radiator",
          ulm_card_thermostat_enable_collapse = false,
          ulm_card_thermostat_enable_controls = false,
          ulm_card_thermostat_enable_popup = true,
          ulm_card_thermostat_enable_background_color = true,
        },
      },
      {
        type = '"custom:mushroom-entity-card",
        entity = "switch.windows_vm",
        icon_color = "cyan",
        name = "Windows VM",
      },
    ],
  }
