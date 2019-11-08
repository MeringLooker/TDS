view: tds_ga_onsite {
  sql_table_name: public.tds_ga_onsite ;;
  drill_fields: [id]

#### JOIN ID ####

  dimension: ga_onsite_join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'||${adwordsadgroupid}  ;;
  }

#### PRIMARY KEY ####

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### DIMENSIONS ####

  dimension: __sampled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.__sampled ;;
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

  dimension: adwordsadgroupid {
    group_label: "Onsite"
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: sourcemedium {
    group_label: "Onsite"
    hidden: yes
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: devicecategory {
    group_label: "Onsite"
    label: "Device Type"
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: keyword {
    group_label: "Onsite"
    hidden: yes
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: region {
    group_label: "Onsite"
    type: string
    sql: ${TABLE}.region ;;
  }

#### MEASURES ####

  measure: newusers {
    group_label: "Onsite"
   type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.newusers ;;
  }

  measure: pageviews {
    group_label: "Onsite"
   type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.pageviews ;;
  }

  measure: sessionduration {
    group_label: "Onsite"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessionduration ;;
  }

  measure: sessions {
    group_label: "Onsite"
   type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessions ;;
  }

  measure: avg_time_on_site {
    group_label: "Onsite"
    label: "Avg. TOS"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessionduration/nullif(${TABLE}.sessions,0) ;;
    value_format: "0.##"
  }


  measure: users {
    group_label: "Onsite"
   type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.users ;;
  }

  measure: count {
    group_label: "Onsite"
    type: count
    drill_fields: [id]
  }
}
