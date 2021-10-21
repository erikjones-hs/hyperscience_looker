view: digital_ad_stats {
  sql_table_name: "MARKETING"."DIGITAL_AD_STATS";;

  dimension: campaign_ad_type {
    type: string
    sql: ${TABLE}."CAMPAIGN_AD_TYPE" ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension_group: campaign_last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CAMPAIGN_LAST_UPDATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME" ;;
  }

  dimension: campaign_platform {
    type: string
    sql: ${TABLE}."CAMPAIGN_PLATFORM" ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}."CAMPAIGN_STATUS" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}."CLICKS" ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}."CONVERSIONS" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}."IMPRESSIONS" ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name]
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    drill_fields: [campaign_name]
    value_format: "$0.00"
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    drill_fields: [campaign_name]
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    drill_fields: [campaign_name]
  }

  measure: total_conversions {
    type: sum
    sql:  ${conversions} ;;
    drill_fields: [campaign_name]
  }

  measure: click_through_rate {
    type: number
    sql:  ${total_clicks} / ${total_impressions}  ;;
    value_format: "0.00%"
  }

  measure: conversion_rate {
    type:  number
    sql:  ${total_conversions} / ${total_clicks} ;;
    value_format: "0.00%"
  }

  measure: cost_per_click {
    type:  number
    sql:  ${total_cost} / ${total_clicks} ;;
    value_format: "$0.00"
  }

  measure: cost_per_conversion {
    type: number
    sql: ${total_cost} / ${total_conversions} ;;
    value_format: "$0.00"

  }










}
