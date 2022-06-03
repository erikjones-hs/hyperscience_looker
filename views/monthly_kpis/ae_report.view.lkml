  view: ae_report {
    sql_table_name: (select * from dev.erikjones.arr_by_ae);;
    drill_fields: [detail*]

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
    sql: ${TABLE}."START_DTE_MONTH" ;;
  }

  dimension_group: start_dte {
    type: time
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte_month {
    type: time
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension_group: end_dte {
    type: time
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
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

  dimension_group: opp_closed_won_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSED_WON_DTE" ;;
  }

  dimension: opp_owner_id {
    type: string
    sql: ${TABLE}."OPP_OWNER_ID" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

  dimension: account_owner_id {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER_ID" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: account_owner_description {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER_DESCRIPTION" ;;
  }

  dimension: sales_team_opp_owner {
    type: string
    sql: ${TABLE}."SALES_TEAM_OPP_OWNER" ;;
  }

  dimension: sales_team_account_owner {
    type: string
    sql: ${TABLE}."SALES_TEAM_ACCOUNT_OWNER" ;;
  }

  dimension_group: close_dte {
    type: time
    sql: ${TABLE}."CLOSE_DTE" ;;
  }

  measure: mrr {
    type: sum
    sql: ${TABLE}."MRR" ;;
    value_format: "$0"
  }

  measure: mrr_change {
    type: sum
    sql: ${TABLE}."MRR_CHANGE" ;;
    value_format: "$0"
  }

  measure: mrr_acct {
    type: sum
    sql: ${TABLE}."MRR_ACCT" ;;
    value_format: "$0"
  }

  set: detail {
    fields: [
      date_month_date,
      account_id,
      account_name,
      opp_id,
      opp_name,
      start_dte_month_time,
      start_dte_time,
      end_dte_month_time,
      end_dte_time,
      mrr,
      mrr_change,
      is_active,
      mrr_acct,
      opp_category,
      customer_category,
      revenue_category,
      opp_closed_won_dte_time,
      opp_owner_id,
      opportunity_owner,
      owner_description,
      account_owner_id,
      account_owner,
      account_owner_description,
      sales_team_opp_owner,
      sales_team_account_owner,
      close_dte_time
    ]
  }
}
