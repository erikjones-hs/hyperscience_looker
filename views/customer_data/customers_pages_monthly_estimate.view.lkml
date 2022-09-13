view: customers_pages_monthly_estimate {
  sql_table_name: (select * from dev.erikjones.customers_pages_processed_estimate);;

  dimension_group: date_month {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: total_pages_placeholder {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_PLACEHOLDER" ;;
  }

  dimension: tot_pages_placeholder {
    type: number
    sql: ${TABLE}."TOT_PAGES_PLACEHOLDER" ;;
  }

  dimension: is_live_customer {
    type: number
    sql: ${TABLE}."IS_LIVE_CUSTOMER" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension_group: first_active_month {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension_group: last_active_month {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."LAST_ACTIVE_MONTH" ;;
  }

  dimension: is_first_month {
    type: yesno
    sql: ${TABLE}."IS_FIRST_MONTH" ;;
  }

  dimension: is_last_month {
    type: yesno
    sql: ${TABLE}."IS_LAST_MONTH" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  measure: num_customers {
    type: count_distinct
    sql_distinct_key: ${account_id} ;;
    sql: ${account_id} ;;
    label: "# Customers"
  }
}
