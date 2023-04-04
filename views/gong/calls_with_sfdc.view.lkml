view: calls_with_sfdc {
  sql_table_name: (select * from "PROD"."GONG"."CALLS_WITH_SFDC_METADATA");;

  dimension: call_id {
    type: string
    sql: ${TABLE}."CALL_ID" ;;
  }

  dimension: conversation_key {
    type: string
    sql: ${TABLE}."CONVERSATION_KEY" ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}."OWNER_ID" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension_group: call_date {
    type: time
    timeframes: [raw, date, week, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CALL_DATE" ;;
  }

  dimension_group: call_start {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CALL_START" ;;
  }

  dimension_group: call_end {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CALL_END" ;;
  }

  dimension: call_duration {
    type: number
    sql: ${TABLE}."CALL_DURATION" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: tracker_id {
    type: string
    sql: ${TABLE}."TRACKER_ID" ;;
  }

  dimension: tracker_name {
    type: string
    sql: ${TABLE}."TRACKER_NAME" ;;
  }

  dimension: tracker_type {
    type: string
    sql: ${TABLE}."TRACKER_TYPE" ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}."KEYWORDS" ;;
  }

  dimension: tracker_count {
    type: number
    sql: ${TABLE}."TRACKER_COUNT" ;;
  }

  dimension: tracker_category {
    type: string
    sql: ${TABLE}."TRACKER_CATEGORY" ;;
  }

  dimension: tracker_specific {
    type: string
    sql: ${TABLE}."TRACKER_SPECIFIC" ;;
  }

  dimension: object_id {
    type: string
    sql: ${TABLE}."OBJECT_ID" ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}."OBJECT_TYPE" ;;
  }

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

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension_group: opp_closed_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CLOSED_DTE" ;;
  }

  measure: num_calls {
    type: count_distinct
    sql_distinct_key: ${call_id} ;;
    sql: ${call_id} ;;
    label: "# Calls"
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    label: "# Opportunities"
  }

  measure: num_accounts {
    type: count_distinct
    sql_distinct_key: ${account_id} ;;
    sql: ${account_id} ;;
    label: "# Accounts"
  }

  measure: avg_call_mength {
    type: average_distinct
    sql_distinct_key: ${call_id};;
    sql: ${call_duration} ;;
    label: "Avg. Call Time"
  }

}
