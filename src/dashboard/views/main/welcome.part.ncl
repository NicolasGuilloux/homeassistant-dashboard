let catChip = import "../../templates/chips/cat-chip.ncl" in
let titleCard = import "../../../../lib/cards/minimalist/title-card.ncl" in

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
  type = '"vertical-stack",
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
        {
          type = '"entity",
          entity = "sensor.instant_power_usage",
        },
        {
          type = '"template",
          icon = "mdi:account-tie-voice",
          tap_action.action = "assist",
        }
      ],
    },
    {
      type = '"custom:mushroom-chips-card",
      alignment = "center",
      chips = [
        (catChip "binary_sensor.pet_alf"),
        (catChip "binary_sensor.pet_arwen"),
        (catChip "binary_sensor.pet_albus"),
      ],
    },
    titleCard "",
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
    titleCard "",
    # {
    #   type = '"custom:mushroom-title-card",
    #   alignment = "center",
    #   secondary = "",
    #   title = m%"
    #     {% set time = now().hour %}
    #     {% if (time >= 18) %}
    #       Bonsoir, {{user}} !
    #     {% elif (time >= 12) %}
    #       Bon après-midi, {{user}} !
    #     {% elif (time >= 5) %}
    #       Bonne matinée, {{user}} !
    #     {% else %}
    #       Bonjour, {{user}} !
    #     {% endif %}
    #   "%
    # },
  ]
}
