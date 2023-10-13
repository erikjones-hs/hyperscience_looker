view: acct_meta_data {
  sql_table_name: (select * from prod.customer_usage.acct_meta_data);;


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

  dimension_group: start_dte {
    type: time
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: contract_length_months {
    type: number
    sql: ${TABLE}."CONTRACT_LENGTH_MONTHS" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  dimension: contract_pages_annual {
    type: number
    sql: ${TABLE}."CONTRACT_PAGES_ANNUAL" ;;
  }

  dimension: live_customer_fl {
    type: number
    sql: ${TABLE}."LIVE_CUSTOMER_FL" ;;
  }

  dimension: activated_customer_fl {
    type: number
    sql: ${TABLE}."ACTIVATED_CUSTOMER_FL" ;;
  }

  dimension: deployment {
    type: string
    sql: ${TABLE}."DEPLOYMENT" ;;
  }

}
