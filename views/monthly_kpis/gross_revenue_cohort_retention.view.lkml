view: gross_revenue_cohort_retention {
  sql_table_name: (select * from dev.erikjones.fct_gross_rev_retention_cohort);;
  drill_fields: [detail*]

  dimension: first_active_quarter {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_QUARTER" ;;
  }

  dimension: num_quarters_since_start {
    type: number
    sql: ${TABLE}."NUM_QUARTERS_SINCE_START" ;;
  }

  dimension: tot_rev_amt {
    type: number
    sql: ${TABLE}."TOT_REV_AMT" ;;
  }

  dimension: cohort_rev_amt {
    type: number
    sql: ${TABLE}."COHORT_REV_AMT" ;;
  }

  dimension: gross_rev_retention {
    type: number
    sql: ${TABLE}."GROSS_REV_RETENTION" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: gross_rev_amt {
    type:  sum
    sql:  ${tot_rev_amt} ;;
    value_format: "$#,##0"
    label: "Gross Revenue"
  }

  measure: cohort_revenue_amt {
    type:  sum
    sql:  ${cohort_rev_amt} ;;
    value_format: "$#,##0"
    label: "Cohort Starting Revenue"
  }

  measure: gross_revenue_retention {
    type:  sum
    sql: 100 * ${gross_rev_retention} ;;
    value_format: "#0\%"
    label: "Gross Revenue Retention"
  }



  set: detail {
    fields: [first_active_quarter, num_quarters_since_start, tot_rev_amt, cohort_rev_amt, gross_rev_retention]
  }
}
