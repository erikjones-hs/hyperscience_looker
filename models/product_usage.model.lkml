connection: "looker-snowflake"

include: "/views/user_defined_usage/*.view.lkml" # include all views in the views/ folder in this project
include: "/views/product_analytics/*.view.lkml"
include: "/views/customer_data/*.view.lkml"
include: "/views/account_analytics/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

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

# -- Account Analytics Explore --

explore: dim_accounts {
  label: "Account Analytics"
  description: ""

    # Join to Opportunities
  join: fct_opportunities {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_accounts.account_id} = ${fct_opportunities.account_id} ;;
  }

  # Join to Opportunities again to get Partner information
  join: partner_opportunities {
    from: fct_opportunities
    type: left_outer
    relationship: one_to_many
    view_label: "Partner Opportunities"
    sql_on: ${dim_accounts.account_id} = ${partner_opportunities.main_partner_account_id} ;;
  }

  join: renewal_opportunity {
    from: fct_opportunities
    type: left_outer
    relationship: one_to_many
    view_label: "Renewal Opportunity"
    sql_on: ${dim_accounts.upcoming_renewal_opportunity_id} = ${renewal_opportunity.account_id} ;;
  }

  join: fct_jira_tickets {
    type: left_outer
    relationship: one_to_one  # Since there is one row of metrics per account
    sql_on: ${dim_accounts.account_id} = ${fct_jira_tickets.account_id} ;;
  }

  # Join to the Usage Lookup Table
  join: usage_sfdc_lookup_account_level {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_accounts.account_id} = ${usage_sfdc_lookup_account_level.sfdc_account_id} ;;
  }

  # Join from the Lookup Table to the main Usage Table
  join: usage_report_full {
    type: left_outer
    relationship: one_to_many
    sql_on: ${usage_report_full.customer} = ${usage_sfdc_lookup_account_level.customer_usage_data} ;;
  }

# Join from the Lookup Table to the nps survey
  join: fct_nps_results {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_accounts.account_id} = ${fct_nps_results.account_id} ;;
  }

# Join to daily defect snapshots to dim_accounts
  join: fct_daily_defect_snapshots {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dim_accounts.account_id} = ${fct_daily_defect_snapshots.account_id} ;;
  }

# Join to usage stats
  join: dim_usage_stats {
    type: left_outer
    relationship: one_to_one  # Since there is one row of metrics per account
    sql_on: ${dim_accounts.account_id} = ${dim_usage_stats.account_id} ;;
  }

# Join to account health
  join: dim_account_health {
    type: left_outer
    relationship: one_to_one  # Since there is one row of metrics per account
    sql_on: ${dim_accounts.account_id} = ${dim_account_health.account_id} ;;
  }

}
