view: sales_pipeline_history {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_pipeline_history);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."DATE_RAN" ;;
  }


  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
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

  measure: total_net_new_arr {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
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
