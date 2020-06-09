include: "/GA/*.view"

explore: tds_ga {
  hidden:  yes
  view_name: tds_ga_acquisition_view
  label: "Google Analytics"
  view_label: "Website Acquisiton"
  group_label: "The Dentists Supply Company"

  join: tds_ga_audience_view {
    view_label: "Users"
    sql_on: ${tds_ga_audience_view.acq_join_id} = ${tds_ga_acquisition_view.acq_join_id} ;;
    relationship: many_to_one
  }

  join: tds_ga_behavior_view {
    view_label: "Pages"
    sql_on: ${tds_ga_behavior_view.acq_join_id} = ${tds_ga_acquisition_view.acq_join_id} ;;
    relationship: many_to_one
  }

  join: tds_ga_transactions_view {
    view_label: "Transactions"
    sql_on: ${tds_ga_transactions_view.acq_join_id} = ${tds_ga_acquisition_view.acq_join_id} ;;
    relationship: many_to_one
  }

  join: tds_ga_ecommerce_view {
    view_label: "Products"
    sql_on: ${tds_ga_ecommerce_view.ecommerce_join_id} = ${tds_ga_transactions_view.ecommerce_join_id} ;;
    relationship: many_to_one
  }
}
