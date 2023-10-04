let View = import "./view.ncl" in

let KioskMode = {
  mobile_settings = {
    hide_header | Bool,
  }
}
in

let Theme = [|
  '"minimalist-desktop",
  '"minimalist-mobile",
  '"minimalist-mobile-tapbar",
  '"minimalist-ios-tapbar",
|]
in

{
  title | String,
  theme
    | Theme
    | optional,
  background
    | String
    | default
    = "var(--background-image)",
  kiosk_mode | KioskMode,
  views | Array View,
}
