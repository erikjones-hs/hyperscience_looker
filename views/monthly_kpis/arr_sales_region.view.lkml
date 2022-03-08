 view: arr_sales_region {
    sql_table_name: (select * from dev.erikjones.arr_account_sales_region);;
    drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Account/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: mrr_acct {
    type: number
    sql: ${TABLE}."MRR_ACCT" ;;
  }

  dimension: mrr_change_acct {
    type: number
    sql: ${TABLE}."MRR_CHANGE_ACCT" ;;
  }

  dimension: mrr_reporting_acct {
    type: number
    sql: ${TABLE}."MRR_REPORTING_ACCT" ;;
  }

  dimension: is_active_acct {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE_ACCT" ;;
  }

  dimension_group: first_active_month {
    type: time
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension_group: last_active_month {
    type: time
    sql: ${TABLE}."LAST_ACTIVE_MONTH" ;;
  }

  dimension: is_first_month_acct {
    type: yesno
    sql: ${TABLE}."IS_FIRST_MONTH_ACCT" ;;
  }

  dimension: is_last_month_acct {
    type: yesno
    sql: ${TABLE}."IS_LAST_MONTH_ACCT" ;;
  }

  dimension: customer_category {
    type: string
    sql: ${TABLE}."CUSTOMER_CATEGORY" ;;
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}."REVENUE_CATEGORY" ;;
  }

  dimension: months_since_start {
    type: number
    sql: ${TABLE}."MONTHS_SINCE_START" ;;
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}."SALES_REGION" ;;
  }

  set: detail {
    fields: [
      date_month_date,
      account_id,
      account_name,
      mrr_acct,
      mrr_change_acct,
      mrr_reporting_acct,
      is_active_acct,
      first_active_month_time,
      last_active_month_time,
      is_first_month_acct,
      is_last_month_acct,
      customer_category,
      revenue_category,
      months_since_start,
      sales_region
    ]
  }
}
