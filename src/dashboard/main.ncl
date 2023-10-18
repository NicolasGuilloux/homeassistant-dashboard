let Dashboard = import "../../lib/types/dashboard.ncl" in

{
  title = "Dashboard",
  theme = '"minimalist-desktop",
  kiosk_mode.mobile_settings.hide_header = true,
  views = [
    import "./views/main/default.ncl",
    import "./views/bedroom/default.ncl",
    import "./views/elena_bedroom/default.ncl",
    import "./views/kitchen/default.ncl",
    import "./views/lab/default.ncl",
    import "./views/lights/default.ncl",
    import "./views/livingroom/default.ncl",
    import "./views/network/default.ncl",
    import "./views/office/default.ncl",
    import "./views/security/default.ncl",
  ],
} | Dashboard
