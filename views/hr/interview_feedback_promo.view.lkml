  view: interview_feedback_promo {
    sql_table_name: (select * from dev.erikjones.fct_interview_promo);;

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: employee_eid {
    type: number
    sql: ${TABLE}."EMPLOYEE_EID" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME" ;;
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}."EMPLOYEE_NAME" ;;
  }

  dimension: avg_feedback {
    type: number
    sql: ${TABLE}."AVG_FEEDBACK" ;;
  }

  dimension_group: opportunity_created_dte {
    type: time
    timeframes: [week, month, quarter, fiscal_quarter, fiscal_year]
    sql: ${TABLE}."OPPORTUNITY_CREATED_DTE" ;;
  }

  dimension_group: opportunity_archive_dte {
    type: time
    timeframes: [week, month, quarter, fiscal_quarter, fiscal_year]
    sql: ${TABLE}."OPPORTUNITY_ARCHIVE_DTE" ;;
  }

  dimension: num_pay_changes {
    type: number
    sql: ${TABLE}."NUM_PAY_CHANGES" ;;
  }

  dimension: num_level_changes {
    type: number
    sql: ${TABLE}."NUM_LEVEL_CHANGES" ;;
  }

  dimension: num_job_title_changes {
    type: number
    sql: ${TABLE}."NUM_JOB_TITLE_CHANGES" ;;
  }

  dimension_group: employee_hire_dte {
    type: time
    timeframes: [date, week, month, quarter, fiscal_quarter, fiscal_year]
    sql: ${TABLE}."EMPLOYEE_HIRE_DTE" ;;
  }

  dimension: employee_tenure_days {
    type: number
    sql: ${TABLE}."EMPLOYEE_TENURE_DAYS" ;;
  }

  dimension: employee_department {
    type: string
    sql: ${TABLE}."EMPLOYEE_DEPARTMENT" ;;
  }

  dimension: employee_job_title {
    type: string
    sql: ${TABLE}."EMPLOYEE_JOB_TITLE" ;;
  }

  dimension: employee_current_status {
    type: string
    sql: ${TABLE}."EMPLOYEE_CURRENT_STATUS" ;;
  }

  dimension: promo_fl {
    type: number
    sql: CASE WHEN ${num_level_changes} >=1 then 1 else 0 end ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: median_feedback {
    type: median
    sql: ${avg_feedback} ;;
  }

  measure: mean_feedback {
    type: average
    sql: ${avg_feedback} ;;
  }

  measure: min_feedback {
    type: min
    sql: ${avg_feedback} ;;
  }

  measure: max_feedback {
    type: max
    sql: ${avg_feedback} ;;
  }

  measure: percentile_25_feedback {
    type: percentile
    percentile:  25
    sql: ${avg_feedback} ;;
  }

  measure: percentile_75_feedback {
    type: percentile
    percentile:  75
    sql: ${avg_feedback};;
  }

  measure: feedback_score {
    type: sum
    sql: ${avg_feedback} ;;
    label: "Feedback Score (Avg)"
  }

  measure: employee_name_count {
    type: count_distinct
    sql_distinct_key: ${opportunity_id} ;;
    sql: ${opportunity_id} ;;
    label: "Employee Count"
  }
}
