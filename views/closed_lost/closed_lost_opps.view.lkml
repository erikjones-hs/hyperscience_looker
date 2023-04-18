view: closed_lost_opps {
  sql_table_name: (select * from "PROD"."CLOSED_LOST"."CLOSED_LOST_OPPS");;

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}."ACCOUNT_INDUSTRY" ;;
  }

  dimension: opp_partner_account {
    type: string
    sql: ${TABLE}."OPP_PARTNER_ACCOUNT" ;;
  }

  dimension: partner_account_name {
    type: string
    sql: ${TABLE}."PARTNER_ACCOUNT_NAME" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: opp_loss_reason {
    type: string
    sql: ${TABLE}."OPP_LOSS_REASON" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opp_is_partner_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_PARTNER_INFLUENCED_FLAG" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension_group: closed_lost_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CLOSED_LOST_DTE" ;;
  }

  dimension: had_gong_call_flag {
    type: number
    sql: ${TABLE}."HAD_GONG_CALL_FLAG" ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Month" }
    allowed_value: { value: "Fiscal Quarter" }
    default_value: "Fiscal Quarter"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Month' THEN ${closed_lost_dte_month}
    WHEN{% parameter timeframe_picker %} = 'Fiscal Quarter' THEN ${closed_lost_dte_fiscal_quarter}
    END ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    label: "# Opps"
    drill_fields: [detail*]
  }

  measure: num_partner_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    filters: [opp_is_partner_influenced_flag: "= 1"]
    label: "# Partner Influenced Opps"
    drill_fields: [detail*]
  }

  measure: num_with_gong_calls {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    filters: [had_gong_call_flag: "= 1"]
    label: "# Opps w/ Gong Call"
    drill_fields: [detail*]
  }

  measure: percent_with_gong_call{
    type: number
    sql: 100*(${num_with_gong_calls} / NULLIFZERO(${num_opps}) ;;
    label: "% Closed Lost Opps w/ Gong Calls"
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      opp_stage_name,
      account_id,
      account_name,
      opp_created_dte_date,
      account_industry,
      opp_partner_account,
      partner_account_name,
      opp_revenue_type,
      opp_lead_source,
      opp_loss_reason,
      opp_arr,
      opp_net_new_arr,
      opp_is_partner_influenced_flag,
      opp_is_marketing_influenced_flag,
      closed_lost_dte_date,
      had_gong_call_flag
    ]
  }
}
