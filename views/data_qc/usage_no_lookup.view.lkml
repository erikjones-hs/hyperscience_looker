view: usage_no_lookup {
  sql_table_name: (select * from "PROD"."DATA_QC"."DATA_QC_USAGE_NO_LOOKUP");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_ID" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  set: detail {
    fields: [dte, customer, sfdc_account_id, sfdc_account_name]
  }
}
