view: time_in_current_stage {
  sql_table_name: (select * from DEV.ERIKJONES.PIPELINE_TIME_IN_CURRENT_STAGE);;
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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: stage_custom {
    label: "Stage (custom sort)"
    case: {
      when: {
        sql: lower(${opp_stage_name}) = 'ae discovery' ;;
        label: "1. Discovery"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'value/fit' ;;
        label: "2. Value/Fit"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'tdd' ;;
        label: "3. TDD"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb go/no-go' ;;
        label: "4. EB Go/No-Go"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'tve' ;;
        label: "5. POC"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb revisit' ;;
        label: "6. EB Review"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'negotiate and close' ;;
        label: "7. Negotiate & Close"
      }
    }
  }

  dimension: stage_custom_new {
    label: "New Stage (custom sort)"
    case: {
      when: {
        sql: lower(${opp_stage_name}) = 'pipeline generation' ;;
        label: "1. Pipeline Generation"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'discovery & qualification' ;;
        label: "2. Discovery & Qualification"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'alignment' ;;
        label: "3. Alignment"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb sponsorship' ;;
        label: "4. EB Sponsorship"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'value & validation' ;;
        label: "5. Value & Validation"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb signoff & contracts' ;;
        label: "6. EB Sign-Off & Contracts"
      }
    }
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

  dimension: time_in_pipeline {
    type: number
    sql: ${TABLE}."TIME_IN_PIPELINE" ;;
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

  dimension: time_in_discovery_bucket {
    case: {
      when: {
        sql: ${time_in_discovery} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_discovery} > 30 AND ${time_in_discovery} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_discovery} > 60 AND ${time_in_discovery} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_discovery} > 90 AND ${time_in_discovery} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_discovery} > 180 AND ${time_in_discovery} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_discovery} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_tdd_bucket {
    case: {
      when: {
        sql: ${time_in_tdd} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_tdd} > 30 AND ${time_in_tdd} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_tdd} > 60 AND ${time_in_tdd} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_tdd} > 90 AND ${time_in_tdd} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_tdd} > 180 AND ${time_in_tdd} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_tdd} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_vf_bucket {
    case: {
      when: {
        sql: ${time_in_vf} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_vf} > 30 AND ${time_in_vf} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_vf} > 60 AND ${time_in_vf} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_vf} > 90 AND ${time_in_vf} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_vf} > 180 AND ${time_in_vf} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_vf} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_go_no_bucket {
    case: {
      when: {
        sql: ${time_in_go_no} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_go_no} > 30 AND ${time_in_go_no} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_go_no} > 60 AND ${time_in_go_no} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_go_no} > 90 AND ${time_in_go_no} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_go_no} > 180 AND ${time_in_go_no} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_go_no} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_poc_bucket {
    case: {
      when: {
        sql: ${time_in_poc} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_poc} > 30 AND ${time_in_poc} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_poc} > 60 AND ${time_in_poc} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_poc} > 90 AND ${time_in_poc} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_poc} > 180 AND ${time_in_poc} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_poc} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_eb_review_bucket {
    case: {
      when: {
        sql: ${time_in_eb_review} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_eb_review} > 30 AND ${time_in_eb_review} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_eb_review} > 60 AND ${time_in_eb_review} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_eb_review} > 90 AND ${time_in_eb_review} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_eb_review} > 180 AND ${time_in_eb_review} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_eb_review} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: time_in_neg_close_bucket {
    case: {
      when: {
        sql: ${time_in_neg_and_close} <= 30;;
        label: "0-30"
      }
      when: {
        sql: ${time_in_neg_and_close} > 30 AND ${time_in_neg_and_close} <= 60;;
        label: "31-60"
      }
      when: {
        sql: ${time_in_neg_and_close} > 60 AND ${time_in_neg_and_close} <= 90;;
        label: "61-90"
      }
      when: {
        sql: ${time_in_neg_and_close} > 90 AND ${time_in_neg_and_close} <= 180;;
        label: "91-180"
      }
      when: {
        sql: ${time_in_neg_and_close} > 180 AND ${time_in_neg_and_close} <= 365;;
        label: "181-365"
      }
      when: {
        sql: ${time_in_neg_and_close} > 365;;
        label: "365+"
      }
      else:"Unknown"
    }
  }

  dimension: fresh_opp_flag {
    sql:  CASE
          WHEN ${stage_custom_new} = '1. Pipeline Generation' and ${time_in_pipeline} <= 60 then 1
          WHEN ${stage_custom_new} = '2. Discovery & Qualification' and ${time_in_pipeline} <= 60 then 1
          WHEN ${stage_custom_new} = '3. Alignment' and ${time_in_pipeline} <= 60 then 1
          WHEN ${stage_custom_new} = '4. EB Sponsorship' and ${time_in_pipeline} <= 60 then 1
          WHEN ${stage_custom_new} = '5. Value & Validation' and ${time_in_pipeline} <= 180 then 1
          WHEN ${stage_custom_new} = '6. EB Sign-Off & Contracts' and ${time_in_pipeline} <= 180 then 1
          ELSE 0
          END;;
  }

  measure: median_discovery {
    type: median
    sql: ${time_in_discovery} ;;
  }

  measure: mean_discovery {
    type: average
    sql: ${time_in_discovery} ;;
  }

  measure: median_vf {
    type: median
    sql: ${time_in_vf} ;;
  }

  measure: mean_vf {
    type: average
    sql: ${time_in_vf} ;;
  }

  measure: median_tdd {
    type: median
    sql: ${time_in_tdd} ;;
  }

  measure: mean_tdd {
    type: average
    sql: ${time_in_tdd} ;;
  }

  measure: median_go_no {
    type: median
    sql: ${time_in_go_no} ;;
  }

  measure: mean_go_no {
    type: average
    sql: ${time_in_go_no} ;;
  }

  measure: median_poc {
    type: median
    sql: ${time_in_poc} ;;
  }

  measure: mean_poc {
    type: average
    sql: ${time_in_poc} ;;
  }

  measure: median_eb_review {
    type: median
    sql: ${time_in_eb_review} ;;
  }

  measure: mean_eb_review {
    type: average
    sql: ${time_in_eb_review} ;;
  }

  measure: median_neg_close {
    type: median
    sql: ${time_in_neg_and_close} ;;
  }

  measure: mean_neg_close {
    type: average
    sql: ${time_in_neg_and_close} ;;
  }

  measure: mean_time_in_pipeline {
    type: average
    sql: ${time_in_pipeline} ;;
    label: "Mean Time in Pipeline"
  }

  measure: median_time_in_pipeline {
    type: median
    sql: ${time_in_pipeline} ;;
    label: "Median Time in Pipeline"
  }

  measure: min_time_in_pipeline {
    type: min
    sql: ${time_in_pipeline} ;;
    label: "Min. Time in Pipeline"
  }

  measure: max_time_in_pipeline {
    type: max
    sql: ${time_in_pipeline} ;;
    label: "Max. Time in Pipeline"
  }

  measure: percentile_25_time_in_pipeline {
    type: percentile
    percentile: 25
    sql: ${time_in_pipeline} ;;
    label: "25th Percentile Time in Pipeline"
  }

  measure: percentile_75_time_in_pipeline {
    type: percentile
    percentile: 75
    sql: ${time_in_pipeline} ;;
    label: "75th Percentile Time in Pipeline"
  }

  measure: num_opps {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
  }

  measure: fresh_discovery {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 60", opp_stage_name: "AE Discovery"]
    drill_fields: [detail*]
    label: "Fresh Discovery Opps"
  }

  measure: fresh_vf {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 60", opp_stage_name: "Value/Fit"]
    drill_fields: [detail*]
    label: "Fresh Value/Fit Opps"
  }

  measure: fresh_tdd {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 60", opp_stage_name: "TDD"]
    drill_fields: [detail*]
    label: "Fresh TDD Opps"
  }

  measure: fresh_go_no {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 60", opp_stage_name: "EB Go/No-Go"]
    drill_fields: [detail*]
    label: "Fresh EB Go/No-Go Opps"
  }

  measure: fresh_poc {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 180", opp_stage_name: "TVE"]
    drill_fields: [detail*]
    label: "Fresh POC Opps"
  }

  measure: fresh_review {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 180", opp_stage_name: "EB Revisit"]
    drill_fields: [detail*]
    label: "Fresh EB Review Opps"
  }

  measure: fresh_neg_and_close {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [time_in_pipeline: "<= 180", opp_stage_name: "EB Negotiate and Close"]
    drill_fields: [detail*]
    label: "Fresh Negotiate and Close Opps"
  }

  measure: num_fresh_opps {
    type: sum
    sql: ${fresh_opp_flag} ;;
    label: "# Fresh Opps"
  }

  measure: percent_fresh_opps {
    type:  number
    sql: 100 * ${num_fresh_opps} / NULLIFZERO(${num_opps});;
    value_format: "#0\%"
    label: "% Fresh Opps"
  }


  set: detail {
    fields: [
      opp_id,
      opp_name,
      account_name,
      account_industry,
      partner_account_name,
      opp_arr,
      opp_net_new_arr,
      opp_stage_name,
      opp_created_dte_date,
      opp_discovery_call_dte_date,
      opp_vf_dte_date,
      opp_tdd_dte_date,
      opp_eb_go_no_go_dte_date,
      opp_poc_dte_date,
      opp_eb_review_dte_date,
      opp_neg_and_close_dte_date,
      opp_close_dte_date,
      opportunity_owner,
      owner_description
    ]
  }
}
