view: software_version_history {
  sql_table_name: (select * from PROD.CUSTOMER_USAGE.SOFTWARE_VERSION_HISTORY);;

  dimension_group: dte {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: software_version {
    type: string
    sql: ${TABLE}."SOFTWARE_VERSION" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}."ROW_NUM" ;;
  }

  dimension: is_active_acct {
    type: number
    sql: ${TABLE}."IS_ACTIVE_ACCT" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: num_customers{
    type: count_distinct
    sql: ${customer} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      software_version,
      version,
      sfdc_account_id,
      sfdc_account_name,
      customer
    ]
  }
}
