view: pdt_linkedin {
    derived_table: {
      explore_source: tds_linkedin{
        column: publisher {field: tds_linkedin_view.publisher}
        column: campaign {field: tds_linkedin_view.campaign}
        column: date {field: tds_linkedin_view.date_day}
        column: week {field: tds_linkedin_view.date_week}
        column: month {field: tds_linkedin_view.date_month}
        column: total_impressions {field: tds_linkedin_view.total_impressions}
        column: total_clicks {field: tds_linkedin_view.total_clicks}
        column: total_cost {field: tds_linkedin_view.total_spend}
        column: total_sessions {field: tds_ga_onsite.sessions}
        column: total_session_duration {field: tds_ga_onsite.sessionduration}
        column: total_checkouts {field: tds_ga_goals.goal1completions}
        column: total_pdp_views {field: tds_ga_goals.goal3completions}
        column: total_revenue {field: tds_ga_goals.transactionsrevenue}
        column:total_subscrpition_orders {field: tds_ga_goals.goal2completions}
        column:total_transactions {field:tds_ga_goals.transactions}
      }
      datagroup_trigger: tds_datagroup
      distribution_style: all
    }

    dimension: publisher {
      type: string
    }

    dimension: campaign {
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

    dimension: total_checkouts  {
      type:  number
    }

    dimension: total_pdp_views   {
      type:  number
    }

    dimension:total_revenue   {
      type:  number
    }

    dimension: total_subscrpition_orders   {
      type:  number
    }

    dimension:  total_transactions   {
      type:  number
    }
  }
