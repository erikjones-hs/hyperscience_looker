view: on_prem_auto_usage_qc {
    sql_table_name: (select * from prod.data_qc.on_prem_usage_data_qc);;

  dimension: sfdc_license_key_name {
    type: string
    sql: ${TABLE}."SFDC_LICENSE_KEY_NAME" ;;
  }

  dimension: environment_id {
    type: string
    sql: ${TABLE}."ENVIRONMENT_ID" ;;
  }

  dimension: license_key_create_date {
    type: date
    sql: ${TABLE}."LICENSE_KEY_CREATE_DATE" ;;
  }

  dimension: environment_type {
    type: string
    sql: ${TABLE}."ENVIRONMENT_TYPE" ;;
  }

  dimension: instance_group {
    type: string
    sql: ${TABLE}."INSTANCE_GROUP" ;;
  }

  dimension: fqdn {
    type: string
    sql: ${TABLE}."FQDN" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: total_pages_processed {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_PROCESSED" ;;
  }

  dimension_group: latest_day_receiving_usage {
    type: time
    sql: ${TABLE}."LATEST_DAY_RECEIVING_USAGE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      sfdc_license_key_name,
      environment_id,
      license_key_create_date,
      environment_type,
      instance_group,
      fqdn,
      customer,
      total_pages_processed,
      latest_day_receiving_usage_time
    ]
  }
}
