  view: sales_dq_opportunities {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_dq_pipeline_opportunities);;
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
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension_group: opp_dq_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_DQ_DTE" ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_dq_pipeline {
    type:  sum
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
      opp_created_dte_time,
      opp_dq_dte_date,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner
    ]
  }
}
