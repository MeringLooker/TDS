view: tds_ga_goals {
  sql_table_name: public.tds_ga_goals ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### PRIMARY KEY ####
  dimension: ga_goals_join_id {
    type: string
    sql: ${date_date}||'|'||${adwordsadgroupid}  ;;
  }


#### Dimensions #####


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

  dimension: adwordsadgroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
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

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }


#### MEASURES ####

  measure: goal1completions {
    group_label: "Transactional"
    label: "Checkout Complete"
  type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal1completions ;;
  }

  measure: goal2completions {
    group_label: "Transactional"
    label: "Subscription Order"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal2completions ;;
  }

  measure: goal3completions {
    label: "PDP View"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal3completions ;;
  }

  measure: goal4completions {
    group_label: "Transactional"
    label: "Account Creations"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal4completions ;;
  }

  measure: goal6completions {
    label: "Account Create - Funnel"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal6completions ;;
  }

  measure: transactions {
    group_label: "Transactional"
    label: "Orders"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactions ;;
  }

  measure: transactionsrevenue {
    group_label: "Transactional"
    label: "Revenue"
    value_format_name: usd
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactionrevenue ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
