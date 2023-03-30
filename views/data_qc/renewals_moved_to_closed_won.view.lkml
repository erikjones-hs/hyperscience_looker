view: renewals_moved_to_closed_won {
  sql_table_name: (select * from "PROD"."DATA_QC"."DATA_QC_RENEWALS_MOVED_TO_CLOSED_WON");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: renewal_month {
    type: time
    sql: ${TABLE}."RENEWAL_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: existing_opp_id {
    type: string
    sql: ${TABLE}."EXISTING_OPP_ID" ;;
  }

  dimension: existing_opp_name {
    type: string
    sql: ${TABLE}."EXISTING_OPP_NAME" ;;
  }

  dimension: potential_churn_amount {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT" ;;
  }

  dimension: has_churned_flag {
    type: number
    sql: ${TABLE}."HAS_CHURNED_FLAG" ;;
  }

  dimension: outstanding_renewal_flag {
    type: number
    sql: ${TABLE}."OUTSTANDING_RENEWAL_FLAG" ;;
  }

  dimension: upcoming_renewal_flag {
    type: number
    sql: ${TABLE}."UPCOMING_RENEWAL_FLAG" ;;
  }

  dimension: has_renewed_flag {
    type: number
    sql: ${TABLE}."HAS_RENEWED_FLAG" ;;
  }

  dimension: open_opp_id {
    type: string
    sql: ${TABLE}."OPEN_OPP_ID" ;;
  }

  dimension: open_opp_name {
    type: string
    sql: ${TABLE}."OPEN_OPP_NAME" ;;
  }

  dimension_group: open_opp_close_dte {
    type: time
    sql: ${TABLE}."OPEN_OPP_CLOSE_DTE" ;;
  }

  set: detail {
    fields: [
      renewal_month_time,
      account_id,
      account_name,
      existing_opp_id,
      existing_opp_name,
      potential_churn_amount,
      has_churned_flag,
      outstanding_renewal_flag,
      upcoming_renewal_flag,
      has_renewed_flag,
      open_opp_id,
      open_opp_name,
      open_opp_close_dte_time
    ]
  }
}
