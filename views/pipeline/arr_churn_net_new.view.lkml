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

  dimension: qtr_end_dte {
    type: date
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: current_qtr {
    type: date
    sql: ${TABLE}."CURRENT_QTR" ;;
  }

  dimension: arr_forecast_plan {
    type: number
    sql: ${TABLE}."ARR_FORECAST_PLAN" ;;
  }

  dimension: arr_budget {
    type: number
    sql: ${TABLE}."ARR_BUDGET" ;;
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

  dimension: churn_budget {
    type: number
    sql: ${TABLE}."CHURN_BUDGET" ;;
  }

  dimension: churn_budget_variance {
    type: number
    sql: ${TABLE}."CHURN_BUDGET_VARIANCE" ;;
  }

  dimension: churn_budget_variance_running_total {
    type: number
    sql: ${TABLE}."CHURN_BUDGET_VARIANCE_RUNNING_TOTAL" ;;
  }

  dimension: num_months_to_end_of_qtr {
    type: number
    sql: ${TABLE}."NUM_MONTHS_TO_END_OF_QTR" ;;
  }

  dimension: rollover_current_month {
    type: number
    sql: ${TABLE}."ROLLOVER_CURRENT_MONTH" ;;
  }

  dimension: churn_forecast_plan {
    type: number
    sql: ${TABLE}."CHURN_FORECAST_PLAN" ;;
  }

  dimension: net_new_arr_actuals {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_ACTUALS" ;;
  }

  dimension: churn_forecast_actuals {
    type: number
    sql: ${TABLE}."CHURN_FORECAST_ACTUALS" ;;
  }

  dimension: net_new_arr_low {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_LOW" ;;
  }

  dimension: net_new_arr_committed {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_COMMITTED" ;;
  }

  dimension: net_new_arr_high {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_HIGH" ;;
  }

  dimension: net_new_arr_committed_plus_actuals {
    type: number
    sql: ${TABLE}."NET_NEW_ARR_COMMITTED_PLUS_ACTUALS" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: total_potential_churn_running_total_fq {
    type: number
    sql: ${TABLE}."TOTAL_POTENTIAL_CHURN_RUNNING_TOTAL_FQ" ;;
  }

  dimension: potential_churn_non_commit_running_total_fq {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_NON_COMMIT_RUNNING_TOTAL_FQ" ;;
  }

  dimension: original_plan_running_total_fq {
    type: number
    sql: ${TABLE}."ORIGINAL_PLAN_RUNNING_TOTAL_FQ" ;;
  }


  measure: budget_arr {
    type:  sum
    sql: ${arr_budget} ;;
    value_format: "$0.00"
    label: "ARR Budget"
  }

  measure: forecast_plan_arr {
    type:  sum
    sql: ${arr_forecast_plan} ;;
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

  measure: budget_churn {
    type:  sum
    sql: ${churn_budget} ;;
    value_format: "$0.00"
    label: "Churn Budget"
  }

  measure: actuals_churn {
    type:  sum
    sql: ${actual_churn_amount} ;;
    value_format: "$0.00"
    label: "Churn Actuals"
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

  measure: low_potential_churn {
    type:  sum
    sql: ${potential_churn_amount_non_commit};;
    value_format: "$0.00"
    label: "Lowest Potential Churn"
  }

  measure: committed_potential_churn {
    type:  sum
    sql: ${potential_churn_amount_non_commit};;
    value_format: "$0.00"
    label: "Committed Potential Churn"
  }

  measure: low_actuals_churn {
    type: number
    sql: ${low_potential_churn} + ${actuals_churn} ;;
    value_format: "$0.00"
    label: "Low + Actuals"
  }

  measure: committed_actuals_churn {
    type: number
    sql: ${committed_potential_churn} + ${actuals_churn} ;;
    value_format: "$0.00"
    label: "Committed + Actuals"
  }

  measure: high_actuals_churn {
    type: number
    sql: ${total_potential_churn} + ${actuals_churn} ;;
    value_format: "$0.00"
    label: "High + Actuals"
  }

  measure: low_plan_attainment_churn {
    type: number
    sql: ${low_actuals_churn} / ${forecast_plan_churn} ;;
    label: "Low Churn Plan Attainament"
  }

  measure: committed_plan_attainment_churn {
    type: number
    sql: ${committed_actuals_churn} / ${forecast_plan_churn} ;;
    label: "Committed Plan Churn Attainament"
  }

  measure: high_plan_attainment_churn {
    type: number
    sql: ${high_actuals_churn} / ${forecast_plan_churn} ;;
    label: "High Churn Plan Attainament"
  }

  measure: actuals_plan_attainment_churn {
    type: number
    sql: ${actuals_churn} / ${forecast_plan_churn} ;;
    label: "Actuals Churn Plan Attainament"
  }

  measure: actuals_net_new_arr {
    type:  sum
    sql: ${net_new_arr_actuals} ;;
    value_format: "$0.00"
    label: "Net New ARR Actuals"
  }

  measure: forecast_plan_net_new_arr {
    type:  sum
    sql: ${arr_forecast_plan} - ${churn_forecast_plan} ;;
    value_format: "$0.00"
    label: "Net New ARR Forecast Plan"
  }

  measure: low_net_new_arr {
    type: sum
    sql:  ${net_new_arr_low};;
    value_format: "$0.00"
    label: "Net New ARR Low"
  }

  measure: committed_net_new_arr {
    type: sum
    sql: ${net_new_arr_committed} ;;
    value_format: "$0.00"
    label: "Net New ARR Committed"
  }

  measure: high_net_new_arr {
    type: sum
    sql: ${net_new_arr_high} ;;
    value_format: "$0.00"
    label: "Net New ARR High"
  }

  measure: net_new_arr_mtd_actuals {
    type: sum
    sql: ${net_new_arr_actuals} ;;
    value_format: "$0.00"
    label: "Net New ARR MTD Actuals"
  }

  measure: rollover_curr {
    type: sum
    sql: ${rollover_current_month} ;;
    value_format: "$0.00"
    label: "Churn Rollover"
  }

  measure: net_new_arr_budget {
    type: number
    sql: ${budget_arr} - ${budget_churn}  ;;
    value_format: "$0.00"
    label: "Net New ARR Budget"
  }

  measure: low_actuals_net_new_arr {
    type: number
    sql: ${low_net_new_arr} + ${net_new_arr_mtd_actuals} ;;
    value_format: "$0.00"
    label: "Low + Actuals Net New ARR"
  }

  measure: committed_actuals_net_new_arr {
    type: number
    sql: ${committed_net_new_arr} + ${net_new_arr_mtd_actuals} ;;
    value_format: "$0.00"
    label: "Committed + Actuals Net New ARR"
  }

  measure: high_actuals_net_new_arr {
    type: number
    sql: ${high_net_new_arr} + ${net_new_arr_mtd_actuals} ;;
    value_format: "$0.00"
    label: "High + Actuals Net New ARR"
  }

  measure: low_plan_attainment_net_new_arr {
    type: number
    sql: ${low_actuals_net_new_arr} / ${forecast_plan_net_new_arr} ;;
    label: "Low Net New ARR Plan Attainament"
  }

  measure: committed_plan_attainment_net_new_arr {
    type: number
    sql: ${committed_actuals_net_new_arr} / ${forecast_plan_net_new_arr} ;;
    label: "Committed Net New ARR Plan Attainament"
  }

  measure: high_plan_attainment_net_new_arr {
    type: number
    sql: ${high_actuals_net_new_arr} / ${forecast_plan_net_new_arr} ;;
    label: "High Net New ARR Plan Attainament"
  }

  measure: actuals_plan_attainment_net_new_arr {
    type: number
    sql: ${net_new_arr_mtd_actuals} / ${forecast_plan_net_new_arr} ;;
    label: "Actuals Net New ARR Plan Attainament"
  }

}
