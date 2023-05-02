view: current_fy_fytd {
  sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."CURRENT_FYTD");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_month {
    type: time
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  measure: beginning_arr {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR" ;;
  }

  measure: last_fy_new_bookings {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS" ;;
  }

  measure: last_fy_na_new_bookings {
    type: sum
    sql: ${TABLE}."NA_NEW_BOOKINGS" ;;
  }

  measure: last_fy_emea_new_bookings {
    type: sum
    sql: ${TABLE}."EMEA_NEW_BOOKINGS" ;;
  }

  measure: last_fy_apac_new_bookings {
    type: sum
    sql: ${TABLE}."APAC_NEW_BOOKINGS" ;;
  }

  measure: last_fy_churn_arr {
    type: sum
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  measure: last_fy_de_book_arr {
    type: sum
    sql: ${TABLE}."DE_BOOK_ARR" ;;
  }

  measure: last_fy_na_churn_arr {
    type: sum
    sql: ${TABLE}."NA_CHURN_ARR" ;;
  }

  measure: last_fy_emea_churn_arr {
    type: sum
    sql: ${TABLE}."EMEA_CHURN_ARR" ;;
  }

  measure: last_fy_apac_churn_arr {
    type: sum
    sql: ${TABLE}."APAC_CHURN_ARR" ;;
  }

  measure: last_fy_net_new_arr {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  measure: ending_arr {
    type: sum
    sql: ${TABLE}."ENDING_ARR" ;;
  }

  set: detail {
    fields: [
      date_month_time,
      beginning_arr,
      last_fy_new_bookings,
      last_fy_na_new_bookings,
      last_fy_emea_new_bookings,
      last_fy_apac_new_bookings,
      last_fy_churn_arr,
      last_fy_de_book_arr,
      last_fy_na_churn_arr,
      last_fy_emea_churn_arr,
      last_fy_apac_churn_arr,
      last_fy_net_new_arr,
      ending_arr
    ]
  }
}
