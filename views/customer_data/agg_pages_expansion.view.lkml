view: agg_pages_expansion {
  sql_table_name: (select * from dev.cx.customer_data_agg_pages_expansion);;
  drill_fields: [detail*]

  dimension_group: first_full_mnth {
    type: time
    sql: ${TABLE}."FIRST_FULL_MNTH" ;;
  }

  dimension: num_months_since {
    type: number
    sql: ${TABLE}."NUM_MONTHS_SINCE" ;;
  }

  dimension: expansion {
    type: number
    sql: ${TABLE}."EXPANSION" ;;
  }

  set: detail {
    fields: [first_full_mnth_time, num_months_since, expansion]
  }
}
