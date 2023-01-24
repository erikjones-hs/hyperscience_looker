connection: "looker-snowflake"

include: "/views/gong/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: calls_and_trackers {}
