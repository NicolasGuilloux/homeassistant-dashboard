let catChip = import "../../templates/chips/cat-chip.ncl" in

let pageTile = fun config =>
  {
    type = '"custom:mushroom-template-card",
    primary = config.name,
    secondary = "",
    icon = config.icon,
    layout = "vertical",
    icon_color = config.color,
    tap_action = {
      action = "navigate",
      navigation_path =
        config.name
        |> std.string.lowercase
        |> std.string.replace_regex "[éèêë]" "e"
        |> std.string.replace_regex "[àâ]" "a"
        |> std.string.replace_regex "[ùû]" "u"
        |> std.string.replace_regex "[ïî]" "i"
        |> std.string.replace_regex "[\\s]" "_",
    },
  }
in
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
      type = '"custom:mushroom-chips-card",
      alignment = "center",
      chips = [
        {
          type = '"weather",
          entity = "weather.forecast_maison",
          show_conditions = false,
          show_temperature = true,
        },
      ],
    },
    {
      type = '"custom:mushroom-chips-card",
      alignment = "center",
      style = m%"
          ha-card {
            padding-top: 1em;
          }
        "%,
      chips = [
        (catChip "binary_sensor.pet_alf"),
        (catChip "binary_sensor.pet_arwen"),
        (catChip "binary_sensor.pet_albus"),
      ],
    },
    {
      type = '"custom:mushroom-title-card",
      alignment = "center",
      secondary = "",
      title = m%"
        {% set time = now().hour %}
        {% if (time >= 18) %}
          Bonsoir, {{user}} !
        {% elif (time >= 12) %}
          Bon après-midi, {{user}} !
        {% elif (time >= 5) %}
          Bonne matinée, {{user}} !
        {% else %}
          Bonjour, {{user}} !
        {% endif %}
      "%
    },
    {
      type = '"horizontal-stack",
      cards = [
        pageTile
          {
            name = "Lumières",
            icon = "mdi:lightbulb",
            color = "yellow",
          },
        pageTile
          {
            name = "Sécurité",
            icon = "mdi:shield",
            color = "green",
          },
        pageTile
          {
            name = "Lab",
            icon = "mdi:flask",
            color = "purple",
          },
        pageTile
          {
            name = "Réseau",
            icon = "mdi:network",
            color = "blue",
          },
      ],
    },
  ]
}
