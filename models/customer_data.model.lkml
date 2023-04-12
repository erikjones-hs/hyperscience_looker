connection: "looker-snowflake"

include: "/views/customer_data/*.view.lkml"
include: "/views/user_defined_usage/*.view.lkml"
fiscal_month_offset:  2


explore: fct_monthly_pages {}

explore: fct_weekly_pages {}

explore: fct_pages_processed {}

explore: usage_combined {}

explore: customer_forecast {}

explore: fct_usage {
  join: software_version {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_usage.account_id} = ${software_version.sfdc_account_id} ;;
  }
}
