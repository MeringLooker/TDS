view: tds_ga_ecommerce_view {
  sql_table_name: public.tds_ga_ecommerce_view ;;

## Primary Key ##

  dimension: product_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.product_join_id ;;
  }

  ## Dimensions Native to this Table ##

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

  dimension: itemquantity {
    type: number
    hidden: yes
    sql: ${TABLE}.itemquantity ;;
  }

  dimension: ecommerce_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ecommerce_join_id ;;
  }

  dimension: productname {
    type: string
    label: "Product Name"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.productname ;;
  }

  dimension: item_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transactionid {
    type: string
    hidden: yes
    sql: ${TABLE}.transactionid ;;
  }

  dimension: uniquepurchases {
    type: number
    hidden: yes
    sql: ${TABLE}.uniquepurchases ;;
  }

### All Measures go Below ###

  measure: count {
    label: "Purchases"
    group_label: "Product Metrics"
    type: count
  }

  measure: total_item_quantity {
    type: sum
    group_label: "Product Metrics"
    sql: ${itemquantity} ;;
    label: "Quantity"
  }

  measure: avg_quantity_sold {
    type: number
    value_format_name: decimal_2
    sql: ${total_item_quantity}/nullif(${count}, 0) ;;
    group_label: "Product Metrics"
    label: "Avg. Order Quantity"
  }

  measure: avg_selling_price {
    type: number
    value_format_name: decimal_2
    sql: ${total_item_revenue}/nullif(${total_item_quantity}, 0) ;;
    group_label: "Product Metrics"
    label: "Avg. Price"
  }

  measure: total_item_revenue {
    type: sum
    sql: ${item_revenue} ;;
    group_label: "Product Metrics"
    label: "Product Revenue"
    value_format_name: usd
  }

  measure: total_unique_purchases {
    type: sum
    sql: ${uniquepurchases} ;;
    group_label: "Product Metrics"
    label: "Unique Purchases"
  }

}
