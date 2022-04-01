  view: capacity_coverage {
    sql_table_name: (select * from dev.erikjones.pipeline_capacity_coverage);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: total_capacity {
    type: number
    sql: ${TABLE}."TOTAL_CAPACITY" ;;
  }

  dimension: new_arr_budget {
    type: number
    sql: ${TABLE}."NEW_ARR_BUDGET" ;;
  }

  dimension: cum_sum_net_new_arr {
    type: number
    sql: ${TABLE}."CUM_SUM_NET_NEW_ARR" ;;
  }

  measure: capacity {
    type: sum
    sql: ${total_capacity} ;;
    value_format: "0.0,,\"M\""
    label: "Capacity"
  }

  measure: budget {
    type: sum
    sql: ${new_arr_budget} ;;
    value_format: "0.0,,\"M\""
    label: "ARR Budget"
  }

  measure: net_new_arr {
    type: sum
    sql: ${cum_sum_net_new_arr} ;;
    value_format: "0.0,,\"M\""
    label: "Pipeline ARR"
  }
}
