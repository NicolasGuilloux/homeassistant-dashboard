let roomChips = import "../../templates/chips/room-chips.ncl" in

let lightCard = fun config =>
  {
    type = '"custom:mushroom-light-card",
    entity = config.entity,
    name = config.name,
    use_light_color = true,
    show_brightness_control = std.record.has_field "has_brightness" config && config.has_brightness,
    secondary_info = "none",
    layout = "vertical",
    collapsible_controls = true,
  }
in

let areaBlock = fun config =>
  [
    { type = '"custom:mushroom-title-card", title = config.title },
    {
      type = '"grid",
      square = false,
      columns = 2,
      cards = std.array.map lightCard config.lights,
    },
  ]
in

{
  title = "Lumières",
  path = "lumieres",
  type = '"custom:vertical-layout",
  subview = true,
  cards =
    [
      {
        title = "Salon",
        lights = [
          {
            name = "Luminaire avant",
            entity = "light.luminaire_a",
            has_brightness = true,
          },
          {
            name = "Luminaire arrière",
            entity = "light.luminaire_b",
            has_brightness = true,
          },
          {
            name = "Lampe sur pied",
            entity = "light.lightbulb_e",
            has_brightness = true,
          },
        ],
      },
      {
        title = "Cuisine",
        lights = [
          {
            name = "Plafonier",
            entity = "light.ceiling_lamp_kitchen",
          },
        ],
      },
      {
        title = "Entrée",
        lights = [
          {
            name = "Plafonier",
            entity = "light.entrance_ceiling_lamp_1",
          },
        ],
      },
      {
        title = "Palier",
        lights = [
          {
            name = "Plafoniers",
            entity = "light.palier",
          },
        ],
      },
      {
        title = "Extérieur",
        lights = [
          {
            name = "Terrasse",
            entity = "light.ceilling_lamp_outdoor",
          },
        ],
      },
      {
        title = "Chambre",
        lights = [
          {
            name = "Plafonier Nico",
            entity = "light.hue_lightbulb_c",
          },
          {
            name = "Plafonier Lolo",
            entity = "light.hue_lightbulb_d",
          },
        ],
      },
      {
        title = "Bureau",
        lights = [
          {
            name = "Plafonier",
            entity = "light.office_ceiling_lamp",
          },
        ],
      },
    ]
    |> std.array.map areaBlock
    |> std.array.flatten
    |> std.array.prepend (roomChips {}),
}
