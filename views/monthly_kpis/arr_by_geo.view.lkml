view: arr_by_geo {
  sql_table_name: (select * from dev.erikjones.arr_by_geo);;
  drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: customer_category {
    type: string
    sql: ${TABLE}."CUSTOMER_CATEGORY" ;;
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}."REVENUE_CATEGORY" ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}."BILLING_COUNTRY" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}."ANNUAL_REVENUE" ;;
  }

  dimension: revenue_range {
    type: string
    sql: ${TABLE}."REVENUE_RANGE" ;;
  }

  measure: num_accounts {
    type: count_distinct
    sql: ${account_id} ;;
    label: "# Customers"
    drill_fields: [detail*]
  }

  measure: sum_arr {
    type: sum_distinct
    sql_distinct_key: ${account_id} ;;
    sql: ${arr} ;;
    label: "$ ARR"
  }

  set: detail {
    fields: [
      date_month_raw,
      account_id,
      account_name,
      arr,
      customer_category,
      revenue_category,
      billing_country,
      country,
      industry,
      annual_revenue,
      revenue_range
    ]
  }
}
