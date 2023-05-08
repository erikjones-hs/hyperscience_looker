view: fct_renewals {
  sql_table_name: (select * from "PROD"."RENEWALS"."FCT_RENEWALS");;

  dimension_group: renewal_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RENEWAL_MONTH" ;;
  }

  dimension: qtr_end_dte {
    type: date
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: existing_opp_id {
    type: string
    sql: ${TABLE}."EXISTING_OPP_ID" ;;
  }

  dimension: existing_opp_name {
    type: string
    sql: ${TABLE}."EXISTING_OPP_NAME" ;;
  }

  dimension: has_account_renewed_flag {
    type: number
    sql: ${TABLE}."HAS_ACCOUNT_RENEWED_FLAG" ;;
  }

  dimension: renewal_type {
    type: string
    sql: ${TABLE}."RENEWAL_TYPE" ;;
  }

  dimension: renewal_opp_id {
    type: string
    sql: ${TABLE}."RENEWAL_OPP_ID" ;;
  }

  dimension: renewal_opp_name {
    type: string
    sql: ${TABLE}."RENEWAL_OPP_NAME" ;;
  }

  dimension: renewal_with_arr_churn_flag {
    type: number
    sql: ${TABLE}."RENEWAL_WITH_ARR_CHURN_FLAG" ;;
  }

  dimension: renewal_with_arr_expansion_flag {
    type: number
    sql: ${TABLE}."RENEWAL_WITH_ARR_EXPANSION_FLAG" ;;
  }

  dimension: flat_renewal_flag {
    type: number
    sql: ${TABLE}."FLAT_RENEWAL_FLAG" ;;
  }

  dimension: logo_churn_flag {
    type: number
    sql: ${TABLE}."LOGO_CHURN_FLAG" ;;
  }

  dimension: renewal_flag {
    type: number
    sql: ${TABLE}."RENEWAL_FLAG" ;;
  }

  dimension: has_churned_flag {
    type: number
    sql: ${TABLE}."HAS_CHURNED_FLAG" ;;
  }

  dimension: outstanding_renewal_flag {
    type: number
    sql: ${TABLE}."OUTSTANDING_RENEWAL_FLAG" ;;
  }

  dimension: upcoming_renewal_flag {
    type: number
    sql: ${TABLE}."UPCOMING_RENEWAL_FLAG" ;;
  }

  dimension_group: existing_opp_renewal_date {
    type: time
    sql: ${TABLE}."EXISTING_OPP_RENEWAL_DATE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: potential_churn_amount {
    type: sum
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT" ;;
    label: "Potential Churn Amount"
  }

  measure: renewal_arr_change {
    type: sum
    sql: ${TABLE}."RENEWAL_ARR_CHANGE" ;;
    label: "Renewal ARR Change"
  }

  measure: actual_renewal_amount {
    type: sum
    sql: ${TABLE}."ACTUAL_RENEWAL_AMOUNT" ;;
    label: "Actual Renewal Amount"
  }

  measure: logo_churn_arr {
    type: sum
    sql: ${TABLE}."RENEWAL_ARR_CHANGE" ;;
    filters: [renewal_type: "logo churn"]
    label: "Logo Churn ARR"
  }

  measure: downsell_arr {
    type: sum
    sql: ${TABLE}."RENEWAL_ARR_CHANGE" ;;
    filters: [renewal_type: "arr decrease"]
    label: "Downsell ARR"
  }

  measure: uplift_arr {
    type: sum
    sql: ${TABLE}."RENEWAL_ARR_CHANGE" ;;
    filters: [renewal_type: "arr increase"]
    label: "Uplift ARR"
  }

  measure: total_contraction {
    type: number
    sql: ${logo_churn_arr} + ${downsell_arr} ;;
    label: "Total Contraction"
  }

  measure: gross_retention {
    type: number
    sql:  (${potential_churn_amount} + ${total_contraction}) / NULLIFZERO(${potential_churn_amount});;
    label: "Gross Retention %"
  }

  measure: net_retention {
    type: number
    sql: (${potential_churn_amount} + ${total_contraction} + ${uplift_arr}) / NULLIFZERO(${potential_churn_amount});;
    label: "Net Retention %"
  }

  set: detail {
    fields: [
      renewal_month_date,
      qtr_end_dte,
      account_id,
      account_name,
      existing_opp_id,
      existing_opp_name,
      potential_churn_amount,
      has_account_renewed_flag,
      renewal_type,
      renewal_arr_change,
      renewal_opp_id,
      renewal_opp_name,
      actual_renewal_amount,
      renewal_with_arr_churn_flag,
      renewal_with_arr_expansion_flag,
      flat_renewal_flag,
      logo_churn_flag,
      renewal_flag,
      has_churned_flag,
      outstanding_renewal_flag,
      upcoming_renewal_flag,
      existing_opp_renewal_date_time
    ]
  }
}
