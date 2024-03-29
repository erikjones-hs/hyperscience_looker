connection: "looker-snowflake"

include: "/views/user_defined_usage/*.view.lkml" # include all views in the views/ folder in this project
include: "/views/product_analytics/*.view.lkml"
include: "/views/customer_data/*.view.lkml"

fiscal_month_offset:  2

explore: user_defined_usage_data {}
explore: pageviews {}
explore: saas_usage {}
explore: saas_meta_data {}
explore: clicks_tasks {}
explore: pageviews_trash {}
explore: reporting {}
explore: documents {}
explore: flows {}
explore: submissions {}
explore: layouts {}
explore: tasks {}
explore: pageviews_raw {}
explore: software_version{}
explore: arr_usage {}
explore: most_recent_saas_usage {}
explore: blended_pages {}
explore: usage_no_lookup {}
explore: actuals_forecast_adoption {}
explore: fct_usage_daily {}
explore: customer_growth {}
explore: customers_pages_monthly_estimate {}
explore: fct_usage_layouts {}
explore: time_to_upgrade {}
explore: sfdc_usage_qc {}
explore: contracted_pages_qc {}
explore: usage_report_full {}
explore: usage_software {}
explore: software_version_history {}
