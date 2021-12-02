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

  measure: churned_employees {
    type:  count_distinct
    sql_distinct_key: ${employee_eid} ;;
    sql:  ${employee_eid};;
    filters: [is_employee: "=0"]
    drill_fields: [detail*]
  }

  measure: total_employees {
    type:  number
    sql:  ${active_employees} + ${churned_employees};;
    drill_fields: [detail*]
  }

  measure: attrition_rate {
    type:  number
    sql:  100.00 * ${churned_employees} / NULLIFZERO(${total_employees});;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      date_month_date,
      employee_eid,
      hire_dte_date,
      hire_dte_month,
      end_dte_date,
      end_dte_month,
      employee_salary_usd,
      salary,
      is_active,
      first_active_month_date,
      last_active_month_date,
      is_first_month,
      is_last_month,
      is_employee
    ]
  }
}
