view: opp_contracted_pages_history {
  sql_table_name: (select * from "PROD"."DATA_QC"."DATA_QC_OPP_CONTRACTED_PAGES_HISTORY");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  set: detail {
    fields: [opp_id, opp_name, account_id, account_name]
  }
}
