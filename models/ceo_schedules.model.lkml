connection: "looker-snowflake"

include: "/views/ceo_schedules/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: revenue_schedule {}
explore: fy_budget {}
explore: last_fy_fytd {}
explore: last_fy_totals {}
explore: current_fy_fytd {}
