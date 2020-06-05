view: tds_sem_ga_view {
  sql_table_name: public.tds_sem_ga_view ;;

#### Join id ####
  dimension: ga_join_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

###### Dimensions added to this table via LookML #######

  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2018-11-01' AND '2019-12-31' THEN 'FY 18/19'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: publisher {
    group_label: "AdWords Dimensions"
    type: string
    sql: 'SEM' ;;
  }


  dimension: tds_placement {
    type: string
    label: "Campaign Placement"
    hidden: yes
    group_label: "Client Dimensions"
    sql: ${ad_group};;
  }

  dimension: tds_campaign {
    type: string
    label: "Campaign Name "
    hidden: yes
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} = 'MC_TDSC SEM Brands' then 'Brand Search'
        when ${campaign} = 'MC_TDSC SEM Dynamic Ads'  then 'Dynamic Ads Search'
        when ${campaign} = 'MC_TDSC SEM Product Categories'  then 'Product Categories Search'
        when ${campaign} = 'MC_TDSC SEM Trademark'  then 'Trademark Search'
      else  'Uncategorized'
      end;;
  }

#### Dimensions ####
  dimension: account {
    group_label: "AdWords Dimensions"
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: account_creates {
    hidden: yes
    type: number
    sql: ${TABLE}.account_creates ;;
  }

  dimension: ad_group {
    group_label: "AdWords Dimensions"
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
    group_label: "AdWords Dimensions"
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
    sql: ${TABLE}.day ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: newusers {
    hidden: yes
    type: number
    sql: ${TABLE}.newusers;;
  }

  dimension: pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews;;
  }

  dimension: pdp_views {
    hidden: yes
    type: number
    sql: ${TABLE}.pdp_views;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname;;
  }

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue;;
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

#### SEM Measures ####

  measure: total_impressions {
    type: sum
    group_label: "AdWords Reporting"
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    group_label: "AdWords Reporting"
    label: "Clicks"
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type: sum
    group_label: "AdWords Reporting"
    label: "Media Spend"
    value_format_name: usd
    sql: ${cost}/1000000.00 ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    group_label: "AdWords Reporting"
    value_format_name: percent_1
    sql: 1.0*${total_clicks}/nullif(${total_impressions},0) ;;
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
    sql: 1.0*${total_newusers}/nullif(${total_users}, 0);;
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
    sql: ${total_revenue}/nullif(${total_transactions}, 0) ;;
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
    drill_fields: [reportname]
  }
}
