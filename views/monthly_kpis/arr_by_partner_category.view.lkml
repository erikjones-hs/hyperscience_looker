view: arr_by_partner_category{
  sql_table_name: (select * from dev.erikjones.arr_partner_bpo_direct);;
  drill_fields: [detail*]

  dimension: dte {
    type: date
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
      dte,
      account_id,
      account_name,
      arr,
      revenue_category,
      arr_category
    ]
  }
}
