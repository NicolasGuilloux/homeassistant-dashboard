let Card = import "../../../lib/types/card.ncl" in

let f : String -> _ = fun entityName =>
    {
      type = '"template",
      icon = "mdi:cat",
      entity = entityName,
      picture = "{{ states." ++ entityName ++ ".attributes.entity_picture }}",
      tap_action = { action = "more-info" },
      double_tap_action = { action = "more-info" },
      hold_action = { action = "more-info" },
    } | Card
  in f
