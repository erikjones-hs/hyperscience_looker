
  view: sfdc_usage_qc {
    sql_table_name: (select * from dev.erikjones.sfdc_usage_qc);;

  dimension: old_opp_id {
    type: string
    sql: ${TABLE}."OLD_OPP_ID" ;;
  }

  dimension: old_opp_name {
    type: string
    sql: ${TABLE}."OLD_OPP_NAME" ;;
  }

  dimension: active_opp {
    type: string
    sql: ${TABLE}."ACTIVE_OPP" ;;
  }

  dimension: active_opp_name {
    type: string
    sql: ${TABLE}."ACTIVE_OPP_NAME" ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }
}
