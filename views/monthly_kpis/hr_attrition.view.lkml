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
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."HIRE_DTE" ;;
  }

  dimension_group: hire_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."HIRE_DTE_MONTH" ;;
  }

  dimension: employee_tenure_calc {
    type: number
    sql: ${TABLE}."EMPLOYEE_TENURE_CALC" ;;
  }

  dimension: lt_year_flag {
    type: number
    sql: ${TABLE}."LT_YEAR_FLAG" ;;
  }

  dimension: ge_year_flag {
    type: number
    sql: ${TABLE}."GE_YEAR_FLAG" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension: employee_salary_usd {
    type: number
    sql: ${TABLE}."EMPLOYEE_SALARY_USD" ;;
    hidden: yes
  }

  dimension: salary {
    type: number
    sql: ${TABLE}."SALARY" ;;
    hidden: yes
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

  dimension: hr_grouping {
    case: {
      when: {
        sql: ${employee_department} in ('Sales') ;;
        label: "Sales"
      }
      when: {
        sql: ${employee_department} in ('Customer Experience','Customer Success') ;;
        label: "Customer Success"
      }
      when: {
        sql: ${employee_department} in ('Marketing') ;;
        label: "Marketing"
      }
      when: {
        sql: ${employee_department} in ('Engineering','Product','Machine Learning', 'BXP','IT & Security') ;;
        label: "Tech"
      }
      when: {
        sql: ${employee_department} in ('People');;
        label: "People"
      }
      when: {
        sql: ${employee_department} in ('Legal');;
        label: "Legal"
      }
      when: {
        sql: ${employee_department} in ('Finance');;
        label: "Finance"
      }
      when: {
        sql: ${employee_department} in ('Corporate Development');;
        label: "Corp. Dev"
      }
      when: {
        sql: ${employee_department} in ('Operations');;
        label: "Operations"
      }
      when: {
        sql: ${employee_department} IS NULL ;;
        label: "None"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: active_employees_true {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql:  ${employee_eid};;
    filters: [is_employee: "=1"]
    drill_fields: [detail*]
  }

  measure: churned_employees_int_true {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql:  ${employee_eid};;
    filters: [is_employee: "=0"]
    drill_fields: [detail*]
  }

  measure: churned_employees_true {
    type:  number
    sql:  -1 * ${churned_employees_int_true} ;;
    drill_fields: [detail*]
  }

  measure: churned_employees_temp {
    type:  number
    sql: CASE WHEN ${date_month_month} = '2022-04' then -1*(${churned_employees_true} + 2)
              WHEN ${date_month_month} = '2022-05' then -1*(${churned_employees_true} + 15)
              WHEN ${date_month_month} = '2022-06' then -1*(${churned_employees_true} + 15)
              WHEN ${date_month_month} = '2022-07' then -1*(${churned_employees_true} + 43)
              WHEN ${date_month_month} = '2022-08' then -1*(${churned_employees_true} + 8)
              ELSE ${churned_employees_true} end;;
  }

  measure: active_employees_temp {
    type:  number
    sql: CASE WHEN ${date_month_month} = '2022-04' then (${active_employees_true})
              WHEN ${date_month_month} = '2022-05' then (${active_employees_true} - 15)
              WHEN ${date_month_month} = '2022-06' then (${active_employees_true} - 35)
              WHEN ${date_month_month} = '2022-07' then (${active_employees_true} - 80)
              WHEN ${date_month_month} = '2022-08' then (${active_employees_true} - 72)
              ELSE ${active_employees_true} end;;
  }

  measure: active_employees {
    type:  number
    sql: ${active_employees_temp} ;;
  }

  measure: churned_employees_int {
    type: number
    sql: -1*${churned_employees_temp} ;;
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
    sql: ${employee_tenure_calc} ;;
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
      employee_job_title,
      employee_department,
      employee_location,
      hire_dte_date,
      employee_tenure_days,
      supervisor,
    ]
  }
}
