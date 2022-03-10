  view: cash_burn {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_cash_burn);;
    drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: net_burn {
    type: number
    sql: ${TABLE}."NET_BURN" ;;
  }

  measure: cash_burn {
    type: sum
    sql: -1*${net_burn} ;;
    value_format: "$#,##0"
    label: "Cash Burn"
  }

  set: detail {
    fields: [dte_month, net_burn]
  }
}
