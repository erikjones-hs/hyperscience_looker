view: hr_attrition {
  sql_table_name: (select * from prod.monthly_kpis.hr_headcount_history);;


  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}."EMPLOYEE_ID" ;;
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


  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }


  #dimension: hr_grouping {
  #  case: {
  #    when: {
  #      sql: ${employee_department} in ('Sales') ;;
  #      label: "Sales"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Customer Experience','Customer Success') ;;
  #      label: "Customer Success"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Marketing') ;;
  #      label: "Marketing"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Engineering','Product','Machine Learning', 'BXP','IT & Security') ;;
  #      label: "Tech"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('People');;
  #      label: "People"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Legal');;
  #      label: "Legal"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Finance');;
  #      label: "Finance"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Corporate Development');;
  #      label: "Corp. Dev"
  #    }
  #    when: {
  #      sql: ${employee_department} in ('Operations');;
  #      label: "Operations"
  #    }
  #    when: {
  #      sql: ${employee_department} IS NULL ;;
  #      label: "None"
  #    }
  #  }
  #}

  measure: count {
    type: count
  }

  measure: active_employees_true {
    type:  count_distinct
    sql_distinct_key: ${employee_id} ;;
    sql:  ${employee_id};;
    filters: [is_employee: "=1"]
  }

  measure: churned_employees_int_true {
    type:  count_distinct
    sql_distinct_key: ${employee_id} ;;
    sql:  ${employee_id};;
    filters: [is_employee: "=0"]
  }

  measure: churned_employees_true {
    type:  number
    sql:  -1 * ${churned_employees_int_true} ;;
  }

  measure: total_employees {
    type:  number
    sql:  ${active_employees_true} + ${churned_employees_true};;
  }

  measure: attrition_rate {
    type:  number
    sql:  100.00 * ${churned_employees_int_true} / NULLIFZERO(${total_employees});;
    value_format: "#0\%"
  }

  measure: average_tenure {
    type:  median
    sql: ${employee_tenure_calc} ;;
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
    value_format: "#0.00\%"
  }

}
