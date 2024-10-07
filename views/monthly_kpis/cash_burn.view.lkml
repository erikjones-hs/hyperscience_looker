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

    dimension_group: current_date {
      type: time
      timeframes: [date, month, quarter, year]
      sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
    }

  measure: cash_burn {
    type: sum
    sql: ${net_burn} ;;
    value_format: "$#,##0"
    label: "Cash Burn"
  }

  set: detail {
    fields: [dte_month, net_burn]
  }
}
