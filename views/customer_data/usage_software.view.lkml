view: usage_software {
  sql_table_name: (select * from "PROD"."CUSTOMER_USAGE"."USAGE_SOFTWARE");;

  dimension_group: dte_month {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: customer_usage_data {
    type: string
    sql: ${TABLE}."CUSTOMER_USAGE_DATA" ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: total_pages_created {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  measure: total_pages {
    type: sum
    sql: ${total_pages_created} ;;
    label: "Total Pages Created"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      dte_month_month,
      customer_usage_data,
      sfdc_account_id,
      sfdc_account_name,
      customer_name,
      total_pages_created,
      version
    ]
  }
}
