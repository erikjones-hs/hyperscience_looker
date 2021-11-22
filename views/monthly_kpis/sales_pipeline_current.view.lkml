view: sales_pipeline_current {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_pipeline_current_month);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    timeframes: [date, month, quarter, year]
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_pipeline {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "pipeline"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_qualified_pipeline {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "qualified_pipeline"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_pipeline_mktg {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "pipeline", opp_is_marketing_influenced_flag: "1"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_qualified_pipeline_mktg {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "qualified_pipeline", opp_is_marketing_influenced_flag: "1"]
    drill_fields: [detail*]
  }

  measure: percent_pipeline_mktg {
    type:  number
    sql: 100* ${total_net_new_arr_pipeline_mktg} / NULLIFZERO(${total_net_new_arr_pipeline_mktg} + ${total_net_new_arr_pipeline});;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_qualified_pipeline_mktg {
    type:  number
    sql: 100* ${total_net_new_arr_qualified_pipeline_mktg} / NULLIFZERO(${total_net_new_arr_qualified_pipeline_mktg} + ${total_net_new_arr_qualified_pipeline});;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  set: detail {
    fields: [
      date_ran_date,
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
