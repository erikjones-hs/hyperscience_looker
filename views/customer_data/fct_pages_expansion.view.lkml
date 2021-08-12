view: fct_pages_expansion {
  sql_table_name: (select * from dev.cx.customer_data_fct_pages_expansion);;
  drill_fields: [detail*]

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: first_full_month {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num]
    sql: ${TABLE}."FIRST_FULL_MONTH" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: total_pages_created {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  dimension_group: num_months_since {
    type: duration
    sql_start: ${first_full_month_date} ;;
    sql_end: ${dte_date} ;;

  }

  measure: sum_pages {
    type: sum
    sql:  ${total_pages_created} ;;
  }

  set: detail {
    fields: []
  }
}
