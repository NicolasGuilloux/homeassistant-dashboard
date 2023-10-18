let roomCard = import "../../templates/cards/room-card.ncl" in

let areas = import "../../data/areas.ncl" in

let sortByOrder = fun x y =>
  if x.order < y.order then
    'Lesser
  else if (x.order == y.order) then
    'Equal
  else
    'Greater
in

{
  type = '"grid",
  square = false,
  columns = 2,
  cards =
    areas
    |> std.record.values
    |> std.array.filter (fun area => area.floor == 1)
    |> std.array.sort sortByOrder
    |> std.array.map roomCard
}
