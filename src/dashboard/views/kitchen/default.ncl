let roomView = import "../../templates/views/room-view.ncl" in

let areas = import "../../data/areas.ncl" in

roomView
  areas.kitchen
  {
    chips = [
      {
        type = '"entity",
        entity = "input_boolean.kitchen_motion_light",
        icon_color = "cyan",
        content_info = "none",
        tap_action.action = "toggle",
      }
    ],
    cards = [
      {
        type = '"tile",
        entity = "light.kitchen_ceiling_lights",
        name = "Plafonier",
      },
      {
        type = '"custom:mushroom-template-card",
        entity = "switch.ikea_outlet_b",
        primary = "Yaourtière",
        icon = "mdi:pot-mix-outline",
        badge_color = "green",
        primary_info = "name",
        secondary_info = "none",
        tap_action.action = "more-info",
        hold_action.action = "more-info",
        icon_color = m%"
          {% if is_state('timer.yaourt_maker_countdown','active') %}
            cyan
          {% endif %}
        "%,
        secondary = m%"
          {% if is_state('timer.yaourt_maker_countdown','active') %}
            {% set finish_timestamp = as_datetime(state_attr('timer.yaourt_maker_countdown','finishes_at')) %}
            {% set current_timestamp = now() %}
            {% set remaining_in_seconds = (finish_timestamp - current_timestamp).seconds %}
            {{ timedelta(seconds = remaining_in_seconds) }}
          {% else %}
            Désactivé
          {% endif %}
        "%,
        badge_icon = m%"
          {% if is_state('timer.yaourt_maker_countdown','active') %}
            mdi:timer-outline
          {% endif %}
        "%,
      },
    ],
  }
