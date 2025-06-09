view: latest_usage_sent {
  sql_table_name: ("PROD"."DATA_QC"."DATA_QC_LAST_USAGE_SENT");;

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  dimension_group: latest_date_received {
    type: time
    sql: ${TABLE}."LATEST_DATE_RECEIVED" ;;
  }

  dimension: num_days_since_last_received {
    type: number
    sql: ${TABLE}."NUM_DAYS_SINCE_LAST_RECEIVED" ;;
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}."DATA_SOURCE" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: customer_category {
    type: string
    sql: ${TABLE}."CUSTOMER_CATEGORY" ;;
  }

  set: detail {
    fields: [
      sfdc_account_id,
      sfdc_account_name,
      latest_date_received_time,
      num_days_since_last_received,
      data_source,
      arr,
      customer_category
    ]
  }
}
