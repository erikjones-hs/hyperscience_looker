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

  measure: num_accounts {
    type: count_distinct
    sql: ${account_id} ;;
    label: "# Accounts"
  }

}
