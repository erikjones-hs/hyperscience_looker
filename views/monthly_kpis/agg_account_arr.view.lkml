view: agg_account_arr {
  sql_table_name: (select * from prod.monthly_kpis.fct_arr_account);;
  drill_fields: [detail*]

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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
    type: string
    sql: ${TABLE}."IS_ACTIVE_ACCT" ;;
  }

  dimension_group: first_active_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  dimension_group: last_active_month {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: months_since_start {
    type: number
    sql: ${TABLE}."MONTHS_SINCE_START" ;;
  }

  dimension: churn_category {
    type: string
    sql: CASE
         WHEN ${customer_category} = 'active' then 'Revenue Churn'
         WHEN ${customer_category} = 'churn' then 'Logo Churn'
         ELSE 'Other'
        END;;
    label: "Churn Category"
  }

  dimension: win_back_fl {
    type: number
    sql: ${TABLE}."WIN_BACK_FL" ;;
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
    sql: ${mrr_acct};;
    value_format: "$#,##0"
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

  measure: expansion_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
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

  measure: de_book_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "de-book"]
    label: "De-Book"
    drill_fields: [detail*]
  }

  measure: recurring_arr {
    type:  number
    sql: lag(${total_arr},1,0) over (order by ${date_month_month} asc);;
    value_format: "$#,##0"
    label: "Recurring"
    drill_fields: [detail*]
  }

  measure: arr_acct_change {
    type:  sum
    sql: ${mrr_change_acct};;
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

  measure: churn_customers_int {
    type:  count_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_id};;
    filters: [customer_category: "churn"]
    drill_fields: [detail*]
  }

  measure: de_book_customers_int {
    type:  count_distinct
    sql_distinct_key: ${account_id} ;;
    sql:  ${account_id};;
    filters: [customer_category: "de-book"]
    drill_fields: [detail*]
  }

  measure: churn_customers {
    type:  number
    sql: -1 * ${churn_customers_int} ;;
    drill_fields: [detail*]
  }

  measure: de_book_customers {
    type:  number
    sql: -1 * ${de_book_customers_int} ;;
    drill_fields: [detail*]
  }

  measure: arr_customers {
    type:  number
    sql:  ${active_customers} + ${new_customers};;
    drill_fields: [detail*]
  }

  measure: net_retention_arr {
    type:  sum
    sql: ${mrr_acct};;
    filters: [months_since_start: ">= 12"]
  }

  measure: arr_12_months_ago {
    type:  number
    sql: lag(${total_arr},12,0) over (order by ${date_month_month} asc);;
  }

  measure: net_dollar_retention {
    type:  number
    sql: 100 * ${net_retention_arr} / NULLIFZERO(${arr_12_months_ago});;
    value_format: "#0.00\%"
  }

  measure: avg_arr {
    type:  average
    sql:  ${mrr_acct} ;;
    value_format: "$#,##0"
  }

  measure: max_arr {
    type:  max
    sql: ${mrr_acct};;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: net_new_arr {
    type:  number
    sql:  ${new_arr} + ${expansion_arr} + ${churn_arr} + ${de_book_arr} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: new_bookings_arr {
    type:  number
    sql:  ${new_arr} + ${expansion_arr};;
    value_format: "$#,##0"
    drill_fields: [detail*]
    label: "New Bookings ARR"
  }

  measure: arr_churn {
    type:  sum
    sql:  ${mrr_reporting_acct} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: percent_expansion {
    type:  number
    sql:  ${expansion_arr} / NULLIFZERO((${new_arr} + ${expansion_arr})) ;;
    label: "% Expansion"
    value_format: "0%"
  }

  set: detail {
    fields: [
      account_id,
      account_name,
      mrr_acct,
      mrr_change_acct,
      first_active_month_month
    ]
  }
}
