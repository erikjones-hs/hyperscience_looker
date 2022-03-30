view: closed_won_sources {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_closed_won_lead_scource);;

  dimension: fy_year {
    type: number
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: dte {
    type: time
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

  measure: number_opportunities {
    type: sum
    sql: ${num_opps} ;;
    label: "# Opportunities"
  }

  measure: arr_net_new {
    type: sum
    sql: ${net_new_arr} ;;
    label: "Net New ARR"
  }

  measure: arr_total {
    type: sum
    sql: ${total_arr} ;;
    label: "Total ARR"
  }

  set: detail {
    fields: [fy_year, dte_time, net_new_arr, total_arr, num_opps]
  }

}
