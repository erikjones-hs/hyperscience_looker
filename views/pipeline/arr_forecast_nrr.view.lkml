view: arr_forecast_nrr {
    sql_table_name: (select * from dev.erikjones.arr_forecast_nrr);;


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

  dimension: nrr_budget {
    type: number
    sql: ${TABLE}."NRR_BUDGET" ;;
  }


  dimension: nrr_actuals {
    type: number
    sql: ${TABLE}."NRR_ACTUALS" ;;
  }

  dimension: budget_variance {
    type: number
    sql: ${TABLE}."BUDGET_VARIANCE" ;;
  }

  dimension: budget_variance_running_total {
    type: number
    sql: ${TABLE}."BUDGET_VARIANCE_RUNNING_TOTAL" ;;
  }

  dimension: num_months_to_end_of_qtr {
    type: number
    sql: ${TABLE}."NUM_MONTHS_TO_END_OF_QTR" ;;
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
  }

  dimension: rollover_current_month {
    type: number
    sql: ${TABLE}."ROLLOVER_CURRENT_MONTH" ;;
  }

  dimension: nrr_low {
    type: number
    sql: ${TABLE}."NRR_LOW" ;;
  }

  dimension: nrr_committed {
    type: number
    sql: ${TABLE}."NRR_COMMITTED" ;;
  }

  dimension: nrr_high {
    type: number
    sql: ${TABLE}."NRR_HIGH" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: budget_nrr {
    type:  sum
    sql: ${nrr_budget} ;;
    value_format: "$0.00"
    label: "NRR Forecast"
  }

  measure: actuals_nrr {
    type:  sum
    sql: ${nrr_actuals} ;;
    value_format: "$0.00"
    label: "NRR Actuals"
  }

  measure: forecast_plan_nrr {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "NRR Forecast Plan"
  }

  measure: low_nrr {
    type:  sum
    sql: ${nrr_low} ;;
    value_format: "$0.00"
    label: "NRR Low"
  }

  measure: committed_nrr {
    type:  sum
    sql: ${nrr_committed} ;;
    value_format: "$0.00"
    label: "NRR Committed"
  }

  measure: high_nrr {
    type:  sum
    sql: ${nrr_high} ;;
    value_format: "$0.00"
    label: "NRR High"
  }

  measure: variance_nrr {
    type: sum
    sql: ${budget_variance} ;;
    value_format: "$0.00"
    label: "NRR Budget Variance"
  }

  measure: variance_rt_nrr {
    type: sum
    sql: ${budget_variance_running_total} ;;
    value_format: "$0.00"
    label: "NRR Budget Variance Running Total"
  }

  measure: rollover_nrr {
    type: sum
    sql: ${rollover_current_month} ;;
    value_format: "$0.00"
    label: "NRR Rollover (Current Month)"
  }

  measure: committed_actuals {
    type: number
    sql: ${committed_nrr} + ${actuals_nrr} ;;
    value_format: "$0.00"
    label: "Committed + Actuals"
  }

  measure: fcst_plan_rollover {
    type: number
    sql: ${forecast_plan_nrr} + ${rollover_nrr} ;;
    value_format: "$0.00"
    label: "FORECAST PLAN + ROLLOVER"
  }

  measure: low_plan_attainment {
    type: number
    sql: ${nrr_low} / ${fcst_plan_rollover} ;;
    label: "NRR Low Plan Attainment"
  }

  measure: committed_plan_attainment {
    type: number
    sql: ${committed_nrr} / ${fcst_plan_rollover} ;;
    label: "NRR Committed Plan Attainment"
  }

  measure: high_plan_attainment {
    type: number
    sql: ${nrr_high} / ${fcst_plan_rollover} ;;
    label: "NRR High Plan Attainment"
  }

  measure: actuals_plan_attainment {
    type: number
    sql: ${actuals_nrr} / ${fcst_plan_rollover} ;;
    label: "NRR Actuals Plan Attainment"
  }

  measure: committed_actuals_plan_attainment {
    type: number
    sql: ${committed_actuals} / ${fcst_plan_rollover} ;;
    label: "NRR Committed + Actuals Plan Attainment"
  }



}
