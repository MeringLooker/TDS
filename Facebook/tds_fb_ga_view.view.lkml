view: tds_fb_ga_view {
  sql_table_name: public.tds_fb_ga_view ;;


#### Join ID ####

  dimension: ga_join_id {
    primary_key: yes
    hidden: yes
    type:  string
  }

###### Dimensions added to this table via LookML #######
  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${date_start_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
        ELSE 'Uncategorized'
        END
        ;;
  }


  dimension: tds_layer {
    hidden: yes
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_name} ilike '%Conversion' then 'Conversion'
        when ${campaign_name} ilike '%Views' then 'Views'
        when ${campaign_name} ilike '%BrandAwareness' then 'Brand Awareness'
        ELSE 'Uncategorized'
        end
        ;;
  }

#   dimension: tds_placement {
#     type: string
#     label: "Campaign Placement"
#     group_label: "Client Dimensions"
#     sql:
#       case
#         when ${ad_name} ilike '%Brand_15' then ':15 Video - Brand'
#         when ${ad_name} ilike '%SaveTogether_30' then ':30 Video - Save Together'
#         when ${ad_name} ilike '%Social_15' then ':15 Video - Social'
#         ELSE 'Uncategorized'
#         end
#         ;;
#   }

  dimension: tds_placement {
    hidden: yes
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql: ${adset_name} ;;
  }

  dimension: tds_audience {
    hidden: yes
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      case
        when ${ad_name} ilike '%CRMList%' then 'CRM List'
        when ${ad_name} ilike '%Lookalike%' then 'Lookalike'
        when ${ad_name} ilike '%DentalProfessionals%' then 'Dental Professionals'
        when ${ad_name} ilike '%AVideoViewers%' then 'AVideo Viewers'
        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: tds_ad_type {
    hidden: yes
    type: string
    label: "Ad Type"
    group_label: "Client Dimensions"
    sql:
      case
        when ${ad_name} ilike '%BigSmilesImage' then 'Big Smiles Image'
        when ${ad_name} ilike '%SalesImage' then 'Sales Image'
        when ${ad_name} ilike '%SaveTogetherImage' then 'Save Together Image'
        when ${ad_name} ilike '%BigSavingsImage' then ' Big Savings Image'

        ELSE 'Uncategorized'
        end
        ;;
  }


  dimension: tds_campaign {
    hidden: yes
    type: string
    label: "Campaign Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_name} = 'FY19_TDSC_Content_BrandAwareness' then 'Brand Awarenss Content'
        when ${campaign_name} = 'FY19_TDSC_Content_Views' then 'Views Content'
        when ${campaign_name} = 'FY19_TDSC_Sales_Conversion' then 'Sales Conversions'
        ELSE 'Uncategorized'
        end
        ;;
  }

#### Dimensions ####

  dimension: account_id {
#     hidden: yes
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    hidden: yes
    type: string
    group_label: "Account Name"
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
#     hidden: yes
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    group_label: "Facebook Dimensions"
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
#     hidden: yes
    type: number
    group_label: "Facebook IDs"
    label: "Ad Set ID"
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Set Name"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    group_label: "Facebook Dimensions"
    type: string
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
#     hidden: yes
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    group_label: "Facebook Dimensions"
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

#     dimension: fiscal_year {
#       label: "Fiscal"
#       type: string
#       group_label: "Client Dimensions"
#       sql:
#       CASE
#         WHEN ${date_start_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
#         ELSE 'Uncategorized'
#         END
#         ;;
#     }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: country {
    group_label: "Facebook Dimensions"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: objective {
    hidden: yes
    type: string
    sql: ${TABLE}.objective ;;
  }

#     dimension: frequency {
#       type: number
#       hidden: yes
#       sql: ${TABLE}.frequency ;;
#     }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: publisher {
    type: string
    group_label: "Facebook Dimensions"
    sql: 'Facebook' ;;
  }

#     dimension: reach {
#       type: number
#       hidden: yes
#       sql: ${TABLE}.reach ;;
#     }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
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

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: new_users {
    hidden:  yes
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: pageviews {
    hidden:  yes
    type: number
    sql: ${TABLE}.pageviews ;;
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

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: account_creates {
    hidden: yes
    type: number
    sql: ${TABLE}.account_creates ;;
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

  dimension:views_to_25 {
    hidden: yes
    type: number
    sql: ${TABLE}.p25_video_view ;;
  }

  dimension:views_to_50 {
    hidden: yes
    type: number
    sql: ${TABLE}.p50_video_view ;;
  }

  dimension:views_to_75 {
    hidden: yes
    type: number
    sql: ${TABLE}.p75_video_view ;;
  }

  dimension:views_to_95 {
    hidden: yes
    type: number
    sql: ${TABLE}.p95_video_view ;;
  }

  dimension:views_to_100 {
    hidden: yes
    type: number
    sql: ${TABLE}.p100_video_view ;;
  }

  dimension: thruplays {
    type: number
    hidden: yes
    sql: ${TABLE}.thruplays ;;
  }

#     dimension: unique_clicks {
#       type: number
#       hidden: yes
#       sql: ${TABLE}.unique_clicks ;;
#     }

#     dimension: unique_ctr {
#       type: number
#       hidden: yes
#       sql: ${TABLE}.unique_ctr ;;
#     }

#### FB Measures ####
  measure: total_impressions {
    group_label: "Facebook Delivery"
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "Facebook Delivery"
    type: sum
    label: "Link Clicks"
    sql: ${inline_link_clicks} ;;
  }

  measure: total_spend {
    group_label: "Facebook Delivery"
    type: sum
    label: "Media Spend"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: click_through_rate {
    group_label: "Facebook Delivery"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    group_label: "Facebook Delivery"
    type: number
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "Facebook Delivery"
    type: number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure:total_views_to_25 {
    group_label: "Facebook Video Metrics"
    label: "Views to 25%"
    type: sum
    sql: ${views_to_25} ;;
  }

  measure:total_views_to_50 {
    group_label: "Facebook Video Metrics"
    label: "Views to 50%"
    type: sum
    sql: ${views_to_50} ;;
  }

  measure:total_views_to_75 {
    group_label: "Facebook Video Metrics"
    label: "Views to 75%"
    type: sum
    sql: ${views_to_75} ;;
  }

  measure:total_views_to_95 {
    group_label: "Facebook Video Metrics"
    label: "Views to 95%"
    type: sum
    sql: ${views_to_95} ;;
  }

  measure:total_video_completes {
    group_label: "Facebook Video Metrics"
    label: "Views to 100%"
    type: sum
    sql: ${views_to_100} ;;
  }

  measure: video_impressions {
    type: sum
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_spend {
    type: sum
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_completion_rate {
    type: number
    label: "Completion Rate"
    group_label: "Facebook Video Metrics"
    sql: 1.0*${total_video_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    group_label: "Facebook Video Metrics"
    sql: 1.0*${video_spend}/nullif(${total_video_completes}, 0) ;;
    value_format_name: usd
  }

#   measure: total_thruplays {
#     type: sum_distinct
#     label: "ThruPlays"
#     group_label: "Facebook Video Metrics"
#     sql: ${thruplays};;
#   }
#
#   measure: thruplay_rate {
#     type: number
#     label: "ThruPlay Rate"
#     group_label: "Facebook Video Metrics"
#     sql: 1.0*${total_thruplays}/nullif(${video_impressions}, 0) ;;
#     value_format_name: percent_2
#   }
#
#   measure: cost_per_thruplay {
#     type: number
#     label: "Cost/ThruPlay"
#     group_label: "Facebook Video Metrics"
#     sql: 1.0*${video_spend}/nullif(${total_thruplays}, 0) ;;
#     value_format_name: usd
#   }


#### GA Measures ###

  measure: total_users {
    group_label: "Google Analytics Metrics"
    label: "Users"
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: total_new_users {
    group_label: "Google Analytics Metrics"
    label: "New Users"
    type: sum
    sql: ${TABLE}.new_users ;;
  }

  measure: new_user_rate {
    group_label:"Google Analytics Metrics"
    label: "New User Rate"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: total_page_views {
    group_label: "Google Analytics Metrics"
    label: "Pageviews"
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    label: "Sessions"
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: total_session_duration {
    group_label: "Google Analytics Metrics"
    hidden: yes
    type: sum
    sql: ${TABLE}.sessionduration ;;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    sql: ${total_session_duration}/nullif(${total_sessions},0) ;;
    value_format: "0.##"
  }

## Google Analytics Goals ##
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
    type: number
    sql: ${total_revenue}/${total_transactions} ;;
    value_format_name: usd
  }

  measure: cost_per_account_create {
    group_label: "Google Analytics Goals"
    label: "Cost per Account Create"
    type: number
    sql: ${total_spend}/nullif(${total_account_creates}, 0) ;;
    value_format_name: usd_0
  }

  measure: count {
    hidden: yes
    type: count
  }

}
