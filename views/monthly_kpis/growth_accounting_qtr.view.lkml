view: growth_accounting_qtr {
  sql_table_name: (select * from dev.erikjones.fct_growth_accounting_qtr);;
  drill_fields: [detail*]


  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: beginning_arr {
    type: number
    sql: ${TABLE}."BEGINNING_ARR" ;;
  }

  dimension: new_arr {
    type: number
    sql: ${TABLE}."NEW_ARR" ;;
  }

  dimension: expansion_arr {
    type: number
    sql: ${TABLE}."EXPANSION_ARR" ;;
  }

  dimension: churn_arr {
    type: number
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  dimension: ending_arr {
    type: number
    sql: ${TABLE}."ENDING_ARR" ;;
  }

  dimension: beginning_customer {
    type: number
    sql: ${TABLE}."BEGINNING_CUSTOMER" ;;
  }

  dimension: new_customer {
    type: number
    sql: ${TABLE}."NEW_CUSTOMER" ;;
  }

  dimension: churn_customer {
    type: number
    sql: ${TABLE}."CHURN_CUSTOMER" ;;
  }

  dimension: ending_customer {
    type: number
    sql: ${TABLE}."ENDING_CUSTOMER" ;;
  }

  dimension: arr_per_customer {
    type: number
    sql: ${TABLE}."ARR_PER_CUSTOMER" ;;
  }

  dimension: arr_growth_qoq {
    type: number
    sql: ${TABLE}."ARR_GROWTH_QOQ" ;;
  }

  dimension: new_arr_percent_beg_arr {
    type: number
    sql: ${TABLE}."NEW_ARR_PERCENT_BEG_ARR" ;;
  }

  dimension: churn_arr_percent_beg_arr {
    type: number
    sql: ${TABLE}."CHURN_ARR_PERCENT_BEG_ARR" ;;
  }

  dimension: new_arr_per_new_customers {
    type: number
    sql: ${TABLE}."NEW_ARR_PER_NEW_CUSTOMERS" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      beginning_arr,
      new_arr,
      expansion_arr,
      churn_arr,
      ending_arr,
      beginning_customer,
      new_customer,
      churn_customer,
      ending_customer,
      arr_per_customer,
      arr_growth_qoq,
      new_arr_percent_beg_arr,
      churn_arr_percent_beg_arr,
      new_arr_per_new_customers
    ]
  }
}
