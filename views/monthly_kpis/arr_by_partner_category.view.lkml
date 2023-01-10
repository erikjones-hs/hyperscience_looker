view: arr_by_partner_category{
  sql_table_name: (select * from dev.erikjones.arr_partner_bpo_direct);;
  drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
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

  dimension: revenue_category {
    type: string
    sql: ${TABLE}."REVENUE_CATEGORY" ;;
  }

  dimension: arr_category {
    type: string
    sql: ${TABLE}."ARR_CATEGORY" ;;
  }

  measure: total_arr {
    type: sum
    sql: ${arr} ;;
    label: "$ ARR"
  }

  set: detail {
    fields: [
      dte_raw,
      account_id,
      account_name,
      arr,
      revenue_category,
      arr_category
    ]
  }
}
