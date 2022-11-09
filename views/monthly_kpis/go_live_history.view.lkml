view: go_live_history {
  sql_table_name: (select * from dev.erikjones.go_live_date_history);;
  drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
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

  dimension_group: go_live_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension_group: churn_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CHURN_MONTH" ;;
  }

  dimension: live_customer_fl {
    type: number
    sql: ${TABLE}."LIVE_CUSTOMER_FL" ;;
  }

  dimension: go_live_date_fl {
    type: number
    sql: ${TABLE}."GO_LIVE_DATE_FL" ;;
  }

  measure: num_live_customers {
    type: count_distinct
    sql_distinct_key: account_id ;;
    sql: ${account_id} ;;
    filters: [live_customer_fl: "1"]
  }

  set: detail {
    fields: [
      dte_month,
      account_id,
      account_name,
      opp_id,
      opp_name,
      go_live_date_date,
      live_customer_fl,
      go_live_date_fl
    ]
  }
}
