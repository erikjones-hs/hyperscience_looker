view: fct_renewals {
  sql_table_name: (select * from "PROD"."RENEWALS"."FCT_RENEWALS");;
  drill_fields: [detail*]

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

  dimension: open_opp_id {
    type: string
    sql: ${TABLE}."OPEN_OPP_ID" ;;
  }

  dimension: open_opp_name {
    type: string
    sql: ${TABLE}."OPEN_OPP_NAME" ;;
  }

  dimension: open_opp_arr {
    type: number
    sql: ${TABLE}."OPEN_OPP_ARR" ;;
  }

  dimension: amount_potential_churn {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT" ;;
    label: "Potential Churn ARR"
  }

  dimension: open_opp_net_new_arr_raw {
    type: number
    sql: ${TABLE}."OPEN_OPP_NET_NEW_ARR_RAW" ;;
  }

  dimension_group: open_opp_close_dte {
    type: time
    sql: ${TABLE}."OPEN_OPP_CLOSE_DTE" ;;
  }

  dimension: open_opp_stage_name {
    type: string
    sql: ${TABLE}."OPEN_OPP_STAGE_NAME" ;;
  }

  dimension: open_opp_commit_status {
    type: string
    sql: ${TABLE}."OPEN_OPP_COMMIT_STATUS" ;;
  }

  dimension: open_opp_projected_renewal_type {
    type: string
    sql: ${TABLE}."OPEN_OPP_PROJECTED_RENEWAL_TYPE" ;;
  }

  dimension: health_score {
    type: string
    sql: ${TABLE}."HEALTH_SCORE" ;;
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}."SALES_REGION" ;;
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

  measure: open_opp_net_new_arr {
    type: sum
    sql: ${TABLE}."OPEN_OPP_NET_NEW_ARR" ;;
    label: "Open Opp Net New ARR"
  }

  measure: arr_open_opp {
    type: sum
    sql: ${TABLE}."OPEN_OPP_ARR" ;;
    label: "Open Opp ARR"
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

  measure: potential_churn_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    label: "Potential # Churn Opps"
  }

  measure: logo_churn_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "logo churn"]
    label: "Logo Churn Opps"
  }

  measure: downsell_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "arr decrease"]
    label: "Downsell Opps"
  }

  measure: expansion_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "arr increase"]
    label: "Expansion Opps"
  }

  measure: flat_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "flat"]
    label: "Flat Opps"
  }

  measure: outstanding_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [outstanding_renewal_flag: "=1"]
    label: "# Outstanding Opps"
  }

  measure: upcoming_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [upcoming_renewal_flag: "=1"]
    label: "# Upcoming Opps"
  }

  measure: total_outstanding_opps {
    type: number
    sql: ${outstanding_opps} + ${upcoming_opps} ;;
    label: "# Total Outstanding Opps"
  }

  measure: total_renewal_opps {
    type: number
    sql: ${flat_opps} + ${expansion_opps} + ${downsell_opps} + ${logo_churn_opps} ;;
    label: "# Total Renewals"
  }

  measure: percent_logo_churn {
    type: number
    sql: ${logo_churn_opps} / nullifzero(${total_renewal_opps}) ;;
    label: "% Logo Churn Renewals"
  }

  measure: percent_flat_renewals {
    type: number
    sql: ${flat_opps} / nullifzero(${total_renewal_opps}) ;;
    label: "% Flat Renewals"
  }

  measure: percent_expansion_renewals {
    type: number
    sql: ${expansion_opps} / nullifzero(${total_renewal_opps}) ;;
    label: "% Expansion Renewals"
  }

  measure: percent_arr_churn_renewals {
    type: number
    sql: ${downsell_opps} / nullifzero(${total_renewal_opps}) ;;
    label: "% ARR Churn Renewals"
  }

  set: detail {
    fields: [
      renewal_month_date,
      account_id,
      account_name,
      existing_opp_id,
      existing_opp_name,
      potential_churn_amount,
      renewal_type,
      renewal_arr_change,
      renewal_opp_id,
      renewal_opp_name,
      actual_renewal_amount,
      existing_opp_renewal_date_time
    ]
  }
}
