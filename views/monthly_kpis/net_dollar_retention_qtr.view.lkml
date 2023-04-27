  view: net_dollar_retention_qtr {
    sql_table_name: (select * from prod.monthly_kpis.net_dollar_retention_qtr);;
    drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: net_dollar_retention {
    type: number
    sql: ${TABLE}."NET_DOLLAR_RETENTION" ;;
  }

  measure: dollar_retention_net {
    type: sum
    sql: ${net_dollar_retention} ;;
    value_format: "0%"
    label: "Net $$ Retention"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [dte_month, net_dollar_retention]
  }
}
