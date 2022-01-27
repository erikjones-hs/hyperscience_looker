  view: sales_dq_pipeline_history {
    sql_table_name: (select * from DEV.ERIKJONES.MONTHLY_KPIS_DQ_PIPELINE_HISTORY);;
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

  dimension_group: opp_close_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
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

  dimension_group: opp_dq_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_DQ_DTE" ;;
  }

    dimension: dq_reason {
      type: string
      sql: ${TABLE}."DQ_REASON" ;;
    }

    dimension: dq_reason_description {
      type: string
      sql: ${TABLE}."DQ_REASON_DESCRIPTION" ;;
    }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_dq_pipeline {
    type:  sum_distinct
    sql_distinct_key:  ${opp_id} ;;
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    label: "DQed Pipeline"
    drill_fields: [detail*]
  }

    measure: num_opps_dq_pipeline {
      type:  count_distinct
      sql:  ${opp_id};;
      label: "Num Opps DQed Pipeline"
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
      opp_close_dte_time,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner,
      owner_description,
      opp_pipeline_category
    ]
  }
}
