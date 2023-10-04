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
{
  type = '"horizontal-stack",
  cards = [
    peopleCard
      {
        name = "Nicolas",
        entity = "person.nicolas_guilloux",
        driving_entity = "binary_sensor.nicolas_driving",
        phone_base_entity = "sensor.nover_phone",
      },
    peopleCard
      {
        name = "Laurianne",
        entity = "person.laurianne_thomann",
        driving_entity = "binary_sensor.laurianne_driving",
        phone_base_entity = "sensor.iphone_de_laurianne",
      },
  ]
}
