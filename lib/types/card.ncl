let Type = [|
  '"template",
  '"custom:button-card",
  '"custom:mushroom-chips-card",
  '"custom:mushroom-title-card",
  '"custom:mushroom-light-card",
  '"grid",
  '"picture-entity",
  '"entity",
  '"tile",
  '"custom:mushroom-entity-card",
  '"horizontal-stack",
  '"custom:mushroom-temaplte-card",
  '"custom:vertical-stack-in-card",
  '"custom:mini-graph-card",
  '"custom:auto-entities",
|]
in

{
  type | Type,
  style
    | String
    | optional,
  ..
}
