view: tds_dcm_ga_view {
  sql_table_name: public.tds_dcm_ga_view ;;

#### Join id ####
  dimension: ga_join_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

  ##### Dimensions added to this table via LookML ######
  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: tds_placement {
    hidden: yes
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql:
    case
        when ${placement} ilike '%Retargeting Cross Device Display%' then 'Retargeting Cross Device Display'
        when ${placement} ilike '%Prospecting Cross Device Display%'  then   'Prospecting Cross Device Display '
        when ${placement} ilike '%Added Value Display%'  then   'Added Value Display'
        when ${placement} ilike '%Cross Device Display_Phase 4%'  then 'Cross Device Display Phase 4'
        when ${placement} ilike '%Added Value Cross Device Display%' then  'Added Value Cross Device Display '
        when ${placement} ilike '%Cross Device Display_Phase 4_Pre-Roll Video%' then 'Cross Device Display Phase 4 Pre-Roll Video'
        when ${placement} ilike '%Sponsored Video_1x1%' then 'Sponsored Video 1x1 '
        when ${placement} ilike '%ROS Super Leaderboard%' then 'ROS Super Leaderboard'
        when ${placement} ilike '%Category Ad Banner%' then 'Category Ad Banner'
        when ${placement} ilike '%ROS Half Page Banner_Mobile%' then 'ROS Half Page Banner Mobile'
        when ${placement} ilike '%Inside Dentistry_Homepage Web Banner%' then 'Inside Dentistry Homepage Web Banner'
        when ${placement} ilike '%ROS Super Leaderboard_Mobile%' then 'ROS Super Leaderboard Mobile'
        when ${placement} ilike '%ROS Half Page Banner_Mobile%' then 'ROS Half Page Banner Mobile'
        when ${placement} ilike '%ROS Half Page Banner%' then 'ROS Half Page Banner'
        when ${placement} ilike '%Inside Dentistry_CE Portal Masthead%'  then 'Inside Dentistry CE Portal Masthead'
        when ${placement} ilike '%Inside Dentistry_Edu Portal Masthead%'  then 'Inside Dentistry Edu Portal Masthead'
      ELSE 'Uncategorized'
        END;;
    }

  dimension: tds_creative {
    hidden: yes
    type: string
    group_label: "Client Dimensions"
    label: "Creative Name"
    sql:
    case
      when ${creative} ilike '%B_STATIC%' then 'Static B'
      when ${creative} ilike '%A_STATIC%' then 'Static A'
      when ${creative} ilike '%WorkTogether%' then 'Work Together'
      when ${creative} ilike '%startsaving_lifestyle%' then 'Start Saving Lifestyle'
      when ${creative} ilike '%startsaving_equipment%' then'Start Saving Equipment'
      when ${creative} ilike '%30off_lifestyle%' then '30 Off Lifestyle'
      when ${creative} ilike '%30off_equipment%' then '30 Off Equipment'
     ELSE 'Uncategorized'
        END;;
  }

  dimension: tds_layer {
    hidden: yes
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${ad} ilike '%Retargeting%' then 'Retargeting'
        when ${ad} ilike '%Prospecting%' then 'Prospecting'
        ELSE 'Uncategorized'
        end
        ;;
  }


#### Dimensions ####

  dimension: account_creates {
    hidden: yes
    type: number
    sql: ${TABLE}.account_creates;;
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
    group_label: "DCM IDs"
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
    group_label: "DCM IDs"
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
    group_label: "DCM IDs"
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
    group_label: "DCM IDs"
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
    label: "Site (DCM)"
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
    group_label: "Client Dimensions"
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
    label: "Media Spend"
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

  measure: dcm_total_revenue {
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

#### GA Measures ####
  measure: total_newusers {
    type: sum
    label: "New Users"
    group_label:  "Google Analytics Metrics"
    sql: ${newusers} ;;
  }

  measure: total_pageviews {
    type: sum
    label: "Pageviews"
    group_label: "Google Analytics Metrics"
    sql: ${pageviews} ;;
  }

  measure: total_session_duration {
    hidden:  yes
    type: sum
    group_label: "Google Analytics Metrics"
    sql: ${sessionduration} ;;
  }

  measure: total_users {
    type: sum
    label: "Users"
    group_label: "Google Analytics Metrics"
    sql: ${users} ;;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    sql: ${total_session_duration}/nullif(${total_sessions},0) ;;
    value_format: "m:ss"
  }

  measure: newuserrate {
    label: "New User Rate"
    group_label: "Google Analytics Metrics"
    type: number
    sql: 1.0*${newusers}/nullif(${users}, 0);;
    value_format_name: percent_0
  }

  measure: total_sessions {
    type: sum
    label: "Sessions"
    group_label: "Google Analytics Metrics"
    sql: ${sessions} ;;
  }

#### Google Analytics Goals ####
  measure: total_pdp_views {
    type: sum
    label: "PDP Views"
    group_label: "Google Analytics Goals"
    sql: ${pdp_views} ;;
  }

  measure: total_account_creates {
    group_label: "Google Analytics Goals"
    label: "Account Creates"
    type: sum
    sql: ${account_creates} ;;
  }

  measure: total_checkouts {
    type: sum
    label: "Checkouts"
    group_label: "Google Analytics Goals"
    sql: ${checkouts} ;;
  }

  measure: total_revenue {
    type: sum
    group_label: "Google Analytics Goals"
    label: "Revenue"
    value_format_name: usd
    sql: ${revenue} ;;
  }

  measure: total_transactions {
    type: sum
    group_label: "Google Analytics Goals"
    label: "Transactions"
    sql: ${transactions} ;;
  }

  measure: total_subscrpition_orders {
    type: sum
    group_label: "Google Analytics Goals"
    label: "Subscription Orders"
    sql: ${subscrpition_orders} ;;
  }

  measure: aov {
    group_label: "Google Analytics Goals"
    label: "Average Order Value"
    type:  number
    sql: ${total_revenue}/${total_transactions} ;;
    value_format_name: usd
  }

  measure: cost_per_account_create {
    group_label: "Google Analytics Goals"
    label: "Cost per Account Create"
    type: number
    sql: ${total_media_cost}/nullif(${total_account_creates}, 0) ;;
    value_format_name: usd
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
