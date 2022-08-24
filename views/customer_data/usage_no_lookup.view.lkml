  view: usage_no_lookup {
    sql_table_name: (select * from dev.erikjones.usage_data_no_lookup);;

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
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
    fields: [
      dte,
      customer,
      opp_id,
      opp_name,
      sfdc_account_id,
      sfdc_account_name
    ]
  }
}
