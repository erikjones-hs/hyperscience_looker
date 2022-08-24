view: actuals_forecast_adoption {
  sql_table_name: (select * from dev.erikjones.actuals_forecast_adoption);;

  dimension_group: dte {
    type: time
    sql: ${TABLE}."DTE" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension_group: end_dte {
    type: time
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: contract_pages_annual {
    type: string
    sql: ${TABLE}."CONTRACT_PAGES_ANNUAL" ;;
  }

  dimension: contract_length_months {
    type: number
    sql: ${TABLE}."CONTRACT_LENGTH_MONTHS" ;;
  }

  measure: total_contracted_pages {
    type: number
    sql: ${TABLE}."TOTAL_CONTRACTED_PAGES" ;;
  }

  measure: cum_sum_forecast {
    type: number
    sql: ${TABLE}."CUM_SUM_FORECAST" ;;
  }

  measure: cum_sum_forecast_lower {
    type: number
    sql: ${TABLE}."CUM_SUM_FORECAST_LOWER" ;;
  }

  measure: cum_sum_forecast_upper {
    type: number
    sql: ${TABLE}."CUM_SUM_FORECAST_UPPER" ;;
  }

  measure: adoption_forecast {
    type: number
    sql: ${TABLE}."ADOPTION_FORECAST" ;;
    label: "Forecast"
  }

  measure: adoption_forecast_lower {
    type: number
    sql: ${TABLE}."ADOPTION_FORECAST_LOWER" ;;
    label: "Forecast (Lower Bound)"
  }

  measure: adoption_forecast_upper {
    type: number
    sql: ${TABLE}."ADOPTION_FORECAST_UPPER" ;;
    label: "Forecast (Upper Bound)"
  }

  set: detail {
    fields: [
      dte_time,
      opp_id,
      opp_name,
      account_id,
      account_name,
      end_dte_time,
      contract_pages_annual,
      contract_length_months,
      total_contracted_pages,
      cum_sum_forecast,
      cum_sum_forecast_lower,
      cum_sum_forecast_upper,
      adoption_forecast,
      adoption_forecast_lower,
      adoption_forecast_upper
    ]
  }
}
