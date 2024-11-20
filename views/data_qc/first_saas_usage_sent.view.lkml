view: first_saas_usage_sent {
  sql_table_name: ("PROD"."DATA_QC"."FIRST_SAAS_USAGE_SENT");;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER_INT" ;;
  }

  dimension: first_day_sent {
    type: date
    sql: ${TABLE}."FIRST_DAY_SENT" ;;
  }

  measure: num_customers {
    type: count_distinct
    sql_distinct_key: ${customer} ;;
    sql: ${customer} ;;
    label: "# Customers"
  }

}
