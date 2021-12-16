view: hr_attrition {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_hr_attrition);;
  drill_fields: [detail*]


  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: employee_eid {
    type: number
    sql: ${TABLE}."EMPLOYEE_EID" ;;
  }

  dimension_group: hire_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."HIRE_DTE" ;;
  }

  dimension_group: hire_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."HIRE_DTE_MONTH" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension: employee_salary_usd {
    type: number
    sql: ${TABLE}."EMPLOYEE_SALARY_USD" ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}."SALARY" ;;
  }

  dimension: is_employee {
    type: number
    sql: ${TABLE}."IS_EMPLOYEE" ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension_group: first_active_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension_group: last_active_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."LAST_ACTIVE_MONTH" ;;
  }

  dimension: is_first_month {
    type: string
    sql: ${TABLE}."IS_FIRST_MONTH" ;;
  }

  dimension: is_last_month {
    type: string
    sql: ${TABLE}."IS_LAST_MONTH" ;;
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}."EMPLOYEE_NAME" ;;
  }

  dimension: employee_tenure_days {
    type: number
    sql: ${TABLE}."EMPLOYEE_TENURE_DAYS" ;;
  }

  dimension: employee_department {
    type: string
    sql: ${TABLE}."EMPLOYEE_DEPARTMENT" ;;
  }

  dimension: employee_location {
    type: string
    sql: ${TABLE}."EMPLOYEE_LOCATION" ;;
  }

  dimension: employee_job_title {
    type: string
    sql: ${TABLE}."EMPLOYEE_JOB_TITLE" ;;
  }

  dimension: supervisor {
    type: string
    sql: ${TABLE}."SUPERVISOR" ;;
  }

  dimension: supervisor_email {
    type: string
    sql: ${TABLE}."SUPERVISOR_EMAIL" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: active_employees {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql:  ${employee_eid};;
    filters: [is_employee: "=1"]
    drill_fields: [detail*]
  }

  measure: churned_employees_int {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql:  ${employee_eid};;
    filters: [is_employee: "=0"]
    drill_fields: [detail*]
  }

  measure: churned_employees {
    type:  number
    sql:  -1 * ${churned_employees_int} ;;
    drill_fields: [detail*]
  }

  measure: total_employees {
    type:  number
    sql:  ${active_employees} + ${churned_employees_int};;
    drill_fields: [detail*]
  }

  measure: attrition_rate {
    type:  number
    sql:  100.00 * ${churned_employees_int} / NULLIFZERO(${total_employees});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: average_tenure {
    type:  median
    sql: ${employee_tenure_days} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      employee_eid,
      employee_name,
      employee_job_title,
      employee_department,
      employee_location,
      hire_dte_date,
      employee_tenure_days,
      supervisor,
    ]
  }
}
