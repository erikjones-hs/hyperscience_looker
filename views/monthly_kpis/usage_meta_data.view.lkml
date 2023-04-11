view: usage_meta_data {
  sql_table_name: (select * from "PROD"."CUSTOMER_USAGE"."USAGE_META_DATA");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: dte_month {
    type: time
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension_group: contract_start_date {
    type: time
    sql: ${TABLE}."CONTRACT_START_DATE" ;;
  }

  dimension_group: go_live_date {
    type: time
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension: ttv_days {
    type: number
    sql: ${TABLE}."TTV_DAYS" ;;
  }

  dimension: ttv_months {
    type: number
    sql: ${TABLE}."TTV_MONTHS" ;;
  }

  dimension_group: activation_month {
    type: time
    sql: ${TABLE}."ACTIVATION_MONTH" ;;
  }

  dimension_group: last_month_usage_data_received {
    type: time
    sql: ${TABLE}."LAST_MONTH_USAGE_DATA_RECEIVED" ;;
  }

  dimension: activated_customer_fl {
    type: number
    sql: ${TABLE}."ACTIVATED_CUSTOMER_FL" ;;
  }

  dimension: live_customer_fl {
    type: number
    sql: ${TABLE}."LIVE_CUSTOMER_FL" ;;
  }

  set: detail {
    fields: [
      dte_month_time,
      account_id,
      account_name,
      contract_start_date_time,
      go_live_date_time,
      ttv_days,
      ttv_months,
      activation_month_time,
      last_month_usage_data_received_time,
      activated_customer_fl,
      live_customer_fl
    ]
  }
}
