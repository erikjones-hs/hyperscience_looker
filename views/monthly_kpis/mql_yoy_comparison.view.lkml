view: mql_yoy_comparison {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_mql_yoy_comparison);;

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: num_leads {
    type: number
    sql: ${TABLE}."NUM_MQLS" ;;
  }

  measure: count {
    type: count
  }

  measure: num_mqls {
    type: number
    sql:  ${num_leads} ;;
    label: "# MQLs"
  }

}
