view: usage_sfdc_lookup_account_level {
  sql_table_name: FIVETRAN_DATABASE.GOOGLE_SHEETS.USAGE_SFDC_LOOKUP_ACCOUNT_LEVEL ;;

  dimension: row {
    primary_key: yes
    type: number
    sql: ${TABLE}._ROW ;;
    hidden: yes
  }

  dimension: customer_usage_data {
    type: string
    sql: ${TABLE}.CUSTOMER_USAGE_DATA ;;
    hidden: yes
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.SFDC_ACCOUNT_ID ;;
    hidden: yes
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}.SFDC_ACCOUNT_NAME ;;
    label: "SFDC Account Name (from Lookup)"
  }
}
