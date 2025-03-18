view: larr_carr {
  sql_table_name: (select * from prod.monthly_kpis.larr_percent_carr);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  measure: live_arr {
    type: sum
    sql: ${TABLE}."LIVE_ARR" ;;
  }

  measure: carr {
    type: sum
    sql: ${TABLE}."CARR" ;;
  }

  measure: live_arr_percent {
    type: number
    sql: ${live_arr} / ${carr} ;;
  }

}
