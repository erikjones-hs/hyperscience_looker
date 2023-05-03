view: fy_budget_totals {
  sql_table_name: (select * from "PROD"."SCHEDULES_SUMMARY"."FY_BUDGET_TOTALS");;

  measure: count {
    type: count
  }

  dimension_group: fy_year {
    type: time
    sql: ${TABLE}."FY_YEAR" ;;
  }

  measure: beginning_arr {
    type: sum
    sql: ${TABLE}."BEGINNING_ARR" ;;
  }

  measure: new_bookings {
    type: sum
    sql: ${TABLE}."NEW_BOOKINGS" ;;
  }

  measure: churn_arr {
    type: sum
    sql: ${TABLE}."CHURN_ARR" ;;
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
