view: pdt_overall {
   derived_table: {
    sql:

    select * from ${pdt_sem.SQL_TABLE_NAME}
      union
    select * from ${pdt_gdn.SQL_TABLE_NAME}
    union
    select * from ${pdt_fb.SQL_TABLE_NAME}
    union
    select * from ${pdt_dcm.SQL_TABLE_NAME}
    union
    select * from ${pdt_linkedin.SQL_TABLE_NAME}
      ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${publisher}||'_'||${campaign}||'_'||${placement}||'_'||${date} ;;
  }

#### Dimensions below ####

  dimension: publisher {
    type:  string
    sql:  ${TABLE}.publisher ;;
#     drill_fields: [campaign,date,week]
  }

  dimension: campaign {
    type: string
#     hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: placement {
    type: string
#     hidden: yes
    sql: ${TABLE}.placement ;;
  }

  dimension: date {
    type:  date
    group_label: "Date"
    sql:  ${TABLE}.date ;;
  }

  dimension: fiscal_year {
    type:  string
#     hidden: yes
    sql:
      CASE
      WHEN ${date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: week {
    type:  date_week
    group_label: "Date"
#     drill_fields: [publisher,campaign]
    sql:  ${TABLE}.week ;;
  }

  dimension: month {
    type:  date_month
    group_label: "Date"
    sql:  ${TABLE}.month ;;
  }

  dimension: impressions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks{
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_clicks;;
  }

  dimension: cost {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: sessions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_session_duration ;;
  }

  dimension: checkouts {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_checkouts ;;
  }

  dimension: pdp_views {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_pdp_views ;;
  }

  dimension: revenue {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: subscrpition_orders {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_subscrpition_orders ;;
  }

  dimension: transactions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_transactions ;;
  }

  #### Measures below ####

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks  {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*(${total_clicks})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: total_spend  {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${cost};;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type:  number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000,0);;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    type: number
    label: "Avg. TOS"
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    sql: ${total_spend}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_checkouts {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${checkouts} ;;
  }

  measure: total_pdp_views {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${pdp_views} ;;
  }

  measure: total_revenue {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${revenue} ;;
    value_format_name: usd_0
  }

  measure: total_subscrpition_orders {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${subscrpition_orders} ;;
  }

  measure: total_transactions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${transactions} ;;
  }

}
