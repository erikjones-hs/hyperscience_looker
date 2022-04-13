  view: pageviews {
    sql_table_name: (select * from dev.erikjones.heap_pageviews);;

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}."SESSION_ID" ;;
  }

  dimension_group: time {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}."DEVICE_TYPE" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}."IP" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."BROWSER" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: customer_int {
    type: string
    sql: ${TABLE}."CUSTOMER_INT" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."PATH" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: pageview {
    type: string
    sql: ${TABLE}."PAGEVIEW" ;;
  }

  measure: num_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    label: "# Users"
    drill_fields: [detail*]
  }

  measure: num_events {
    type: count_distinct
    sql_distinct_key: ${event_id} ;;
    label: "# Events"
    drill_fields: [detail*]
  }

  measure: num_sessions {
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    label: "# Sessions"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      user_id,
      event_id,
      session_id,
      platform,
      device_type,
      country,
      region,
      city,
      ip,
      browser,
      domain,
      customer_int,
      customer,
      path,
      title,
      pageview
    ]
  }
}
