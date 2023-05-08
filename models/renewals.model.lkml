connection: "looker-snowflake"

include: "/views/renewals/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: fct_renewals {}
