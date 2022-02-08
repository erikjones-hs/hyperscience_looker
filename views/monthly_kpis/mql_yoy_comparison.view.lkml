view: mql_yoy_comparison {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_mqls_ytd_comparison);;
  drill_fields: [detail*]

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: dte_month {
    type: time
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: num_leads {
    type: number
    sql: ${TABLE}."NUM_LEADS" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_mqls {
    type: sum
    sql:  ${num_leads} ;;
    label: "# MQLs"
  }

  set: detail {
    fields: [fy_year, dte_month_time, num_leads]
  }
}
