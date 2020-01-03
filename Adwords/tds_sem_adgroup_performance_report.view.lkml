view: tds_sem_adgroup_performance_report {
  sql_table_name: public.tds_sem_adgroup_performance_report ;;
  drill_fields: [id]

 #### Primary Key ####

  dimension: id {
hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Join Id ####

  dimension: sem_join_id {
    hidden: yes
    type: string
    sql: ${day_date}||'|'||${ad_group_id}  ;;
  }

  #### Dimensions ####

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

  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2018-11-01' AND '2020-12-31' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }


  dimension_group: __senttime {
    type: time
    hidden: yes
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

  dimension: account {
    label: "Account"
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: campaign {
    label: "Campaign"
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: ad_group {
    label: "Ad Group"
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

  dimension: campaign_state {
    hidden: yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: device {
    label: "Device"
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }


#### Measures ####

  measure: avg__position {
    drill_fields: [adwords*, avg__position]
    type: average
    sql: ${TABLE}."avg. position" ;;
 }


  measure: clicks {
    drill_fields: [adwords*, clicks]
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: conversions {
    hidden: yes
    type: sum
    sql: ${TABLE}.conversions ;;
  }

  measure: cost {
    drill_fields: [adwords*, cost]
    type: sum
    value_format_name: usd
    sql: ${TABLE}.cost/1000000.00 ;;
  }

  measure: impressions {
    drill_fields: [adwords*, impressions]
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: click_through_rate {
    label: "CTR"
    drill_fields: [adwords*, click_through_rate]
    type: number
    value_format_name: percent_1
    sql: 1.0*${clicks}/nullif(${impressions},0) ;;
  }

  measure: search_impr__share {
    drill_fields: [adwords*, search_impr__share]
    type: string
    sql: ${TABLE}."search impr. share" ;;
  }

  measure: search_lost_is_rank {
    drill_fields: [adwords*, search_lost_is_rank]
    type: string
    sql: ${TABLE}."search lost is (rank)" ;;
  }

  measure: total_conv__value {
    hidden: yes
    type: sum
    sql: ${TABLE}."total conv. value" ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, reportname]
  }

set: adwords  {
 fields: [campaign, ad_group, device]

}
}
