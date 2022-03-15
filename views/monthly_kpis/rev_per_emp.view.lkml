  view: rev_per_emp {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_rev_per_employee);;

  dimension_group: date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: rev_per_emp {
    type: number
    sql: ${TABLE}."REV_PER_EMP" ;;
    label: "Revenue / Employee"
  }

  measure: revenue_per_employee {
    type: sum
    sql: ${rev_per_emp} ;;
    value_format: "$#,##0"
  }

}
