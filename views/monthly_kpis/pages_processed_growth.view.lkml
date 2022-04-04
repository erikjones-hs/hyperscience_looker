  view: pages_processed_growth {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_pages_processed_growth);;
    drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: dte_week {
    type: time
    sql: ${TABLE}."DTE_WEEK" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: momentum_4 {
    type: number
    sql: ${TABLE}."MOMENTUM_4" ;;
  }

  dimension: momentum_8 {
    type: number
    sql: ${TABLE}."MOMENTUM_8" ;;
  }

  dimension: momentum_4_ratio {
    type: number
    sql: ${TABLE}."MOMENTUM_4_RATIO" ;;
  }

  set: detail {
    fields: [dte_week_time, customer, momentum_4, momentum_8]
  }
}
