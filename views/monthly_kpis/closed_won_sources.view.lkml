view: closed_won_sources {
    sql_table_name: (select * from prod.monthly_kpis.closed_won_sourced);;

  dimension: fy_year {
    type: number
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  measure: number_opportunities {
    type: sum
    sql: ${num_opps} ;;
    label: "# Opportunities"
  }

  measure: arr_net_new {
    type: sum
    sql: ${net_new_arr} ;;
    value_format: "$#,##0"
    label: "Net New ARR"
  }

  measure: arr_total {
    type: sum
    sql: ${total_arr} ;;
    value_format: "$#,##0"
    label: "Total ARR"
  }

}
