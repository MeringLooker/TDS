view: tds_gdn_ga_view {
  sql_table_name: public.tds_gdn_ga_view ;;

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

  dimension: tds_campaign {
    hidden: yes
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} = 'GDN_TDSC_FY20_ConversionLayer_Prospecting_CustomIntent_Responsive_Clicks' THEN 'GDN TDSC FY20 ConversionLayer Prospecting CustomIntent Responsive Clicks'
        WHEN ${campaign} = 'GDN_TDSC_FY20_ConversionLayer_Prospecting_Lookalike_Responsive_Clicks' THEN 'GDN TDSC FY20 ConversionLayer Prospecting Lookalike Responsive Clicks'
        WHEN ${campaign} = 'GDN_TDSC_FY20_ConversionLayer_Retargeting_CartAbandoners_Responsive_Clicks' THEN 'GDN TDSC FY20 ConversionLayer Retargeting CartAbandoners Responsive Clicks'
        WHEN ${campaign} = 'GDN_TDSC_FY20_ConversionLayer_Retargeting_LoggedIn_Responsive_Clicks' THEN 'GDN TDSC FY20 ConversionLayer Retargeting LoggedIn_Responsive Clicks'
        WHEN ${campaign} = 'GDN_TDSC_FY20_ConversionLayer_Retargeting_Visitors_Responsive_Clicks' THEN 'GDN TDSC FY20 ConversionLayer Retargeting Visitors Responsive Clicks'
        WHEN ${campaign} = 'TDSC - Abandon Cart - GDN Responsive - CA - FY19' THEN 'TDSC - Abandon Cart - GDN Responsive - CA - FY19'
        WHEN ${campaign} = 'TDSC - Abandon Cart - GDN Responsive - FY19' THEN 'TDSC - Abandon Cart - GDN Responsive - FY19'
        WHEN ${campaign} = 'TDSC - Categories - GDN Carousel - FY19' THEN 'TDSC - Categories - GDN Carousel - FY19'
        WHEN ${campaign} = 'TDSC - Logged In - GDN Responsive -  CA - FY19' THEN 'TDSC - Logged In - GDN Responsive -  CA - FY19'
        WHEN ${campaign} = 'TDSC - Logged In - GDN Responsive - FY19' THEN 'TDSC - Logged In - GDN Responsive - FY19'
        WHEN ${campaign} = 'TDSC - Products - GDN Carousel - FY19' THEN 'TDSC - Products - GDN Carousel - FY19'
        WHEN ${campaign} = 'TDSC - Prospecting - GDN Responsive - CA - FY19' THEN 'TDSC - Prospecting - GDN Responsive - CA - FY19'
        WHEN ${campaign} = 'TDSC - Prospecting - GDN Responsive - FY19' THEN 'TDSC - Prospecting - GDN Responsive - FY19'
        WHEN ${campaign} = 'TDSC - Visitors - GDN Responsive - CA - FY19' THEN 'TDSC - Visitors - GDN Responsive - CA - FY19'
        WHEN ${campaign} = 'TDSC - Visitors - GDN Responsive - FY19' THEN 'TDSC - Visitors - GDN Responsive - FY19'
        WHEN ${campaign} = 'zzz - TDSC - Abandon Cart - GDN Responsive - FY19' THEN 'zzz - TDSC - Abandon Cart - GDN Responsive - FY19'
        WHEN ${campaign} = 'zzz - TDSC - Logged In - GDN Responsive - FY19' THEN 'zzz - TDSC - Logged In - GDN Responsive - FY19'
        WHEN ${campaign} = 'zzz - TDSC - Visitors - GDN Responsive - FY19' THEN 'zzz - TDSC - Visitors - GDN Responsive - FY19'
        END
;;
  }

#     dimension: tds_placement {
#       type: string
#       label: "Campaign Placement"
#       group_label: "Client Dimensions"
#       sql:
#       case
#         when ${ad_group} ilike '%Responsive_Clicks%' then 'Responsive Clicks'
#         when ${ad_group} ilike '%Responsive A%' then 'Responsive A'
#         when ${ad_group} ilike '%Responsive B%' then 'Responsive B'
#         when ${ad_group} ilike '%GDN Carousel%' then 'GDN Carousel'
#         ELSE 'Uncategorized'
#         end
#         ;;
#     }

  dimension: tds_placement {
    hidden: yes
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql: ${ad_group}
      ;;
  }


  dimension: tds_audience {
    hidden: yes
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike '%CustomIntent%' then 'Custom Intent'
        when ${campaign} ilike '%Lookalike%' then 'Lookalike'
        when ${campaign} ilike '%CartAbandoners%' then 'Cart Abandoners'
        when ${campaign} ilike '%Abandon Cart%' then 'Cart Abandoners'
        when ${campaign} ilike '%LoggedIn%' then 'Logged In'
        when ${campaign} ilike '%Logged In%' then 'Logged In'
        when ${campaign} ilike '%Visitor%'   then 'Visitor'
        when ${campaign} ilike '%Visitors%'  then 'Visitor'
        when ${campaign} ilike '%Categories%' then 'Categories'
        when ${campaign} ilike '%Products%' then 'Products'
        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: tds_layer {
    hidden: yes
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike '%ConversionLayer%' then 'Conversion Layer'
        when ${campaign} ilike '%Prospecting%' then 'Prospecting'
        ELSE 'Uncategorized'
        end
        ;;
  }

#### Dimensions ####
  dimension: account {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: account_creates {
    hidden: yes
    type: number
    sql: ${TABLE}.account_creates;;
  }

  dimension: ad_group {
    type: string
    group_label: "AdWords Dimensions"
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
    group_label: "AdWords Dimensions"
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

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
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
    sql: ${TABLE}.pdp_views;;
  }

  dimension: publisher {
    type: string
    group_label: "AdWords Dimensions"
    sql: 'GDN' ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
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
    sql: ${TABLE}.subscrpition_orders;;
  }

  dimension: transactions {
    hidden: yes
    type: number
    sql: ${TABLE}.transactions;;
  }

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
  }

#### GDN Measures ####
  measure: total_impressions {
    type: sum
    group_label:"AdWords Reporting"
    label: " Impressions"
    sql: ${impressions} ;;
  }

  measure: total_cost {
    type: sum
    group_label: "AdWords Reporting"
    label: "Media Spend"
    value_format_name: usd
    sql: ${cost}/1000000.00 ;;
  }

  measure: total_clicks {
    type: sum
    group_label: "AdWords Reporting"
    label: "Clicks"
    sql: ${clicks} ;;
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
