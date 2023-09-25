view: growth_accounting_fy {
  sql_table_name: (select * from dev.erikjones.yearly_growth_accounting);;
  drill_fields: [detail*]


  dimension: fy_end_dte {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension_group: fy {
    type:  time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."FY_YEAR" ;;
    label: "FY"
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

  dimension: de_book_arr {
    type: number
    sql: ${TABLE}."DE_BOOK_ARR" ;;
  }

  dimension: ending_arr {
    type: number
    sql: ${TABLE}."ENDING_ARR" ;;
  }

  dimension: logo_churn_arr {
    type: number
    sql: ${TABLE}."LOGO_CHURN_ARR" ;;
  }

  dimension: arr_churn_arr {
    type: number
    sql: ${TABLE}."ARR_CHURN_ARR" ;;
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

  dimension: de_book_customer {
    type: number
    sql: ${TABLE}."DE_BOOK_CUSTOMER" ;;
  }

  dimension: ending_customer {
    type: number
    sql: ${TABLE}."ENDING_CUSTOMER" ;;
  }

  dimension: arr_per_customer {
    type: number
    sql: ${TABLE}."ARR_PER_CUSTOMER" ;;
  }

  dimension: arr_growth_yoy {
    type: number
    sql: ${TABLE}."ARR_GROWTH_YOY" ;;
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

  measure: arr_beginning {
    type:  sum
    sql:  ${beginning_arr} ;;
    value_format: "$#,##0"
    label: "Beginning ARR"
  }

  measure: arr_new {
    type:  sum
    sql:  ${new_arr} ;;
    value_format: "$#,##0"
    label: "New ARR"
  }

  measure: arr_expansion {
    type:  sum
    sql:  ${expansion_arr} ;;
    value_format: "$#,##0"
    label: "Expansion ARR"
  }

  measure: arr_churn {
    type:  sum
    sql:  ${churn_arr} ;;
    value_format: "$#,##0"
    label: "Churned ARR"
  }

  measure: arr_de_book {
    type:  sum
    sql:  ${de_book_arr} ;;
    value_format: "$#,##0"
    label: "De-Book ARR"
  }

  measure: arr_ending {
    type:  sum
    sql:  ${ending_arr} ;;
    value_format: "$#,##0"
    label: "Ending ARR"
  }

  measure: downsell {
    type:  sum
    sql:  ${arr_churn_arr} ;;
    value_format: "$#,##0"
    label: "ARR Churn (Downsell)"
  }

  measure: logo_churn {
    type:  sum
    sql:  ${logo_churn_arr} ;;
    value_format: "$#,##0"
    label: "Logo ARR"
  }

  measure: customer_beginning {
    type:  sum
    sql:  ${beginning_customer} ;;
    label: "Beginning Customers"
  }

  measure: customer_new {
    type:  sum
    sql:  ${new_customer} ;;
    label: "New Customers"
  }

  measure: customer_churn {
    type:  sum
    sql:  ${churn_customer} ;;
    label: "Churned Customers"
  }

  measure: customer_de_book {
    type:  sum
    sql:  ${de_book_customer} ;;
    label: "De-Booked Customers"
  }

  measure: customer_ending {
    type:  sum
    sql:  ${ending_customer} ;;
    label: "Ending Customers"
  }

  measure: avg_arr {
    type:  sum
    sql:  ${arr_per_customer} ;;
    value_format: "$#,##0"
    label: "Avg. ARR Per Customer"
  }

  measure: arr_qoq {
    type:  sum
    sql:  100 * ${arr_growth_yoy} ;;
    value_format: "#0\%"
    label: "ARR Growth QoQ"
  }

  measure: new_arr_percent_beg {
    type:  sum
    sql:  100 * ${new_arr_percent_beg_arr} ;;
    value_format: "#0\%"
    label: "New ARR / Begining ARR"
  }

  measure: lost_arr_percent_beg {
    type:  sum
    sql:  100 * ${churn_arr_percent_beg_arr} ;;
    value_format: "#0\%"
    label: "Lost ARR / Begining ARR"
  }

  measure: initial_arr_new_customers {
    type:  sum
    sql:  ${new_arr_per_new_customers} ;;
    value_format: "$#,##0"
    label: "Initial ARR from New Customers"
  }

  measure: net_new_arr {
    type: number
    sql: ${arr_new} + ${arr_expansion} + ${arr_churn} + ${arr_de_book} ;;
    value_format: "$#,##0"
    label: "Net New ARR"
  }

  measure: retention {
    type: number
    sql: 100 * (${arr_ending} / NULLIFZERO(${arr_beginning})) ;;
    value_format: "#0\%"
    label: "$$ Retention"
  }

  measure: net_new_customers {
    type: number
    sql: ${customer_new} - ${customer_churn} - ${customer_de_book} ;;
    label: "Net New Customers"
  }

  measure: customer_retention {
    type: number
    sql: 100 * (${customer_ending} / NULLIFZERO(${customer_beginning})) ;;
    value_format: "#0\%"
    label: "Customer Retention"
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
      arr_growth_yoy,
      new_arr_percent_beg_arr,
      churn_arr_percent_beg_arr,
      new_arr_per_new_customers
    ]
  }
}
