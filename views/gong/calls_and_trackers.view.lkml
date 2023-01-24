view: calls_and_trackers {
    sql_table_name: (select * from "PROD"."GONG"."CALLS_AND_TRACKERS");;


  dimension: workspace_id {
    type: string
    sql: ${TABLE}."WORKSPACE_ID" ;;
  }

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

  dimension: call_date {
    type: date
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

  dimension: crm_id {
    type: string
    sql: ${TABLE}."CRM_ID" ;;
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

  dimension: call_had_tracker_mention {
    type: number
    sql: ${TABLE}."CALL_HAD_TRACKER_MENTION" ;;
  }

  measure: num_calls {
    type: count_distinct
    sql_distinct_key: ${call_id} ;;
    sql: ${call_id} ;;
    label: "# Calls"
  }

}
