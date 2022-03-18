connection: "looker-snowflake"

include: "/views/pipeline/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: from_to {}
