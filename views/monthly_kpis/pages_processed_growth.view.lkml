  view: pages_processed_growth {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_pages_processed_growth);;

  measure: count {
    type: count
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: pre_pages {
    type: number
    sql: ${TABLE}."PRE_PAGES" ;;
  }

  dimension: post_pages {
    type: number
    sql: ${TABLE}."POST_PAGES" ;;
  }

  dimension: growth {
    type: number
    sql: ${TABLE}."GROWTH" ;;
  }

}
