connection: "looker-snowflake"

include: "/views/ceo_schedules/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: revenue_schedule {}
