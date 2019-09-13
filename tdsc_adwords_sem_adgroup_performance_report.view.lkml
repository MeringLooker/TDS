view: tdsc_adwords_sem_adgroup_performance_report {
  sql_table_name: public.tdsc_adwords_sem_adgroup_performance_report ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
    drill_fields: [campaign, ad_group, device]
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
    drill_fields: [detail*]
  }

  dimension: ad_group_id {
    hidden:  yes
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: avg__position {
    type: number
    sql: ${TABLE}."avg. position" ;;
    drill_fields: [campaign,ad_group]
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
    drill_fields: [ad_group,device]
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    hidden:  yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

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

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.device;;
  }

  dimension: formatted_device {
    type: string
    sql:
      CASE
        WHEN ${device} LIKE 'Mobile%' THEN 'Mobile'
        WHEN ${device} = 'Tablet%' THEN 'Tablet'
        WHEN ${device} LIKE 'TV Screens' THEN 'TV'
        ELSE ${device};;
      }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension_group: month {
    type:  time
    timeframes: [year, month]
    sql:TO_DATE(${TABLE}.month, 'YYYY-MM' ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: search_impr__share {
    hidden: yes
    type: string
    sql: ${TABLE}."search impr. share" ;;
  }

  dimension: search_lost_is_rank {
    hidden: yes
    type: string
    sql: ${TABLE}."search lost is (rank)" ;;
  }

  dimension: total_conv__value {
    type: number
    sql: ${TABLE}."total conv. value" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*,id, reportname]
  }

  measure: total_impressions {
    label: "Total Impressions"
    type: sum
    sql: ${impressions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum
    sql: ${clicks} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
    }

  measure: clickthrough_rate {
    label: "CTR"
    type:  number
    sql: (${total_clicks}/${total_impressions})  ;;
    value_format: "0.00%"
    drill_fields: [detail*]
  }

  measure: total_cost {
    type: sum
    sql: (${cost}/1000000) ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: cost_per_click {
    type: number
    sql:  ({${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: cost_per_session {
    type: number
    sql:  (${total_cost}/nullif(${tdsc_ga_adwords.sessions}, 0) ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: total_sessions {
    type: sum
    sql: ${tdsc_ga_adwords.sessions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_conversions {
    type: sum
    sql: ${conversions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: cost_per_conversion {
    type: number
    sql:  ${total_cost}/${total_conversions};;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: total_conversion_value {
    type: sum
    sql: ${total_conv__value} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: avg_order_value {
    label: "Avg. Order Value"
    type: number
    sql: ${total_conversions}/${total ${conversions};;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: return_on_ad_spend {
    label: "ROAS"
    type: number
    sql: ${total_cost}/${total_conversion_value} ;;
    value_format: "##0.00"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [ad_group,campaign,formatted_device]
  }
}
