  view: capacity_coverage {
    sql_table_name: (select * from prod.monthly_kpis.pipeline_coverage);;

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

  dimension: opp_pipeline_category {
    type: string
    sql: ${TABLE}."OPP_PIPELINE_CATEGORY" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }


  measure: capacity {
    type: sum_distinct
    sql_distinct_key: ${dte_fiscal_quarter};;
    sql: ${total_capacity} ;;
    value_format: "$0,,\"M\""
    label: "Capacity"
  }

  measure: budget {
    type: sum_distinct
    sql_distinct_key: ${dte_fiscal_quarter};;
    sql: ${new_arr_budget} ;;
    value_format: "$0,,\"M\""
    label: "ARR Budget"
  }

  measure: net_new_arr {
    type: sum
    sql: ${cum_sum_net_new_arr} ;;
    value_format: "$0,,\"M\""
    label: "Pipeline ARR"
  }
}
