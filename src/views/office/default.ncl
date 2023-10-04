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
        type = '"custom:mushroom-entity-card",
        entity = "switch.windows_vm",
        icon_color = "cyan",
        name = "Windows VM",
      },
    ],
  }
