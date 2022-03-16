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

  dimension: revenue {
    type:  number
    sql: ${TABLE}."REVENUE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: gm {
    type:  sum
    sql: ${gross_margin} ;;
    value_format: "0%"
    label: "Gross Margin"
  }

  measure: ebitda {
    type: sum
    sql: ${adjusted_ebitda} ;;
    value_format: "$#,##0"
    label: "Adjustd EBITDA"
  }

  measure: rev {
    type: sum
    sql: ${revenue} ;;
    value_format: "$0.0,,\"M\""
    label: "GAAP Revenue"
  }

  set: detail {
    fields: [dte_month, gross_margin, adjusted_ebitda]
  }
}
