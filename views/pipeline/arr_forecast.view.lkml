  view: arr_forecast {
    sql_table_name: (select * from dev.erikjones.arr_forecast_sales_teams);;

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

  dimension: sales_team {
    type: string
    sql: ${TABLE}."SALES_TEAM" ;;
    order_by_field: sales_team_sort
  }

  dimension: sales_team_sort {
    type: number
    sql: CASE
        WHEN ${sales_team} = 'US East' then 7
        WHEN ${sales_team} = 'US West' then 6
        WHEN ${sales_team} = 'Federal' then 5
        WHEN ${sales_team} = 'APAC' then 4
        WHEN ${sales_team} = 'Channel' then 3
        WHEN ${sales_team} = 'EMEA' then 2
        WHEN ${sales_team} = 'Other' then 1
        END;;
    hidden:  yes
  }

  dimension: budget {
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  dimension: budget_rollover {
    type: number
    sql: ${TABLE}."BUDGET_ROLLOVER" ;;
  }

    dimension: budget_rollover_month {
      type: number
      sql: ${TABLE}."BUDGET_ROLLOVER_MONTH" ;;
    }

  dimension: sales_budget_running_total {
    type: number
    sql: ${TABLE}."SALES_BUDGET_RUNNING_TOTAL" ;;
  }


  dimension: new_arr_actuals {
    type: number
    sql: ${TABLE}."NEW_ARR_ACTUALS" ;;
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

  dimension: forecast_plan_rollover_int {
    type: number
    sql: ${TABLE}."FORECAST_PLAN_ROLLOVER_INT" ;;
  }

  dimension: rollover_current {
    type: number
    sql: ${TABLE}."ROLLOVER_CURRENT" ;;
  }

  dimension: actuals_running_total {
    type: number
    sql: ${TABLE}."ACTUALS_RUNNING_TOTAL" ;;
  }


  dimension: arr_low {
    type: number
    sql: ${TABLE}."ARR_LOW" ;;
  }

  dimension: arr_committed {
    type: number
    sql: ${TABLE}."ARR_COMMITTED" ;;
  }

  dimension: arr_best_case {
    type: number
    sql: ${TABLE}."ARR_BEST_CASE" ;;
  }

  dimension: high_best_case {
    type: number
    sql: ${TABLE}."HIGH_BEST_CASE" ;;
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
  }

  dimension: forecast_plan_rollover {
    type: number
    sql: ${TABLE}."FORECAST_PLAN_ROLLOVER" ;;
  }

  dimension: arr_committed_running_total {
    type: number
    sql: ${TABLE}."ARR_COMMITTED_RUNNING_TOTAL" ;;
  }

  dimension: best_case_high_running_total {
    type: number
    sql: ${TABLE}."BEST_CASE_HIGH_RUNNING_TOTAL" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: today_dte {
    type: string
    sql: to_char(date_trunc(month,add_months(to_date(current_date()),0)), 'MMMM') ;;
  }

  dimension: next_month_dte {
    type: string
    sql: to_char(date_trunc(month,add_months(to_date(current_date()),1)), 'MMMM') ;;
  }

  dimension: two_month_out_dte {
    type: string
    sql: to_char(date_trunc(month,add_months(to_date(current_date()),2)), 'MMMM') ;;
  }

  dimension: three_month_out_dte {
    type: string
    sql: to_char(date_trunc(month,add_months(to_date(current_date()),3)), 'MMMM') ;;
  }

  dimension: four_month_out_dte {
    type: string
    sql: to_char(date_trunc(month,add_months(to_date(current_date()),4)), 'MMMM') ;;
  }

  measure: boy_budget  {
    type:  sum
    sql:  ${budget};;
    value_format: "$0.00"
    label: "Budget"
  }

  measure: arr_actuals  {
    type:  sum
    sql:  ${new_arr_actuals};;
    value_format: "$0.00"
    label: "(New) ARR Actuals"
  }

  measure: low_arr  {
    type:  sum
    sql:  ${arr_low};;
    value_format: "$0.00"
    label: "Low"
  }

  measure: committed_arr  {
    type:  sum
    sql:  ${arr_committed};;
    value_format: "$0.00"
    label: "Committed"
  }

  measure: arr_high  {
    type:  sum
    sql:  ${high_best_case};;
    value_format: "$0.00"
    label: "High"
  }

  measure: forecast {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "FCST Plan"
  }

  measure: committed_closed {
    type: number
    sql: ${committed_arr} + ${arr_actuals} ;;
    value_format: "$0.00"
    label: "Committed + Closed"
  }

  measure: arr_commit_running_tot {
    type: sum
    sql: ${arr_committed_running_total} ;;
    value_format: "$0.00"
    label: "Committed Running Total"
  }

  measure: arr_best_case_high_running_tot {
    type: sum
    sql: ${best_case_high_running_total} ;;
    value_format: "$0.00"
    label: "Best Case High Running Total"
  }

  measure: committed_closed_qtr {
    type: number
    sql: ${arr_commit_running_tot} + ${arr_best_case_high_running_tot} ;;
    value_format: "$0.00"
    label: "Committed + Closed QTR"
  }

  measure: budget_running_tot {
    type: sum
    sql: ${sales_budget_running_total} ;;
    value_format: "$0.00"
    label: "Sales Budget Running Total"
  }

  measure: actuals_running_tot {
    type: sum
    sql: ${actuals_running_total} ;;
    value_format: "$0.00"
    label: "ARR Actuals Running Total"
  }

  measure: rollover_budget {
    type: sum
    sql: ${budget_rollover} ;;
    value_format: "$0.00"
    label: "BUDGET + ROLLOVER"
  }

  measure: rollover_budget_month {
    type: sum
    sql: ${budget_rollover_month} ;;
    value_format: "$0.00"
    label: "BUDGET + ROLLOVER (Month)"
  }

  measure: variance_budget {
    type: sum
    sql: ${budget_variance} ;;
    value_format: "$0.00"
    label: "BUDGET VARIANCE"
  }

  measure: budget_variance_running_tot {
    type: sum
    sql: ${budget_variance_running_total} ;;
    value_format: "$0.00"
    label: "BUDGET VARIANCE RUNNING TOTAL"
  }

  measure: rollover_curr {
    type: sum
    sql:  ${rollover_current};;
    value_format: "$0.00"
    label: "ROLLOVER CURRENT"
  }

  measure: fcst_plan_rollover {
  type: sum
  sql: ${forecast_plan_rollover} ;;
  value_format: "$0.00"
  label: "FORECAST PLAN + ROLLOVER"
  }

  set: detail {
    fields: [
      dte_month,
      sales_team,
      budget,
      arr_committed,
      forecast_plan
    ]
  }
}
