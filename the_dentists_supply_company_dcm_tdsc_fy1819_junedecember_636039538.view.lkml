view: the_dentists_supply_company_dcm_tdsc_fy1819_junedecember_636039538 {
  sql_table_name: public.the dentists supply company_dcm_tdsc fy1819 june-december_636039538 ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: site_dcm {
    type: string
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: total_conversions {
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
}
