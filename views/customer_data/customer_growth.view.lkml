view: customer_growth {
  sql_table_name: (select * from dev.erikjones.usage_customer_growth);;


  dimension_group: dte_month {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
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

  dimension: cum_pages {
    type: number
    sql: ${TABLE}."CUM_PAGES" ;;
  }

  dimension: cum_pages_3_months_ago {
    type: number
    sql: ${TABLE}."CUM_PAGES_3_MONTHS_AGO" ;;
  }

  dimension: cum_pages_6_months_ago {
    type: number
    sql: ${TABLE}."CUM_PAGES_6_MONTHS_AGO" ;;
  }

  dimension: perc_change_3_months {
    type: number
    sql: ${TABLE}."PERC_CHANGE_3_MONTHS" ;;
  }

  dimension: perc_change_6_months {
    type: number
    sql: ${TABLE}."PERC_CHANGE_6_MONTHS" ;;
  }
}
