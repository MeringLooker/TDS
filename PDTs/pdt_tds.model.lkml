connection: "mc_panoply"

include: "*.view.lkml"
include: "/Adwords/*.view"
include: "/Facebook/**/*.view"
include: "/DCM/**/*.view"
include: "/LinkedIn/*.view"

datagroup: tds_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_overall{
  label: "TDS"
  view_label: "TDS"
  hidden: no
  group_label: "The Dentists Supply Company"
}
