  view: arr_forecast {
    sql_table_name: (select * from dev.erikjones.arr_forecast_sales_teams);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: sales_team {
    type: string
    sql: ${TABLE}."SALES_TEAM" ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  dimension: sales_budget_running_total {
    type: number
    sql: ${TABLE}."SALES_BUDGET_RUNNING_TOTAL" ;;
  }


  dimension: new_arr_actuals {
    type: number
    sql: ${TABLE}."NEW_ARR_ACTUALS" ;;
  }

  dimension: actuals_running_total {
    type: number
    sql: ${TABLE}."ACTUALS_RUNNING_TOTAL" ;;
  }


  dimension: arr_low {
    type: number
    sql: ${TABLE}."ARR_LOW" ;;
  }

  dimension: arr_committed {
    type: number
    sql: ${TABLE}."ARR_COMMITTED" ;;
  }

  dimension: arr_best_case {
    type: number
    sql: ${TABLE}."ARR_BEST_CASE" ;;
  }

  dimension: high_best_case {
    type: number
    sql: ${TABLE}."HIGH_BEST_CASE" ;;
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
  }

  dimension: arr_committed_running_total {
    type: number
    sql: ${TABLE}."ARR_COMMITTED_RUNNING_TOTAL" ;;
  }

  dimension: best_case_high_running_total {
    type: number
    sql: ${TABLE}."BEST_CASE_HIGH_RUNNING_TOTAL" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: boy_budget  {
    type:  sum
    sql:  ${budget};;
    value_format: "$0.00"
    label: "Budget"
  }

  measure: arr_actuals  {
    type:  sum
    sql:  ${new_arr_actuals};;
    value_format: "$0.00"
    label: "(New) ARR Actuals"
  }

  measure: low_arr  {
    type:  sum
    sql:  ${arr_low};;
    value_format: "$0.00"
    label: "Low"
  }

  measure: committed_arr  {
    type:  sum
    sql:  ${arr_committed};;
    value_format: "$0.00"
    label: "Committed"
  }

  measure: arr_high  {
    type:  sum
    sql:  ${high_best_case};;
    value_format: "$0.00"
    label: "High"
  }

  measure: forecast {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "FCST Plan"
  }

  measure: committed_closed {
    type: number
    sql: ${committed_arr} + ${arr_actuals} ;;
    value_format: "$0.00"
    label: "Committed + Closed"
  }

  measure: arr_commit_running_tot {
    type: sum
    sql: ${arr_committed_running_total} ;;
    value_format: "$0.00"
    label: "Committed Running Total"
  }

  measure: arr_best_case_high_running_tot {
    type: sum
    sql: ${best_case_high_running_total} ;;
    value_format: "$0.00"
    label: "Best Case High Running Total"
  }

  measure: committed_closed_qtr {
    type: number
    sql: ${arr_commit_running_tot} + ${arr_best_case_high_running_tot} ;;
    value_format: "$0.00"
    label: "Committed + Closed QTR"
  }

  measure: budget_running_tot {
    type: sum
    sql: ${sales_budget_running_total} ;;
    value_format: "$0.00"
    label: "Sales Budget Running Total"
  }

  measure: actuals_running_tot {
    type: sum
    sql: ${actuals_running_total} ;;
    value_format: "$0.00"
    label: "ARR Actuals Running Total"
  }









  set: detail {
    fields: [
      dte_month,
      sales_team,
      budget,
      arr_committed,
      forecast_plan
    ]
  }
}
