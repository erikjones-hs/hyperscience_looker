  view: all_closed_won_opps {
    sql_table_name: (SELECT * FROM DEV.ERIKJONES.MONTHLY_KPIS_ALL_CLOSED_WON_OPPS);;
    drill_fields: [detail*]

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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension_group: end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE" ;;
  }

  dimension_group: start_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE" ;;
  }

  dimension_group: closed_won_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CLOSED_WON_DTE" ;;
  }

  dimension_group: start_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."START_DTE_MONTH" ;;
  }

  dimension_group: end_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."END_DTE_MONTH" ;;
  }

  dimension_group: closed_won_dte_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension: opp_sales_cycle_days {
    type: number
    sql: ${TABLE}."OPP_SALES_CYCLE_DAYS" ;;
  }

  measure: num_non_marketing_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    filters: [opp_is_marketing_influenced_flag: "= 0"]
    label: "# Non-Marketing Influenced Opportunities"
  }

  measure: num_marketing_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    filters: [opp_is_marketing_influenced_flag: "= 1"]
    label: "# Marketing Influenced Opportunities"
  }

  measure: num_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "# Closed Won Opportunities"
  }

  measure: marketing_closed_won_rate {
    type:  number
    sql:  100.00 * ${num_marketing_opps} / NULLIFZERO(${num_opps});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

  measure: non_marketing_closed_won_rate {
    type:  number
    sql:  100.00 * ${num_non_marketing_opps} / NULLIFZERO(${num_opps});;
    value_format: "#0\%"
    drill_fields: [detail*]
  }

    measure: median_sales_cycle {
      type: median
      sql: ${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: mean_sales_cycle {
      type: average
      sql: ${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: min_sales_cycle {
      type: min
      sql: ${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: max_sales_cycle {
      type: max
      sql:${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: percentile_25_sales_cycle {
      type: percentile
      percentile:  25
      sql: ${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: percentile_75_sales_cycle {
      type: percentile
      percentile:  75
      sql: ${opp_sales_cycle_days} ;;
      drill_fields: [detail*]
    }

    measure: median_net_new_arr {
      type: median
      sql: ${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: mean_net_new_arr {
      type: average
      sql: ${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: min_net_new_arr {
      type: min
      sql: ${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: max_net_new_arr {
      type: max
      sql:${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: percentile_25_net_new_arr {
      type: percentile
      percentile:  25
      sql: ${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: percentile_75_net_new_arr {
      type: percentile
      percentile:  75
      sql: ${opp_net_new_arr} ;;
      drill_fields: [detail*]
    }

    measure: median_arr {
      type: median
      sql: ${opp_arr} ;;
      drill_fields: [detail*]
    }

    measure: mean_arr {
      type: average
      sql: ${opp_arr} ;;
      drill_fields: [detail*]
    }

    measure: min_arr {
      type: min
      sql: ${opp_arr} ;;
      drill_fields: [detail*]
    }

    measure: max_arr {
      type: max
      sql:${opp_arr} ;;
      drill_fields: [detail*]
    }

    measure: percentile_25_arr {
      type: percentile
      percentile:  25
      sql: ${opp_arr} ;;
      drill_fields: [detail*]
    }

    measure: percentile_75_arr {
      type: percentile
      percentile:  75
      sql: ${opp_arr} ;;
      drill_fields: [detail*]
    }

  set: detail {
    fields: [
      account_id,
      account_name,
      opp_id,
      opp_name,
      opp_revenue_type,
      opp_arr,
      opp_net_new_arr,
      opp_is_marketing_influenced_flag,
      opp_sales_cycle_days
    ]
  }
}
