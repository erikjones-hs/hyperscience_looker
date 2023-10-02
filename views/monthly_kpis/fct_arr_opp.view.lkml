view: fct_arr_opp {
  sql_table_name: (select * from prod.monthly_kpis.fct_arr_opp);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE_MONTH" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: mrr {
    type: number
    sql: ${TABLE}."MRR" ;;
  }

  dimension: mrr_change {
    type: number
    sql: ${TABLE}."MRR_CHANGE" ;;
  }

  dimension: mrr_reporting {
    type: number
    sql: ${TABLE}."MRR_REPORTING" ;;
  }

  dimension: is_active {
    type: yesno
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
    type: yesno
    sql: ${TABLE}."IS_FIRST_MONTH" ;;
  }

  dimension: is_last_month {
    type: yesno
    sql: ${TABLE}."IS_LAST_MONTH" ;;
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

  dimension: first_active_month_acct {
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_MONTH_ACCT" ;;
  }

  dimension: last_active_month_acct {
    type: date
    sql: ${TABLE}."LAST_ACTIVE_MONTH_ACCT" ;;
  }

  dimension: is_first_month_acct {
    type: yesno
    sql: ${TABLE}."IS_FIRST_MONTH_ACCT" ;;
  }

  dimension: is_last_month_acct {
    type: yesno
    sql: ${TABLE}."IS_LAST_MONTH_ACCT" ;;
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

  measure: total_arr {
    type:  sum
    sql: ${mrr};;
    value_format: "$#,##0"
  }

  measure: new_arr {
    type:  sum
    sql:  ${mrr_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "new"]
    label: "New"
  }

  measure: expansion_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "expansion", opp_category: "new"]
    label: "Expansion"
  }

  measure: churn {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "churn"]
    label: "Total Churn"
  }

  measure: logo_churn_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [customer_category: "churn", opp_category: "churn"]
    label: "Logo Churn"
  }

  measure: arr_churn_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [customer_category: "active", opp_category: "churn"]
    label: "ARR Churn"
  }

  measure: de_book_arr {
    type:  sum
    sql:  ${mrr_change_acct};;
    value_format: "$#,##0"
    filters: [revenue_category: "de-book"]
    label: "De-Book"
  }

}
