let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

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
      {
        type = '"tile",
        entity = "light.livingroom",
        features = [
          { type = '"light-brightness" },
        ],
      },
      {
        type = '"custom:button-card",
        template = ["card_media_player"],
        entity = "media_player.tcl_television",
        variables.ulm_card_media_player_enable_popup = true,
      },
    ],
  }
