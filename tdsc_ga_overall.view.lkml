view: tdsc_ga_overall {
  sql_table_name: public.tdsc_ga_overall ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __sampled {
    type: yesno
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: channelgrouping {
    type: string
    sql: ${TABLE}.channelgrouping ;;
  }

  dimension_group: date {
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

  dimension: goal4completions {
    type: number
    sql: ${TABLE}.goal4completions ;;
  }

  dimension: join_id {
    type: string
    sql: ${keyword}||';'||${date_date} ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: newusers {
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: region {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.region ;;
    drill_fields: [detail*]
  }

  dimension: sessionduration {
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: transactionrevenue {
    type: number
    sql: ${TABLE}.transactionrevenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_sessions {
    label: "Total Sessions"
    type: sum
    sql:  ${sessions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_transactions {
    label: "Total Transactions"
    type: sum
    sql: ${transactions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: transaction_revenue {
    label: "Transaction Revenue"
    type: sum
    sql: ${transactionrevenue} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: total_users {
    label: "Total Users"
    type: sum
    sql: ${users} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [region,total_sessions,total_transactions,transaction_revenue,total_users]
}
}
