view: utilization_run_rate {
  sql_table_name: (select * from DEV.ERIKJONES.CX_FCT_ADOPTION_RATE_METRICS);;
  drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: current_contract_end {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END" ;;
  }

  dimension: total_fy_forecast {
    type: number
    sql: ${TABLE}."TOTAL_FY_FORECAST" ;;
  }

  dimension: run_rate {
    type: number
    sql: ${TABLE}."RUN_RATE" ;;
  }

  dimension: contract_term_forecast {
    type: number
    sql: ${TABLE}."CONTRACT_TERM_FORECAST" ;;
  }

  dimension: renewal_run_rate {
    type: number
    sql: ${TABLE}."RENEWAL_RUN_RATE" ;;
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
  }

  dimension: attainment_over_current_term {
    type: number
    sql: ${TABLE}."ATTAINMENT_OVER_CURRENT_TERM" ;;
  }

  dimension: projected_attainment_over_term_at_renewal {
    type: number
    sql: ${TABLE}."PROJECTED_ATTAINMENT_OVER_TERM_AT_RENEWAL" ;;
  }

  set: detail {
    fields: [
      customer_name,
      current_contract_end,
      total_fy_forecast,
      run_rate,
      contract_term_forecast,
      renewal_run_rate,
      contracted_pages_over_term,
      attainment_over_current_term,
      projected_attainment_over_term_at_renewal
    ]
  }
}
