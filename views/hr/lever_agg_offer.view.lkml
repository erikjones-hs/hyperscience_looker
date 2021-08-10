view: lever_agg_offer {
  sql_table_name: (select * from dev.hr.lever_fct_offer);;
  drill_fields: [detail*]

  dimension: offer_id {
    type: string
    sql: ${TABLE}."OFFER_ID" ;;
  }

  dimension: offer_opp_id {
    type: string
    sql: ${TABLE}."OFFER_OPP_ID" ;;
  }

  dimension: offer_status {
    type: string
    sql: ${TABLE}."OFFER_STATUS" ;;
  }

  dimension: offer_signed_fl {
    type: number
    sql: ${TABLE}."OFFER_SIGNED_FL" ;;
  }

  dimension: offer_declined_fl {
    type: number
    sql: ${TABLE}."OFFER_DECLINED_FL" ;;
  }

  dimension_group: offer_create_dte {
    type: time
    sql: ${TABLE}."OFFER_CREATE_DTE" ;;
  }

  dimension: offer_creator_name {
    type: string
    sql: ${TABLE}."OFFER_CREATOR_NAME" ;;
  }

  dimension: offer_creator_email {
    type: string
    sql: ${TABLE}."OFFER_CREATOR_EMAIL" ;;
  }

  dimension: offer_comp_currency {
    type: string
    sql: ${TABLE}."OFFER_COMP_CURRENCY" ;;
  }

  dimension: offer_country {
    type: string
    sql: ${TABLE}."OFFER_COUNTRY" ;;
  }

  dimension: offer_level {
    type: number
    sql: ${TABLE}."OFFER_LEVEL" ;;
  }

  dimension: offer_level_type {
    type: string
    sql: ${TABLE}."OFFER_LEVEL_TYPE" ;;
  }

  dimension: offer_job_title {
    type: string
    sql: ${TABLE}."OFFER_JOB_TITLE" ;;
  }

  dimension: num_job_title_offers {
    type: number
    sql: ${TABLE}."NUM_OFFERS" ;;
  }

  dimension: offer_equity {
    type: number
    sql: ${TABLE}."OFFER_EQUITY" ;;
  }

  dimension: offer_equity_type {
    type: string
    sql: ${TABLE}."OFFER_EQUITY_TYPE" ;;
  }

  dimension: offer_salary {
    type: number
    sql: ${TABLE}."OFFER_SALARY" ;;
  }

  dimension: xrate_to_usd {
    type: number
    sql: ${TABLE}."XRATE_TO_USD" ;;
  }

  dimension: salary_usd {
    type: number
    sql: ${TABLE}."SALARY_USD" ;;
  }

  dimension: offer_sales_ote {
    type: number
    sql: ${TABLE}."OFFER_SALES_OTE" ;;
  }

  dimension: sales_ote_usd {
    type: number
    sql: ${TABLE}."SALES_OTE_USD" ;;
  }

  dimension: offer_team {
    type: string
    sql: ${TABLE}."OFFER_TEAM" ;;
  }

  dimension: offer_agency_fees {
    type: number
    sql: ${TABLE}."OFFER_AGENCY_FEES" ;;
  }

  dimension: offer_agency_name {
    type: string
    sql: ${TABLE}."OFFER_AGENCY_NAME" ;;
  }

  dimension: offer_manager_fl {
    type: string
    sql: ${TABLE}."OFFER_MANAGER_FL" ;;
  }

  measure: num_offers {
    type: count_distinct
    sql:  ${offer_id} ;;
    drill_fields: [detail*]
  }

  measure: num_opps {
    type: count_distinct
    sql:  ${offer_opp_id} ;;
    drill_fields: [detail*]
  }

  measure: num_signed {
    type: sum_distinct
    sql_distinct_key: ${offer_id};;
    sql:  ${offer_signed_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_declined {
    type: sum_distinct
    sql_distinct_key: ${offer_id};;
    sql:  ${offer_declined_fl} ;;
    drill_fields: [detail*]
  }

  measure: total_offers {
    type: number
    sql:  ${num_signed} + ${num_declined};;
    drill_fields: [detail*]
  }

  measure: offer_acceptance_rate {
    type: number
    sql:  100.00 * ${num_signed} / NULLIFZERO(${total_offers}) ;;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  measure: median_salary_usd {
    type: median
    sql: ${salary_usd} ;;
    drill_fields: [detail*]
  }

  measure: mean_salary_usd {
    type: average
    sql: ${salary_usd} ;;
    drill_fields: [detail*]
  }

  measure: min_salary_usd {
    type: min
    sql: ${salary_usd} ;;
    drill_fields: [detail*]
  }

  measure: max_salary_usd {
    type: max
    sql: ${salary_usd} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_salary_usd {
    type: percentile
    percentile:  25
    sql: ${salary_usd} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_salary_usd {
    type: percentile
    percentile:  75
    sql: ${salary_usd};;
    drill_fields: [detail*]
  }

  measure: total_agency_fees {
    type: sum
    sql:  ${offer_agency_fees} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      offer_id,
      offer_opp_id,
      offer_status,
      offer_signed_fl,
      offer_declined_fl,
      offer_create_dte_date,
      offer_creator_name,
      offer_creator_email,
      offer_comp_currency,
      offer_country,
      offer_level,
      offer_level_type,
      offer_job_title,
      offer_equity,
      offer_equity_type,
      offer_salary,
      xrate_to_usd,
      salary_usd,
      offer_sales_ote,
      sales_ote_usd,
      offer_team,
      offer_agency_fees,
      offer_agency_name,
      offer_manager_fl
    ]
  }
}
