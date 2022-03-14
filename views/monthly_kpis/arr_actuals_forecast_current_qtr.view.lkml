
  view: arr_actuals_forecast_current_qtr {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_arr_actuals_forecast_current_qtr);;

  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: actuals_forecast {
    type: string
    sql: ${TABLE}."ACTUALS_FORECAST" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
    }

  measure: annual_recurring_revenue{
    type:  sum
    sql: ${arr} ;;
    value_format: "$#,##0.00"
    label: "ARR"
  }


}
