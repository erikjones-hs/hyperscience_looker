view: budget_forecast_actuals {
  sql_table_name: (select * from dev.erikjones.fct_actuals_forecst_budget);;
  drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: arr_budget {
    type: number
    sql: ${TABLE}."ARR_BUDGET" ;;
  }

  dimension: arr_forecast {
    type: number
    sql: ${TABLE}."ARR_FORECAST" ;;
  }

  dimension: arr_actual {
    type: number
    sql: ${TABLE}."ARR_ACTUAL" ;;
  }

  dimension: headcount_budget {
    type: number
    sql: ${TABLE}."HEADCOUNT_BUDGET" ;;
  }

  dimension: headcount_forecast {
    type: number
    sql: ${TABLE}."HEADCOUNT_FORECAST" ;;
  }

  dimension: headcount_actual {
    type: number
    sql: ${TABLE}."HEADCOUNT_ACTUAL" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: budget_arr {
    type: number
    sql: ${arr_budget} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: forecast_arr {
    type: sum
    sql: ${arr_forecast} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: actuals_arr {
    type: sum
    sql: ${arr_actual} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: budget_headcount {
    type: sum
    sql: ${headcount_budget} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: forecast_headcount {
    type: sum
    sql: ${headcount_forecast} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: actuals_headcount {
    type: sum
    sql: ${headcount_actual} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      dte_raw,
      arr_budget,
      arr_forecast,
      arr_actual,
      headcount_budget,
      headcount_forecast,
      headcount_actual
    ]
  }
}
