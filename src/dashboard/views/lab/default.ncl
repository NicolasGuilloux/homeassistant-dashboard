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

let inkCard = fun config =>
  {
    type = '"custom:mushroom-entity-card",
    entity = config.entity,
    layout = "vertical",
    icon_color = config.color,
    primary_info = "none",
  }
in

{
  title = "Lab",
  path = "lab",
  type = '"custom:vertical-layout",
  subview = true,
  cards = [
    roomChips {},
    {
      type = '"custom:auto-entities",
      show_empty = false,
      card = {
        show_name = true,
        show_icon = true,
        show_state = false,
        type = "glance",
        title = "Plex",
      },
      filter.include = [
        {
          integration = "tautulli",
          domain = "sensor",
          entity_id = "*_etat",
        }
      ],
      filter.exclude = [
        {
          state = "unknown",
        }
      ],
    },
    { type = '"custom:mushroom-title-card", title = "Annoncer" },
    {
      type = '"custom:vertical-stack-in-card",
      style = m%"
          ha-card {
            padding-top: 1em;
            padding-bottom: 1em;
          }
        "%,
      cards = [
        {
          type = '"tile",
          name = "Annoncer",
          entity = "input_select.announcing_area",
          hide_state = true,
          features = [
            { type = "select-options" },
          ]
        },
        {
          type = "custom:notify-card",
          target = "script.texttospeech",
          label = "Votre message",
          card_title = "",
        },
      ],
    },
    { type = '"custom:mushroom-title-card", title = "Vault" },
    {
      type = '"grid",
      square = false,
      cards = [
        {
          type = '"tile",
          name = "Mode Tortue",
          entity = "switch.transmission_mode_tortue",
          color = "teal",
          vertical = true,
        },
        {
          type = '"tile",
          name = "Actifs",
          entity = "sensor.transmission_torrents_actifs",
          color = "light-blue",
          vertical = true,
        },
        {
          type = '"tile",
          name = "Terminés",
          entity = "sensor.transmission_torrents_termines",
          color = "light-green",
          vertical = true,
        },
      ],
    },
    { type = '"custom:mushroom-title-card", title = "Mewenn" },
    {
      type = '"grid",
      columns = 1,
      square = false,
      cards = [
        graphCard { name = "CPU", entity = "sensor.novermewenn_cpu", color = "var(--google-blue)" },
        graphCard { name = "RAM", entity = "sensor.novermewenn_ram", color = "var(--google-green)" },
        graphCard { name = "Température", entity = "sensor.novermewenn_temp", color = "var(--google-red)" },
      ]
    },
    { type = '"custom:mushroom-title-card", title = "Imprimante" },
    {
      type = '"custom:mushroom-entity-card",
      entity = "sensor.canon_mg5700_series",
      secondary_info = "last-changed",
    },
    {
      type = '"grid",
      square = true,
      columns = 5,
      cards =
        [
          { color = "grey", entity = "sensor.canon_mg5700_series_black_pgbk" },
          { color = "cyan", entity = "sensor.canon_mg5700_series_cyan" },
          { color = "purple", entity = "sensor.canon_mg5700_series_magenta" },
          { color = "yellow", entity = "sensor.canon_mg5700_series_yellow" },
          { color = "black", entity = "sensor.canon_mg5700_series_black_bk" },
        ]
        |> std.array.map inkCard
    }
  ],
}
