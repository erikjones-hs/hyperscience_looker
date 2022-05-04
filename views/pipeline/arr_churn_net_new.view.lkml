view: arr_churn_net_new {
  sql_table_name: (select * from dev.erikjones.arr_forecast_churn_net_new_arr);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: month_custom_sort {
    label: "Month (Custom Sort)"
    case: {
      when: {
        sql: ${dte_month} = '2022-03' ;;
        label: "March"
      }
      when: {
        sql: ${dte_month} = '2022-04' ;;
        label: "April"
      }
      when: {
        sql: ${dte_month} = '2022-05' ;;
        label: "May"
      }
      when: {
        sql: ${dte_month} = '2022-06' ;;
        label: "June"
      }
      when: {
        sql: ${dte_month} = '2022-07' ;;
        label: "July"
      }
      when: {
        sql: ${dte_month} = '2022-08' ;;
        label: "August"
      }
      when: {
        sql: ${dte_month} = '2022-09' ;;
        label: "September"
      }
      when: {
        sql: ${dte_month} = '2022-10' ;;
        label: "October"
      }
      when: {
        sql: ${dte_month} = '2022-11' ;;
        label: "November"
      }
      when: {
        sql: ${dte_month} = '2022-12' ;;
        label: "December"
      }
      when: {
        sql: ${dte_month} = '2023-01' ;;
        label: "January"
      }
      when: {
        sql: ${dte_month} = '2023-02' ;;
        label: "February"
      }
    }
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
  }

  dimension: original_plan {
    type: number
    sql: ${TABLE}."ORIGINAL_PLAN" ;;
  }

  dimension: arr_low {
    type: number
    sql: ${TABLE}."ARR_LOW" ;;
  }

  dimension: arr_committed {
    type: number
    sql: ${TABLE}."ARR_COMMITTED" ;;
  }

  dimension: arr_high {
    type: number
    sql: ${TABLE}."ARR_HIGH" ;;
  }

  dimension: arr_mtd_actuals {
    type: number
    sql: ${TABLE}."ARR_MTD_ACTUALS" ;;
  }

  dimension: arr_committed_plus_actuals {
    type: number
    sql: ${TABLE}."ARR_COMMITTED_PLUS_ACTUALS" ;;
  }

  dimension: total_potential_churn_amount {
    type: number
    sql: ${TABLE}."TOTAL_POTENTIAL_CHURN_AMOUNT" ;;
  }

  dimension: potential_churn_amount_non_commit {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT_NON_COMMIT" ;;
  }

  dimension: actual_churn_amount {
    type: number
    sql: ${TABLE}."ACTUAL_CHURN_AMOUNT" ;;
  }

  dimension: actual_churn_running_total_fq {
    type: number
    sql: ${TABLE}."ACTUAL_CHURN_RUNNING_TOTAL_FQ" ;;
  }

  dimension: actual_churn_running_total_fq_lag1 {
    type: number
    sql: ${TABLE}."ACTUAL_CHURN_RUNNING_TOTAL_FQ_LAG1" ;;
  }

  dimension: churn_budget {
    type: number
    sql: ${TABLE}."CHURN_BUDGET" ;;
  }

  dimension: churn_budget_running_total_fq {
    type: number
    sql: ${TABLE}."CHURN_BUDGET_RUNNING_TOTAL_FQ" ;;
  }

  dimension: total_potential_churn_actuals {
    type: number
    sql: ${TABLE}."TOTAL_POTENTIAL_CHURN_ACTUALS" ;;
  }

  dimension: lowest_potential_churn_actuals {
    type: number
    sql: ${TABLE}."LOWEST_POTENTIAL_CHURN_ACTUALS" ;;
  }

  dimension: churn_forecast_plan {
    type: number
    sql: ${TABLE}."CHURN_FORECAST_PLAN" ;;
  }

  dimension: net_new_arr_actuals {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_ACTUALS" ;;
  }

  dimension: net_new_arr_forecast_plan {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_FORECAST_PLAN" ;;
  }

  dimension: churn_forecast_actuals {
    type: number
    sql: ${TABLE}."CHURN_FORECAST_ACTUALS" ;;
  }

  dimension: net_new_arr_forecast {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_FORECAST" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }


  measure: arr_forecast_plan {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "ARR Forecast Plan"
  }

  measure: low_arr {
    type:  sum
    sql: ${arr_low} ;;
    value_format: "$0.00"
    label: "ARR Low"
  }

  measure: committed_arr {
    type:  sum
    sql: ${arr_committed} ;;
    value_format: "$0.00"
    label: "ARR Committed"
  }

  measure: high_arr {
    type:  sum
    sql: ${arr_high} ;;
    value_format: "$0.00"
    label: "ARR High"
  }

  measure: mtd_actuals_arr {
    type:  sum
    sql: ${arr_mtd_actuals} ;;
    value_format: "$0.00"
    label: "ARR Actuals"
  }

  measure: actuals_committed_arr {
    type:  sum
    sql: ${arr_committed_plus_actuals} ;;
    value_format: "$0.00"
    label: "ARR Committed + Actuals"
  }

  measure: forecast_plan_churn {
    type:  sum
    sql: ${churn_forecast_plan} ;;
    value_format: "$0.00"
    label: "Churn Forecast Plan"
  }

  measure: total_potential_churn {
    type:  sum
    sql: ${total_potential_churn_amount} ;;
    value_format: "$0.00"
    label: "Total Potential Churn"
  }

  measure: low_potetial_churn {
    type:  sum
    sql: ${potential_churn_amount_non_commit};;
    value_format: "$0.00"
    label: "Lowest Potential Churn"
  }

  measure: committed_potetial_churn {
    type:  sum
    sql: ${potential_churn_amount_non_commit};;
    value_format: "$0.00"
    label: "Committed Potential Churn"
  }

  measure: total_potetial_churn_actuals {
    type:  sum
    sql: ${total_potential_churn_actuals};;
    value_format: "$0.00"
    label: "Total Potential Churn + Actuals"
  }

  measure: low_potetial_churn_actuals {
    type:  sum
    sql: ${lowest_potential_churn_actuals};;
    value_format: "$0.00"
    label: "Lowest Potential Churn + Actuals"
  }

  measure: committed_potetial_churn_actuals {
    type:  sum
    sql: ${lowest_potential_churn_actuals};;
    value_format: "$0.00"
    label: "Committed Potential Churn + Actuals"
  }

  measure: actuals_net_new_arr {
    type:  sum
    sql: ${net_new_arr_actuals} ;;
    value_format: "$0.00"
    label: "Net New ARR Actuals"
  }

  measure: forecast_plan_net_new_arr {
    type:  sum
    sql: ${net_new_arr_forecast_plan} ;;
    value_format: "$0.00"
    label: "Net New ARR Forecast Plan"
  }

}
