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
    drill_fields: [detail*]
  }

  dimension: current_contract_end {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END" ;;
    drill_fields: [detail*]
  }

  dimension: total_fy_forecast {
    type: number
    sql: ${TABLE}."TOTAL_FY_FORECAST" ;;
    drill_fields: [detail*]
  }

  dimension: run_rate {
    type: number
    sql: ${TABLE}."RUN_RATE" ;;
    drill_fields: [detail*]
  }

  dimension: contract_term_forecast {
    type: number
    sql: ${TABLE}."CONTRACT_TERM_FORECAST" ;;
    drill_fields: [detail*]
  }

  dimension: renewal_run_rate {
    type: number
    sql: ${TABLE}."RENEWAL_RUN_RATE" ;;
    drill_fields: [detail*]
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
    drill_fields: [detail*]
  }

  dimension: attainment_over_current_term {
    type: number
    sql: ${TABLE}."ATTAINMENT_OVER_CURRENT_TERM" ;;
    drill_fields: [detail*]
  }

  dimension: projected_attainment_over_term_at_renewal {
    type: number
    sql: ${TABLE}."PROJECTED_ATTAINMENT_OVER_TERM_AT_RENEWAL" ;;
    drill_fields: [detail*]
  }

  measure: total_contracted_pages {
    type: sum
    drill_fields: [detail*]
    sql: ${contracted_pages_over_term}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
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
