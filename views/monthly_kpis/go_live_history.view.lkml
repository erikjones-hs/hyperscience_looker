view: sql_runner_query {
  derived_table: {
    sql: select * from dev.erikjones.go_live_date_history
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: dte {
    type: time
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
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension_group: churn_month {
    type: time
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

  set: detail {
    fields: [
      dte_time,
      account_id,
      account_name,
      opp_id,
      opp_name,
      go_live_date_time,
      churn_month_time,
      live_customer_fl,
      go_live_date_fl
    ]
  }
}
