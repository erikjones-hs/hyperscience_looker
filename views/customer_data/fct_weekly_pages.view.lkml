view: fct_weekly_pages {
  sql_table_name: (select * from dev.cx.customer_data_fct_weekly_pages);;
  drill_fields: [detail*]

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte_week {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_WEEK" ;;
  }

  dimension: weekly_pages {
    type: number
    sql: ${TABLE}."WEEKLY_PAGES" ;;
  }

  measure: ma_2 {
    type: sum
    sql: ${TABLE}."MA_2" ;;
  }

  measure: ma_4 {
    type: sum
    sql: ${TABLE}."MA_4" ;;
  }

  measure: ma_8 {
    type: sum
    sql: ${TABLE}."MA_8" ;;
  }

  measure: ma_12 {
    type: sum
    sql: ${TABLE}."MA_12" ;;
  }

  measure: momentum_1 {
    type: sum
    sql: ${TABLE}."MOMENTUM_1" ;;
  }

  measure: momentum_4 {
    type: sum
    sql: ${TABLE}."MOMENTUM_4" ;;
  }

  measure: momentum_8 {
    type: sum
    sql: ${TABLE}."MOMENTUM_8" ;;
  }

  measure: momentum_12 {
    type: sum
    sql: ${TABLE}."MOMENTUM_12" ;;
  }

  measure: oscillation {
    type: sum
    sql: ${TABLE}."OSCILLATION" ;;
  }

  measure: count {
  type: count
  drill_fields: [detail*]
  }

  measure: sum_pages {
    type: sum
    sql:  ${weekly_pages} ;;
  }

  measure: median_pages_created {
    type: median
    sql: ${weekly_pages} ;;
    drill_fields: [detail*]
  }
  measure: min_pages_created {
    type: min
    sql: ${weekly_pages} ;;
    drill_fields: [detail*]
  }

  measure: max_pages_created {
    type: max
    sql: ${weekly_pages} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_pages_created {
    type: percentile
    percentile:  25
    sql: ${weekly_pages} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_pages_created {
    type: percentile
    percentile:  75
    sql: ${weekly_pages} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      customer,
      weekly_pages,
      ma_2,
      ma_4,
      ma_8,
      ma_12,
      momentum_1,
      momentum_4,
      momentum_8,
      momentum_12,
      oscillation
    ]
  }
}
