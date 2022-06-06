connection: "looker-snowflake"

include: "/views/monthly_kpis/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: sales {persist_for: "12 hours"}
explore: pages_processed {persist_for: "12 hours"}
explore: hr {persist_for: "12 hours"}
explore: sales_pipeline_history {persist_for: "12 hours"}
explore: sales_dq_pipeline_history {persist_for: "12 hours"}
explore: sales_dq_opportunities {persist_for: "12 hours"}
explore: sales_pipeline_current {persist_for: "12 hours"}
explore: sales_stage_progression {persist_for: "12 hours"}
explore: cx_go_live_ttv {persist_for: "12 hours"}
explore: finance_arr {persist_for: "12 hours"}
explore: agg_account_arr {persist_for: "12 hours"}
explore: sales_closed_opps_this_year {persist_for: "12 hours"}
explore: marketing_mqls {persist_for: "12 hours"}
explore: hr_attrition {persist_for: "12 hours"}
explore: budget_forecast_actuals {persist_for: "12 hours"}
explore: ml_team_metrics {persist_for: "12 hours"}
explore: marketing_closed_won_opps {persist_for: "12 hours"}
explore: marketing_closed_won_opps_agg {persist_for: "12 hours"}
explore: marketing_closed_won_sourced_opps {persist_for: "12 hours"}
explore: growth_accounting_qtr {persist_for: "12 hours"}
explore: customer_cohort_retention {persist_for: "12 hours"}
explore: net_revenue_cohort_retention {persist_for: "12 hours"}
explore: gross_revenue_cohort_retention {persist_for: "12 hours"}
explore: mql_yoy_comparison {persist_for: "12 hours"}
explore: operational_health_metrics {persist_for: "12 hours"}
explore: hr_growth_accounting {persist_for: "12 hours"}
explore: sales_funnel {persist_for: "12 hours"}
explore: all_closed_won_opps {persist_for: "12 hours"}
explore: arr_sales_region {persist_for: "12 hours"}
explore: net_dollar_retention_qtr {persist_for: "12 hours"}
explore: cash_burn {persist_for: "12 hours"}
explore: gross_margin_ebitda {persist_for: "12 hours"}
explore: cac {persist_for: "12 hours"}
explore: arr_actuals_forecast {persist_for: "12 hours"}
explore:hr_budget_forecast {persist_for: "12 hours"}
explore:sales_team_actuals_goals {persist_for: "12 hours"}
explore: arr_actuals_forecast_current_qtr {persist_for: "12 hours"}
explore: net_new_arr_comparisons {persist_for: "12 hours"}
explore: rev_per_emp {persist_for: "12 hours"}
explore: avg_arr_customer {persist_for: "12 hours"}
explore: closed_won_sources {persist_for: "12 hours"}
explore: cash_balance {persist_for: "12 hours"}
explore: pages_processed_growth {persist_for: "12 hours"}
explore: customer_count {persist_for: "12 hours"}
explore: pages_processed_percent_growth {persist_for: "12 hours"}
explore: saas_metrics {persist_for: "12 hours"}
explore: ae_report {persist_for: "12 hours"}
explore: net_new_arr_comparison_current_qtr {persist_for: "12 hours"}
