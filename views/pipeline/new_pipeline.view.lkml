 view: new_pipeline {
    sql_table_name: (select * from DEV.ERIKJONES.SALES_NEW_PIPELINE);;

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: opp_commit_status {
    type: string
    sql: ${TABLE}."OPP_COMMIT_STATUS" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

  dimension: sales_team {
    type: string
    sql: ${TABLE}."SALES_TEAM" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension: time_in_pipeline {
    type: number
    sql: ${TABLE}."TIME_IN_PIPELINE" ;;
  }

  dimension: date_ran {
    type: date
    sql: ${TABLE}."DATE_RAN" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: opp_net_new_arr {
    type: sum
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
    value_format: "$#,##0"
    label:"Net New ARR"
  }

  measure: opp_arr {
    type: sum
    sql: ${TABLE}."OPP_ARR" ;;
    value_format: "$#,##0"
    label:"ARR"
  }

  measure: num_opps {
    type:count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    label: "# Opportunities"
  }

  measure: median_time_in_pipeline {
    type: median
    sql: ${time_in_pipeline} ;;
    label: "Median Time in Pipeline"
  }


  set: detail {
    fields: [
      account_name,
      opp_name,
      opp_commit_status,
      opp_stage_name,
      opportunity_owner,
      owner_description,
      sales_team,
      opp_arr,
      opp_created_dte_date,
      opp_close_dte_date,
      time_in_pipeline
    ]
  }
}
