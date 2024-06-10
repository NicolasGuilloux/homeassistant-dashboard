let peopleCard = import "../../templates/cards/person-card.ncl" in

{
  type = '"vertical-stack",
  cards = [
    {
      type = '"custom:auto-entities",
      show_empty = false,
      card_param = "chips",
      sort.method = "last_changed",
      card = {
        type = '"custom:mushroom-chips-card",
        view_layout.grid_area = "main",
        alignment = "center",
      },
      filter.include = [
        {
          domain = "person",
          attributes.is_guest = true,
          state = "home",
          options = {
            type = "entity",
            use_entity_picture = true,
            content_info = "none",
            tap_action.action = "more-info",
          },
        },
      ],
    },
    {
      type = '"grid",
      columns = 2,
      square = false,
      cards = [
        peopleCard
          {
            name = "Nico",
            entity = "person.nicolas_guilloux",
            driving_entity = "binary_sensor.nicolas_driving",
            battery_entity = "sensor.nover_phone_battery_level",
            battery_state_entity = "sensor.nover_phone_battery_state",
            area_entity = "sensor.noverphone_bluetooth_tracker_area",
          },
        peopleCard
          {
            name = "Lolo",
            entity = "person.laurianne_thomann",
            driving_entity = "binary_sensor.laurianne_driving",
            battery_entity = "sensor.iphone_de_laurianne_battery_level",
            battery_state_entity = "sensor.iphone_de_laurianne_battery_state",
            area_entity = "sensor.laurianne_phone_bluetooth_tracker_area",
          },
        peopleCard
          {
            name = "Eléna",
            entity = "person.elena_guilloux",
          },
      ],
    },
  ]
}
