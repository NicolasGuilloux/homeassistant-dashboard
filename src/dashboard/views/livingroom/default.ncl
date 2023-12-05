let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

let gridCard = import "../../../../lib/cards/builtins/grid-card.ncl" in

roomView
  areas.livingroom
  {
    chips = [
      {
        type = '"entity",
        content_info = "none",
        icon_color = "light-green",
        tap_action = {
          action = "call-service",
          service = "scene.turn_on",
          target.service_id = "schene.mode_cinema",
        }
      },
    ],
    cards = [
      gridCard
        {
          cards = [
            {
              type = '"tile",
              entity = "light.luminaire_a",
              name = "Luminaire Avant",
            },
            {
              type = '"tile",
              entity = "light.luminaire_b",
              name = "Luminaire Arrière",
            },
            {
              type = '"tile",
              entity = "light.lightbulb_e",
              name = "Lampe à pied",
            },
            {
              type = '"tile",
              entity = "light.tuya_smart_plug_orange_commutateur",
              name = "Sapin de Noël",
              color = "green",
            },
          ],
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
    ],
  }
