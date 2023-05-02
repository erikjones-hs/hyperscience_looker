view: revenue_schedule {
    sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."REVENUE_SCHEDULE");;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  measure: beginning_arr {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR" ;;
    label: "Beginning ARR"
  }

  measure: new_arr {
    type: sum
    sql: ${TABLE}."NEW_ARR" ;;
  }

  measure: expansion_arr {
    type: sum
    sql: ${TABLE}."EXPANSION_ARR" ;;
  }

  measure: new_bookings {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS" ;;
  }

  measure: na_new_bookings {
    type: sum
    sql: ${TABLE}."NA_NEW_BOOKINGS" ;;
  }

  measure: emea_new_bookings {
    type: sum
    sql: ${TABLE}."EMEA_NEW_BOOKINGS" ;;
  }

  measure: apac_new_bookings {
    type:  sum
    sql: ${TABLE}."APAC_NEW_BOOKINGS" ;;
  }

  measure: churn_arr {
    type: sum
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  measure: de_book_arr {
    type: sum
    sql: ${TABLE}."DE_BOOK_ARR" ;;
  }

  measure: ending_arr {
    type: sum
    sql: ${TABLE}."ENDING_ARR" ;;
  }

  measure: net_new_arr {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  measure: beginning_customer {
    type: sum
    sql: ${TABLE}."BEGINNING_CUSTOMER" ;;
  }

 measure: new_customer {
    type: sum
    sql: ${TABLE}."NEW_CUSTOMER" ;;
  }

  measure: churn_customer {
    type: sum
    sql: ${TABLE}."CHURN_CUSTOMER" ;;
  }

  measure: de_book_customer {
    type: sum
    sql: ${TABLE}."DE_BOOK_CUSTOMER" ;;
  }

  measure: ending_customer {
    type: sum
    sql: ${TABLE}."ENDING_CUSTOMER" ;;
  }

  measure: arr_per_customer {
    type: sum
    sql: ${TABLE}."ARR_PER_CUSTOMER" ;;
  }

  measure: arr_growth_mom {
    type: sum
    sql: ${TABLE}."ARR_GROWTH_MOM" ;;
  }

  measure: new_arr_percent_beg_arr {
    type: sum
    sql: ${TABLE}."NEW_ARR_PERCENT_BEG_ARR" ;;
  }

  measure: churn_arr_percent_beg_arr {
    type: sum
    sql: ${TABLE}."CHURN_ARR_PERCENT_BEG_ARR" ;;
  }

  measure: new_arr_per_new_customers {
    type: sum
    sql: ${TABLE}."NEW_ARR_PER_NEW_CUSTOMERS" ;;
  }

  set: detail {
    fields: [
      date_month_date,
      beginning_arr,
      new_arr,
      expansion_arr,
      new_bookings,
      na_new_bookings,
      emea_new_bookings,
      apac_new_bookings,
      churn_arr,
      de_book_arr,
      ending_arr,
      net_new_arr,
      beginning_customer,
      new_customer,
      churn_customer,
      de_book_customer,
      ending_customer,
      arr_per_customer,
      arr_growth_mom,
      new_arr_percent_beg_arr,
      churn_arr_percent_beg_arr,
      new_arr_per_new_customers
    ]
  }
}
