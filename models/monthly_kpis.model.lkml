connection: "looker-snowflake"

include: "/views/monthly_kpis/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: sales {}
explore: pages_processed {}
explore: hr {}
explore: sales_pipeline_history {}
explore: sales_dq_pipeline_history {}
explore: sales_dq_opportunities {}
explore: sales_pipeline_current {}
explore: sales_stage_progression {}
explore: cx_go_live_ttv {}
explore: finance_arr {}
explore: agg_account_arr {}
explore: sales_closed_opps_this_year {}
explore: marketing_mqls {}
explore: hr_attrition {}
explore: budget_forecast_actuals {}
explore: ml_team_metrics {}
explore: marketing_closed_won_opps {}
explore: marketing_closed_won_opps_agg {}
explore: marketing_closed_won_sourced_opps {}
explore: growth_accounting_qtr {}
explore: customer_cohort_retention {}
explore: net_revenue_cohort_retention {}
explore: gross_revenue_cohort_retention {}
explore: mql_yoy_comparison {}
