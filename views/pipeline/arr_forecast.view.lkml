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

  dimension: rollover_current_month {
    type: number
    sql: ${TABLE}."ROLLOVER_CURRENT_MONTH" ;;
  }

  dimension: forecast_plan {
    type: number
    sql: ${TABLE}."FORECAST_PLAN" ;;
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

  dimension: arr_high {
    type: number
    sql: ${TABLE}."ARR_HIGH" ;;
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

  measure: high_arr  {
    type:  sum
    sql:  ${arr_high};;
    value_format: "$0.00"
    label: "High"
  }

  measure: forecast {
    type:  sum
    sql: ${forecast_plan} ;;
    value_format: "$0.00"
    label: "FCST Plan"
  }

  measure: committed_actuals {
    type: number
    sql: ${committed_arr} + ${arr_actuals} ;;
    value_format: "$0.00"
    label: "Committed + Actuals"
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
    sql:  ${rollover_current_month};;
    value_format: "$0.00"
    label: "ROLLOVER CURRENT"
  }


  measure: low_plan_attainment {
    type: number
    sql: ${arr_low} / ${forecast} ;;
    label: "NRR Low Plan Attainment"
  }

  measure: committed_plan_attainment {
    type: number
    sql: ${committed_arr} / ${forecast} ;;
    label: "NRR Committed Plan Attainment"
  }

  measure: high_plan_attainment {
    type: number
    sql: ${arr_high} / ${forecast} ;;
    label: "NRR High Plan Attainment"
  }

  measure: actuals_plan_attainment {
    type: number
    sql: ${arr_actuals} / ${forecast} ;;
    label: "NRR Actuals Plan Attainment"
  }

  measure: committed_actuals_plan_attainment {
    type: number
    sql: ${committed_actuals} / ${forecast} ;;
    label: "NRR Committed + Actuals Plan Attainment"
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
