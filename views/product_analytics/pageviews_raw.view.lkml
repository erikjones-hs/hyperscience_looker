  view: pageviews_raw {
      sql_table_name: (select * from "HEAP_MAIN_PRODUCTION"."HEAP"."PAGEVIEWS");;

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
    sql: ${TABLE}."TIME" ;;
  }

  dimension: library {
    type: string
    sql: ${TABLE}."LIBRARY" ;;
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

  dimension: referrer {
    type: string
    sql: ${TABLE}."REFERRER" ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}."LANDING_PAGE" ;;
  }

  dimension: landing_page_query {
    type: string
    sql: ${TABLE}."LANDING_PAGE_QUERY" ;;
  }

  dimension: landing_page_hash {
    type: string
    sql: ${TABLE}."LANDING_PAGE_HASH" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."BROWSER" ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}."SEARCH_KEYWORD" ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}."UTM_SOURCE" ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}."UTM_CAMPAIGN" ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}."UTM_MEDIUM" ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}."UTM_TERM" ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}."UTM_CONTENT" ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}."DEVICE" ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}."CARRIER" ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}."APP_NAME" ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}."APP_VERSION" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}."QUERY" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."PATH" ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}."HASH" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: view_controller {
    type: string
    sql: ${TABLE}."VIEW_CONTROLLER" ;;
  }

  dimension: screen_a11_y_id {
    type: string
    sql: ${TABLE}."SCREEN_A11Y_ID" ;;
  }

  dimension: screen_a11_y_label {
    type: string
    sql: ${TABLE}."SCREEN_A11Y_LABEL" ;;
  }

  dimension: target_a11_y_label {
    type: string
    sql: ${TABLE}."TARGET_A11Y_LABEL" ;;
  }

  dimension: heap_device_id {
    type: string
    sql: ${TABLE}."HEAP_DEVICE_ID" ;;
  }

  dimension: heap_previous_page {
    type: string
    sql: ${TABLE}."HEAP_PREVIOUS_PAGE" ;;
  }

  dimension: heap_app_name {
    type: string
    sql: ${TABLE}."HEAP_APP_NAME" ;;
  }

  dimension: heap_app_version {
    type: string
    sql: ${TABLE}."HEAP_APP_VERSION" ;;
  }

  dimension: heap_device {
    type: string
    sql: ${TABLE}."HEAP_DEVICE" ;;
  }

  measure: num_pageviews {
    type: sum_distinct
    sql_distinct_key: ${event_id} ;;
    sql: ${event_id} ;;
    label: "# Pageviews"
  }

  measure: most_recet_pageview {
    type: max
    sql: ${time_date} ;;
    label: "Most Recent Activity"
  }
}
