  view: rev_per_emp {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_rev_per_employee);;

  dimension_group: date {
    type: time
    sql: ${TABLE}."DATE" ;;
  }

  dimension: rev_per_emp {
    type: number
    sql: ${TABLE}."REV_PER_EMP" ;;
  }

  measure: revenue_per_employee {
    type: sum
    sql: ${rev_per_emp} ;;
    value_format: "$#,##0"
  }

}
