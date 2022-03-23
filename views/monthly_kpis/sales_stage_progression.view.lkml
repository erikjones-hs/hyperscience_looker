 view: sales_stage_progression {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_sales_stage_conversions);;
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

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension: opp_is_partner_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_PARTNER_INFLUENCED_FLAG" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    drill_fields: [detail*]
    label: "# Opportunities"
  }

  measure: had_discovery {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_discovery_call_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_value_fit {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_vf_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_tdd {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_tdd_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_eb_go_no_go {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_eb_go_no_go_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_poc {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_poc_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_eb_review {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_eb_review_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: had_neg_and_close {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_had_neg_and_close_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: closed_won {
    type:  count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql:  ${opp_id};;
    filters: [opp_closed_won_flag: "= 1"]
    drill_fields: [detail*]
  }

  measure: discovery_to_vf {
    type:  number
    sql: 100.00 * ${had_value_fit} / NULLIFZERO(${had_discovery});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: vf_to_tdd {
    type:  number
    sql: 100.00 * ${had_tdd} / NULLIFZERO(${had_value_fit});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: tdd_to_go_no_go {
    type:  number
    sql: 100.00 * ${had_eb_go_no_go} / NULLIFZERO(${had_tdd});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: go_no_go_to_poc {
    type:  number
    sql: 100.00 * ${had_poc} / NULLIFZERO(${had_eb_go_no_go});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: poc_to_eb_review {
    type:  number
    sql: 100.00 * ${had_eb_review} / NULLIFZERO(${had_poc});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: eb_review_to_neg_and_close {
    type:  number
    sql: 100.00 * ${had_neg_and_close} / NULLIFZERO(${had_eb_review});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: neg_and_close_to_closed_won {
    type:  number
    sql: 100.00 * ${closed_won} / NULLIFZERO(${had_neg_and_close});;
    value_format: "#0\%"
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
      opp_is_marketing_influenced_flag,
      opp_is_partner_influenced_flag,
      opp_created_dte_date,
      opp_had_discovery_call_flag,
      opp_had_vf_flag,
      opp_had_tdd_flag,
      opp_had_eb_go_no_go_flag,
      opp_had_poc_flag,
      opp_had_eb_review_flag,
      opp_had_neg_and_close_flag,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner
    ]
  }
}
