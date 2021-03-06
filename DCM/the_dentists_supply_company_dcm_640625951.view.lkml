view: tds_dcm_640625951 {
  sql_table_name: public."tds_dcm_640625951" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Join Ids ####
  dimension: dcm_join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'|| ${placement_id}||';'||${creative_id}||';'|| ${ad_id} ;;
  }


#### Dimensions Added via LookML ####

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

  dimension: tds_campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${campaign} ;;
  }
  dimension: tds_placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${placement} ;;
  }

######## Dimensions go below ########

  dimension: __id {
    hidden: yes
    type: string
    sql: ${TABLE}.__id ;;
  }

  dimension: __report {
    hidden: yes
    type: number
    sql: ${TABLE}.__report ;;
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


  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

#   dimension: creative_name {
#     type: string
#     group_label: "Client Dimensions"
#     sql:
#       CASE
#         when ${creative} ILIKE '%UPDATE%' then 'UPDATE'
#         ELSE ${creative}
#         END;;
#   }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
      ELSE 'Uncategorized'
      END;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}."creative id" ;;
  }

  dimension_group: date {
    type: time
    label: ""
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




  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    hidden: yes
    sql: ${TABLE}."placement id" ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "DCM Dimensions"
    label: "Channel"
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
    hidden: yes
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    group_label: "DCM Dimensions"
    sql: ${TABLE}."site (dcm)" ;;
  }

#   dimension: vnv_layer {
#     type: string
#     group_label: "Client Dimensions"
#     label: "VNV Objective"
#     sql:
#       CASE
#         WHEN ${campaign} = 'VNV FY20 Objective 4 (Group)' then 'Group'
#         WHEN ${campaign} = 'VNV FY20 Objective 2 (Engage)' then 'Engage'
#         WHEN ${campaign} = 'VNV FY20 Objective #3 (Impact)' then 'Impact'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Viant' then 'Group'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Afar Media, LLC 1' then 'Impact'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Sojern' then 'Engage'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Refinery 29 1' then 'Engage'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Architectural Digest' then 'Impact'
#         WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Smart Meetings 1' then 'Group'
#         ELSE 'Uncategorized'
#         END
#         ;;
#   }


#   dimension: fiscal_year {
#     type: string
#     group_label: "Client Dimensions"
#     label: "Fiscal Year"
#     sql:
#       CASE
#         WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
#         ELSE 'Uncategorized'
#         END
#         ;;
#   }

#   dimension: formatted_device {
#     type: string
#     label: "Device Type"
#     group_label: "DCM Dimensions"
#     sql:
#       CASE
#         WHEN ${platform_type} ILIKE '%mobile%' THEN 'Mobile'
#         ELSE ${platform_type}
#         END
#         ;;
#   }

######### MEASURES ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.impressions ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Clicks"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.clicks ;;
  }

  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Measureable Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."active view: measurable impressions";;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Viewable Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Total Cost"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."media cost" ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversions {
    hidden: yes
    label: "Total Conversions"
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."total conversions" ;;
  }

  measure: total_revenue {
    hidden: yes
    label: "Total Revenue"
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."total revenue" ;;
    value_format_name: usd
  }

  measure: viewthrough_conversions {
    label: "View Through Conversions"
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."view-through conversions" ;;
  }

  measure: viewthrough_revenue {
    hidden: yes
    label: "View Through Revenue"
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."view-through revenue" ;;
  }
}
