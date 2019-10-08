view: tdsc_ga_adwords {
  sql_table_name: public.tdsc_ga_adwords ;;


#### Primary Key ####

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#### Join Id ####

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'||${adwordsadgroupid} ;;
}

#### Dimensions ####

  dimension: __sampled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.__sampled ;;
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

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: adwordscampaignid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordscampaignid ;;
  }

  dimension: adgroup {
    type: string
    sql: ${TABLE}.adgroup ;;
  }

  dimension: adwordsadgroupid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }


  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }


#### Measures ####

 measure: goal4completions {
    label: "Account Creations"
    type: number
    sql: ${TABLE}.goal4completions ;;
  }

  measure: newusers {
    type: number
    sql: ${TABLE}.newusers ;;
  }

  measure: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  measure: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  measure: transactionrevenue {
    type: number
    sql: ${TABLE}.transactionrevenue ;;
  }

  measure: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  measure: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

}
