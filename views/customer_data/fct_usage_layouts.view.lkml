  view: fct_usage_layouts {
    sql_table_name: (select * from dev.erikjones.fct_usage_layouts);;

  dimension_group: dte {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: num_accounts {
    type: count_distinct
    sql_distinct_key: ${account_id} ;;
    sql: ${account_id} ;;
    label: "# Accounts"
  }

  measure: num_layouts {
    type: sum
    sql: ${TABLE}."NUM_LAYOUTS" ;;
    label: "Total # Layouts"
  }

  measure: avg_layouts {
    type: average
    sql: ${TABLE}."NUM_LAYOUTS" ;;
    label: "Avg. # Layouts"
  }
}
