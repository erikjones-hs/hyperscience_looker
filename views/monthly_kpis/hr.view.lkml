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
        sql: ${employee_department} in ('Engineering','Product','Machine Learning', 'BXP') ;;
        label: "PDE"
      }
      when: {
        sql: ${employee_department} in ('People','IT & Security','Legal','Finance');;
        label: "Ops"
      }
      when: {
        sql: ${employee_department} IS NULL ;;
        label: "None"
      }
    }
  }

  dimension: lt_year_flag {
    type: number
    sql: ${TABLE}."LT_YEAR_FLAG" ;;
  }

  dimension: ge_year_flag {
    type: number
    sql: ${TABLE}."GE_YEAR_FLAG" ;;
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
    type:  median
    sql: ${employee_tenure_days} ;;
    drill_fields: [detail*]
  }

  measure: num_employees_lt_1_year  {
    type: number
    sql:  SUM(${lt_year_flag}) ;;
  }

  measure: num_employees_ge_1_year  {
    type: number
    sql:  SUM(${ge_year_flag}) ;;
  }

  measure: zero_year_ratio {
    type:  number
    sql: 100* ${num_employees_lt_1_year} / NULLIFZERO(${num_employees_ge_1_year} + ${num_employees_lt_1_year} );;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }


    set: detail {
      fields: [
        employee_eid,
        employee_name,
        employee_work_email,
        employee_department,
        employee_job_title,
        employee_location,
        supervisor,
        employee_hire_dte_date,
        employee_tenure_days,
      ]
    }
  }
