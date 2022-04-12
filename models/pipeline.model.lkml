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
