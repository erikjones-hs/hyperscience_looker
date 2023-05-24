view: closed_won_region {
  sql_table_name: (select * from prod.schedules_summary.closed_won_region);;

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

  dimension: customer_category {
    type: string
    sql: ${TABLE}."CUSTOMER_CATEGORY" ;;
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}."REVENUE_CATEGORY" ;;
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}."SALES_REGION" ;;
  }

  dimension_group: first_active_month {
    type: time
    sql: ${TABLE}."FIRST_ACTIVE_MONTH" ;;
  }

  measure: mrr {
    type: sum
    sql: ${TABLE}."MRR" ;;
    label: "ARR"
  }

  measure: mrr_acct {
    type: sum
    sql: ${TABLE}."MRR_ACCT" ;;
    label: "ARR Account"
  }

  measure: mrr_change_acct {
    type: sum
    sql: ${TABLE}."MRR_CHANGE_ACCT" ;;
    label: "ARR Account Change"
  }

  set: detail {
    fields: [
      date_month_date,
      account_id,
      account_name,
      opp_id,
      opp_name,
      mrr,
      mrr_acct,
      mrr_change_acct,
      customer_category,
      revenue_category,
      sales_region
    ]
  }
}
