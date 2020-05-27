view: tds_dcm_ga_view {
  sql_table_name: public.tds_dcm_ga_view ;;

#### Join id ####
  dimension: ga_join_id {
#     hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

#### Dimensions ####
  dimension: __report {
    hidden: yes
    type: number
    sql: ${TABLE}.__report ;;
  }

  dimension: __state {
    hidden: yes
    type: string
    sql: ${TABLE}.__state ;;
  }

  dimension: active_view_eligible_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_eligible_impressions;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_measurable_impressions;;
  }

  dimension: active_view_viewable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_viewable_impressions;;
  }

  dimension: ad {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    hidden: yes
    type: string
    sql: ${TABLE}."ad id" ;;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
      ELSE 'Uncategorized'
      END;;
  }

  dimension: advertiser {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: campaign {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    hidden:  yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    hidden:  yes
    type: number
    sql: ${TABLE}.click_through_conversions;;
  }

  dimension: clickthrough_revenue {
    hidden:  yes
    type: number
    sql: ${TABLE}.click_through_revenue ;;
  }

  dimension: cost {
    hidden:  yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: creative {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    hidden:  yes
    type: string
    sql: ${TABLE}."creative id" ;;
  }

  dimension_group: date {
    type: time
    label: ""
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


#   dimension: fiscal_year {
#     label: "Fiscal"
#     type: string
#     group_label: "Client Dimensions"
#     sql:
#       CASE
#         WHEN ${date_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
#         ELSE 'Uncategorized'
#         END
#         ;;
#   }



  dimension: impressions {
    hidden:  yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: newusers {
    hidden:  yes
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    hidden:  yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: placement {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    hidden: yes
    type: number
    sql: ${TABLE}."placement id" ;;
  }

 dimension: advertising_channel {
  type: string
  group_label: "DCM Dimensions"
  label: "Channel"
  sql: ${TABLE}."placement strategy" ;;
}

  dimension: sessionduration {
    hidden:  yes
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    hidden:  yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: site_dcm {
    group_label: "DCM Dimensions"
    type: string
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: conversions {
    hidden:  yes
    type: number
    sql: ${TABLE}.total_conversions;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    sql:
    CASE
        WHEN ${site_dcm} ilike 'dentaltown%' then 'Dentaltown'
        WHEN ${site_dcm} ilike 'digilant%' then 'Digilant'
        ELSE ${site_dcm}
        END
        ;;
  }

  dimension: revenue {
    hidden:  yes
    type: number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: viewthrough_conversions {
    hidden:  yes
    type: number
    sql: ${TABLE}.view_through_conversions ;;
  }

  dimension: viewthrough_revenue {
    hidden:  yes
    type: number
    sql: ${TABLE}.view_through_revenue ;;
  }

  dimension: subscrpition_orders {
    hidden: yes
    type: number
    sql: ${TABLE}.subscrpition_orders ;;
  }

  dimension: transactions {
    hidden: yes
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: goal_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: checkouts {
    hidden: yes
    type: number
    sql: ${TABLE}.checkouts ;;
  }

  dimension: pdp_views {
    hidden: yes
    type: number
    sql: ${TABLE}.pdp_views ;;
  }


######### MEASURES ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum
    label: "Impressions"
    sql: ${TABLE}.impressions ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum
    label: "Clicks"
    sql: ${TABLE}.clicks ;;
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum
    label: "Total Cost"
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }


  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum
    label: "Active View Measureable Impressions"
    sql: ${TABLE}."active view: measurable impressions";;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum
    label: "Active View Viewable Impressions"
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversions {
    hidden: yes
    label: "Total Conversions"
    group_label: "3rd Party Measures"
    type: sum
    sql: ${TABLE}."total conversions" ;;
  }

  measure: total_revenue {
    hidden: yes
    label: "Total Revenue"
    group_label: "3rd Party Measures"
    type: sum
    sql: ${TABLE}."total revenue" ;;
    value_format_name: usd
  }

  measure: view_through_conversions {
    label: "View Through Conversions"
    group_label: "3rd Party Measures"
    type: sum
    sql: ${TABLE}."view-through conversions" ;;
  }

  measure: view_through_revenue {
    hidden: yes
    label: "View Through Revenue"
    group_label: "3rd Party Measures"
    type: sum
    sql: ${TABLE}."view-through revenue" ;;
  }

### GA Measures ###
  measure: total_page_views {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: total_session_duration {
    group_label: "Google Analytics Metrics"
    hidden: yes
    type: sum
    sql: ${TABLE}.sessionduration ;;
  }

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    sql: ${total_session_duration}/nullif(${total_sessions},0) ;;
    value_format: "0.##"
  }

  measure: total_users {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: total_new_users {
    label: "New Users"
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${TABLE}.newusers ;;
  }

  measure: new_user_rate {
    label: "New User Rate"
    group_label:"Google Analytics Metrics"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

### GA Goals Measure ###
  measure: total_checkouts {
    type: sum
    group_label: "Google Analytics Goals"
    sql: ${checkouts} ;;
  }

  measure: total_pdp_views {
    type: sum
    group_label: "Google Analytics Goals"
    sql: ${pdp_views} ;;
  }

  measure: total_goal_revenue {
    type: sum
    group_label: "Google Analytics Goals"
    label: "Goal Revenue"
    value_format_name: usd_0
    sql: ${revenue} ;;
  }

  measure: total_subscrpition_orders {
    type: sum
    group_label: "Google Analytics Goals"
    sql: ${subscrpition_orders} ;;
  }

  measure: total_transactions {
    type: sum
    group_label: "Google Analytics Goals"
    sql: ${transactions} ;;
  }

  measure: count {
#     hidden: yes
    type: count
    drill_fields: []
  }
}
