view: fct_pages_expansion {
  sql_table_name: (select * from dev.cx.customer_data_fct_pages_expansion);;
  drill_fields: [detail*]

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: first_full_month {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."FIRST_FULL_MONTH" ;;
  }

  dimension_group: dte_month {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension_group: cohort_start_qtr {
    type: time
    timeframes: [date, quarter, year, fiscal_year, fiscal_quarter, fiscal_quarter_of_year]
    sql: ${TABLE}."COHORT_START_QTR" ;;
  }

  dimension_group: dte_qtr {
    type: time
    timeframes: [date, quarter, year, fiscal_year, fiscal_quarter, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_QTR" ;;
  }

  dimension: total_pages_created {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  dimension: num_months_since {
    type: number
    sql: ${TABLE}."NUM_MONTHS_SINCE" ;;
  }

  dimension: num_quarters_since {
    type: number
    sql: ${TABLE}."NUM_QUARTERS_SINCE" ;;
  }

  dimension: is_recent_month {
    type: yesno
    sql: ${dte_month_date}_date} = dateadd(month,-1,date_trunc('month', current_date())) ;;
  }

  dimension: is_prev_month {
    type: yesno
    sql: ${dte_month_date} = dateadd(month,-2,date_trunc('month', current_date())) ;;
  }

  measure: sum_pages {
    type: sum
    sql:  ${total_pages_created} ;;
  }

  measure: most_recent_month_pages {
    type:  sum
    sql:  ${total_pages_created} ;;
    filters: {
      field:  is_recent_month
      value: "yes"
    }
    label: "Num Pages Most Recently Completed Month"
  }

  measure: prev_month_pages {
    type:  sum
    sql:  ${total_pages_created} ;;
    filters: {
      field:  is_prev_month
      value: "yes"
    }
    label: "Num Pages Previously Completed Month"
  }

  measure: mean_pages_created {
    type: average
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }

  measure: median_pages_created {
    type: median
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }
  measure: min_pages_created {
    type: min
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }

  measure: max_pages_created {
    type: max
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_pages_created {
    type: percentile
    percentile:  25
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_pages_created {
    type: percentile
    percentile:  75
    sql: ${total_pages_created} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: []
  }
}
