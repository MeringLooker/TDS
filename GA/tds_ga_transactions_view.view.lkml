view: tds_ga_transactions_view {
  sql_table_name: public.tds_ga_transactions_view ;;

  ## Primary Key ##

  dimension: transaction_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.transaction_join_id ;;
  }

  ## Dimensions Native to this Table ##

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  dimension: adwordsadgroupid {
    type: string
    label: "AdWords Ad Group ID"
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: devicecategory {
    type: string
    label: "Device Category"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: ecommerce_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ecommerce_join_id ;;
  }

  dimension: itemquantity {
    type: number
    hidden: yes
    sql: ${TABLE}.itemquantity ;;
  }

  dimension: keyword {
    type: string
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.keyword ;;
  }

  dimension: region {
    type: string
    description: "This can return values that reflect US states."
    map_layer_name: us_states
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.region ;;
  }

  dimension: shipping_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: sourcemedium {
    type: string
    label: "Source / Medium"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: transaction_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transaction_tax {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_tax ;;
  }

  dimension: transactionid {
    type: string
    hidden: yes
    sql: ${TABLE}.transactionid ;;
  }

  ### All Measures go Below ###

  measure: count {
    label: "Transactions"
    group_label: "Transaction Metrics"
    type: count
  }

  measure: total_item_quantity {
    type: sum
    group_label: "Transaction Metrics"
    sql: ${itemquantity} ;;
    label: "Quantity"
  }

  measure: total_transaction_revenue {
    type: sum
    sql: ${transaction_revenue} ;;
    group_label: "Transaction Metrics"
    label: "Transaction Revenue"
    value_format_name: usd
  }

  measure: avg_order_value {
    type: number
    value_format_name: usd
    sql: ${total_transaction_revenue}/nullif(${count}, 0) ;;
    group_label: "Transaction Metrics"
    label: "Avg. Order Value"
  }

  measure: total_transaction_tax {
    type: sum
    value_format_name: usd
    sql: ${transaction_tax} ;;
    group_label: "Transaction Metrics"
    label: "Transaction Tax"
  }

  measure: total_shipping_cost {
    type: sum
    value_format_name: usd
    sql: ${shipping_cost} ;;
    group_label: "Transaction Metrics"
    label: "Shipping Cost"
  }


}
