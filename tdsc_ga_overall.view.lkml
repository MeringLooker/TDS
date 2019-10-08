view: tdsc_ga_overall {
  sql_table_name: public.tdsc_ga_overall ;;

  #### Primary Key ####
  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }


  #### Join Id ####
  dimension: join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'||${keyword} ;;
  }

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'||${adwordsadgroupid} ;;
}

#### Dimensions

  dimension: sourcemedium {
    label: "Source/Medium"
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: channelgrouping {
    label: "Default Channel Grouping"
    type: string
    sql: ${TABLE}.channelgrouping ;;
  }

  dimension: campaign {
    label: "Campaign"
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: date {
    label: ""
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

  dimension_group: __updatetime {
    hidden: yes
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

  dimension: region {
    label: "Region"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.region ;;
    drill_fields: [detail*]
  }

  dimension: __sampled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
    hidden: yes
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

  dimension: keyword {
    hidden: yes
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: adwordsadgroupid {
    hidden: yes
    type: string
    sql: ${TABLE}.adwordsadgroupid ;;
  }

#### Measures ####

  measure: bounces {
    label: "Bounces"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.bounces ;;
  }

  measure: goal4completions {
    label: "Account Creations"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.goal4completions ;;
  }

  measure: newusers {
    label: "New Users"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.newusers ;;
  }

  measure: pageviews {
    label: "Pageviews"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.pageviews ;;
  }

  measure: sessionduration {
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.sessionduration ;;
  }

  measure: sessions {
    label: "Sessions"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.sessions ;;
  }

  measure: transactionrevenue {
    label: "Revenue"
    type: sum
    value_format_name: usd_0
    drill_fields: [detail*]
    sql: ${TABLE}.transactionrevenue ;;
  }

  measure: transactions {    label: "Transactions"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.transactions ;;
  }

  measure: users {
    label: "Total Users"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

 ## measure: total_sessions {
    #label: "Total Sessions"
    #type: sum
    #sql:  ${sessions} ;;
    #value_format: "#,##0"
    #drill_fields: [detail*]

  set: detail {
    fields: [region,sessions,transactions,transactionrevenue,users,newusers, pageviews, channelgrouping]
}
}
