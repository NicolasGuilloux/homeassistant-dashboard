let roomChips = import "../../templates/chips/room-chips.ncl" in

let appendIfHas | forall a. String -> Dyn -> a -> Array a -> Array a = fun field config element list =>
    if std.record.has_field field config then
      std.array.append element list
    else
      list
  in

let computerStats = fun config =>
  {
    type = '"grid",
    columns = 2,
    square = false,
    cards =
      []
      |> appendIfHas
        "cpu_entity"
        config
        {
          type = '"custom:button-card",
          template = "custom_card_bar_card",
          variables = {
            ulm_custom_card_bar_card_entity = config.cpu_entity,
            ulm_custom_card_bar_card_name = "CPU",
            ulm_custom_card_bar_card_color = "var(--google-blue)",
          },
        }
      |> appendIfHas
        "ram_entity"
        config
        {
          type = '"custom:button-card",
          template = "custom_card_bar_card",
          variables = {
            ulm_custom_card_bar_card_entity = config.ram_entity,
            ulm_custom_card_bar_card_name = "RAM",
            ulm_custom_card_bar_card_color = "var(--google-green)",
            ulm_custom_card_bar_card_max = config.max_ram,
          },
        }
      |> appendIfHas
        "temp_entity"
        config
        {
          type = '"custom:button-card",
          template = "custom_card_bar_card",
          variables = {
            ulm_custom_card_bar_card_entity = config.temp_entity,
            ulm_custom_card_bar_card_name = "Température",
            ulm_custom_card_bar_card_color = "var(--google-red)",
          },
        }
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
    { type = '"custom:mushroom-title-card", title = "Mewenn" },
    computerStats
      {
        cpu_entity = "sensor.novermewenn_cpu",
        ram_entity = "sensor.novermewenn_ram",
        temp_entity = "sensor.novermewenn_temp",
        max_ram = 32000,
      },
    { type = '"custom:mushroom-title-card", title = "Noan" },
    computerStats
      {
        cpu_entity = "sensor.novernoan_cpu",
        ram_entity = "sensor.novernoan_ram",
        max_ram = 1800,
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
