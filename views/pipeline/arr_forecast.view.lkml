  view: arr_forecast {
    sql_table_name: (select * from dev.erikjones.arr_forecast_sales_teams);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension: new_arr_actuals {
    type: number
    sql: ${TABLE}."NEW_ARR_ACTUALS" ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}."LOW" ;;
  }

  dimension: arr_committed {
    type: number
    sql: ${TABLE}."ARR_COMMITTED" ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}."HIGH" ;;
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  measure: arr_low  {
    type:  sum
    sql:  ${low};;
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
    sql:  ${high};;
    value_format: "$0.00"
    label: "High"
  }

  measure: forecast {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "FCST Plan"
  }









  set: detail {
    fields: [
      dte_month,
      sales_team,
      budget,
      new_arr_actuals,
      low,
      arr_committed,
      high,
      forecast_plan
    ]
  }
}
