view: sales_closed_opps_this_year {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_sales_opps_closed);;
  drill_fields: [detail*]

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Account/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension_group: closed_won_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CLOSED_WON_DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: num_deals {
    type: count_distinct
    sql: ${opp_id};;
    drill_fields: [detail*]
  }

  measure: total_arr {
    type:  sum
    sql:  ${opp_arr} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      account_id,
      account_name,
      opp_id,
      opp_name,
      closed_won_dte_date,
      start_dte_date,
      opp_arr,
      opp_net_new_arr,
    ]
  }
}
