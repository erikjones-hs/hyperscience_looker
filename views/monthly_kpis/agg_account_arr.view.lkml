view: agg_account_arr {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_finance_arr_acct);;
  drill_fields: [detail*]

  dimension_group: date_month {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
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
    type: string
    sql: ${TABLE}."IS_ACTIVE_ACCT" ;;
  }

  dimension_group: first_active_month {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension_group: last_active_month {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."LAST_ACTIVE_MONTH" ;;
  }

  dimension: is_first_month_acct {
    type: string
    sql: ${TABLE}."IS_FIRST_MONTH_ACCT" ;;
  }

  dimension: is_last_month_acct {
    type: string
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

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_accounts {
    type: count_distinct
    sql:${account_id} ;;
    drill_fields: [detail*]
  }

  measure: total_arr {
    type:  sum
    sql: ${mrr_acct} ;;
    drill_fields: [detail*]
  }

  measure: new_arr {
    type:  sum
    sql:  ${mrr_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "new"]
    label: "New"
    drill_fields: [detail*]
  }

  measure: recurring_arr {
    type:  sum
    sql:  ${mrr_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "recurring"]
    label: "Recurring"
    drill_fields: [detail*]
  }

  measure: expansion_arr {
    type:  sum
    sql:  ${mrr_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "expansion"]
    label: "Expansion"
    drill_fields: [detail*]
  }

  measure: churn_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "churn"]
    label: "Churn"
    drill_fields: [detail*]
  }



  set: detail {
    fields: [
      date_month_month,
      account_id,
      account_name,
      mrr_acct,
      first_active_month_month,
      customer_category,
      revenue_category
    ]
  }
}
