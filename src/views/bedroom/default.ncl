# Imports
let roomView = import "../../templates/views/room-view.ncl" in
let gridCard = import "../../../lib/cards/builtins/grid-card.ncl" in
let powerOutletCard = import "../../../lib/cards/minimalist/power-outlet-card.ncl" in
let areas = import "../../data/areas.ncl" in

roomView
  areas.bedroom
  {
    cards = [
      gridCard
        {
          cards = [
            {
              type = '"custom:mushroom-light-card",
              name = "Plafonier Nico",
              entity = "light.hue_lightbulb_c",
              use_light_color = true,
              show_brightness_control = true,
              secondary_info = "none",
              layout = "vertical",
              collapsible_controls = true,
            },
            {
              type = '"custom:mushroom-light-card",
              name = "Plafonier Lolo",
              entity = "light.hue_lightbulb_d",
              use_light_color = true,
              show_brightness_control = true,
              secondary_info = "none",
              layout = "vertical",
              collapsible_controls = true,
            },
          ],
        },
      gridCard
        {
          cards = [
            powerOutletCard
              {
                entity = "switch.tuya_smart_plug_orange_switch",
                name = "Ventilateur",
                icon = "mdi:fan",
                consumption_sensor = "sensor.tuya_smart_plug_orange_active_power",
                color = "purple",
                force_background_color = true,
              },
            powerOutletCard
              {
                entity = "switch.tuya_smart_plug_blue_switch",
                name = "Déshumidificateur",
                icon = "mdi:air-humidifier",
                consumption_sensor = "sensor.tuya_smart_plug_blue_active_power",
                color = "blue",
                force_background_color = true,
              },
          ],
        },
    ],
  }
