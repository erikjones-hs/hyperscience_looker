 view: hr_budget_forecast {
    sql_table_name: (select * from prod.monthly_kpis.hr_budget_forecast);;
    drill_fields: [detail*]


  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: headcount {
    type: number
    sql: ${TABLE}."HEADCOUNT" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  measure: ftes {
    type: sum
    sql: ${headcount} ;;
    label: "Headcount"
  }

  set: detail {
    fields: [dte_month, department, headcount, category]
  }
}
