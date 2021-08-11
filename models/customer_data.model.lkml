connection: "looker-snowflake"

include: "/views/customer_data/*.view.lkml"
fiscal_month_offset:  2


explore: agg_pages_expansion {}
