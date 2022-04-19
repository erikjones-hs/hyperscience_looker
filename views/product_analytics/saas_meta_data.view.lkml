  view: saas_meta_data {
    sql_table_name: (select * from dev.erikjones.saas_account_meta_data);;

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}."ANNUAL_REVENUE" ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}."NUMBER_OF_EMPLOYEES" ;;
  }

  dimension: industry_cleaned_c {
    type: string
    sql: ${TABLE}."INDUSTRY_CLEANED_C" ;;
  }

  dimension_group: contract_start_dte {
    type: time
    sql: ${TABLE}."CONTRACT_START_DTE" ;;
  }

  dimension_group: contract_end_dte {
    type: time
    sql: ${TABLE}."CONTRACT_END_DTE" ;;
  }

  dimension: months_since_start {
    type: number
    sql: ${TABLE}."MONTHS_SINCE_START" ;;
  }

  dimension: num_months_to_renewal {
    type: number
    sql: ${TABLE}."NUM_MONTHS_TO_RENEWAL" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: tot_pages_contracted {
    type: number
    sql: ${TABLE}."TOT_PAGES_CONTRACTED" ;;
  }

  dimension: go_live_date {
    type: date
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension: usage_prod_name {
    type: string
    sql: ${TABLE}."USAGE_PROD_NAME" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

}
