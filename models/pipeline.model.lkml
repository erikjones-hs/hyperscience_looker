connection: "looker-snowflake"

include: "/views/pipeline/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: from_to {}
explore: time_in_current_stage {}
explore: prev_next_stage {}
explore: days_to_close_dq {}
explore: time_in_stage {}
explore: balance_sheet {}
explore: capacity_coverage {}
explore: current_fy_renewals {}
explore: current_fy_renewals_from_to {}
explore: arr_forecast {persist_for: "12 hours"}
explore: arr_sales_team_closed_won {persist_for: "12 hours"}
explore: arr_sales_team_pipeline {persist_for: "12 hours"}
explore: arr_churn_net_new {persist_for: "12 hours"}
explore: arr_forecast_nrr {persist_for: "12 hours"}
explore: arr_forecast_nrr_opps {persist_for: "12 hours"}
explore: new_pipeline {persist_for: "12 hours"}
explore: growth_accounting {}
explore: current_fq_renewals_growth_acounting {}
