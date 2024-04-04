let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

let gridCard = import "../../../../lib/cards/builtins/grid-card.ncl" in

roomView
  areas.livingroom
  {
    chips = [
      {
        type = '"entity",
        entity = "scene.mode_cinema",
        content_info = "none",
        icon = "mdi:movie-filter",
        icon_color = "light-green",
        tap_action = {
          action = "call-service",
          service = "scene.turn_on",
          target.entity_id = "scene.mode_cinema",
        }
      },
      {
        type = '"entity",
        entity = "switch.livingroom_privacy_mode",
        content_info = "none",
        icon = "mdi:eye-off",
        icon_color = "light-blue",
        tap_action.action = "toggle",
      },
      {
        type = '"entity",
        entity = "sensor.iphone_de_laurianne_distance",
      },
    ],
    cards = [
      gridCard
        {
          cards = [
            # {
            #   type = '"tile",
            #   entity = "light.luminaire_a",
            #   name = "Luminaire Avant",
            # },
            {
              type = '"tile",
              entity = "light.livingroom_ceiling_lights_a",
              name = "Luminaire Arrière",
            },
            {
              type = '"tile",
              entity = "light.ikea_lightbulb_e",
              name = "Lampe à pied",
            },
          ],
        },
      {
        type = '"custom:button-card",
        template = ["card_media_player"],
        entity = "media_player.sonos_beam",
        variables = {
          ulm_card_media_player_enable_art = true,
          ulm_card_media_player_enable_controls = true,
          ulm_card_media_player_enable_volume_slider = true,
          ulm_card_media_player_collapsible = true,
          ulm_card_media_player_enable_popup = false,
          ulm_card_media_player_more_info = true,
          ulm_card_media_player_power_button = false,
        },
      },
      {
        type = '"custom:button-card",
        template = ["card_media_player"],
        entity = "media_player.tcl_television",
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
      {
        type = '"custom:button-card",
        entity = "camera.livingroom_high",
        template = "custom_card_camera",
        show_icon = false,
        variables = {
          ulm_custom_card_camera_title = false,
          ulm_custom_card_camera_aspect_ratio = "16:9",
        },
      }
    ],
  }
