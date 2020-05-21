view: tds_fb_ga_view {
    sql_table_name: public.tds_fb_ga_view ;;


#### Join ID ####

    dimension: ga_join_id {
      primary_key: yes
      hidden: yes
      type:  string
    }

#### Dimensions ####
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

    dimension: account_id {
      hidden: yes
      type: number
      sql: ${TABLE}.account_id ;;
    }

    dimension: account_name {
      hidden: yes
      type: string
      sql: ${TABLE}.account_name ;;
    }

    dimension: ad_id {
      hidden: yes
      type: number
      sql: ${TABLE}.ad_id ;;
    }

    dimension: ad_name {
      group_label: "Facebook Dimensions"
      type: string
      sql: ${TABLE}.ad_name ;;
    }

    dimension: adset_id {
      hidden: yes
      type: number
      sql: ${TABLE}.adset_id ;;
    }

    dimension: adset_name {
      group_label: "Facebook Dimensions"
      type: string
      sql: ${TABLE}.adset_name ;;
    }

    dimension: buying_type {
      group_label: "Facebook Dimensions"
      type: string
      sql: ${TABLE}.buying_type ;;
    }

    dimension: campaign_id {
      hidden: yes
      type: number
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
    sql: ${TABLE}.views_to_25 ;;
  }

  dimension:views_to_50 {
    hidden: yes
    type: number
    sql: ${TABLE}.views_to_50 ;;
  }

  dimension:views_to_75 {
    hidden: yes
    type: number
    sql: ${TABLE}.views_to_75 ;;
  }

  dimension:views_to_95 {
    hidden: yes
    type: number
    sql: ${TABLE}.views_to_95 ;;
  }

  dimension:views_to_100 {
    hidden: yes
    type: number
    sql: ${TABLE}.views_to_100 ;;
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

#### Measures ####
    measure: total_impressions {
      group_label: "Delivery Metrics"
      type: sum
      label: "Impressions"
      sql: ${impressions} ;;
    }

    measure: total_clicks {
      group_label: "Delivery Metrics"
      type: sum
      label: "Link Clicks"
      sql: ${inline_link_clicks} ;;
    }

    measure: total_spend {
      group_label: "Delivery Metrics"
      type: sum
      label: "Total Cost"
      sql: ${spend};;
      value_format_name: usd
    }

    measure: click_through_rate {
      group_label: "Delivery Metrics"
      type: number
      label: "CTR"
      sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
      value_format_name: percent_2
    }

    measure: cost_per_click {
      group_label: "Delivery Metrics"
      type: number
      label: "CPC"
      sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
      value_format_name: usd
    }

    measure: cost_per_thousand {
      group_label: "Delivery Metrics"
      type: number
      label: "CPM"
      sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
      value_format_name: usd
    }

    measure:total_views_to_25 {
      group_label: "Video Metrics"
      label: "Views to 25%"
      type: sum
      sql: ${views_to_25} ;;
    }

    measure:total_views_to_50 {
      group_label: "Video Metrics"
      label: "Views to 50%"
      type: sum
      sql: ${views_to_50} ;;
    }

    measure:total_views_to_75 {
      group_label: "Video Metrics"
      label: "Views to 75%"
     type: sum
      sql: ${views_to_75} ;;
    }

    measure:total_views_to_95 {
      group_label: "Video Metrics"
      label: "Views to 95%"
      type: sum
      sql: ${views_to_95} ;;
    }

    measure:total_views_to_100 {
      group_label: "Video Metrics"
      label: "Views to 100%"
      type: sum
      sql: ${views_to_100} ;;
    }

    measure: count {
      hidden: yes
      type: count
    }

#### GA Measures ###

  measure: total_page_views {
    group_label: "GA-Onsite"
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: total_session_duration {
    group_label: "GA-Onsite"
    hidden: yes
    type: sum
    sql: ${TABLE}.sessionduration ;;
  }

  measure: total_sessions {
    group_label: "GA-Onsite"
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: avg_time_on_site {
    group_label: "GA-Onsite"
    label: "Avg. TOS"
    sql: ${total_session_duration}/nullif(${total_sessions},0) ;;
    value_format: "0.##"
  }

  measure: total_users {
    group_label: "GA-Onsite"
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: total_new_users {
    label: "New Users"
    group_label: "GA-Onsite"
    type: sum
    sql: ${TABLE}.new_users ;;
  }

  measure: new_user_rate {
    label: "New User Rate"
    group_label:"GA-Onsite"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: total_checkouts {
    type: sum
    group_label: "Transactional"
    sql: ${checkouts} ;;
  }

  measure: total_pdp_views {
    type: sum
    group_label: "Transactional"
    sql: ${pdp_views} ;;
  }

  measure: total_revenue {
    type: sum
    group_label: "Transactional"
    value_format_name: usd_0
    sql: ${revenue} ;;
  }

  measure: total_subscrpition_orders {
    type: sum
    group_label: "Transactional"
    sql: ${subscrpition_orders} ;;
  }

  measure: total_transactions {
    type: sum
    group_label: "Transactional"
    sql: ${transactions} ;;
    }

  }
