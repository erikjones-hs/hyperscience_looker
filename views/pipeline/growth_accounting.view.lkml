  view: growth_accounting {
    sql_table_name: (select * from dev.erikjones.growth_accounting_new_business_pipeline);;


  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: beginning_opps {
    type: sum
    sql: ${TABLE}."BEGINNING_OPPS" ;;
    label: "# Beginning Opportunities"
  }

  measure: new_opps {
    type: sum
    sql: ${TABLE}."NEW_OPPS" ;;
    label: "# New Opportunities"
  }

  measure: closed_won_opps {
    type: sum
    sql: ${TABLE}."CLOSED_WON_OPPS" ;;
    label: "# Closed WOn Opportunities"
  }

  measure: closed_lost_opps {
    type: sum
    sql: ${TABLE}."CLOSED_LOST_OPPS" ;;
    label: "# Closed Lost Opportunities"
  }

  measure: opp_change {
    type: sum
    sql: ${TABLE}."OPP_CHANGE" ;;
    label: "Delta"
  }

  measure: ending_opps {
    type: sum
    sql: ${TABLE}."ENDING_OPPS" ;;
    label:"# Ending Opportunities"
  }
}
