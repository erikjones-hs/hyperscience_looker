view: ltv_ltm {
  sql_table_name: (select * from dev.erikjones.ltv_to_cac_ltm);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: qtr_end_dte {
    type: date
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: ltv_to_cac {
    type: number
    sql: ${TABLE}."LTV_TO_CAC" ;;
  }

  dimension: ltm {
    type: number
    sql: ${TABLE}."LTM" ;;
  }

  measure: ltm_avg {
    type: sum
    sql: ${ltm} ;;
    label: "LTV-to-CAC LTM"
  }

  set: detail {
    fields: [dte_date, qtr_end_dte, ltv_to_cac, ltm]
  }
}
