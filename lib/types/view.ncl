let Card = import "./card.ncl" in

let Type = [|
  '"masonry",
  '"panel",
  '"sidebar",
  '"custom:vertical-layout",
  '"custom:horizontal-layout",
  '"custom:masonry-layout",
  '"custom:grid-layout",
|]
in

{
  title | String,
  path | String,
  type | Type,
  subview
    | Bool
    | default
    = false,
  cards | Array Card,
}
