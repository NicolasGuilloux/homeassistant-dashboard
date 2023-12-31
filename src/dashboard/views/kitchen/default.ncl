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
        type = '"custom:mushroom-template-card",
        entity = "switch.outlet_b",
        primary = "Yaourtière",
        icon = "mdi:pot-mix-outline",
        badge_color = "green",
        primary_info = "name",
        secondary_info = "none",
        tap_action.action = "toggle",
        hold_action.action = "more-info",
        icon_color = m%"
          {% if is_state('timer.yaourtiere','active') %}
            cyan
          {% endif %}
        "%,
        secondary = m%"
          {% if is_state('timer.yaourtiere','active') %}
            {% set finish_timestamp = as_datetime(state_attr('timer.yaourtiere','finishes_at')) %}
            {% set current_timestamp = now() %}
            {% set remaining_in_seconds = (finish_timestamp - current_timestamp).seconds %}
            {{ timedelta(seconds = remaining_in_seconds) }}
          {% else %}
            Désactivé
          {% endif %}
        "%,
        badge_icon = m%"
          {% if is_state('timer.yaourtiere','active') %}
            mdi:timer-outline
          {% endif %}
        "%,
      },
    ],
  }
