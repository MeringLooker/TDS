view: tds_linkedin_ {
  sql_table_name: public.tds_linkedin_ ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: accountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.accountid ;;
  }

  dimension: actionclicks {
    type: number
    sql: ${TABLE}.actionclicks ;;
  }

  dimension: adunitclicks {
    type: number
    sql: ${TABLE}.adunitclicks ;;
  }

  dimension: cardclicks {
    type: number
    sql: ${TABLE}.cardclicks ;;
  }

  dimension: cardimpressions {
    type: number
    sql: ${TABLE}.cardimpressions ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: commentlikes {
    type: number
    sql: ${TABLE}.commentlikes ;;
  }

  dimension: comments {
    type: number
    sql: ${TABLE}.comments ;;
  }

  dimension: companypageclicks {
    type: number
    sql: ${TABLE}.companypageclicks ;;
  }

  dimension: conversionvalueinlocalcurrency {
    type: number
    sql: ${TABLE}.conversionvalueinlocalcurrency ;;
  }

  dimension: costinlocalcurrency {
    type: number
    sql: ${TABLE}.costinlocalcurrency ;;
  }

  dimension: costinusd {
    type: number
    sql: ${TABLE}.costinusd ;;
  }

  dimension_group: enddate {
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
    sql: ${TABLE}.enddate ;;
  }

  dimension: externalwebsiteconversions {
    type: number
    sql: ${TABLE}.externalwebsiteconversions ;;
  }

  dimension: externalwebsitepostclickconversions {
    type: number
    sql: ${TABLE}.externalwebsitepostclickconversions ;;
  }

  dimension: externalwebsitepostviewconversions {
    type: number
    sql: ${TABLE}.externalwebsitepostviewconversions ;;
  }

  dimension: follows {
    type: number
    sql: ${TABLE}.follows ;;
  }

  dimension: fullscreenplays {
    type: number
    sql: ${TABLE}.fullscreenplays ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: landingpageclicks {
    type: number
    sql: ${TABLE}.landingpageclicks ;;
  }

  dimension: leadgenerationmailcontactinfoshares {
    type: number
    sql: ${TABLE}.leadgenerationmailcontactinfoshares ;;
  }

  dimension: leadgenerationmailinterestedclicks {
    type: number
    sql: ${TABLE}.leadgenerationmailinterestedclicks ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension: oneclickleadformopens {
    type: number
    sql: ${TABLE}.oneclickleadformopens ;;
  }

  dimension: oneclickleads {
    type: number
    sql: ${TABLE}.oneclickleads ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  dimension: otherengagements {
    type: number
    sql: ${TABLE}.otherengagements ;;
  }

  dimension: pivot {
    type: string
    sql: ${TABLE}.pivot ;;
  }

  dimension: pivot_value_cost_type {
    type: string
    sql: ${TABLE}.pivot_value_cost_type ;;
  }

  dimension: pivot_value_creative_selection {
    type: string
    sql: ${TABLE}.pivot_value_creative_selection ;;
  }

  dimension: pivot_value_id {
    type: number
    sql: ${TABLE}.pivot_value_id ;;
  }

  dimension: pivot_value_name {
    type: string
    sql: ${TABLE}.pivot_value_name ;;
  }

  dimension: pivot_value_objective_type {
    type: string
    sql: ${TABLE}.pivot_value_objective_type ;;
  }

  dimension: pivot_value_optimization_target_type {
    type: string
    sql: ${TABLE}.pivot_value_optimization_target_type ;;
  }

  dimension: pivot_value_type {
    type: string
    sql: ${TABLE}.pivot_value_type ;;
  }

  dimension: pivotvalue {
    type: string
    sql: ${TABLE}.pivotvalue ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension_group: startdate {
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

  dimension: texturlclicks {
    type: number
    sql: ${TABLE}.texturlclicks ;;
  }

  dimension: totalengagements {
    type: number
    sql: ${TABLE}.totalengagements ;;
  }

  dimension: videocompletions {
    type: number
    sql: ${TABLE}.videocompletions ;;
  }

  dimension: videofirstquartilecompletions {
    type: number
    sql: ${TABLE}.videofirstquartilecompletions ;;
  }

  dimension: videomidpointcompletions {
    type: number
    sql: ${TABLE}.videomidpointcompletions ;;
  }

  dimension: videostarts {
    type: number
    sql: ${TABLE}.videostarts ;;
  }

  dimension: videothirdquartilecompletions {
    type: number
    sql: ${TABLE}.videothirdquartilecompletions ;;
  }

  dimension: videoviews {
    type: number
    sql: ${TABLE}.videoviews ;;
  }

  dimension: viralcardclicks {
    type: number
    sql: ${TABLE}.viralcardclicks ;;
  }

  dimension: viralcardimpressions {
    type: number
    sql: ${TABLE}.viralcardimpressions ;;
  }

  dimension: viralclicks {
    type: number
    sql: ${TABLE}.viralclicks ;;
  }

  dimension: viralcomments {
    type: number
    sql: ${TABLE}.viralcomments ;;
  }

  dimension: viralcompanypageclicks {
    type: number
    sql: ${TABLE}.viralcompanypageclicks ;;
  }

  dimension: viralexternalwebsiteconversions {
    type: number
    sql: ${TABLE}.viralexternalwebsiteconversions ;;
  }

  dimension: viralexternalwebsitepostclickconversions {
    type: number
    sql: ${TABLE}.viralexternalwebsitepostclickconversions ;;
  }

  dimension: viralexternalwebsitepostviewconversions {
    type: number
    sql: ${TABLE}.viralexternalwebsitepostviewconversions ;;
  }

  dimension: viralfollows {
    type: number
    sql: ${TABLE}.viralfollows ;;
  }

  dimension: viralfullscreenplays {
    type: number
    sql: ${TABLE}.viralfullscreenplays ;;
  }

  dimension: viralimpressions {
    type: number
    sql: ${TABLE}.viralimpressions ;;
  }

  dimension: virallandingpageclicks {
    type: number
    sql: ${TABLE}.virallandingpageclicks ;;
  }

  dimension: virallikes {
    type: number
    sql: ${TABLE}.virallikes ;;
  }

  dimension: viraloneclickleadformopens {
    type: number
    sql: ${TABLE}.viraloneclickleadformopens ;;
  }

  dimension: viraloneclickleads {
    type: number
    sql: ${TABLE}.viraloneclickleads ;;
  }

  dimension: viralotherengagements {
    type: number
    sql: ${TABLE}.viralotherengagements ;;
  }

  dimension: viralshares {
    type: number
    sql: ${TABLE}.viralshares ;;
  }

  dimension: viraltotalengagements {
    type: number
    sql: ${TABLE}.viraltotalengagements ;;
  }

  dimension: viralvideocompletions {
    type: number
    sql: ${TABLE}.viralvideocompletions ;;
  }

  dimension: viralvideofirstquartilecompletions {
    type: number
    sql: ${TABLE}.viralvideofirstquartilecompletions ;;
  }

  dimension: viralvideomidpointcompletions {
    type: number
    sql: ${TABLE}.viralvideomidpointcompletions ;;
  }

  dimension: viralvideostarts {
    type: number
    sql: ${TABLE}.viralvideostarts ;;
  }

  dimension: viralvideothirdquartilecompletions {
    type: number
    sql: ${TABLE}.viralvideothirdquartilecompletions ;;
  }

  dimension: viralvideoviews {
    type: number
    sql: ${TABLE}.viralvideoviews ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pivot_value_name]
  }
}
