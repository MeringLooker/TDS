view: tds_ga_behavior_view {
  sql_table_name: public.tds_ga_behavior_view ;;

  ## Primary Key ##

  dimension: behavior_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.behavior_join_id ;;
  }

  ## Dimensions Native to this Table ##

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  dimension: adwordsadgroupid {
    type: string
    label: "AdWords Ad Group ID"
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
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

  dimension: entrances {
    type: number
    hidden: yes
    sql: ${TABLE}.entrances ;;
  }

  dimension: exits {
    type: number
    hidden: yes
    sql: ${TABLE}.exits ;;
  }

  dimension: keyword {
    type: string
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.keyword ;;
  }

  dimension: pagetitle {
    type: string
    label: "Page Title"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.pagetitle ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: region {
    type: string
    description: "This can return values that reflect US states."
    map_layer_name: us_states
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.region ;;
  }

  dimension: sourcemedium {
    type: string
    label: "Source / Medium"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: timeonpage {
    type: number
    hidden: yes
    sql: ${TABLE}.timeonpage ;;
  }

  ### All Measures go Below ###


  measure: total_pageviews {
    type: sum
    group_label: "Page Metrics"
    sql: ${pageviews} ;;
    label: "Pageviews"
  }

  measure: total_time_on_page {
    type: sum
    hidden: yes
    sql: ${timeonpage} ;;
    group_label: "Page Metrics"
  }

  measure: avg_time_on_page {
    label: "Avg. TOP"
    type: number
    sql: (${total_time_on_page}/nullif(${total_pageviews},0))::float/86400 ;;
    value_format: "m:ss"
    group_label: "Page Metrics"
  }

  measure: total_exits {
    type: sum
    group_label: "Page Metrics"
    sql: ${exits} ;;
    label: "Exits"
  }

  measure: exit_rate {
    label: "Exit Rate"
    group_label: "Page Metrics"
    type: number
    sql: 1.0*${total_exits}/nullif(${total_pageviews}, 0);;
    value_format_name: percent_0
  }

  measure: total_bounces {
    type: sum
    group_label: "Page Metrics"
    sql: ${bounces} ;;
    label: "Bounces"
  }

  measure: total_entrances {
    type: sum
    group_label: "Page Metrics"
    sql: ${entrances} ;;
    label: "Entrances"
  }
}
