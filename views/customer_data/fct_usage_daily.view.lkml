  view: fct_usage_daily {
    sql_table_name: (select * from dev.erikjones.fct_usage_daily);;

  dimension_group: dte {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: contract_length_months {
    type: number
    sql: ${TABLE}."CONTRACT_LENGTH_MONTHS" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  dimension: contract_pages_annual {
    type: string
    sql: ${TABLE}."CONTRACT_PAGES_ANNUAL" ;;
  }

  measure: total_pages {
    type: sum
    sql: ${TABLE}."TOTAL_PAGES" ;;
    label: "# Pages Processed"
  }

}
