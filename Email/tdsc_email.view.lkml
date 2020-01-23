view: tdsc_email {
  sql_table_name: public.tdsc_email ;;
  drill_fields: [id]

#### Primary Key ####
  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  #### Join Id ####
  dimension: email_join_id {
    hidden: yes
    type: string
    sql: ${date_date}||'|'||${campaign} ;;
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
    sql: ${TABLE}.date ;;
  }

  dimension: campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign ;;
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

  dimension: subject {
    label: "Subject Line"
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: subject_t {
    hidden: yes
    type: string
    sql: ${TABLE}."subject (t)" ;;
  }

  dimension: __sheet {
    hidden: yes
    type: string
    sql: ${TABLE}.__sheet ;;
  }

  dimension: __state {
    hidden: yes
    type: string
    sql: ${TABLE}.__state ;;
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

  dimension: email_id {
    hidden: yes
    type: number
    sql: ${TABLE}.email_id ;;
  }

#### Measures ####
  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: ctr {
    label: "CTR"
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: impressions {
    type: string
    sql: ${TABLE}.impressions ;;
  }

  dimension: open {
    type: string
    sql: ${TABLE}.open ;;
  }

  dimension: opne_rate {
    type: string
    sql: ${TABLE}."opne rate" ;;
  }

  dimension: spam {
    type: number
    sql: ${TABLE}.spam ;;
  }

  dimension: unsubs {
    type: number
    sql: ${TABLE}.unsubs ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
