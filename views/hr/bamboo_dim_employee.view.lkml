view: bamboo_dim_employee {
  sql_table_name: (select * from dev.hr.bamboo_dim_employee);;
  drill_fields: [detail*]

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: full_name_1 {
    type: string
    sql: ${TABLE}."FULL_NAME_1" ;;
  }

  dimension: employee_number {
    type: number
    sql: ${TABLE}."EMPLOYEE_NUMBER" ;;
  }

  dimension_group: hire_date {
    type: time
    timeframes: [week, month, quarter, fiscal_quarter, fiscal_year]
    sql: ${TABLE}."HIRE_DATE" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}."WORK_EMAIL" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}."JOB_TITLE" ;;
  }

  dimension: pay_type {
    type: string
    sql: ${TABLE}."PAY_TYPE" ;;
  }

  dimension: pay_rate {
    type: string
    sql: ${TABLE}."PAY_RATE" ;;
  }

  dimension: salary_usd {
    type: number
    sql: ${TABLE}."SALARY_USD" ;;
  }

  dimension: pay_rate_effective_date {
    type: date
    sql: ${TABLE}."PAY_RATE_EFFECTIVE_DATE" ;;
  }

  dimension: pay_change_reason {
    type: string
    sql: ${TABLE}."PAY_CHANGE_REASON" ;;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}."DATE_OF_BIRTH" ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}."BIRTHDAY" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}."ETHNICITY" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: termination_date {
    type: string
    sql: ${TABLE}."TERMINATION_DATE" ;;
  }

  dimension: supervisor_eid {
    type: number
    sql: ${TABLE}."SUPERVISOR_EID" ;;
  }

  dimension: supervisor_id {
    type: number
    sql: ${TABLE}."SUPERVISOR_ID" ;;
  }

  dimension: supervisor_email {
    type: string
    sql: ${TABLE}."SUPERVISOR_EMAIL" ;;
  }

  dimension: supervisor {
    type: string
    sql: ${TABLE}."SUPERVISOR" ;;
  }

  measure: num_employees {
    type: count_distinct
    sql:  ${id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      full_name_1,
      employee_number,
      department,
      work_email,
      city,
      state,
      country,
      location,
      job_title,
      pay_type,
      pay_rate,
      salary_usd,
      pay_rate_effective_date,
      pay_change_reason,
      date_of_birth,
      birthday,
      age,
      ethnicity,
      status,
      termination_date,
      supervisor_eid,
      supervisor_id,
      supervisor_email,
      supervisor
    ]
  }
}
