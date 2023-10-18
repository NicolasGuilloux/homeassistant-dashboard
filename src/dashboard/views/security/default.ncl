let roomChips = import "../../templates/chips/room-chips.ncl" in

{
  title = "Sécurité",
  path = "securite",
  type = '"custom:vertical-layout",
  subview = true,
  cards = [
    roomChips {},
    {
      type = '"picture-entity",
      entity = "camera.g3_instant_high",
      camera_view = "live",
      camera_image = "camera.g3_instant_high",
      tap_action.action = "more-info",
      show_state = false,
      show_name = false,
    },
  ],
}
