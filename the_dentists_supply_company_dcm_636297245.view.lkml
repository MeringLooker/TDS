view: the_dentists_supply_company_dcm_636297245 {
  view_label: "TDS DoubleClick"
  sql_table_name: public.the dentists supply company_dcm_636297245 ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: join_id {
    type: string
    sql: ${placement_id}||';'||${creative_id}||';'|| ${ad_id} ;;
  }

  dimension: __id {
    type: string
    sql: ${TABLE}.__id ;;
  }

  dimension: __report {
    type: number
    sql: ${TABLE}.__report ;;
  }

  dimension_group: __senttime {
    label: "Sent Time"
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

  dimension: active_view__measurable_impressions {
    type: number
    sql: ${TABLE}."active view: % measurable impressions"
      ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    sql: ${TABLE}."active view: % viewable impressions"
      ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    sql: ${TABLE}."active view: eligible impressions"
      ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}."active view: measurable impressions"
      ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    sql: ${TABLE}."active view: viewable impressions"
      ;;
  }

  dimension: ad {
    type: string
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    type: number
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id{
    type: string
    sql:${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    type: number
    sql: ${TABLE}."click-through conversions" ;;
  }

  dimension: clickthrough_revenue {
    type: number
    sql: ${TABLE}."click-through revenue" ;;
  }

  dimension: creative {
    type: string
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}."creative id" ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    sql: ${TABLE}."media cost" ;;
  }

  dimension_group: month {
    type:  time
    timeframes: [year, month]
    sql:TO_DATE(${TABLE}.month, 'YYYY-MM' ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    sql: ${TABLE}."placement id" ;;
  }

  dimension: placement_strategy {
    type: string
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    hidden:  yes
    type: string
    sql: ${TABLE}."platform type";;
  }

  dimension: formatted_platform_type {
    label: "Device Category"
    type: string
    sql:
      CASE
        WHEN ${platform_type} LIKE 'Mobile%' THEN 'Mobile'
        WHEN ${platform_type} = '(not set)' THEN 'Uncategorized'
        ELSE ${platform_type};;
  }


  dimension: site_dcm {
    hidden:  yes
    type: string
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: formatted_site_dcm {
    label: "Publishers"
    type: string
    sql:
      CASE
       WHEN ${site_dcm} = 'digilant.com' THEN 'Digilant'
       WHEN ${site_dcm} = 'dentaltown.com' THEN 'Dental Town'
       ELSE ${site_dcm};;
  }

  measure: total_conversions {
    type: number
    sql: ${TABLE}."total conversions" ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: viewthrough_conversions {
    type: number
    sql: ${TABLE}."view-through conversions" ;;
  }

  dimension: viewthrough_revenue {
    type: number
    sql: ${TABLE}."view-through revenue" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

   measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_spend {
    type: sum
    sql: ${media_cost} ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  measure: total_view_through_conversions {
    type: number
    sql: ${viewthrough_conversions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: total_click_through_conversions {
    type: sum
    sql: ${clickthrough_conversions} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  measure: click_through_conversion_rate {
    type: number
    sql: ${total_click_through_conversions}/nullif(${total_clicks},0) ;;
    value_format: "0.00%"
    drill_fields: [detail*]
  }

  measure: ttl_conversions {
    label: "Total Conversions"
    type: sum
    sql: ${viewthrough_conversions}+${clickthrough_conversions} ;;
    drill_fields: [detail*]
  }

  measure: CTR {
    label: "CTR"
    description: "Click Through Rate"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions},0) ;;
    value_format: "0.00\%"
    drill_fields: [detail*]
  }

  measure: CPC {
    label: "CPC"
    description: "Cost per Click"
    type: number
    sql: ${total_spend}/nullif(${total_clicks},0) ;;
    value_format: "$#,##0.00"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [campaign,formatted_site_dcm,total_revenue]
  }
}
