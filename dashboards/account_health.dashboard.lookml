dashboard: account_health_dashboard
title: "Account Health Dashboard"
layout: newspaper

filters:
- name: account_name
  title: Account Name
  type: field_filter
  model: product_usage
  explore: accounts
  field: dim_accounts.account_name
  allow_multiple_values: false
  required: true

- name: usage_date
  title: Usage Date
  type: field_filter
  model: product_usage
  explore: accounts
  field: usage_report_full.date_date
  default_value: this year
  required: true

elements:
- title: System
  type: text
  body: ''
  row: 0
  col: 0
  width: 24
  height: 1

- title: System Version
  name: system_version
  model: product_usage
  explore: accounts
  type: single_value
  fields: [dim_accounts.current_prod_version_number]
  limit: 500
  listen:
  account_name: dim_accounts.account_name
  row: 1
  col: 0
  width: 8
  height: 3

- title: Live Layouts
  name: live_layouts
  model: product_usage
  explore: accounts
  type: looker_line
  fields: [usage_report_full.total_live_layouts, usage_report_full.date_date]
  pivots: []
  sorts: [usage_report_full.date_date desc]
  limit: 500
  listen:
  account_name: dim_accounts.account_name
  usage_date: usage_report_full.date_date
  row: 1
  col: 8
  width: 8
  height: 3

- title: Last Statistics Received
  name: last_statistics_received
  model: product_usage
  explore: accounts
  type: single_value
  fields: [usage_report_full.last_statistics_received]
  limit: 500
  listen:
    account_name: dim_accounts.account_name
    usage_date: usage_report_full.date_date
  row: 1
  col: 16
  width: 8
  height: 3
