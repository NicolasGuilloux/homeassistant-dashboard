let titleCard = import "../../../../lib/cards/minimalist/title-card.ncl" in

{
  title = "Dashboard",
  path = "",
  type = '"custom:vertical-layout",
  cards = [
    import "./welcome.part.ncl",
    import "./people.part.ncl",
    titleCard "Rez-de-Chaussée",
    import "./ground-floor.part.ncl",
    titleCard "Étage",
    import "./first-floor.part.ncl",
  ],
}
