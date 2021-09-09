connection: "looker-snowflake"

include: "/views/customer_data/*.view.lkml"
fiscal_month_offset:  2


explore: fct_monthly_pages {}

explore: fct_weekly_pages {}

explore: fct_pages_processed {}
