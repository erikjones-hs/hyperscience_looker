  view: net_new_arr_comparisons {
    sql_table_name: (select * from prod.monthly_kpis.net_new_arr_comparisons);;

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

  dimension_group: current_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: annual_recurring_revenue {
    type: sum
    sql: ${arr} ;;
    value_format: "$0.0,,\"M\""
    label: "Net New ARR"
  }

}
