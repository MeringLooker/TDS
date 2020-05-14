view: pdt_sem {
  derived_table: {
    explore_source: tds_sem {
      column: publisher {field: tds_sem_ga_ga_view.publisher}
      column: campaign {field: tds_sem_ga_view.tds_campaign}
      column: market {field: tds_sem_ga_view.tds_market}
      column: layer {field: tds_sem_ga_view.tds_layer}
      column: placement {field: tds_sem_ga_view.tds_placement}
      column: creative_name {field: tds_sem_ga_view.creative_name}
      column: date {field: tds_sem_ga_view.day_date}
      column: week {field: tds_sem_ga_view.day_week}
      column: month {field: tds_sem_ga_view.day_month}
      column: total_impressions {field: tds_sem_ga_view.total_impressions}
      column: total_clicks {field: tds_sem_ga_view.total_clicks}
      column: total_views {field: tds_sem_ga_view.total_views}
      column: total_completes {field: tds_sem_ga_view.total_completes}
      column: total_cost {field: tds_sem_ga_view.total_cost}
      column: total_sessions {field: tds_sem_ga_view.total_sessions}
      column: total_session_duration {field: tds_sem_ga_view.total_session_duration}
    }
#     datagroup_trigger: tds_can_digital_datagroup
#     distribution_style: all
  }

  dimension: publisher {
    type: string
  }

  dimension: campaign {
    type: string
  }

  dimension: market {
    type: string
  }

  dimension: layer {
    type: string
  }

  dimension: date {
    type: date
  }

  dimension: week {
    type: date
  }

  dimension: month {
    type: date
  }

  dimension: total_impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_views {
    type: number
  }

  dimension: total_cost {
    type: number
    value_format_name: usd
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
