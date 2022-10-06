  view: time_to_upgrade {
    sql_table_name: (select * from DEV.ERIKJONES.DAYS_TO_UPGRADE_SOFTWARE_VERSION);;

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

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}."ROW_NUM" ;;
  }

  dimension: is_opp_active_fl {
    type: number
    sql: ${TABLE}."IS_OPP_ACTIVE_FL" ;;
  }

  dimension: prev_dte {
    type: date
    sql: ${TABLE}."PREV_DTE" ;;
  }

  dimension: days_to_upgrade {
    type: number
    sql: ${TABLE}."DAYS_TO_UPGRADE" ;;
  }

  measure: median_days_to_upgrade {
    type: median
    sql: ${days_to_upgrade} ;;
  }

  measure: mean_days_to_upgrade {
    type: average
    sql: ${days_to_upgrade} ;;
  }

  measure: min_days_to_upgrade {
    type: min
    sql: ${days_to_upgrade} ;;
  }

  measure: max_days_to_upgrade {
    type: max
    sql: ${days_to_upgrade} ;;
  }

  measure: percentile_25_days_to_upgrade {
    type: percentile
    percentile:  25
    sql: ${days_to_upgrade} ;;
  }

  measure: percentile_75_days_to_upgrade {
    type: percentile
    percentile:  75
    sql: ${days_to_upgrade};;
  }

  set: detail {
    fields: [
      dte,
      customer,
      software_version,
      version,
      main_version,
      opp_id,
      opp_name,
      sfdc_account_id,
      sfdc_account_name,
      customer_name,
      row_num,
      is_opp_active_fl,
      prev_dte,
      days_to_upgrade
    ]
  }
}
