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
          # {
          #   name = "Luminaire avant",
          #   entity = "light.luminaire_a",
          #   has_brightness = true,
          # },
          {
            name = "Luminaire arrière",
            entity = "light.livingroom_ceiling_lights_a",
            has_brightness = true,
          },
          {
            name = "Lampe sur pied",
            entity = "light.ikea_lightbulb_e",
            has_brightness = true,
          },
        ],
      },
      {
        title = "Cuisine",
        lights = [
          {
            name = "Plafonier",
            entity = "light.kitchen_ceiling_lights",
          },
        ],
      },
      {
        title = "Entrée",
        lights = [
          {
            name = "Plafonier",
            entity = "light.entrance_lights",
          },
        ],
      },
      {
        title = "Palier",
        lights = [
          {
            name = "Plafoniers",
            entity = "light.landingfirstfloor",
          },
        ],
      },
      {
        title = "Extérieur",
        lights = [
          {
            name = "Terrasse",
            entity = "light.pergola",
          },
        ],
      },
      {
        title = "Chambre",
        lights = [
          {
            name = "Plafonier Nico",
            entity = "light.philips_lightbulb_d",
          },
          {
            name = "Plafonier Lolo",
            entity = "light.philips_lightbulb_c",
          },
        ],
      },
      {
        title = "Bureau",
        lights = [
          {
            name = "Plafonier",
            entity = "light.aqara_wall_switch_a",
          },
        ],
      },
    ]
    |> std.array.map areaBlock
    |> std.array.flatten
    |> std.array.prepend (roomChips {}),
}
