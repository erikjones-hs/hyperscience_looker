view: operational_health_metrics {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_operational_health);;
  drill_fields: [detail*]

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension: s_m_prior_qtr {
    type: number
    sql: ${TABLE}."S_M_PRIOR_QTR" ;;
  }

  dimension: magic_number {
    type: number
    sql: ${TABLE}."MAGIC_NUMBER" ;;
  }

  dimension: carr_bookings_ltm {
    type: number
    sql: ${TABLE}."CARR_BOOKINGS_LTM" ;;
  }

  dimension: cac_ltm {
    type: number
    sql: ${TABLE}."CAC_LTM" ;;
  }

  dimension: new_upsell_arr_ltm {
    type: number
    sql: ${TABLE}."NEW_UPSELL_ARR_LTM" ;;
  }

  dimension: cac_ratio_ltm {
    type: number
    sql: ${TABLE}."CAC_RATIO_LTM" ;;
  }

  dimension: cac_ending_arr_ratio {
    type: number
    sql: ${TABLE}."CAC_ENDING_ARR_RATIO" ;;
  }

  dimension: sm_ending_arr_ratio {
    type: number
    sql: ${TABLE}."SM_ENDING_ARR_RATIO" ;;
  }

  measure: sm_prior_quarter {
    type:  sum
    sql:  ${s_m_prior_qtr} ;;
    value_format: "$#,##0"
    label: "S&M - Prior Quarter"
  }

  measure: magic_num {
    type:  sum
    sql:  ${magic_number} ;;
    label: "Magic Number"
  }

  measure: ltm_carr_bookings {
    type:  sum
    sql:  ${carr_bookings_ltm} ;;
    value_format: "$#,##0"
    label: "New / Growth / Expansion CARR LTI"
  }

  measure: ltm_cac {
    type:  sum
    sql:  ${cac_ltm} ;;
    value_format: "$#,##0"
    label: "CAC - LTM"
  }

  measure: ltm_new_upsell_arr {
    type:  sum
    sql:  ${new_upsell_arr_ltm} ;;
    value_format: "$#,##0"
    label: "New & Upsell ARR - LTM"
  }

  measure: ltm_cac_ratio {
    type:  sum
    sql:  ${cac_ratio_ltm} ;;
    label: "CAC Ratio - LTM"
  }

  measure: cac_ending_arr {
    type:  sum
    sql:  ${cac_ending_arr_ratio} ;;
    label: "CAC / Ending ARR"
  }

  measure: sm_ending_arr {
    type:  sum
    sql:  ${sm_ending_arr_ratio} ;;
    label: "S&M / Ending ARR"
  }


  set: detail {
    fields: [
      dte,
      s_m_prior_qtr,
      magic_number,
      carr_bookings_ltm,
      cac_ltm,
      new_upsell_arr_ltm,
      cac_ratio_ltm,
      cac_ending_arr_ratio,
      sm_ending_arr_ratio
    ]
  }
}
