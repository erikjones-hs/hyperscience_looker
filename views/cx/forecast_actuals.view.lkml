view: forecast_actuals {
  sql_table_name: (select * from DEV.ERIKJONES.CX_FORECAST_ACTUALS);;
  drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: forecast_pages {
    type: number
    sql: ${TABLE}."FORECAST_PAGES" ;;
  }

  dimension: current_contract_start {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_START" ;;
  }

  dimension: current_contract_end {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END" ;;
  }

  dimension: current_contract_term {
    type: number
    sql: ${TABLE}."CURRENT_CONTRACT_TERM" ;;
  }

  dimension: actual_pages_processed {
    type: number
    sql: ${TABLE}."ACTUAL_PAGES_PROCESSED" ;;
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
  }

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension: fy_qtr_year {
    type: string
    sql: ${TABLE}."FY_QTR_YEAR" ;;
  }

  dimension: fy_qtr_end_dte {
    type: date
    sql: ${TABLE}."FY_QTR_END_DTE" ;;
  }

  dimension: date_ran {
    type: date
    sql: ${TABLE}."DATE_RAN" ;;
  }

  set: detail {
    fields: [
      dte,
      customer_name,
      forecast_pages,
      current_contract_start,
      current_contract_end,
      current_contract_term,
      actual_pages_processed,
      contracted_pages_over_term,
      fy_year,
      fy_qtr_year,
      fy_qtr_end_dte,
      date_ran
    ]
  }
}
