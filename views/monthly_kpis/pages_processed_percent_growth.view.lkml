 view: pages_processed_percent_growth {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_pages_processed_cum_sum);;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte_month {
    type: time
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: total_pages_created {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  dimension: cum_sum_pages {
    type: number
    sql: ${TABLE}."CUM_SUM_PAGES" ;;
  }

  dimension: cum_sum_3_months_prior {
    type: number
    sql: ${TABLE}."CUM_SUM_3_MONTHS_PRIOR" ;;
  }

  dimension: perc_growth {
    type: number
    sql: ${TABLE}."PERC_GROWTH" ;;
  }

  measure: percent_growth {
    type: sum
    sql:  ${perc_growth} ;;
  }

  set: detail {
    fields: [
      customer,
      dte_month_time,
      total_pages_created,
      cum_sum_pages,
      cum_sum_3_months_prior,
      perc_growth
    ]
  }
}
