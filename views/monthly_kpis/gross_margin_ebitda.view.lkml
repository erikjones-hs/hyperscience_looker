  view: gross_margin_ebitda {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_gm_ebitda);;
    drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: gross_margin {
    type: number
    sql: ${TABLE}."GROSS_MARGIN" ;;
  }

  dimension: adjusted_ebitda {
    type: number
    sql: ${TABLE}."ADJUSTED_EBITDA" ;;
  }

  measure: gm {
    type:  sum
    sql: ${gross_margin} ;;
    value_format: "0.0%"
    label: "Gross Margin"
  }

  measure: ebitda {
    type: sum
    sql: ${adjusted_ebitda} ;;
    value_format: "$#,##0"
    label: "Adjustd EBITDA"
  }

  set: detail {
    fields: [dte_month, gross_margin, adjusted_ebitda]
  }
}
