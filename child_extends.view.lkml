include: "/SEM_common_metrics.view.lkml"

view: child_extends {
sql_table_name: public.tds_adwords_adgroup_performance_report_pp ;;
extends: [tds_adwords_adgroup_performance_report_parent]
}
