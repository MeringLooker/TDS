view: tds_gdn_adgroup_performance_report {
  sql_table_name: public.tds_gdn_adgroup_performance_report ;;
  drill_fields: [id]

 #### Primary Key ####

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Join Id ####

  dimension: gdn_join_id {
    type: string
    sql: ${day_date}||'|'||${ad_group_id}  ;;
  }

  #### Dimensions ####

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
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

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    hidden: yes
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: campaign_state {
    hidden: yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }


#### Measures ####

  measure: avg__position {
    type: number
    sql: ${TABLE}."avg. position" ;;
  }


  measure: clicks {
  type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.clicks ;;
  }

  measure: conversions {
   type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.conversions ;;
  }

  measure: cost {
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    value_format_name: usd
    sql: ${TABLE}.cost/1000000.00 ;;
  }

  measure: impressions {
  type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.impressions ;;
  }

  measure: search_impr__share {
    type: string
    sql: ${TABLE}."search impr. share" ;;
  }

  measure: search_lost_is_rank {
    type: string
    sql: ${TABLE}."search lost is (rank)" ;;
  }

  measure: total_conv__value {
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."total conv. value" ;;
  }



  measure: count {
    type: count
    drill_fields: [id, reportname]
  }
}
