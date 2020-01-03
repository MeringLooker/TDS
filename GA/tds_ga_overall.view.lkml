view: tds_ga_overall {
  sql_table_name: public.tds_ga_overall ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Dimensions ####

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

  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
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
  dimension: __sampled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.__sampled ;;
  }

  dimension: campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaigns {
    type: string
    sql: CASE
      WHEN ${campaign} ilike '%MC%'
        THEN 'Mering'
      WHEN ${campaign} ilike '%TDSC%'
        Then 'Mering'
      ELSE ${campaign}
    END;;
  }

  dimension: channelgrouping {
    label: "Default Channel Grouping"
    type: string
    sql: ${TABLE}.channelgrouping ;;
  }

  dimension: devicecategory {
    label: "Device Category"
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    label: "Source/Medium"
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: Phase {
    type: string
    sql: CASE
      WHEN  ${region} ilike '%Alabama%' THEN  '3'
      WHEN  ${region} ilike '%Alaska%'  THEN  '5'
      WHEN  ${region} ilike '%Arizona%' THEN  '1'
      WHEN  ${region} ilike '%Arkansas%'  THEN  '4'
      WHEN  ${region} ilike '%California%'  THEN  '1'
      WHEN  ${region} ilike '%Colorado%'  THEN  '1'
      WHEN  ${region} ilike '%Connecticut%' THEN  '4'
      WHEN  ${region} ilike '%Delaware%'  THEN  '4'
      WHEN  ${region} ilike '%Florida%' THEN  '5'
      WHEN  ${region} ilike '%Georgia%' THEN  '4'
      WHEN  ${region} ilike '%Idaho%' THEN  '1'
      WHEN  ${region} ilike '%Hawaii%'  THEN  '5'
      WHEN  ${region} ilike '%Illinois%'  THEN  '2'
      WHEN  ${region} ilike '%Indiana%' THEN  '4'
      WHEN  ${region} ilike '%Iowa%'  THEN  '4'
      WHEN  ${region} ilike '%Kansas%'  THEN  '4'
      WHEN  ${region} ilike '%Kentucky%'  THEN  '3'
      WHEN  ${region} ilike '%Louisiana%' THEN  '4'
      WHEN  ${region} ilike '%Maine%' THEN  '4'
      WHEN  ${region} ilike '%Maryland%'  THEN  '4'
      WHEN  ${region} ilike '%Massachusetts%' THEN  '4'
      WHEN  ${region} ilike '%Michigan%'  THEN  '3'
      WHEN  ${region} ilike '%Minnesota%' THEN  '4'
      WHEN  ${region} ilike '%Mississippi%' THEN  '4'
      WHEN  ${region} ilike '%Missouri%'  THEN  '3'
      WHEN  ${region} ilike '%Montana%' THEN  '1'
      WHEN  ${region} ilike '%Nebraska%'  THEN  '4'
      WHEN  ${region} ilike '%Nevada%'  THEN  '1'
      WHEN  ${region} ilike '%New Hampshire%' THEN  '4'
      WHEN  ${region} ilike '%New Jersey%'  THEN  '4'
      WHEN  ${region} ilike '%New Mexico%'  THEN  '1'
      WHEN  ${region} ilike '%New York%'  THEN  '2'
      WHEN  ${region} ilike '%North Carolina%'  THEN  '3'
      WHEN  ${region} ilike '%North Dakota%'  THEN  '4'
      WHEN  ${region} ilike '%Ohio%'  THEN  '4'
      WHEN  ${region} ilike '%Oklahoma%'  THEN  '4'
      WHEN  ${region} ilike '%Oregon%'  THEN  '1'
      WHEN  ${region} ilike '%Pennsylvania%'  THEN  '4'
      WHEN  ${region} ilike '%Rhode Island%'  THEN  '4'
      WHEN  ${region} ilike '%South Carolina%'  THEN  '3'
      WHEN  ${region} ilike '%South Dakota%'  THEN  '4'
      WHEN  ${region} ilike '%Tennessee%' THEN  '3'
      WHEN  ${region} ilike '%Texas%' THEN  '2'
      WHEN  ${region} ilike '%Utah%'  THEN  '1'
      WHEN  ${region} ilike '%Vermont%' THEN  '4'
      WHEN  ${region} ilike '%Virginia%'  THEN  '3'
      WHEN  ${region} ilike '%Washington%'  THEN  '1'
      WHEN  ${region} ilike '%West Virginia%' THEN  '3'
      WHEN  ${region} ilike '%Wisconsin%' THEN  '4'
      WHEN  ${region} ilike '%Wyoming%' THEN  '4'
      ELSE 'Unattributed Region'
      END
  ;;
  }

#### Measures ####

  measure: goal4completions {
    group_label: "Transactional"
    label: "Account Creations"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal4completions ;;
  }

  measure: newusers {
    label: "New Users"
    group_label: "Onsite"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.newusers ;;
  }

  measure: sessionduration {
    group_label: "Onsite"
    hidden: yes
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

  measure: transactionsrevenue {
    group_label: "Transactional"
    label: "Revenue"
    value_format_name: usd_0
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactionrevenue ;;
  }

  measure: transactions {
    group_label: "Transactional"
    label: "Orders"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactions ;;
  }

  measure: users {
    group_label: "Onsite"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.users ;;
  }

  measure: avg_time_on_site {
    group_label: "Onsite"
    label: "Avg. TOS"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessionduration/nullif(${TABLE}.sessions,0) ;;
    value_format: "0.##"
  }

  measure: newuserrate {
    label: "New User Rate"
    group_label: "Onsite"
    type: number
    sql: 1.0*${newusers}/nullif(${users}, 0);;
    value_format_name: percent_0
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
