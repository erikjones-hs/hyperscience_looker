  view: customer_cohort_retention {
    sql_table_name: (select * from dev.erikjones.fct_customer_retention_cohort);;
    drill_fields: [detail*]

  dimension: first_active_quarter {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_QUARTER" ;;
  }

  dimension: num_quarters_since_start {
    type: number
    sql: ${TABLE}."NUM_QUARTERS_SINCE_START" ;;
  }

  dimension: num_active_customers {
    type: number
    sql: ${TABLE}."NUM_ACTIVE_CUSTOMERS" ;;
  }

  dimension: cohort_customer_count {
    type: number
    sql: ${TABLE}."COHORT_CUSTOMER_COUNT" ;;
  }

  dimension: gross_logo_retention {
    type: number
    sql: ${TABLE}."GROSS_LOGO_RETENTION" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: active_customers{
    type:  sum
    sql:  ${num_active_customers} ;;
    label: "Number Active Customers"
  }

  measure: cohort_customers{
    type:  sum
    sql:  ${cohort_customer_count} ;;
    label: "Number Cohort Customers"
  }

  measure: logo_retention {
    type:  sum
    sql:  100 * ${gross_logo_retention} ;;
    value_format: "#0\%"
    label: "Gross Logo Retention"
  }


  set: detail {
    fields: [first_active_quarter, num_quarters_since_start, num_active_customers, cohort_customer_count, gross_logo_retention]
  }
}
