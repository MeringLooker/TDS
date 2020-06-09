view: tds_ga_audience_view {
  sql_table_name: public.tds_ga_audience_view ;;

  ## Primary Key ##

  dimension: audience_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.audience_join_id ;;
  }

  ## Dimensions joined from Ads Lookup File ##

  dimension: ad_name {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${tds_ga_ads_lookup.ad_name};;
  }

  dimension: creative_name {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${tds_ga_ads_lookup.creative_name};;
  }

  dimension: publisher {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${tds_ga_ads_lookup.publisher};;
  }

  ## Dimensions Native to this Table ##

  dimension: traffic_type {
    type: string
    hidden: no
    group_label: "Google Analytics Dimensions"
    description: "This is determined by the medium of traffic. Includes campaign, cpc, ppc, and email traffic."
    sql:
      case
        when ${sourcemedium} ilike '%campaign%' then 'Paid'
        when ${sourcemedium} ilike '%cpc%' then 'Paid'
        when ${sourcemedium} ilike '%ppc%' then 'Paid'
        when ${sourcemedium} ilike '%email%' then 'Paid'
        else 'Not Paid'
        end
        ;;
  }

  dimension: is_paid_traffic {
    type: yesno
    group_label: "Paid Traffic Info"
    description: "This is determined by the medium of traffic. Includes campaign, cpc, ppc, and email traffic."
    sql: ${traffic_type} = 'Paid' ;;
  }

  dimension: account_create {
    type: number
    hidden: yes
    sql: ${TABLE}.account_create ;;
  }

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  dimension: adwordsadgroupid {
    type: string
    hidden: yes
    label: "AdWords Ad Group ID"
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: checkout_complete {
    type: number
    hidden: yes
    sql: ${TABLE}.checkout_complete ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
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

  dimension: devicecategory {
    type: string
    label: "Device Category"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: ga_ads_lookup_id {
    type: string
    hidden: yes
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.ga_ads_lookup_id ;;
  }

  dimension: keyword {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.keyword ;;
  }

  dimension: medium {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.medium ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: pdp_view {
    type: number
    hidden: yes
    sql: ${TABLE}.pdp_view ;;
  }

  dimension: region {
    type: string
    description: "This can return values that reflect US states."
    map_layer_name: us_states
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.region ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: source {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.source ;;
  }

  dimension: sourcemedium {
    type: string
    label: "Source / Medium"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: subscription_confirmation {
    type: number
    hidden: yes
    sql: ${TABLE}.subscription_confirmation ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: usertype {
    type: string
    label: "User Type"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.usertype ;;
  }

  ### All Measures go Below ###

  measure: total_sessions {
    type: sum
    sql: ${sessions} ;;
    label: "Sessions"
    group_label: "Traffic Metrics"
  }

  measure: total_session_duration {
    type: sum
    hidden: yes
    sql: ${sessionduration} ;;
    group_label: "Traffic Metrics"
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions},0))::float/86400 ;;
    value_format: "m:ss"
    group_label: "Traffic Metrics"
  }

  measure: total_users {
    type: sum
    sql: ${users} ;;
    label: "Users"
    group_label: "Traffic Metrics"
  }

  measure: total_new_users {
    type: sum
    sql: ${newusers} ;;
    label: "New Users"
    group_label: "Traffic Metrics"
  }

  measure: percent_new_users {
    label: "New User Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    type: sum
    group_label: "Traffic Metrics"
    sql: ${pageviews} ;;
    label: "Pageviews"
  }

  measure: pages_per_session {
    label: "Pages per Session"
    group_label: "Traffic Metrics"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0);;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    type: sum
    group_label: "Traffic Metrics"
    sql: ${bounces} ;;
    label: "Bounces"
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_bounces}/nullif(${total_sessions}, 0);;
    value_format_name: percent_0
  }

  ### Google Analytics  Goals ###

  measure: total_subscription_confirmations {
    type: sum
    sql: ${subscription_confirmation} ;;
    label: "Subscription Confirmations"
    group_label: "Website Goals"
  }

  measure: total_pdp_views {
    type: sum
    sql: ${pdp_view} ;;
    label: "PDP Views"
    group_label: "Website Goals"
  }

  measure: total_checkout_completes {
    type: sum
    sql: ${checkout_complete} ;;
    label: "Checkout Completes"
    group_label: "Website Goals"
  }

  measure: total_account_creates {
    type: sum
    sql: ${account_create} ;;
    label: "Account Creates"
    group_label: "Website Goals"
  }
}
