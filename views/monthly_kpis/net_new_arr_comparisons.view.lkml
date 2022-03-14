  view: net_new_arr_comparisons {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_net_new_arr_comparisons);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  measure: annual_recurring_revenue {
    type: sum
    sql: ${arr} ;;
    value_format: "$#,##0.00"
  }

}
