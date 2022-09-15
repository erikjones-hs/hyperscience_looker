view: arr_usage {
  sql_table_name: (select * from dev.erikjones.arr_customers_usage);;

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: has_usage_data_fl {
    type: number
    sql: ${TABLE}."HAS_USAGE_DATA_FL" ;;
  }

  dimension: first_active_month_acct {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_MONTH_ACCT" ;;
  }

  dimension: months_since_arr_start {
    type: number
    sql: ${TABLE}."MONTHS_SINCE_ARR_START" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  measure: num_accounts {
    type: count_distinct
    sql: ${account_id} ;;
    label: "# Accounts"
  }

}
