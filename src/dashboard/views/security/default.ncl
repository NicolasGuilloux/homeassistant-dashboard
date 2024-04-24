let roomChips = import "../../templates/chips/room-chips.ncl" in

{
  title = "Sécurité",
  path = "securite",
  type = '"custom:vertical-layout",
  subview = true,
  cards = [
    roomChips {},
    {
      type = '"custom:button-card",
      entity = "camera.livingroom_high_resolution_channel",
      template = "custom_card_camera",
      show_icon = false,
      variables = {
        ulm_custom_card_camera_title = true,
        ulm_custom_card_camera_aspect_ratio = "16:9",
        ulm_custom_card_camera_label = "Salon",
      },
    },
    {
      type = '"custom:button-card",
      entity = "camera.bedroom_elena_high_resolution_channel",
      template = "custom_card_camera",
      show_icon = false,
      variables = {
        ulm_custom_card_camera_title = true,
        ulm_custom_card_camera_aspect_ratio = "16:9",
        ulm_custom_card_camera_label = "Chambre d'Eléna",
      },
    },
    {
      type = '"custom:button-card",
      entity = "camera.office_high_resolution_channel",
      template = "custom_card_camera",
      show_icon = false,
      variables = {
        ulm_custom_card_camera_title = true,
        ulm_custom_card_camera_aspect_ratio = "16:9",
        ulm_custom_card_camera_label = "Bureau",
      },
    }
  ],
}
