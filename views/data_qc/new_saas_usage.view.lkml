view: new_saas_usage {
  sql_table_name: (select * from "PROD"."CUSTOMER_USAGE"."DATA_QC_SAAS_USAGE");;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_int {
    type: string
    sql: ${TABLE}."CUSTOMER_INT" ;;
  }

  set: detail {
    fields: [customer_int]
  }
}
