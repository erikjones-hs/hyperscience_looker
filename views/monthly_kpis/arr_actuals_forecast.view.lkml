  view: arr_actuals_forecast {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_arr_actuals_forecast);;
    drill_fields: [detail*]

  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: total_arr {
    type: number
    sql: ${TABLE}."TOTAL_ARR" ;;
  }

  dimension: new_arr {
    type: number
    sql: ${TABLE}."NEW_ARR" ;;
  }

  dimension: expansion_arr {
    type: number
    sql: ${TABLE}."EXPANSION_ARR" ;;
  }

  dimension: churn_arr {
    type: number
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  dimension: recurring_arr {
    type: number
    sql: ${TABLE}."RECURRING_ARR" ;;
  }

  dimension: net_new_arr {
    type: number
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  set: detail {
    fields: [
      qtr_end_dte_date,
      total_arr,
      new_arr,
      expansion_arr,
      churn_arr,
      recurring_arr,
      net_new_arr
    ]
  }
}
