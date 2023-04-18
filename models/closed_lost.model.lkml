connection: "looker-snowflake"

include: "/views/closed_lost/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: closed_lost_opps {}
