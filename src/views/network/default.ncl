let roomChips = import "../../templates/chips/room-chips.ncl" in

let graphCard = fun config =>
  {
    type = '"custom:mini-graph-card",
    hours_to_show = 24,
    points_per_hour = 4,
    update_interval = 30,
    smoothing = false,
    animate = true,
    line_width = 2,
    name = config.name,
    entities = [
      { entity = config.entity, color = config.color },
    ],
    show = {
      name = true,
      icon = true,
      state = true,
      legend = false,
      fill = "fade",
    },
  }
in

{
  title = "Réseau",
  path = "reseau",
  type = '"custom:vertical-layout",
  subview = true,
  cards = [
    roomChips {},
    { type = '"custom:mushroom-title-card", title = "Invités" },
    {
      type = '"custom:auto-entities",
      card = {
        type = '"glance",
        columns = 3,
        show_name = true,
        show_icon = true,
        show_state = false,
        state_color = false,
      },
      filter.include = [
        {
          domain = "device_tracker",
          attributes.is_guest = true,
        },
      ],
    },
    { type = '"custom:mushroom-title-card", title = "Réseau" },
    graphCard { name = "Download", entity = "sensor.starlink_downlink_throughput", color = "teal" },
    graphCard { name = "Upload", entity = "sensor.starlink_uplink_throughput", color = "lime" },
    graphCard { name = "Ping", entity = "sensor.starlink_ping", color = "red" },
  ],
}
