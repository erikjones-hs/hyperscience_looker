view: marketing_closed_won_opps_agg {
  sql_table_name: (select * from DEV.ERIKJONES.MONTHLY_KPIS_MARKETING_CLOSED_WON_OPPS_AGG_HIST);;

  dimension: fy_year {
    type: string
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: net_new_arr {
    type: number
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  dimension: total_arr {
    type: number
    sql: ${TABLE}."TOTAL_ARR" ;;
  }

  dimension: num_opps {
    type: number
    sql: ${TABLE}."NUM_OPPS" ;;
  }

  measure: count {
    type: count
  }

  measure: closed_won_net_new_arr {
    type:  sum
    sql:  ${net_new_arr} ;;
    value_format: "$#,##0"
  }

  measure: closed_won_total_arr {
    type:  sum
    sql:  ${total_arr} ;;
    value_format: "$#,##0"
  }


  measure: closed_won_opps {
    type:  sum
    sql:  ${num_opps} ;;
  }

}
