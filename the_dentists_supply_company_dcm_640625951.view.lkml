view: the_dentists_supply_company_dcm_640625951 {
  sql_table_name: "the dentists supply company_dcm_640625951" ;;
  drill_fields: [id]


#### Primary Key ####
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }


#### measures ####


  dimension_group: date {
    label: "Period"
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

  dimension: __report {
    hidden:  yes
    type: number
    sql: ${TABLE}.__report ;;
  }

  dimension_group: __senttime {
    hidden:  yes
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
    hidden:  yes
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

  dimension: site {
    type: string
    sql: ${TABLE}."site (DCM)" ;;
  }

  dimension: ad {
    type: string
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    hidden:  yes
    type: string
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    hidden:  yes
   type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden:  yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: creative {
    type: string
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    hidden:  yes
    type: string
    sql: ${TABLE}."creative id" ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    hidden: yes
    type: number
    sql: ${TABLE}."placement id" ;;
  }

  dimension: placement_strategy {
    type: string
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: platform_type {
    type: string
    sql: ${TABLE}."platform type" ;;
  }

#### Measures ####

  measure: active_view__measurable_impressions {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}."active view: % measurable impressions"
      ;;
  }

  measure: active_view__viewable_impressions {
   value_format_name: decimal_0
   type: sum
    sql: ${TABLE}."active view: % viewable impressions"
      ;;
  }

  measure: active_view_eligible_impressions {
    value_format_name: decimal_0
    type: sum
    sql: ${TABLE}."active view: eligible impressions"
      ;;
  }

  measure: booked_clicks {
    hidden: yes
    type: sum
    sql: ${TABLE}."booked clicks" ;;
  }

  measure: booked_impressions {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}."booked impressions" ;;
  }

  measure: booked_viewable_impressions {
    hidden: yes
    type: sum
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: clickthrough_conversions {
    hidden:  yes
    type: sum
    sql: ${TABLE}."click-through conversions" ;;
  }

  measure: clickthrough_revenue {
    type: sum
    sql: ${TABLE}."click-through revenue" ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: media_cost {
    value_format_name: usd_0
    type: sum
    sql: ${TABLE}."media cost" ;;
  }

  measure: planned_media_cost {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}."planned media cost" ;;
  }

  measure: total_conversions {
    type: sum
    sql: ${TABLE}."total conversions" ;;
  }

  measure: total_revenue {
    hidden: yes
    type: sum
    sql: ${TABLE}."total revenue" ;;
  }

  measure: viewthrough_conversions {
    type: sum
    sql: ${TABLE}."view-through conversions" ;;
  }

  measure: viewthrough_revenue {
    hidden: yes
    type: sum
    sql: ${TABLE}."view-through revenue" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
