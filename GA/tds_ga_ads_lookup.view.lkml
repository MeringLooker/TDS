view: tds_ga_ads_lookup {
  sql_table_name: public.tds_ga_ads_lookup ;;

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}.creative_id ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }
}
