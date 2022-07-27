  view: fct_usage {
    sql_table_name: (select * from dev.erikjones.fct_usage);;

  dimension_group: dte_month {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
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
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  measure: contract_pages_annual {
    type: sum
    sql: ${TABLE}."CONTRACT_PAGES_ANNUAL" ;;
  }

  measure: total_pages {
    type: sum
    sql: ${TABLE}."TOTAL_PAGES" ;;
  }

  measure: contract_length_months {
    type: sum
    sql: ${TABLE}."CONTRACT_LENGTH_MONTHS" ;;
  }

  measure: arr {
    type: sum
    sql: ${TABLE}."ARR" ;;
  }

  set: detail {
    fields: [
      dte_month_date,
      opp_id,
      opp_name,
      account_id,
      sfdc_account_name,
      total_pages,
      start_dte_date,
      end_dte_date,
      contract_length_months,
      arr,
      is_opp_active_fl,
      contract_pages_annual
    ]
  }
}
