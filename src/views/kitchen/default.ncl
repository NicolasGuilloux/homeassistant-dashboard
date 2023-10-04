let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

roomView
  areas.kitchen
  {
    chips = [
      {
        type = '"entity",
        entity = "input_boolean.motion_light_kitchen",
        icon_color = "cyan",
        content_info = "none",
        tap_action.action = "toggle",
      }
    ],
    cards = [
      {
        type = '"tile",
        entity = "light.ceiling_lamp_kitchen",
        name = "Plafonier",
      },
      {
        type = '"tile",
        entity = "switch.outlet_b",
        name = "Yaourtière",
        icon = "mdi:pot-mix-outline",
        color = "cyan",
        tap_action.action = "more-info",
        hold_action.action = "more-info",
      },
    ],
  }
