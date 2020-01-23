view: tds_ga_goals {
  sql_table_name: public.tds_ga_goals ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Join IDs ####
  dimension: ga_goals_join_id {
    type: string
    sql: ${date_date}||'|'||${adwordsadgroupid}  ;;
  }

  dimension: ga_dcm_goals_join_id {
    type: string
    sql: ${date_date}||'|'||${keyword}  ;;
  }

dimension: ga_fb_goals_join_id {
  type: string
  sql: ${date_date}||'|'||${keyword}  ;;
}

  dimension: ga_linkedin_goals_join_id {
    type: string
    sql: ${date_date}||'|'||${linkedin_keyword}  ;;
  }

  dimension: ga_email_goals_join_id {
    type: string
    sql: ${date_date}||'|'||${campaign}  ;;
  }


#### Dimensions #####


  dimension: __sampled {
    type: yesno
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
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
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: date {
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

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

dimension: linkedin_keyword {
  type: string
  sql:
    CASE
      WHEN ${keyword} = 'LI_Sales_Skills_WorkTogether_Smiles' Then 'LI_Sales_Skills'
      WHEN ${keyword} = 'LI_Sales_JobTitles_StartSaving_Smiles' Then 'LI_Sales_JobTitles'
      WHEN ${keyword} = 'LI_Sales_Skills_WorkTogether_Smiles' Then 'LI_Sales_Skills'
      WHEN ${keyword} = 'LI_Sales_Groups_StartSaving_Smiles' Then 'LI_Sales_Groups'
      WHEN ${keyword} = 'LI_Sales_Skills_StartSaving_Smiles' Then 'LI_Sales_Skills'
      WHEN ${keyword} = 'LI_Sales_Skills_WorkTogether_BigSavings' Then 'LI_Sales_Skills'
      WHEN ${keyword} = 'LI_Sales_Skills_StartSaving_BigSavings' Then 'LI_Sales_Skills'
      WHEN ${keyword} = 'LI_Sales_JobTitles_WorkTogether_Smiles' Then 'LI_Sales_JobTitles'
      WHEN ${keyword} = 'LI_Sales_JobTitles_WorkTogether_BigSavings' Then 'LI_Sales_JobTitles'
      WHEN ${keyword} = 'LI_Sales_Groups_WorkTogether_BigSavings' Then 'LI_Sales_Groups'
      WHEN ${keyword} = 'LI_Sales_Groups_StartSaving_BigSavings' Then 'LI_Sales_Groups'
      WHEN ${keyword} = 'LI_Sales_JobTitles_StartSaving_BigSavings' Then 'LI_Sales_JobTitles'
      WHEN ${keyword} = 'LI_Sales_Groups_WorkTogether' Then 'LI_Sales_Groups'
      WHEN ${keyword} = 'LI_Sales_Skills_WorkTogether' Then 'LI_Sales_Skills'
      END
  ;;
}

  dimension: region {
    group_label: "Transactional"
    type: string
    map_layer_name:  us_states
    sql: ${TABLE}.region ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
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

#### MEASURES ####

  measure: goal1completions {
    group_label: "Transactional"
    label: "Checkout Complete"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal1completions ;;
  }

  measure: goal2completions {
    group_label: "Transactional"
    label: "Subscription Order"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal2completions ;;
  }

  measure: goal3completions {
    label: "PDP View"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal3completions ;;
  }

  measure: goal4completions {
    group_label: "Transactional"
    label: "Account Creations"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal4completions ;;
  }

  measure: goal6completions {
    label: "Account Create - Funnel"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal6completions ;;
  }

  measure: transactions {
    group_label: "Transactional"
    label: "Orders"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactions ;;
  }

  measure: transactionsrevenue {
    group_label: "Transactional"
    label: "Revenue"
    value_format_name: usd_0
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.transactionrevenue ;;
  }

  measure: dcm_roas {
    group_label: "Transactional"
    label: "ROAS"
    type: number
    sql: ${transactionsrevenue}/nullif(${the_dentists_supply_company_dcm_640625951.total_media_cost}, 0) ;;
    value_format_name: usd
  }

  measure: sem_roas {
    group_label: "Transactional"
    label: "ROAS"
    type: number
    sql: ${transactionsrevenue}/nullif(${tds_sem_adgroup_performance_report.cost}, 0) ;;
    value_format_name: usd
  }

  measure: gdn_roas {
    group_label: "Transactional"
    label: "ROAS"
    type: number
    sql: ${transactionsrevenue}/nullif(${tds_gdn_adgroup_performance_report.cost}, 0) ;;
    value_format_name: usd
  }

  measure: fb_roas {
    group_label: "Transactional"
    label: "ROAS"
    type: number
    sql: ${transactionsrevenue}/nullif(${tds_fb_view.total_spend}, 0) ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
