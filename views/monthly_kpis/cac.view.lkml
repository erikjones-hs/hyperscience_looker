
  view: cac {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_cac);;
    drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: cac {
    type: number
    sql: ${TABLE}."CAC" ;;
  }

  dimension: new_upsell_arr {
    type: number
    sql: ${TABLE}."NEW_UPSELL_ARR" ;;
  }

  dimension: arr_cac_ratio {
    type: number
    sql: ${TABLE}."ARR_CAC_RATIO" ;;
  }

    dimension_group: current_date {
      type: time
      timeframes: [date, month, quarter, year]
      sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
    }

  measure: cost_acq {
    type:  sum
    sql: ${cac} ;;
    value_format: "$0.0,,\"M\""
    label: "CAC"
  }

    measure: new_expansion_arr {
      type:  sum
      sql: ${new_upsell_arr} ;;
      value_format: "$0.0,,\"M\""
      label: "New/Expansion ARR"
    }

    measure: cac_ratio {
      type:  number
      sql: ${new_expansion_arr} / NULLIFZERO(${cost_acq}) ;;
      value_format: "$0.00"
      label: "New/Expansion ARR / CAC Ratio"
    }

  set: detail {
    fields: [dte_month, cac, new_upsell_arr, arr_cac_ratio]
  }
}
