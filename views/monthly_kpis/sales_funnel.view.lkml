view: sales_funnel {
  sql_table_name: (select * from dev.erikjones.fct_sales_funnel);;
  drill_fields: [detail*]

  dimension_group: opp_create_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATE_DTE" ;;
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

  dimension: account_industry {
    type: string
    sql: ${TABLE}."ACCOUNT_INDUSTRY" ;;
  }

  dimension: account_sales_region {
    type: string
    sql: ${TABLE}."ACCOUNT_SALES_REGION" ;;
  }

  dimension: opp_partner_account {
    type: string
    sql: ${TABLE}."OPP_PARTNER_ACCOUNT" ;;
  }

  dimension: partner_account_name {
    type: string
    sql: ${TABLE}."PARTNER_ACCOUNT_NAME" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension: opp_is_partner_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_PARTNER_INFLUENCED_FLAG" ;;
  }

  dimension: opp_had_discovery_call_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_DISCOVERY_CALL_FLAG" ;;
  }

  dimension: opp_had_vf_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_VF_FLAG" ;;
  }

  dimension: opp_had_tdd_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_TDD_FLAG" ;;
  }

  dimension: opp_had_eb_go_no_go_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_EB_GO_NO_GO_FLAG" ;;
  }

  dimension: opp_had_poc_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_POC_FLAG" ;;
  }

  dimension: opp_had_eb_review_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_EB_REVIEW_FLAG" ;;
  }

  dimension: opp_had_neg_and_close_flag {
    type: number
    sql: ${TABLE}."OPP_HAD_NEG_AND_CLOSE_FLAG" ;;
  }

  dimension: opp_closed_won_flag {
    type: number
    sql: ${TABLE}."OPP_CLOSED_WON_FLAG" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  measure: num_had_discovery_call {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_discovery_call_flag: "= 1"]
    label: "# Discovery Call"
  }

  measure: num_had_vf {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_vf_flag: "= 1"]
    label: "# Value/Fit"
  }

  measure: num_had_tdd {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_tdd_flag: "= 1"]
    label: "# TDD"
  }

  measure: num_eb_go_no_go {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_eb_go_no_go_flag: "= 1"]
    label: "# EB Go/No"
  }

  measure: num_had_poc {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_poc_flag: "= 1"]
    label: "# POC"
  }

  measure: num_had_eb_review {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_eb_review_flag: "= 1"]
    label: "# EB Review"
  }

  measure: num_neg_and_close {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_had_neg_and_close_flag: "= 1"]
    label: "# Neg. & Close"
  }

  measure: num_closed_won {
    type:  count_distinct
    sql: ${opp_id} ;;
    filters: [opp_closed_won_flag: "= 1"]
    label: "# Closed Won"
  }

  measure: discovery_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_had_discovery_call};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "Discovery Call - Closed Won Ratio"
  }

  measure: vf_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_had_vf};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "Value/Fit - Closed Won Ratio"
  }

  measure: tdd_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_had_tdd};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "TDD - Closed Won Ratio"
  }

  measure: eb_go_no_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_eb_go_no_go};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "EB Go/No - Closed Won Ratio"
  }

  measure: poc_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_had_poc};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "POC - Closed Won Ratio"
  }

  measure: eb_review_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_had_eb_review};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "EB Review - Closed Won Ratio"
  }

  measure: neg_closed_ratio {
    type: number
    sql:100 * ${num_closed_won} / NULLIFZERO(${num_neg_and_close};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
    label: "Neg. & Close - Closed Won Ratio"
  }



  set: detail {
    fields: [
      opp_create_dte_date,
      opp_id,
      opp_name,
      account_id,
      account_name,
      account_industry,
      account_sales_region,
      opp_partner_account,
      partner_account_name,
      opp_is_marketing_influenced_flag,
      opp_is_partner_influenced_flag,
      opp_had_discovery_call_flag,
      opp_had_vf_flag,
      opp_had_tdd_flag,
      opp_had_eb_go_no_go_flag,
      opp_had_poc_flag,
      opp_had_eb_review_flag,
      opp_had_neg_and_close_flag,
      opp_closed_won_flag,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner
    ]
  }
}
