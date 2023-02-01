view: saas_metrics_qtr {
  sql_table_name: (select * from prod.saas_metrics.saas_metrics_qtr);;


  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}."METRIC" ;;
    order_by_field: metric_order_by_column
  }

  dimension: metric_order_by_column {
    type: number
    sql: ${TABLE}."METRIC_ORDER_BY_COLUMN" ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  measure: forecast {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
  }

  measure: actuals {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
  }

  measure: budget_variance {
    type: sum
    sql: ${TABLE}."BUDGET_VARIANCE" ;;
  }

  measure: forecast_variance {
    type: sum
    sql: ${TABLE}."FORECAST_VARIANCE" ;;
  }

  measure: percent_budget_variance {
    type: sum
    sql: ${TABLE}."PERCENT_BUDGET_VARIANCE" ;;
  }

  measure: percent_forecast_variance {
    type: sum
    sql: ${TABLE}."PERCENT_FORECAST_VARIANCE" ;;
  }

  measure: budget_arr {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "ARR"]
    value_format: "$#,##0"
    label: "ARR (Budget)"
  }

  measure: budget_revenue {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "REVENUE"]
    value_format: "$#,##0"
    label: "Revenue (Budget)"
  }

  measure: budget_ndr {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "NET_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Net Dollar Retention (Budget)"
  }

}
