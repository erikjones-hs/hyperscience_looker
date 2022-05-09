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

  dimension: nrr_forecast {
    type: number
    sql: ${TABLE}."NRR_FORECAST" ;;
  }

  dimension: nrr_actuals {
    type: number
    sql: ${TABLE}."NRR_ACTUALS" ;;
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

  dimension: nrr_committed_plus_actuals {
    type: number
    sql: ${TABLE}."NRR_COMMITTED_PLUS_ACTUALS" ;;
  }

  dimension: nrr_forecast_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_FORECAST_RUNNING_TOTAL_FQ" ;;
  }

  dimension: nrr_low_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_LOW_RUNNING_TOTAL_FQ" ;;
  }

  dimension: nrr_committed_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_COMMITTED_RUNNING_TOTAL_FQ" ;;
  }

  dimension: nrr_high_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_HIGH_RUNNING_TOTAL_FQ" ;;
  }

  dimension: nrr_actuals_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_ACTUALS_RUNNING_TOTAL_FQ" ;;
  }

  dimension: nrr_actuals_plus_committed_running_total_fq {
    type: number
    sql: ${TABLE}."NRR_ACTUALS_PLUS_COMMITTED_RUNNING_TOTAL_FQ" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: forecast_nrr {
    type:  sum
    sql: ${nrr_forecast} ;;
    value_format: "$0.00"
    label: "NRR Forecast"
  }

  measure: actuals_nrr {
    type:  sum
    sql: ${nrr_actuals} ;;
    value_format: "$0.00"
    label: "NRR Actuals"
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

  measure: committed_plus_actuals_nrr {
    type:  sum
    sql: ${nrr_committed_plus_actuals} ;;
    value_format: "$0.00"
    label: "NRR Committed + Actuals"
  }

  measure: forecast_running_total {
    type:  sum
    sql: ${nrr_forecast_running_total_fq} ;;
    value_format: "$0.00"
    label: "NRR Forecast Running Total"
  }

  measure: actuals_running_total {
    type:  sum
    sql: ${nrr_actuals_running_total_fq} ;;
    value_format: "$0.00"
    label: "NRR Actuals Running Total"
  }

  measure: low_running_total {
    type:  sum
    sql: ${nrr_low_running_total_fq} ;;
    value_format: "$0.00"
    label: "NRR Low Running Total"
  }

  measure: committed_running_total {
    type:  sum
    sql: ${nrr_committed_running_total_fq} ;;
    value_format: "$0.00"
    label: "NRR Committed Running Total"
  }

  measure: high_running_total {
    type:  sum
    sql: ${nrr_high_running_total_fq} ;;
    value_format: "$0.00"
    label: "NRR High Running Total"
  }

  measure: committed_plus_actuals_running_total {
    type:  sum
    sql: ${nrr_actuals_plus_committed_running_total_fq};;
    value_format: "$0.00"
    label: "NRR Committed + Actuals Running Total"
  }
}
