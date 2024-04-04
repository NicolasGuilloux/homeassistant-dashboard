let peopleCard = fun config =>
  {
    type = '"custom:button-card",
    template = "card_person_info",
    name = config.name,
    variables = {
      ulm_card_person_entity = config.entity,
      ulm_card_person_use_entity_picture = true,
      ulm_multiline = false,
      ulm_card_person_driving_entity = config.driving_entity,
      ulm_card_person_battery_entity = config.phone_base_entity ++ "_battery_level",
      ulm_card_person_battery_state_entity = config.phone_base_entity ++ "_battery_state",
    },
  }
in
let locationInHouseCard = fun config =>
  {
    type = '"conditional",
    conditions = [
      {
        condition = "state",
        entity = config.entity_id,
        state_not = "not_home",
      }
    ],
    card = {
      type = '"custom:mushroom-template-card",
      icon = "",
      entity = config.entity_id,
      primary = "{{ states." ++ config.entity_id ++ ".state }} - {{ states." ++ config.entity_id ++ ".attributes.distance }}m",
      tap_action.action = "more-info",
    },
  }
in
{
  type = '"vertical-stack",
  cards = [
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
            phone_base_entity = "sensor.nover_phone",
          },
        peopleCard
          {
            name = "Lolo",
            entity = "person.laurianne_thomann",
            driving_entity = "binary_sensor.laurianne_driving",
            phone_base_entity = "sensor.iphone_de_laurianne",
          },
        locationInHouseCard
          {
            entity_id = "sensor.noverphone_ble_tracker",
          },
        locationInHouseCard
          {
            entity_id = "sensor.laurianne_phone_ble_tracker",
          },
      ],
    },
    {
      type = '"custom:auto-entities",
      show_empty = false,
      sort.method = "last_changed",
      card = {
        type = '"glance",
        show_name = true,
        show_icon = true,
        show_state = false,
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
  ]
}
