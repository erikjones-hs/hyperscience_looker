  view: current_fy_renewals_from_to {
    sql_table_name: (select * from dev.erikjones.renewals_current_fy_from_to_agg);;

  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }

  dimension: tot_amount {
    type: number
    sql: ${TABLE}."TOT_AMOUNT" ;;
  }

  measure: arr {
    type: sum
    sql: ${tot_amount} ;;
    label: "Total ARR"
    value_format: "$0.00,,\"M\""
  }

}
