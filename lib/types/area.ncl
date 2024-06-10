let Nullable = fun contract label value =>
  if value == null then
    value
  else
    std.contract.apply contract label value
in

{
  id | String,
  name | String,
  icon | String,
  color
    | String
    | default
    = "yellow",
  floor | Number,
  order
    | Number
    | default
    = 99,
  light_entity
    | Nullable String
    | default
    = null,
  speaker_entity
    | Nullable String
    | default
    = null,
  television_entity
    | Nullable String
    | default
    = null,
  temperature_entity
    | Nullable String
    | default
    = null,
  humidity_entity
    | Nullable String
    | default
    = null,
  url
    | Nullable String
    | default
    = null,
}
