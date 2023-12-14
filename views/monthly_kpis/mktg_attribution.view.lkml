view: mktg_attribution{
  sql_table_name: (select * from "PROD"."SALESFORCE"."MART_MULTI_TOUCH_PIPELINE_ATTRIBUTION");;

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: engagement_date {
    type: date
    sql: ${TABLE}."ENGAGEMENT_DATE" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension: opp_created_fy_qtr {
    type: string
    sql: ${TABLE}."OPP_CREATED_FY_QTR" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: influence_type {
    type: string
    sql: ${TABLE}."INFLUENCE_TYPE" ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}."CAMPAIGN_TYPE" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME" ;;
  }

  measure: mt_model {
    type: number
    sql: ${TABLE}."MT_MODEL" ;;
  }

  measure: mt_model_arr {
    type: number
    sql: ${TABLE}."MT_MODEL_ARR" ;;
  }

  measure: mt_model_arr_total {
    type: number
    sql: ${TABLE}."MT_MODEL_ARR_TOTAL" ;;
  }

  measure: count {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "# Opps"
  }

}
