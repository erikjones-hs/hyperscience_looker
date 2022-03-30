  view: cash_balance {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_cash_balance);;

  measure: count {
    type: count
  }

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: cash_balance {
    type: number
    sql: ${TABLE}."CASH_BALANCE" ;;
  }

  measure: balance_cash {
    type: sum
    sql: ${cash_balance} ;;
    label: "Cash Balance"
  }

}
