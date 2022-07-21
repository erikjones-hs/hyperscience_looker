  view: customer_forecast {
    sql_table_name: (select * from dev.erikjones.usage_forecast_actuals_all);;

  dimension_group: dte {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  measure: yhat {
    type: sum
    sql: ${TABLE}."YHAT" ;;
    label: "Forecast"
  }

  measure: yhat_upper {
    type: sum
    sql: ${TABLE}."YHAT_UPPER" ;;
    label: "Upper 95% CI"
  }

  measure: yhat_lower {
    type: sum
    sql: ${TABLE}."YHAT_LOWER" ;;
    label: "Lower 95% CI"
  }

  measure: total_pages {
    type: sum
    sql: ${TABLE}."TOTAL_PAGES" ;;
    label: "Actuals"
  }

  measure: total_pages_prac {
    type: number
    sql: CASE WHEN ${dte_date} < dateadd(month,-2,date_trunc(month,to_date(current_date()))) then ${total_pages} else NULL end;;
    label: "Actuals Prac"
  }

}
