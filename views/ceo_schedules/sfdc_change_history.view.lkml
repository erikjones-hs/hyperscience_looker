view: sfdc_change_history {
  sql_table_name: (select * from prod.schedules_summary.sfdc_change_history);;

  dimension_group: updated_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."UPDATED_DTE" ;;
  }

  dimension: updated_qtr_end_dte {
    type: date
    sql: ${TABLE}."UPDATED_QTR_END_DTE" ;;
  }

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

  dimension: sfdc_field {
    type: string
    sql: ${TABLE}."SFDC_FIELD" ;;
  }

  dimension_group: old_close_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OLD_CLOSE_DTE" ;;
  }

  dimension_group: new_close_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."NEW_CLOSE_DTE" ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}."OLD_VALUE" ;;
  }

  dimension: new_value {
    type: string
    sql: ${TABLE}."NEW_VALUE" ;;
  }

  dimension: current_qtr_change_fl {
    type: number
    sql: ${TABLE}."CURRENT_QTR_CHANGE_FL" ;;
  }

  dimension: close_date_push_new_qtr_fl {
    type: number
    sql: ${TABLE}."CLOSE_DATE_PUSH_NEW_QTR_FL" ;;
  }

  dimension: close_date_brought_into_current_qtr_fl {
    type: number
    sql: ${TABLE}."CLOSE_DATE_BROUGHT_INTO_CURRENT_QTR_FL" ;;
  }

  measure: arr {
    type: sum
    sql: ${TABLE}."OPP_ARR" ;;
    label: "ARR"
  }
}
