view: budget_forecast_actuals {
  sql_table_name: (select * from dev.erikjones.fct_actuals_forecst_budget);;

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

  dimension: arr_current {
    type: number
    sql: ${TABLE}."ARR_CURRENT" ;;
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

  dimension: headcount_current {
    type: number
    sql: ${TABLE}."HEADCOUNT_CURRENT" ;;
  }

  dimension: marketing_influenced_arr_goal {
    type: number
    sql: ${TABLE}."MARKETING_INFLUENCED_ARR_GOAL" ;;
  }

  dimension: mql_goal {
    type: number
    sql: ${TABLE}."MQL_GOAL" ;;
  }

  dimension: new_arr_goal {
    type: number
    sql: ${TABLE}."NEW_ARR_GOAL" ;;
  }

  dimension: new_arr {
    type: number
    sql: ${TABLE}."NEW_ARR" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: count {
    type: count
  }

  measure: budget_arr {
    type: sum
    sql: ${arr_budget} ;;
    value_format: "$#,##0"
  }

  measure: forecast_arr {
    type: sum
    sql: ${arr_forecast} ;;
    value_format: "$#,##0"
  }

  measure: actuals_arr {
    type: sum
    sql: ${arr_actual} ;;
    value_format: "$#,##0"
  }

  measure: current_arr {
    type:  sum
    sql: ${arr_current} ;;
    value_format: "$#,##0"
  }

  measure: budget_headcount {
    type: sum
    sql: ${headcount_budget} ;;
  }

  measure: forecast_headcount {
    type: sum
    sql: ${headcount_forecast} ;;
  }

  measure: actuals_headcount {
    type: sum
    sql: ${headcount_actual} ;;
  }

  measure: current_heacount {
    type:  sum
    sql: ${headcount_current} ;;
  }

  measure: mktg_inf_arr_goal {
    type:  sum
    sql: ${marketing_influenced_arr_goal} ;;
    value_format: "$#,##0"
    label: "Marketing Influenced ARR Goal"
  }

  measure: goal_mql {
    type:  sum
    sql: ${mql_goal} ;;
    label: "MQL Goal"
  }

  measure: goal_new_arr {
    type:  sum
    sql: ${new_arr_goal} ;;
    value_format: "$#,##0"
    label: "New ARR Goal"
  }

  measure: actuals_new_arr {
    type:  sum
    sql: ${new_arr} ;;
    value_format: "$#,##0"
    label: "New ARR"
  }


}
