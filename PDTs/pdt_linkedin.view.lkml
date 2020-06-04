view: pdt_linkedin {
    derived_table: {
      explore_source:tds_linkedin {
        column: publisher {field: tds_linkedin_ga_view.publisher}
        column: campaign {field: tds_linkedin_ga_view.campaign}
        column: placement {field: tds_linkedin_ga_view.placement}
        column: date {field: tds_linkedin_ga_view.date_date}
        column: week {field: tds_linkedin_ga_view.date_week}
        column: month {field: tds_linkedin_ga_view.date_month}
        column: total_impressions {field: tds_linkedin_ga_view.total_impressions}
        column: total_clicks {field: tds_linkedin_ga_view.total_clicks}
        column: total_cost {field: tds_linkedin_ga_view.total_cost}
        column: total_sessions {field: tds_linkedin_ga_view.total_sessions}
        column: total_session_duration {field: tds_linkedin_ga_view.total_sessionduration}
        column: total_checkouts {field: tds_linkedin_ga_view.total_checkouts}
        column: total_pdp_views {field: tds_linkedin_ga_view.total_pdp_views}
        column: total_revenue {field: tds_linkedin_ga_view.total_revenue}
        column: total_subscrpition_orders {field: tds_linkedin_ga_view.total_subscrpition_orders}
        column: total_transactions {field: tds_linkedin_ga_view.total_transactions}
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