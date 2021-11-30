view: sales_closed_opps_this_year {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_sales_opps_closed);;
  drill_fields: [detail*]

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
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
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."CLOSED_WON_DTE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_arr {
    type:  number
    sql:  ${opp_arr} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      account_name,
      opp_name,
      start_dte_date,
      end_dte_date,
      opp_arr,
      opp_net_new_arr,
      closed_won_dte_date
    ]
  }
}
