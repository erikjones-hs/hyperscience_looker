view: software_version {
  sql_table_name: (select * from DEV.ERIKJONES.CURRENT_SOFTWARE_VERSION);;

  dimension: dte {
    type: date
    sql: ${TABLE}."DTE" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: software_version {
    type: string
    sql: ${TABLE}."SOFTWARE_VERSION" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  dimension: main_version {
    type: number
    sql: ${TABLE}."MAIN_VERSION" ;;
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

  dimension: row_num {
    type: number
    sql: ${TABLE}."ROW_NUM" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  measure: num_customers{
    type: count_distinct
    sql: ${customer} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      software_version,
      version,
      main_version,
      opp_id,
      opp_name,
      sfdc_account_id,
      sfdc_account_name,
    ]
  }
}
