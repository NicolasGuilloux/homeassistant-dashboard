# Imports
let roomView = import "../../templates/views/room-view.ncl" in
let gridCard = import "../../../../lib/cards/builtins/grid-card.ncl" in
let powerOutletCard = import "../../../../lib/cards/minimalist/power-outlet-card.ncl" in
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
              entity = "light.philips_lightbulb_d",
              use_light_color = true,
              show_brightness_control = true,
              secondary_info = "none",
              layout = "vertical",
              collapsible_controls = true,
            },
            {
              type = '"custom:mushroom-light-card",
              name = "Plafonier Lolo",
              entity = "light.philips_lightbulb_c",
              use_light_color = true,
              show_brightness_control = true,
              secondary_info = "none",
              layout = "vertical",
              collapsible_controls = true,
            },
          ],
        },
      {
        type = '"custom:button-card",
        template = ["card_media_player"],
        entity = "media_player.televiseur_de_la_chambre",
        variables = {
          ulm_card_media_player_enable_art = true,
          ulm_card_media_player_enable_controls = true,
          ulm_card_media_player_enable_volume_slider = true,
          ulm_card_media_player_collapsible = true,
          ulm_card_media_player_enable_popup = true,
          ulm_card_media_player_more_info = true,
          ulm_card_media_player_power_button = true,
        },
      },
      gridCard
        {
          cards = [
            # powerOutletCard
            # {
            # entity = "switch.tuya_smart_plug_orange_switch",
            # name = "Ventilateur",
            # icon = "mdi:fan",
            # consumption_sensor = "sensor.tuya_smart_plug_orange_active_power",
            # color = "purple",
            # force_background_color = true,
            # },
            powerOutletCard
              {
                entity = "switch.tuya_outlet_blue",
                name = "Déshumidificateur",
                icon = "mdi:air-humidifier",
                consumption_sensor = "sensor.tuya_outlet_blue_energy",
                color = "blue",
                force_background_color = true,
              },
          ],
        },
    ],
  }
