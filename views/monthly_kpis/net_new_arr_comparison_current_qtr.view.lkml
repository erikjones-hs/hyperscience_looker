  view: net_new_arr_comparison_current_qtr {
    sql_table_name: (select * from dev.erikjones.net_new_arr_comparison_current_qtr);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  measure: actuals {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
  }

  measure: forecast {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
  }

}
