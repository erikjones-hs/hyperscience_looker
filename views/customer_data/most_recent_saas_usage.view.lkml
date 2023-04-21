view: most_recent_saas_usage {
  sql_table_name: ("PROD"."DATA_QC"."DATA_QC_MOST_RECENT_SAAS_USAGE_SENT");;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: most_recent_day_sent {
    type: date
    sql: ${TABLE}."MOST_RECENT_DAY_SENT" ;;
  }

  measure: num_customers {
    type: count_distinct
    sql_distinct_key: ${customer} ;;
    sql: ${customer} ;;
    label: "# Customers"
  }

}
