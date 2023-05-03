view: budget_v_last_fy_actuals {
  sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."BUDGET_V_LAST_FY_ACTUALS");;

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

  measure: beginning_arr_yoy_change {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR_YOY_CHANGE" ;;
  }

  measure: beginning_arr_yoy_change_perc {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR_YOY_CHANGE_PERC" ;;
  }

  measure: new_bookings {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS" ;;
  }

  measure: new_bookings_yoy_change {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS_YOY_CHANGE" ;;
  }

  measure: new_bookings_yoy_change_perc {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS_YOY_CHANGE_PERC" ;;
  }


  measure: churn_arr {
    type: sum
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  measure: churn_arr_yoy_change {
    type: sum
    sql: ${TABLE}."CHURN_ARR_YOY_CHANGE" ;;
  }

  measure: churn_arr_yoy_change_perc {
    type: sum
    sql: ${TABLE}."CHURN_ARR_YOY_CHANGE_PERC" ;;
  }

  measure: net_new_arr {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  measure: net_new_arr_yoy_change {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR_YOY_CHANGE" ;;
  }

  measure: net_new_arr_yoy_change_perc {
    type: sum
    sql: ${TABLE}."NET_NEW_ARR_YOY_CHANGE_PERC" ;;
  }

  measure: ending_arr_yoy_change {
    type: sum
    sql: ${TABLE}."ENDING_ARR_YOY_CHANGE" ;;
  }

  measure: ending_arr_yoy_change_perc {
    type: sum
    sql: ${TABLE}."ENDING_ARR_YOY_CHANGE_PERC" ;;
  }

  measure: ending_arr {
    type: sum
    sql: ${TABLE}."ENDING_ARR" ;;
  }

}
