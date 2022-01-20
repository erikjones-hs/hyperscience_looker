view: forecast_actuals {
  sql_table_name: (select * from DEV.ERIKJONES.CX_FORECAST_ACTUALS);;
  drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension_group: dte {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_year
    ]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: forecast_pages {
    type: number
    sql: ${TABLE}."FORECAST_PAGES" ;;
  }

  dimension: current_contract_start {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_START" ;;
  }

  dimension: current_contract_end {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END" ;;
  }

  dimension: current_contract_term {
    type: number
    sql: ${TABLE}."CURRENT_CONTRACT_TERM" ;;
  }

  dimension: actual_pages_processed {
    type: number
    sql: ${TABLE}."ACTUAL_PAGES_PROCESSED" ;;
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
  }

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension: fy_qtr_year {
    type: string
    sql: ${TABLE}."FY_QTR_YEAR" ;;
  }

  dimension: fy_qtr_end_dte {
    type: date
    sql: ${TABLE}."FY_QTR_END_DTE" ;;
  }

  dimension: date_ran {
    type: date
    sql: ${TABLE}."DATE_RAN" ;;
  }

  measure: total_pages_processed {
    type: sum
    # drill_fields: [details*, number_of_pages_created]
    sql: ${actual_pages_processed}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_pages_forecasted {
    type: sum
    # drill_fields: [details*, number_of_pages_created]
    sql: ${forecast_pages}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_contracted_pages {
    type: sum
    # drill_fields: [details*, number_of_pages_created]
    sql: ${contracted_pages_over_term}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: term {
    type: number
    # drill_fields: [details*, number_of_pages_created]
    sql: ${current_contract_term}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: monthly_contracted_pages {
    type: number
    #drill_fields: [details*, number_of_pages_completed, number_of_documents_completed]
    sql: ${total_contracted_pages}::real/nullif(${term}::real,0) ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  set: detail {
    fields: [
      dte,
      customer_name,
      forecast_pages,
      current_contract_start,
      current_contract_end,
      current_contract_term,
      actual_pages_processed,
      contracted_pages_over_term,
      fy_year,
      fy_qtr_year,
      fy_qtr_end_dte,
      date_ran
    ]
  }
}
