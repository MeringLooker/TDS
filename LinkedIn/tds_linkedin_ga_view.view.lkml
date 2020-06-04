view: tds_linkedin_ga_view {
  sql_table_name: public.tds_linkedin_ga_view ;;

#### Primary Key ####
  dimension: linkedin_join_id {
    hidden: yes
    type: string
    sql: ${TABLE}.linkedin_join_id ;;
  }


#### Dimensions Added via LookML ####
  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
         WHEN ${date_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: campaign {
    group_label: "LinkedIn Dimensions"
    type: string
    sql:
      CASE
        WHEN ${pivot_value_name} = 'MC_TDSC_Sales_Skills' then 'Sales Skills'
        WHEN ${pivot_value_name} = 'FY19_TDSC_Sales_JobTitles' then 'Sales Job Titles'
        WHEN ${pivot_value_name} = 'FY19_TDSC_Sales_Groups' then 'Sales Groups'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: placement {
    group_label: "LinkedIn Dimensions"
    type: string
    sql:
      CASE
        WHEN ${pivot_value_name} = 'MC_TDSC_Sales_Skills' then 'Sales Skills'
        WHEN ${pivot_value_name} = 'FY19_TDSC_Sales_JobTitles' then 'Sales Job Titles'
        WHEN ${pivot_value_name} = 'FY19_TDSC_Sales_Groups' then 'Sales Groups'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: publisher {
    type: string
    group_label: "LinkedIn Dimensions"
    sql: 'LinkedIn' ;;
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
    sql: ${TABLE}.startdate ;;
  }

  dimension: pivot_value_name {
    hidden: yes
    type: string
    sql: ${TABLE}.pivot_value_name ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
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

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
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

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: sessionduration {
    hidden: yes
    type: number
    sql: ${TABLE}.sessionduration ;;
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

  dimension: subscrpition_orders {
    hidden: yes
    type: number
    sql: ${TABLE}.subscrpition_orders ;;
  }

  #### Measures ####

  measure: total_impressions {
    group_label: "LinkedIn Reporting"
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "LinkedIn Reporting"
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_cost {
    group_label: "LinkedIn Reporting"
    type: sum
    sql: ${cost} ;;
  }

  measure: total_users {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${users} ;;
  }

  measure: total_newusers {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${newusers} ;;
  }

  measure: total_pageviews {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${pageviews} ;;
  }

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum
    sql: ${sessions} ;;
  }

  measure: total_sessionduration {
    group_label: "Google Analytics Metrics"
    type: sum
    hidden: yes
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    sql: ${total_sessionduration}/nullif(${total_sessions},0) ;;
    value_format: "m:ss"
  }

  measure: total_account_creates {
    group_label: "Google Analytics Goals"
    type: sum
    sql: ${account_creates} ;;
  }

  measure: total_checkouts {
    group_label: "Google Analytics Goals"
    type: sum
    sql: ${checkouts} ;;
  }

  measure: total_pdp_views {
    group_label: "Google Analytics Goals"
    type: sum
    sql: ${pdp_views} ;;
  }

  measure: total_transactions {
    group_label: "Google Analytics Goals"
    type: sum
    sql: ${transactions} ;;
  }

  measure: total_revenue {
    group_label: "Google Analytics Goals"
    type: sum
    value_format_name: usd_0
    sql: ${revenue} ;;
  }

  measure: total_subscrpition_orders {
    group_label: "Google Analytics Goals"
    type: sum
    sql: ${subscrpition_orders} ;;
  }

  measure: click_through_rate {
    group_label: "LinkedIn Reporting"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    group_label: "LinkedIn Reporting"
    label: "CPC"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "LinkedIn Reporting"
    type: number
    label: "CPM"
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: newuserrate {
    label: "New User Rate"
    group_label: "Google Analytics Metrics"
    type: number
    sql: 1.0*${total_newusers}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: count {
    type: count
    drill_fields: [pivot_value_name]
  }
}
