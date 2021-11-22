view: hr {
      sql_table_name: (select * from dev.erikjones.monthly_kpis_hr_headcount_current);;
      drill_fields: [detail*]

    dimension: employee_eid {
      type: number
      sql: ${TABLE}."EMPLOYEE_EID" ;;
    }

    dimension: employee_first_name {
      type: string
      sql: ${TABLE}."EMPLOYEE_FIRST_NAME" ;;
    }

    dimension: employee_last_name {
      type: string
      sql: ${TABLE}."EMPLOYEE_LAST_NAME" ;;
    }

    dimension: employee_name {
      type: string
      sql: ${TABLE}."EMPLOYEE_NAME" ;;
    }

    dimension: employee_number {
      type: number
      sql: ${TABLE}."EMPLOYEE_NUMBER" ;;
    }

    dimension_group: employee_hire_dte {
      type: time
      timeframes: [date, month, quarter, year]
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

    dimension: employee_work_email {
      type: string
      sql: ${TABLE}."EMPLOYEE_WORK_EMAIL" ;;
    }

    dimension: employee_city {
      type: string
      sql: ${TABLE}."EMPLOYEE_CITY" ;;
    }

    dimension: employee_state {
      type: string
      sql: ${TABLE}."EMPLOYEE_STATE" ;;
    }

    dimension: employee_country {
      type: string
      sql: ${TABLE}."EMPLOYEE_COUNTRY" ;;
    }

    dimension: employee_location {
      type: string
      sql: ${TABLE}."EMPLOYEE_LOCATION" ;;
    }

    dimension_group: employee_job_title_effective_dte {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."EMPLOYEE_JOB_TITLE_EFFECTIVE_DTE" ;;
    }

    dimension: employee_job_title {
      type: string
      sql: ${TABLE}."EMPLOYEE_JOB_TITLE" ;;
    }

    dimension: employee_pay_type {
      type: string
      sql: ${TABLE}."EMPLOYEE_PAY_TYPE" ;;
    }

    dimension: employee_pay_rate {
      type: string
      sql: ${TABLE}."EMPLOYEE_PAY_RATE" ;;
    }

    dimension_group: employee_pay_effective_dte {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."EMPLOYEE_PAY_EFFECTIVE_DTE" ;;
    }

    dimension: employee_salary_usd {
      type: number
      sql: ${TABLE}."EMPLOYEE_SALARY_USD" ;;
    }

    dimension: employee_pay_change_reason {
      type: string
      sql: ${TABLE}."EMPLOYEE_PAY_CHANGE_REASON" ;;
    }

    dimension_group: employee_level_effective_dte {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."EMPLOYEE_LEVEL_EFFECTIVE_DTE" ;;
    }

    dimension: employee_band {
      type: string
      sql: ${TABLE}."EMPLOYEE_BAND" ;;
    }

    dimension: employee_level {
      type: string
      sql: ${TABLE}."EMPLOYEE_LEVEL" ;;
    }

    dimension_group: employee_status_effective_dte {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."EMPLOYEE_STATUS_EFFECTIVE_DTE" ;;
    }

    dimension: employee_current_status {
      type: string
      sql: ${TABLE}."EMPLOYEE_CURRENT_STATUS" ;;
    }

    dimension: employee_active_inactive {
      type: string
      sql: ${TABLE}."EMPLOYEE_ACTIVE_INACTIVE" ;;
    }

    dimension: employee_dob {
      type: string
      sql: ${TABLE}."EMPLOYEE_DOB" ;;
    }

    dimension: employee_age {
      type: number
      sql: ${TABLE}."EMPLOYEE_AGE" ;;
    }

    dimension: employee_ethnicity {
      type: string
      sql: ${TABLE}."EMPLOYEE_ETHNICITY" ;;
    }

    dimension: employee_gender {
      type: string
      sql: ${TABLE}."EMPLOYEE_GENDER" ;;
    }

    dimension: employee_termination_dte {
      type: string
      sql: ${TABLE}."EMPLOYEE_TERMINATION_DTE" ;;
    }

    dimension: supervisor_eid {
      type: number
      sql: ${TABLE}."SUPERVISOR_EID" ;;
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
      sql:  to_timestamp(to_date(current_date())) ;;
    }

  dimension: date_ran {
    type: date
    sql: ${TABLE}."DATE_RAN" ;;
  }

  dimension: group {
    case: {
      when: {
        sql: ${employee_department} in ('Sales','Customer Experience','Marketing') ;;
        label: "GTM"
      }
      when: {
        sql: ${employee_department} in ('Engineering','Product','Machine Learning') ;;
        label: "PDE"
      }
      when: {
        sql: ${employee_department} in ('People','IT & Security','Legal','Finance');;
        label: "Ops"
      }
      when: {
        sql: ${employee_department} IS NULL ;;
        label: "Ops"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    }

  measure: num_employees {
    type: count_distinct
    sql:${employee_eid} ;;
    drill_fields: [detail*]
  }

  measure: cumulative_employees {
    type:  running_total
    sql:  ${num_employees} ;;
    drill_fields: [detail*]
  }

  measure: average_tenure {
    type:  average
    sql: ${employee_tenure_days} ;;
    drill_fields: [detail*]
  }

  measure: num_employees_lt_1_yr {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql: ${employee_tenure_days} < 365 ;;
    drill_fields: [detail*]
  }

  measure: num_employees_ge_1_yr {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql: ${employee_tenure_days} >= 365 ;;
    drill_fields: [detail*]
  }

  measure: zero_year_ratio {
    type:  number
    sql: 100* ${num_employees_lt_1_yr} / NULLIFZERO(${num_employees_ge_1_yr});;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

    set: detail {
      fields: [
        employee_eid,
        employee_first_name,
        employee_last_name,
        employee_name,
        employee_number,
        employee_tenure_days,
        employee_department,
        employee_work_email,
        employee_city,
        employee_state,
        employee_country,
        employee_location,
        employee_job_title,
        employee_pay_type,
        employee_pay_rate,
        employee_salary_usd,
        employee_pay_change_reason,
        employee_band,
        employee_level,
        employee_current_status,
        employee_active_inactive,
        employee_dob,
        employee_age,
        employee_ethnicity,
        employee_gender,
        employee_termination_dte,
        supervisor_eid,
        supervisor,
        supervisor_email
      ]
    }
  }
