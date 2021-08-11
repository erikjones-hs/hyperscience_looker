view: agg_pages_expansion {
  sql_table_name: (select * from dev.cx.customer_data_agg_pages_expansion);;
  drill_fields: [detail*]

  dimension_group: first_full_mnth {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num]
    sql: ${TABLE}."FIRST_FULL_MNTH" ;;
  }

  dimension_group: dte {
    type: time
    sql: ${TABLE}."DTE" ;;
  }

  dimension: tot_first_full_month_pages {
    type: number
    sql: ${TABLE}."TOT_FIRST_FULL_MONTH_PAGES" ;;
  }

  dimension: sub_month_pages {
    type: number
    sql: ${TABLE}."SUB_MONTH_PAGES" ;;
  }

  dimension: num_months_since {
    type: number
    sql: ${TABLE}."NUM_MONTHS_SINCE" ;;
  }

  measure: expansion{
    type:  number
    sql:  100 * (${sub_month_pages} / ${tot_first_full_month_pages}) ;;
    value_format: "#0.00\%"
  }

  set: detail {
    fields: []
  }
}
