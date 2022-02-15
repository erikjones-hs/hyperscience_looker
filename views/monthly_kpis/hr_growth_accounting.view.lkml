view: hr_growth_accounting {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_hr_growth_acct);;
  drill_fields: [detail*]

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: employee_department {
    type: string
    sql: ${TABLE}."EMPLOYEE_DEPARTMENT" ;;
  }

  dimension: beginning_employees {
    type: number
    sql: ${TABLE}."BEGINNING_EMPLOYEES" ;;
  }

  dimension: new_employees {
    type: number
    sql: ${TABLE}."NEW_EMPLOYEES" ;;
  }

  dimension: churned_employees {
    type: number
    sql: ${TABLE}."CHURNED_EMPLOYEES" ;;
  }

  dimension: ending_employees {
    type: number
    sql: ${TABLE}."ENDING_EMPLOYEES" ;;
  }

  dimension: monthly_attrition_rate {
    type: number
    sql: ${TABLE}."MONTHLY_ATTRITION_RATE" ;;
  }

  measure: employees_beginning {
    type:  sum
    sql:  ${beginning_employees} ;;
    label: "Beginning Employees"

  }

  measure: employees_new {
    type:  sum
    sql:  ${new_employees} ;;
    label: "New Employees"
  }

  measure: employees_churn {
    type:  sum
    sql:  ${churned_employees} ;;
    label: "Churned Employees"
  }

  measure: employees_ending {
    type:  sum
    sql:  ${ending_employees} ;;
    label: "Ending Employees"
  }

  measure: attrition_rate_monthly {
    type: sum
    sql: ${monthly_attrition_rate} ;;
    value_format: "0.00"
    label: "Monthly Attrition Rate"
  }

  set: detail {
    fields: [
      employee_department,
      beginning_employees,
      new_employees,
      churned_employees,
      ending_employees,
      monthly_attrition_rate
    ]
  }
}
