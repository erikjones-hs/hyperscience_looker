  view: sales_team_actuals_goals {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_arr_by_sales_team);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

    dimension: new_arr {
      type: number
      sql: ${TABLE}."NEW_ARR" ;;
    }

  dimension: sales_team {
    type: string
    sql: ${TABLE}."SALES_TEAM" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  measure: goal_eoy{
    type:  sum
    sql: ${new_arr} ;;
    filters: [category: "budget"]
    value_format: "$#,##0.00"
  }

 measure: actuals_fytd {
   type: sum
   sql: ${new_arr} ;;
  filters: [category: "actuals"]
   value_format: "$#,##0.00"
 }

}
