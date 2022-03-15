  view: avg_arr_customer {
    sql_table_name: (select * from DEV.ERIKJONES.MONTHLY_KPIS_AVG_ARR_CUSTOMER_QTR);;


  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: avg_arr {
    type: number
    sql: ${TABLE}."AVG_ARR" ;;
  }

  measure: arr_avg {
    type: sum
    sql: ${avg_arr} ;;
    value_format: "$#,##0.00"
    label: "Avg. ARR per Customer"
  }


}
