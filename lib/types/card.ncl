let Type = [|
  '"custom:auto-entities",
  '"custom:button-card",
  '"custom:mini-graph-card",
  '"custom:mushroom-chips-card",
  '"custom:mushroom-entity-card",
  '"custom:mushroom-light-card",
  '"custom:mushroom-template-card",
  '"custom:mushroom-title-card",
  '"custom:vertical-stack-in-card",
  '"entity",
  '"grid",
  '"horizontal-stack",
  '"vertical-stack",
  '"picture-entity",
  '"template",
  '"tile",
  '"custom:vertical-stack-in-card",
|]
in

{
  type | Type,
  style
    | String
    | optional,
  ..
}
