view: fy_budget {
  sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."FY_BUDGET");;


  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  measure: beginning_budget {
    type: sum
    sql: ${TABLE}."BEGINNING_BUDGET" ;;
  }

  measure: new_arr_budget {
    type: sum
    sql: ${TABLE}."NEW_ARR_BUDGET" ;;
  }

  measure: expansion_arr_budget {
    type: sum
    sql: ${TABLE}."EXPANSION_ARR_BUDGET" ;;
  }

  measure: new_bookings_budget {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS_BUDGET" ;;
  }

  measure: churn_arr_budget {
    type: sum
    sql: ${TABLE}."CHURN_ARR_BUDGET" ;;
  }

  measure: net_new_arr_budget {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR_BUDGET" ;;
  }

  measure: ending_arr_budget {
    type: sum
    sql: ${TABLE}."ENDING_ARR_BUDGET" ;;
  }

  set: detail {
    fields: [
      dte_month,
      beginning_budget,
      new_arr_budget,
      expansion_arr_budget,
      new_bookings_budget,
      churn_arr_budget,
      net_new_arr_budget,
      ending_arr_budget
    ]
  }
}
