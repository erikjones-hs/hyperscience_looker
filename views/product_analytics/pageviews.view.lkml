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
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension_group: session_start_time {
    type: time
    sql: ${TABLE}."SESSION_START_TIME" ;;
  }

  dimension_group: session_end_time {
    type: time
    sql: ${TABLE}."SESSION_END_TIME" ;;
  }

  dimension_group: time_between_sessions {
    type: duration
    sql_start: ${session_start_time_minute} ;;
    sql_end:  ${session_end_time_minute} ;;
    intervals: [minute, hour]
  }

  measure: num_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    label: "# Users"
    drill_fields: [detail*]
  }

  measure: num_events {
    type: count_distinct
    sql_distinct_key: ${event_id} ;;
    sql: ${event_id} ;;
    label: "# Events"
    drill_fields: [detail*]
  }

  measure: num_sessions {
    type: count_distinct
    sql_distinct_key: ${session_id} ;;
    sql: ${session_id} ;;
    label: "# Sessions"
    drill_fields: [detail*]
  }

  measure: session_per_user {
    type: number
    sql: ${num_sessions} / ${num_users} ;;
    label: "Session / User"
  }

  measure: avg_time_between_sessions{
    type:  average
    sql: ${minutes_time_between_sessions} ;;
    label: "Avg. Time Between Sessions"
  }

  measure: activity_days {
    type: count_distinct
    sql_distinct_key: ${time_date} ;;
    sql: ${time_date} ;;
    label: "# Activity Days"
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
