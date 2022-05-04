view: arr_sales_team_closed_won {
  sql_table_name: (select * from dev.erikjones.arr_sales_team_opps);;


  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension: mrr {
    type: number
    sql: ${TABLE}."MRR" ;;
  }

  dimension: mrr_change {
    type: number
    sql: ${TABLE}."MRR_CHANGE" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension: mrr_acct {
    type: number
    sql: ${TABLE}."MRR_ACCT" ;;
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

  dimension: sales_team {
    type: string
    sql: ${TABLE}."SALES_TEAM" ;;
    order_by_field: sales_team_sort
  }

  dimension: sales_team_sort {
    type: number
    sql: CASE
        WHEN ${sales_team} = 'US East' then 7
        WHEN ${sales_team} = 'US West' then 6
        WHEN ${sales_team} = 'Federal' then 5
        WHEN ${sales_team} = 'APAC' then 4
        WHEN ${sales_team} = 'Channel' then 3
        WHEN ${sales_team} = 'EMEA' then 2
        WHEN ${sales_team} = 'Other' then 1
        END;;
    hidden:  yes
  }

  dimension_group: close_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CLOSE_DTE" ;;
  }

  measure: new_arr {
    type: sum
    sql: CASE WHEN ${revenue_category} = 'new' OR ${revenue_category} = 'expansion'
              THEN ${mrr_change_acct}
              ELSE 0
              END;;
    value_format: "$0.00"
    label: "Closed Won ARR"
  }

}
