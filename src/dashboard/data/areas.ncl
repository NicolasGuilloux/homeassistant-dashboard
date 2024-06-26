let Area = import "../../../lib/types/area.ncl" in

{
  livingroom = {
    id = "salon",
    name = "Salon",
    icon = "mdi:fireplace",
    color = "red",
    floor = 0,
    order = 1,
    light_entity = "light.livingroom",
    speaker_entity = "media_player.sonos_beam",
    television_entity = "media_player.tcl_television",
    temperature_entity = "sensor.xiaomi_mijia_a_temperature",
    humidity_entity = "sensor.xiaomi_mijia_a_humidity",
    url = "salon",
  },
  kitchen = {
    id = "cuisine",
    name = "Cuisine",
    icon = "mdi:knife",
    color = "blue",
    floor = 0,
    order = 2,
    light_entity = "light.kitchen_ceiling_lights",
    speaker_entity = "media_player.sonos_roam",
    temperature_entity = "sensor.xiaomi_mijia_d_temperature",
    humidity_entity = "sensor.xiaomi_mijia_d_humidity",
    url = "cuisine",
  },
  entrance = {
    id = "entree",
    name = "Entrée",
    icon = "mdi:door",
    color = "yellow",
    floor = 0,
    order = 3,
    light_entity = "light.entrance_lights",
    temperature_entity = "sensor.xiaomi_mijia_i_temperature",
    humidity_entity = "sensor.xiaomi_mijia_i_humidity",
  },
  garden = {
    id = "jardin",
    name = "Pergola",
    icon = "mdi:flower-tulip",
    color = "green",
    floor = 0,
    order = 4,
    light_entity = "light.pergola",
  },
  toilet = {
    id = "toilettes",
    name = "Toilettes",
    icon = "mdi:toilet",
    color = "grey",
    floor = 0,
    order = 5,
    light_entity = "light.aqara_wall_switch_c",
  },
  veranda = {
    id = "veranda",
    name = "Véranda",
    icon = "mdi:rabbit",
    color = "green",
    floor = 0,
    order = 6,
    light_entity = "light.veranda",
    temperature_entity = "sensor.xiaomi_mijia_j_temperature",
    humidity_entity = "sensor.xiaomi_mijia_j_humidity",
  },

  # First floor
  office = {
    id = "bureau",
    name = "Bureau",
    icon = "mdi:desk",
    color = "purple",
    floor = 1,
    order = 6,
    light_entity = "light.aqara_wall_switch_a",
    temperature_entity = "sensor.xiaomi_mijia_c_temperature",
    humidity_entity = "sensor.xiaomi_mijia_c_humidity",
    url = "bureau",
  },
  landing = {
    id = "palier",
    name = "Palier",
    icon = "mdi:ceiling-light-multiple",
    color = "yellow",
    floor = 1,
    order = 7,
    light_entity = "light.landingfirstfloor",
    temperature_entity = "sensor.xiaomi_mijia_h_temperature",
    humidity_entity = "sensor.xiaomi_mijia_h_humidity",
  },
  bedroom = {
    id = "chambre_a_coucher",
    name = "Chambre",
    icon = "mdi:bed-king",
    color = "blue",
    floor = 1,
    light_entity = "light.bedroom",
    television_entity = "media_player.televiseur_de_la_chambre_2",
    temperature_entity = "sensor.xiaomi_mijia_f_temperature",
    humidity_entity = "sensor.xiaomi_mijia_f_humidity",
    url = "bedroom",
  },
  elena_bedroom = {
    id = "chambre_d_elena",
    name = "Chambre d'Eléna",
    icon = "mdi:baby",
    floor = 1,
    temperature_entity = "sensor.xiaomi_mijia_b_temperature",
    humidity_entity = "sensor.xiaomi_mijia_b_humidity",
    url = "chambre-elena",
  },
  friends_bedroom = {
    id = "chambre_d_amis",
    name = "Chambre d'Amis",
    icon = "mdi:bed",
    floor = 1,
    light_entity = "light.aqara_wall_switch_b",
    temperature_entity = "sensor.xiaomi_mijia_e_temperature",
    humidity_entity = "sensor.xiaomi_mijia_e_humidity",
  },
} | { _ : Area }
