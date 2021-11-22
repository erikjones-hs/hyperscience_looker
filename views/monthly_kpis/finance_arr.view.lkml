view: finance_arr {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_finance_arr);;
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

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension_group: start_dte_month {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."START_DTE_MONTH" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: mrr {
    type: number
    sql: ${TABLE}."MRR" ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension: first_active_month {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension: last_active_month {
    type: date
    sql: ${TABLE}."LAST_ACTIVE_MONTH" ;;
  }

  dimension: is_first_month {
    type: string
    sql: ${TABLE}."IS_FIRST_MONTH" ;;
  }

  dimension: is_last_month {
    type: string
    sql: ${TABLE}."IS_LAST_MONTH" ;;
  }

  dimension: mrr_change {
    type: number
    sql: ${TABLE}."MRR_CHANGE" ;;
  }

  dimension: is_active_acct {
    type: string
    sql: ${TABLE}."IS_ACTIVE_ACCT" ;;
  }

  dimension: first_active_month_acct {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_MONTH_ACCT" ;;
  }

  dimension: last_active_month_acct {
    type: date
    sql: ${TABLE}."LAST_ACTIVE_MONTH_ACCT" ;;
  }

  dimension: is_first_month_acct {
    type: string
    sql: ${TABLE}."IS_FIRST_MONTH_ACCT" ;;
  }

  dimension: is_last_month_acct {
    type: string
    sql: ${TABLE}."IS_LAST_MONTH_ACCT" ;;
  }

  dimension: account_mrr {
    type: number
    sql: ${TABLE}."ACCOUNT_MRR" ;;
  }

  dimension: mrr_change_acct {
    type: number
    sql: ${TABLE}."MRR_CHANGE_ACCT" ;;
  }

  dimension: opp_category {
    type: string
    sql: ${TABLE}."OPP_CATEGORY" ;;
  }

  dimension: customer_category {
    type: string
    sql: ${TABLE}."CUSTOMER_CATEGORY" ;;
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}."REVENUE_CATEGORY" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: new_arr {
    type:  sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_mrr};;
    value_format: "$#,##0"
    filters: [revenue_category: "new"]
    drill_fields: [detail*]
  }

  measure: recurring_arr {
    type:  sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_mrr};;
    value_format: "$#,##0"
    filters: [revenue_category: "recurring"]
    drill_fields: [detail*]
  }

  measure: expansion_arr {
    type:  sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_mrr};;
    value_format: "$#,##0"
    filters: [revenue_category: "expansion"]
    drill_fields: [detail*]
  }

  measure: churn_arr {
    type:  sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "churn"]
    drill_fields: [detail*]
  }

  measure: total_arr {
    type:  sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_mrr};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: new_customers {
    type:  count_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_id};;
    filters: [customer_category: "new"]
    drill_fields: [detail*]
  }

  measure: active_customers {
    type:  count_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_id};;
    filters: [customer_category: "active"]
    drill_fields: [detail*]
  }

  measure: churn_customers {
    type:  count_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_id};;
    filters: [customer_category: "churn"]
    drill_fields: [detail*]
  }

  measure: arr_customers {
    type:  number
    sql:  ${active_customers} + ${new_customers};;
    drill_fields: [detail*]
  }




  set: detail {
    fields: [
      date_month_date,
      account_id,
      account_name,
      opp_id,
      opp_name,
      start_dte_month_date,
      start_dte_date,
      end_dte_month_date,
      end_dte_date,
      mrr,
      is_active,
      first_active_month,
      last_active_month,
      is_first_month,
      is_last_month,
      mrr_change,
      is_active_acct,
      first_active_month_acct,
      last_active_month_acct,
      is_first_month_acct,
      is_last_month_acct,
      account_mrr,
      mrr_change_acct,
      opp_category,
      customer_category,
      revenue_category
    ]
  }
}
