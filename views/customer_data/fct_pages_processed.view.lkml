view: fct_pages_processed {
  sql_table_name: (select * from dev.cx.customer_data_fct_pages_processed);;
  drill_fields: [detail*]

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: number_of_pages_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_CREATED" ;;
  }

  dimension_group: qtr {
    type: time
    sql: ${TABLE}."QTR" ;;
  }

  dimension: yr {
    type: date
    sql: ${TABLE}."YR" ;;
  }

  dimension: day_of_qtr {
    type: number
    sql: ${TABLE}."DAY_OF_QTR" ;;
  }

  dimension: day_of_year {
    type: number
    sql: ${TABLE}."DAY_OF_YEAR" ;;
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }

  dimension: ytd {
    type: number
    sql: ${TABLE}."YTD" ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}."ROW_NUM" ;;
  }

  dimension_group: first_full_month {
    type: time
    sql: ${TABLE}."FIRST_FULL_MONTH" ;;
  }

  dimension: num_months_sending_data {
    type: number
    sql: ${TABLE}."NUM_MONTHS_SENDING_DATA" ;;
  }

  dimension_group: last_month_sending_data {
    type: time
    sql: ${TABLE}."LAST_MONTH_SENDING_DATA" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_pages {
    type:  sum
    sql:  ${number_of_pages_created} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      customer,
      number_of_pages_created,
      qtr_time,
      yr,
      day_of_qtr,
      day_of_year,
      qtd,
      ytd,
      row_num,
      first_full_month_time,
      num_months_sending_data,
      last_month_sending_data_time
    ]
  }
}
