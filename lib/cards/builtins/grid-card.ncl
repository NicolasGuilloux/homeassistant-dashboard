let Card = import "../../types/card.ncl" in

let Config = {
  columns
    | Number
    | doc "Number of columns for the grid"
    | default
    = 2,
  square
    | Bool
    | doc "Renders the card as even squares"
    | default
    = false,
  title
    | String
    | doc "Title of your grid"
    | default
    = "",
  cards
    | Array Card
    | doc "List of cards to pass to the grid"
    | default
    = [],
}
in

fun input =>
  let config = input | Config in
  {
    type = '"grid",
    title = config.title,
    square = config.square,
    columns = config.columns,
    cards = config.cards,
  } | Card
