view: sql_runner_query {
  sql_table_name: (select * from dev.cx.customer_data_fct_weekly_pages);;
  drill_fields: [detail*]

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte_week {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_WEEK" ;;
  }

  dimension: weekly_pages {
    type: number
    sql: ${TABLE}."WEEKLY_PAGES" ;;
  }

  dimension: ma_2 {
    type: number
    sql: ${TABLE}."MA_2" ;;
  }

  dimension: ma_4 {
    type: number
    sql: ${TABLE}."MA_4" ;;
  }

  dimension: ma_8 {
    type: number
    sql: ${TABLE}."MA_8" ;;
  }

  dimension: ma_12 {
    type: number
    sql: ${TABLE}."MA_12" ;;
  }

  dimension: momentum_1 {
    type: number
    sql: ${TABLE}."MOMENTUM_1" ;;
  }

  dimension: momentum_4 {
    type: number
    sql: ${TABLE}."MOMENTUM_4" ;;
  }

  dimension: momentum_8 {
    type: number
    sql: ${TABLE}."MOMENTUM_8" ;;
  }

  dimension: momentum_12 {
    type: number
    sql: ${TABLE}."MOMENTUM_12" ;;
  }

  dimension: oscillation {
    type: number
    sql: ${TABLE}."OSCILLATION" ;;
  }

measure: count {
  type: count
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
