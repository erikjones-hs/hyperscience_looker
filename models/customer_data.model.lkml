connection: "looker-snowflake"

include: "/views/customer_data/*.view.lkml"
include: "/views/user_defined_usage/*.view.lkml"
fiscal_month_offset:  2


explore: fct_monthly_pages {}

explore: fct_weekly_pages {}

explore: fct_pages_processed {}

explore: usage_combined {}

explore: customer_forecast {}
