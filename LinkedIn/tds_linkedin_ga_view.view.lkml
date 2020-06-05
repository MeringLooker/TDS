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
    label: "Impressions"
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "LinkedIn Reporting"
    label: "Clicks"
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_cost {
    group_label: "LinkedIn Reporting"
    label: "Media Spend"
    type: sum
    sql: ${cost} ;;
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
    sql: ${total_cost}/nullif(${total_account_creates}, 0) ;;
    value_format_name: usd
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [pivot_value_name]
  }
}
