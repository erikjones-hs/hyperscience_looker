view: net_revenue_cohort_retention {
  sql_table_name: (select * from dev.erikjones.prod.monthly_kpis.net_revenue_retention_cohort_qtr);;
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

  dimension: net_rev_retention {
    type: number
    sql: ${TABLE}."NET_REV_RETENTION" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: revenue_amount {
    type:  sum
    sql: ${tot_rev_amt} ;;
    value_format: "$#,##0"
  }

  measure: cohort_revenue_amount {
    type:  sum
    sql: ${cohort_rev_amt} ;;
    value_format: "$#,##0"
  }

  measure: net_revenue_retention {
    type:  sum
    sql: 100 * ${net_rev_retention} ;;
    value_format: "#0\%"
    label: "Net Revenue Retention"
  }

  set: detail {
    fields: [first_active_quarter, num_quarters_since_start, tot_rev_amt, cohort_rev_amt, net_rev_retention]
  }
}
