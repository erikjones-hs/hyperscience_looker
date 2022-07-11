view: usage_combined {
  sql_table_name: (select * from dev.erikjones.usage_all_customers);;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte_month {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  measure: total_pages_created {
    type: sum
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  measure: mean_pages_processed {
    type: sum
    sql: ${TABLE}."MEAN_PAGES_PROCESSED" ;;
    label: "Mean (Pages Processed)"
  }

  measure: std_dev_pages_processed {
    type: sum
    sql: ${TABLE}."STD_DEV_PAGES_PROCESSED" ;;
    label: "Standard Deviation (pages Processed)"
  }

  measure: ucl {
    type: number
    sql: ${mean_pages_processed} + (3 * ${std_dev_pages_processed}) ;;
    label: "Upper Control Limit"
  }

  measure: lcl {
    type: number
    sql: ${mean_pages_processed} - (3 * ${std_dev_pages_processed}) ;;
    label: "Lower Control Limit"
  }

  measure: ucl_alert {
    type: number
    sql: ${mean_pages_processed} + (2 * ${std_dev_pages_processed}) ;;
    label: "Upper Control Limit (Alert)"
  }

  measure: lcl_alert {
    type: number
    sql: ${mean_pages_processed} - (2 * ${std_dev_pages_processed}) ;;
    label: "Lower Control Limit (Alert)"
  }

  set: detail {
    fields: [customer, dte_month_date, total_pages_created, mean_pages_processed, std_dev_pages_processed]
  }
}
