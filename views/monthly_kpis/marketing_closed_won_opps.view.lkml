
view: marketing_closed_won_opps {
  sql_table_name: (select * from "PROD"."MONTHLY_KPIS"."MARKETING_INFLUENCED_CLOSED_WON_OPPS");;
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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: closed_won_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CLOSED_WON_DTE" ;;
  }

  dimension_group: start_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."START_DTE_MONTH" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension_group: closed_won_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."CLOSED_WON_DTE_MONTH" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_opps {
    type:  count_distinct
    sql: ${opp_id} ;;
    drill_fields: [detail*]
  }

  measure: arr {
    type: sum
    sql: ${opp_arr} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: net_new_arr {
    type: sum
    sql: ${opp_net_new_arr} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      account_id,
      account_name,
      opp_id,
      opp_name,
      opp_revenue_type,
      closed_won_dte_date,
      opp_arr,
      opp_net_new_arr
    ]
  }
}
