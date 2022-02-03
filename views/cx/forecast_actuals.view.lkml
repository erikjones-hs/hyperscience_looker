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
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
    drill_fields: [detail*]
  }

  dimension: forecast_pages {
    type: number
    sql: ${TABLE}."FORECAST_PAGES" ;;
    drill_fields: [detail*]
  }

  dimension: current_contract_start {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_START" ;;
    drill_fields: [detail*]
  }

  dimension: current_contract_end {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END" ;;
    drill_fields: [detail*]
  }

  dimension: current_contract_term {
    type: number
    sql: ${TABLE}."CURRENT_CONTRACT_TERM" ;;
    drill_fields: [detail*]
  }

  dimension: actual_pages_processed {
    type: number
    sql: ${TABLE}."ACTUAL_PAGES_PROCESSED" ;;
    drill_fields: [detail*]
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
    drill_fields: [detail*]
  }

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
    drill_fields: [detail*]
  }

  dimension: fy_qtr_year {
    type: string
    sql: ${TABLE}."FY_QTR_YEAR" ;;
    drill_fields: [detail*]
  }

  dimension: fy_qtr_end_dte {
    type: date
    sql: ${TABLE}."FY_QTR_END_DTE" ;;
    drill_fields: [detail*]
  }

  dimension: date_ran {
    type: date
    sql: ${TABLE}."DATE_RAN" ;;
    drill_fields: [detail*]
  }

  dimension: usage_collected {
    type: yesno
    sql: ${actual_pages_processed} > 0 AND ${forecast_pages} > 0;;
    drill_fields: [detail*]
  }

  dimension: usage_expected {
    type: yesno
    sql: ${forecast_pages} > 0 ;;
    drill_fields: [detail*]
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: fed_sled {
    type: string
    sql: CASE WHEN ${industry} = 'Government & Public Services' AND ${customer_name} in ('Dept. of VA via VICCS (IBM/DLT)','SSA-Dedupe', 'SSA-Extract') THEN 'Fed'
    WHEN ${industry} = 'Government & Public Services' AND ${customer_name} in ('Treasury') THEN 'Treasury'
    ELSE 'Private/Sled' END;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}."PARTNER" ;;
  }

  dimension: prev_three_month_page_avg {
    type: number
    sql: ${TABLE}."PREV_THREE_MONTH_PAGE_AVG" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }


  measure: total_usage_collected {
    type: number
    sql: SUM(CASE WHEN ${usage_collected} THEN 1 ELSE 0 END) ;;
  }

  measure: three_month_page_avg {
    type: sum
    drill_fields: [detail*]
    sql: ${prev_three_month_page_avg}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: three_month_page_avg_missing_customers {
    type: sum
    drill_fields: [detail*]
    sql: ${prev_three_month_page_avg}  ;;
    filters: [usage_collected: "no", usage_expected: "yes"]
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_usage_expected {
    type: number
    sql: SUM(CASE WHEN ${usage_expected} THEN 1 ELSE 0 END) ;;
  }

  measure: total_pages_processed {
    type: sum
    drill_fields: [detail*]
    sql: ${actual_pages_processed}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_pages_processed_fed {
    type: sum
    drill_fields: [detail*]
    sql: ${actual_pages_processed}  ;;
    filters: [fed_sled: "Fed"]
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_pages_forecasted {
    type: sum
   drill_fields: [detail*]
    sql: ${forecast_pages}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  measure: total_pages_forecasted_fed {
    type: sum
    drill_fields: [detail*]
    sql: ${forecast_pages}  ;;
    filters: [fed_sled: "Fed"]
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
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

  measure: term {
    type: max
    drill_fields: [detail*]
    sql: ${current_contract_term}  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }


  measure: diff_from_forecast {
    type: number
    drill_fields: [detail*]
    sql: ${forecast_actuals.total_pages_processed}-${forecast_actuals.total_pages_forecasted};;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    # link: {
    #   label: "Detailed View of pages Created"
    #   url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    # }
  }

  set: detail {
    fields: [
      dte,
      customer_name,
      actual_pages_processed,
      forecast_pages,
      diff_from_forecast,
      contracted_pages_over_term,
      current_contract_start,
      current_contract_end,
      current_contract_term,
      prev_three_month_page_avg,
      fy_year,
      fy_qtr_year,
      fy_qtr_end_dte,
      region,
      industry,
      partner,
      date_ran
    ]
  }
}
