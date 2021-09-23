view: sales {
  sql_table_name: (select * from dev.sales.salesforce_agg_opporunity;;
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

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_stage_name_ordered {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME_ORDERED" ;;
  }

  dimension: opp_discovery_flag {
    type: number
    sql: ${TABLE}."OPP_DISCOVERY_FLAG" ;;
  }

  dimension: opp_vf_flag {
    type: number
    sql: ${TABLE}."OPP_VF_FLAG" ;;
  }

  dimension: opp_tdd_flag {
    type: number
    sql: ${TABLE}."OPP_TDD_FLAG" ;;
  }

  dimension: opp_eb_go_no_go_flag {
    type: number
    sql: ${TABLE}."OPP_EB_GO_NO_GO_FLAG" ;;
  }

  dimension: opp_tve_flag {
    type: number
    sql: ${TABLE}."OPP_TVE_FLAG" ;;
  }

  dimension: opp_eb_revisit_flag {
    type: number
    sql: ${TABLE}."OPP_EB_REVISIT_FLAG" ;;
  }

  dimension: opp_neg_close_flag {
    type: number
    sql: ${TABLE}."OPP_NEG_CLOSE_FLAG" ;;
  }

  dimension: opp_closed_won_flag {
    type: number
    sql: ${TABLE}."OPP_CLOSED_WON_FLAG" ;;
  }

  dimension: opp_dq_flag {
    type: number
    sql: ${TABLE}."OPP_DQ_FLAG" ;;
  }

  dimension: opp_is_active {
    type: string
    sql: ${TABLE}."OPP_IS_ACTIVE" ;;
  }

  dimension: opp_is_active_flag {
    type: number
    sql: ${TABLE}."OPP_IS_ACTIVE_FLAG" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: opp_partner_influence {
    type: string
    sql: ${TABLE}."OPP_PARTNER_INFLUENCE" ;;
  }

  dimension: opp_is_partner_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_PARTNER_INFLUENCED_FLAG" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension: opp_secondary_lead_source {
    type: string
    sql: ${TABLE}."OPP_SECONDARY_LEAD_SOURCE" ;;
  }

  dimension: opp_commit_status {
    type: string
    sql: ${TABLE}."OPP_COMMIT_STATUS" ;;
  }

  dimension: opp_pipeline_category {
    type: string
    sql: ${TABLE}."OPP_PIPELINE_CATEGORY" ;;
  }

  dimension: opp_qualified_pipeline_flag {
    type: number
    sql: ${TABLE}."OPP_QUALIFIED_PIPELINE_FLAG" ;;
  }

  dimension: opp_pipeline_flag {
    type: number
    sql: ${TABLE}."OPP_PIPELINE_FLAG" ;;
  }

  dimension: opp_fiscal {
    type: string
    sql: ${TABLE}."OPP_FISCAL" ;;
  }

  dimension: opp_loss_reason {
    type: string
    sql: ${TABLE}."OPP_LOSS_REASON" ;;
  }

  dimension_group: opp_closed_won_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_CLOSED_WON_DTE" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension: opp_sales_cycle_days {
    type: number
    sql: ${TABLE}."OPP_SALES_CYCLE_DAYS" ;;
  }

  dimension_group: opp_start_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_START_DTE" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension_group: opp_discovery_call_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_DISCOVERY_CALL_DTE" ;;
  }

  dimension_group: opp_vf_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_VF_DTE" ;;
  }

  dimension_group: opp_tdd_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_TDD_DTE" ;;
  }

  dimension_group: opp_eb_go_no_go_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_EB_GO_NO_GO_DTE" ;;
  }

  dimension_group: opp_poc_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_POC_DTE" ;;
  }

  dimension_group: opp_eb_review_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_EB_REVIEW_DTE" ;;
  }

  dimension_group: opp_neg_and_close_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_NEG_AND_CLOSE_DTE" ;;
  }

  dimension_group: opp_vo_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_VO_DTE" ;;
  }

  dimension_group: opp_nbm_meeting_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."OPP_NBM_MEETING_DTE" ;;
  }

  dimension: closed_won_fy_qtr {
    type: string
    sql: ${TABLE}."CLOSED_WON_FY_QTR" ;;
  }

  dimension: close_fy_qtr {
    type: string
    sql: ${TABLE}."CLOSE_FY_QTR" ;;
  }

  dimension: start_fy_qtr {
    type: string
    sql: ${TABLE}."START_FY_QTR" ;;
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

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opp_services_nrr {
    type: number
    sql: ${TABLE}."OPP_SERVICES_NRR" ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}."IS_DELETED" ;;
  }

  dimension: opp_owner_id {
    type: string
    sql: ${TABLE}."OPP_OWNER_ID" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_opps {
    type: count_distinct
    sql:  ${opp_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      account_id,
      account_name,
      account_industry,
      account_sales_region,
      opp_partner_account,
      partner_account_name,
      opp_stage_name,
      opp_stage_name_ordered,
      opp_discovery_flag,
      opp_vf_flag,
      opp_tdd_flag,
      opp_eb_go_no_go_flag,
      opp_tve_flag,
      opp_eb_revisit_flag,
      opp_neg_close_flag,
      opp_closed_won_flag,
      opp_dq_flag,
      opp_is_active,
      opp_is_active_flag,
      opp_revenue_type,
      opp_lead_source,
      opp_partner_influence,
      opp_is_partner_influenced_flag,
      opp_is_marketing_influenced_flag,
      opp_secondary_lead_source,
      opp_commit_status,
      opp_pipeline_category,
      opp_qualified_pipeline_flag,
      opp_pipeline_flag,
      opp_fiscal,
      opp_loss_reason,
      opp_sales_cycle_days,
      closed_won_fy_qtr,
      close_fy_qtr,
      start_fy_qtr,
      opp_had_discovery_call_flag,
      opp_had_vf_flag,
      opp_had_tdd_flag,
      opp_had_eb_go_no_go_flag,
      opp_had_poc_flag,
      opp_had_eb_review_flag,
      opp_had_neg_and_close_flag,
      opp_arr,
      opp_net_new_arr,
      opp_services_nrr,
      is_deleted,
      opp_owner_id,
      opportunity_owner,
      username,
      owner_description
    ]
  }
}
