  view: days_to_close_dq {
    sql_table_name: (select * from dev.erikjones.pipeline_days_to_close_dq);;
    drill_fields: [detail*]

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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
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

  dimension_group: opp_closed_won_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSED_WON_DTE" ;;
  }

  dimension_group: opp_dq_dte {
    type: time
    sql: ${TABLE}."OPP_DQ_DTE" ;;
  }

  dimension: opp_sales_cycle_days {
    type: number
    sql: ${TABLE}."OPP_SALES_CYCLE_DAYS" ;;
  }

  dimension: create_to_closed_won_days {
    type: number
    sql: ${TABLE}."CREATE_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: discovery_to_closed_won_days {
    type: number
    sql: ${TABLE}."DISCOVERY_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: vf_to_closed_won_days {
    type: number
    sql: ${TABLE}."VF_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: tdd_to_closed_won_days {
    type: number
    sql: ${TABLE}."TDD_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: eb_go_no_go_to_closed_won_days {
    type: number
    sql: ${TABLE}."EB_GO_NO_GO_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: poc_to_closed_won_days {
    type: number
    sql: ${TABLE}."POC_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: eb_review_to_closed_won_days {
    type: number
    sql: ${TABLE}."EB_REVIEW_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: neg_and_close_to_closed_won_days {
    type: number
    sql: ${TABLE}."NEG_AND_CLOSE_TO_CLOSED_WON_DAYS" ;;
  }

  dimension: create_to_dq_days {
    type: number
    sql: ${TABLE}."CREATE_TO_DQ_DAYS" ;;
  }

  dimension: discovery_to_dq_days {
    type: number
    sql: ${TABLE}."DISCOVERY_TO_DQ_DAYS" ;;
  }

  dimension: vf_to_dq_days {
    type: number
    sql: ${TABLE}."VF_TO_DQ_DAYS" ;;
  }

  dimension: tdd_to_dq_days {
    type: number
    sql: ${TABLE}."TDD_TO_DQ_DAYS" ;;
  }

  dimension: eb_go_no_go_to_dq_days {
    type: number
    sql: ${TABLE}."EB_GO_NO_GO_TO_DQ_DAYS" ;;
  }

  dimension: poc_to_dq_days {
    type: number
    sql: ${TABLE}."POC_TO_DQ_DAYS" ;;
  }

  dimension: eb_review_to_dq_days {
    type: number
    sql: ${TABLE}."EB_REVIEW_TO_DQ_DAYS" ;;
  }

  dimension: neg_and_close_to_dq_days {
    type: number
    sql: ${TABLE}."NEG_AND_CLOSE_TO_DQ_DAYS" ;;
  }

  dimension: disc_to_vf {
    type: number
    sql: ${TABLE}."DISC_TO_VF" ;;
  }

  dimension: vf_to_tdd {
    type: number
    sql: ${TABLE}."VF_TO_TDD" ;;
  }

  dimension: tdd_to_eb_go_no_go {
    type: number
    sql: ${TABLE}."TDD_TO_EB_GO_NO_GO" ;;
  }

  dimension: eb_go_no_go_to_poc {
    type: number
    sql: ${TABLE}."EB_GO_NO_GO_TO_POC" ;;
  }

  dimension: poc_to_eb_review {
    type: number
    sql: ${TABLE}."POC_TO_EB_REVIEW" ;;
  }

  dimension: eb_review_to_neg_and_close {
    type: number
    sql: ${TABLE}."EB_REVIEW_TO_NEG_AND_CLOSE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    drill_fields: [detail*]
  }

  measure: sales_cycle_median {
    type: median
    sql: ${opp_sales_cycle_days} ;;
    label: "Median Sales Cycle"
  }

  measure: discovery_to_closed_won_median {
    type: median
    sql: ${discovery_to_closed_won_days} ;;
    label: "Discovery / Cosed Won Median "
  }

  measure: vf_to_closed_won_median {
    type: median
    sql: ${vf_to_closed_won_days} ;;
    label: "VF / Closed Won Median "
  }

  measure: tdd_to_closed_won_median {
    type: median
    sql: ${tdd_to_closed_won_days} ;;
    label: "TDD / Closed Won Median "
  }

  measure: go_no_to_closed_won_median {
    type: median
    sql: ${eb_go_no_go_to_closed_won_days} ;;
    label: "Go, No Go / Closed Won Median "
  }

  measure: poc_to_closed_won_median {
    type: median
    sql: ${poc_to_closed_won_days} ;;
    label: "POC / Closed Won Median "
  }

  measure: review_to_closed_won_median {
    type: median
    sql: ${eb_review_to_closed_won_days} ;;
    label: "EB Review / Closed Won Median "
  }

  measure: neg_and_close_to_closed_won_median {
    type: median
    sql: ${neg_and_close_to_closed_won_days} ;;
    label: "Negotiate & Close / Cosed Won Median "
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      account_id,
      account_name,
      opp_created_dte_time,
      opp_discovery_call_dte_time,
      opp_vf_dte_time,
      opp_tdd_dte_time,
      opp_eb_go_no_go_dte_time,
      opp_poc_dte_time,
      opp_eb_review_dte_time,
      opp_neg_and_close_dte_time,
      opp_closed_won_dte_time,
      opp_dq_dte_time,
      opp_sales_cycle_days,
      create_to_closed_won_days,
      discovery_to_closed_won_days,
      vf_to_closed_won_days,
      tdd_to_closed_won_days,
      eb_go_no_go_to_closed_won_days,
      poc_to_closed_won_days,
      eb_review_to_closed_won_days,
      neg_and_close_to_closed_won_days,
      create_to_dq_days,
      discovery_to_dq_days,
      vf_to_dq_days,
      tdd_to_dq_days,
      eb_go_no_go_to_dq_days,
      poc_to_dq_days,
      eb_review_to_dq_days,
      neg_and_close_to_dq_days,
      disc_to_vf,
      vf_to_tdd,
      tdd_to_eb_go_no_go,
      eb_go_no_go_to_poc,
      poc_to_eb_review,
      eb_review_to_neg_and_close
    ]
  }
}
