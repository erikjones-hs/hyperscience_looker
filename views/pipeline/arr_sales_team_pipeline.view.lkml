
view: arr_sales_team_pipeline {
  sql_table_name: (select * from dev.erikjones.arr_sales_team_opps_pipeline);;

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

  dimension: opp_commit_status {
    type: string
    sql: ${TABLE}."OPP_COMMIT_STATUS" ;;
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

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: net_new_arr {
    type: sum
    sql: ${opp_net_new_arr} ;;
    value_format: "$0.00"
    label: "ARR"

  }

}
