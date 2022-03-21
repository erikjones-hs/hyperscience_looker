view: time_in_current_stage {
  sql_table_name: (select * from dev.erikjones.sales_stage_from_to);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    sql: ${TABLE}."DATE_RAN" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
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

  dimension: partner_account_name {
    type: string
    sql: ${TABLE}."PARTNER_ACCOUNT_NAME" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension_group: opp_discovery_call_dte {
    type: time
    sql: ${TABLE}."OPP_DISCOVERY_CALL_DTE" ;;
  }

  dimension_group: opp_vf_dte {
    type: time
    sql: ${TABLE}."OPP_VF_DTE" ;;
  }

  dimension_group: opp_tdd_dte {
    type: time
    sql: ${TABLE}."OPP_TDD_DTE" ;;
  }

  dimension_group: opp_eb_go_no_go_dte {
    type: time
    sql: ${TABLE}."OPP_EB_GO_NO_GO_DTE" ;;
  }

  dimension_group: opp_poc_dte {
    type: time
    sql: ${TABLE}."OPP_POC_DTE" ;;
  }

  dimension_group: opp_eb_review_dte {
    type: time
    sql: ${TABLE}."OPP_EB_REVIEW_DTE" ;;
  }

  dimension_group: opp_neg_and_close_dte {
    type: time
    sql: ${TABLE}."OPP_NEG_AND_CLOSE_DTE" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension_group: opp_closed_won_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSED_WON_DTE" ;;
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

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

  dimension: opp_pipeline_category {
    type: string
    sql: ${TABLE}."OPP_PIPELINE_CATEGORY" ;;
  }

  dimension: time_in_discovery {
    type: number
    sql: ${TABLE}."TIME_IN_DISCOVERY" ;;
  }

  dimension: time_in_vf {
    type: number
    sql: ${TABLE}."TIME_IN_VF" ;;
  }

  dimension: time_in_tdd {
    type: number
    sql: ${TABLE}."TIME_IN_TDD" ;;
  }

  dimension: time_in_go_no {
    type: number
    sql: ${TABLE}."TIME_IN_GO_NO" ;;
  }

  dimension: time_in_poc {
    type: number
    sql: ${TABLE}."TIME_IN_POC" ;;
  }

  dimension: time_in_eb_review {
    type: number
    sql: ${TABLE}."TIME_IN_EB_REVIEW" ;;
  }

  dimension: time_in_neg_and_close {
    type: number
    sql: ${TABLE}."TIME_IN_NEG_AND_CLOSE" ;;
  }

  measure: num_opps {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
  }

  measure: discovery_time_in {
    type: number
    sql: ${time_in_discovery} ;;
    label: "Time in Discovery"
  }

  measure: vf_time_in {
    type: number
    sql: ${time_in_vf} ;;
    label: "Time in Value/Fit"
  }

  measure: tdd_time_in {
    type: number
    sql: ${time_in_tdd} ;;
    label: "Time in TDD"
  }

  measure: go_no_time_in {
    type: number
    sql: ${time_in_go_no} ;;
    label: "Time in EB Go/No-Go"
  }

  measure: poc_time_in {
    type: number
    sql: ${time_in_poc} ;;
    label: "Time in POC"
  }

  measure: eb_review_time_in {
    type: number
    sql: ${time_in_eb_review} ;;
    label: "Time in EB Review"
  }

  measure: neg_and_close_time_in {
    type: number
    sql: ${time_in_neg_and_close} ;;
    label: "Time in Negotiate & Close"
  }

  measure: median_discovery {
    type: median
    sql: ${time_in_discovery} ;;
    drill_fields: [detail*]
  }

  measure: mean_discovery {
    type: average
    sql: ${time_in_discovery} ;;
    drill_fields: [detail*]
  }

  measure: min_discovery {
    type: min
    sql: ${time_in_discovery} ;;
    drill_fields: [detail*]
  }

  measure: max_discovery {
    type: max
    sql: ${time_in_discovery} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_discovery{
    type: percentile
    percentile:  25
    sql: ${time_in_discovery} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_discovery {
    type: percentile
    percentile:  75
    sql: ${time_in_discovery};;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      date_ran_time,
      opp_id,
      opp_name,
      account_name,
      account_industry,
      account_sales_region,
      partner_account_name,
      opp_stage_name,
      opp_lead_source,
      opp_is_marketing_influenced_flag,
      opp_created_dte_time,
      opp_discovery_call_dte_time,
      opp_vf_dte_time,
      opp_tdd_dte_time,
      opp_eb_go_no_go_dte_time,
      opp_poc_dte_time,
      opp_eb_review_dte_time,
      opp_neg_and_close_dte_time,
      opp_close_dte_time,
      opp_closed_won_dte_time,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner,
      owner_description,
      opp_pipeline_category,
      time_in_discovery,
      time_in_vf,
      time_in_tdd,
      time_in_go_no,
      time_in_poc,
      time_in_eb_review,
      time_in_neg_and_close
    ]
  }
}
