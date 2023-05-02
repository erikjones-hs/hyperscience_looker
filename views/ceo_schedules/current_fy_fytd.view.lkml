view: current_fy_fytd {
  sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."CURRENT_FYTD");;

  measure: count {
    type: count
  }

  dimension_group: date_month {
    type: time
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  measure: beginning_arr {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR" ;;
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
    type: sum
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

  measure: na_churn_arr {
    type: sum
    sql: ${TABLE}."NA_CHURN_ARR" ;;
  }

  measure: emea_churn_arr {
    type: sum
    sql: ${TABLE}."EMEA_CHURN_ARR" ;;
  }

  measure: apac_churn_arr {
    type: sum
    sql: ${TABLE}."APAC_CHURN_ARR" ;;
  }

  measure: net_new_arr {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  measure: ending_arr {
    type: sum
    sql: ${TABLE}."ENDING_ARR" ;;
  }
}
