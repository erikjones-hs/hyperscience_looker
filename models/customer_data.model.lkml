connection: "looker-snowflake"

include: "/views/hr/*.view.lkml"
fiscal_month_offset:  2


explore: lever_agg_postings {}
