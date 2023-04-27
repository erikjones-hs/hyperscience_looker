view: go_live_history {
  sql_table_name: (select * from prod.customer_usage.go_live_date_history);;
  drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension_group: go_live_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension_group: churn_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CHURN_MONTH" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(to_date(current_date())) ;;
  }

  dimension: live_customer_fl {
    type: number
    sql: ${TABLE}."LIVE_CUSTOMER_FL" ;;
  }

  dimension: go_live_date_fl {
    type: number
    sql: ${TABLE}."GO_LIVE_DATE_FL" ;;
  }

  dimension: ttv_days {
    type: number
    sql: ${TABLE}."TTV_DAYS" ;;
  }

  dimension: ttv_months {
    type: number
    sql: ${TABLE}."TTV_MONTHS" ;;
  }

  dimension: deployment {
    type: string
    sql: ${TABLE}."DEPLOYMENT" ;;
  }

  measure: num_live_customers {
    type: count_distinct
    sql_distinct_key: account_id ;;
    sql: ${account_id} ;;
    filters: [live_customer_fl: "1"]
    label: "# Live Customers"
  }

  measure: num_customers {
    type: count_distinct
    sql_distinct_key: account_id ;;
    sql: ${account_id} ;;
    label: "# Customers"
  }

  measure: num_live_customers_12_months_ago {
    type: number
    sql: lag(${num_live_customers},12,0) over (order by ${dte_month} asc);;
    label: "# Live Customers 12 Months Ago"
  }

  measure: delta_12_months_ago {
    type: number
    sql: ${num_live_customers} - ${num_live_customers_12_months_ago} ;;
    label: "Live Customer Delta from 12 Months Ago"
  }

  measure: perc_change_12_months_ago {
    type: number
    sql: 100*(${delta_12_months_ago} / NULLIFZERO(${num_live_customers_12_months_ago})) ;;
    label: "Live Customer % Change from 12 Months Ago"
  }

  measure: avg_time_to_value {
    type: average
    sql:${ttv_months} ;;
    value_format: "0.##"
    drill_fields: [detail*]
  }

  measure: median_ttv {
    type: median
    sql: ${ttv_months} ;;
    drill_fields: [detail*]
    value_format: "0.0"
  }

  measure: min_ttv {
    type: min
    sql: ${ttv_months} ;;
    drill_fields: [detail*]
  }

  measure: max_ttv {
    type: max
    sql:${ttv_months} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_ttv {
    type: percentile
    percentile:  25
    sql: ${ttv_months} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_ttv {
    type: percentile
    percentile:  75
    sql: ${ttv_months} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      dte_month,
      account_id,
      account_name,
      opp_id,
      opp_name,
      go_live_date_date,
      live_customer_fl,
      go_live_date_fl,
      deployment,
      ttv_days,
      ttv_months
    ]
  }
}
