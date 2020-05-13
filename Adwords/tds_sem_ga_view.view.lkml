view: tds_sem_ga_view {
  sql_table_name: public.tds_sem_ga_view ;;

#### Dimensions ####

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: account_creates {
    hidden: yes
    type: number
    sql: ${TABLE}.account_creates ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    hidden: yes
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${TABLE}.adwords_join_id ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    hidden: yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: checkouts {
    hidden: yes
    type: number
    sql: ${TABLE}.checkouts ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension: ga_join_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: newusers {
    hidden: yes
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: pdp_views {
    hidden: yes
    type: number
    sql: ${TABLE}.pdp_views ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: sessionduration {
    hidden: yes
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
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

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
  }

#### Measures ####

  measure: total_checkouts {
    type: sum
    group_label: "Transactional"
    sql: ${checkouts} ;;
  }

  measure: total_clicks {
    type: sum
    group_label: "Delivery"
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type: sum
    group_label: "Delivery"
    value_format_name: usd
    sql: ${cost}/1000000.00 ;;
  }


  measure: total_impressions {
    type: sum
    group_label: "Delivery"
    sql: ${impressions} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    group_label: "Delivery"
    value_format_name: percent_1
    sql: 1.0*${clicks}/nullif(${impressions},0) ;;
  }

  measure: newuserrate {
    label: "New User Rate"
    group_label: "Onsite"
    type: number
    sql: 1.0*${newusers}/nullif(${users}, 0);;
    value_format_name: percent_0
    }

  measure: total_newusers {
    type: sum
    group_label: "Onsite"

    sql: ${newusers} ;;
  }

  measure: total_pageviews {
    type: sum
    group_label: "Onsite"

    sql: ${pageviews} ;;
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

  measure: total_sessionduration {
    type: sum
    group_label: "Onsite"
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    group_label: "Onsite"
    label: "Avg. TOS"
    type: number
    sql: ${total_sessionduration}/nullif(${total_sessions},0) ;;
    value_format: "m:ss"
  }

  measure: total_sessions {
    type: sum
    group_label: "Onsite"

    sql: ${sessions} ;;
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

  measure: total_users {
    type: sum
    group_label: "Onsite"

    sql: ${users} ;;
  }

  measure: count {
    type: count
    drill_fields: [reportname]
  }
}
