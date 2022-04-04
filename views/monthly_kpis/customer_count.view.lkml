  view: customer_count {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_total_customers);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: num_customers {
    type: number
    sql: ${TABLE}."NUM_CUSTOMERS" ;;
  }

    measure: tot_customers {
      type: sum
      sql: ${num_customers} ;;
      label: "Total # Customers"
    }
}
