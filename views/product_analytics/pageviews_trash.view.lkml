view: pageviews_trash {
  sql_table_name: (select * from "DEV"."ERIKJONES"."HEAP_PAGEVIEWS");;

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

  dimension: heap_previous_page {
    type: string
    sql: ${TABLE}."HEAP_PREVIOUS_PAGE" ;;
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

  dimension_group: time_of_session {
    type: duration
    sql_start: ${session_start_time_minute} ;;
    sql_end:  ${session_end_time_minute} ;;
    intervals: [minute, hour]
  }

  dimension: view_task_queue_fl {
    type: number
    sql:  CASE WHEN ${path} like '/tasks/queue' then 1 else 0 end ;;
  }

  dimension: view_submissions_page_fl {
    type: number
    sql:  CASE WHEN ${path} like '/submissions/submissions' then 1 else 0 end ;;
  }

  dimension: view_task_overview_fl {
    type: number
    sql:  CASE WHEN ${path} like '/tasks/overview' then 1 else 0 end ;;
  }

  dimension: view_layouts_library_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layouts/library' then 1 else 0 end ;;
  }

  dimension: view_models_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layouts/models' then 1 else 0 end ;;
  }

  dimension: click_id_model_fl {
    type: number
    sql:  CASE WHEN (${path} like '/layouts/models/%' and ${path} not like '/layouts/models/classification/%') then 1 else 0 end ;;
  }

  dimension: click_classification_model_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layouts/models/classification/%' then 1 else 0 end ;;
  }

  dimension: click_document_fl {
    type: number
    sql:  CASE WHEN ${path} like '/document/%' then 1 else 0 end ;;
  }

  dimension: view_flows_fl {
    type: number
    sql:  CASE WHEN ${path} like '/flows' then 1 else 0 end ;;
  }

  dimension: click_layout_variation_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layouts/%/variations' then 1 else 0 end ;;
  }

  dimension: view_admin_fl {
    type: number
    sql:  CASE WHEN ${path} like '/administration/%' then 1 else 0 end ;;
  }

  dimension: view_users_fl {
    type: number
    sql:  CASE WHEN ${path} like '/users/%' then 1 else 0 end ;;
  }

  dimension: view_documents_from_submissions_fl {
    type: number
    sql:  CASE WHEN ${path} like '/submissions/documents' then 1 else 0 end ;;
  }

  dimension: click_perform_task_from_submission_fl {
    type: number
    sql:  CASE WHEN ${path} like '/supervision/submission/%' then 1 else 0 end ;;
  }

  dimension: click_perform_task_from_tasks_fl {
    type: number
    sql:  CASE WHEN ${path} like '/supervision/%' then 1 else 0 end ;;
  }

  dimension: click_edit_flow_fl {
    type: number
    sql:  CASE WHEN ${path} like '/flows/%/edit' then 1 else 0 end ;;
  }

  dimension: click_submission_fl {
    type: number
    sql:  CASE WHEN ${path} like '/submissions/%' then 1 else 0 end ;;
  }

  dimension: click_edit_layout_variation_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layout_variations/%/edit' then 1 else 0 end ;;
  }

  dimension: view_dreleases_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layouts/releases' then 1 else 0 end ;;
  }

  dimension: click_releases_fl {
    type: number
    sql:  CASE WHEN ${path} like '/layoutss/releases/*' then 1 else 0 end ;;
  }

  dimension: click_potential_layouts_fl {
    type: number
    sql:  CASE WHEN ${path} like '/submissions/potential_layouts/*' then 1 else 0 end ;;
  }

  dimension: click_find_layouts_fl {
    type: number
    sql:  CASE WHEN ${path} like '/submissions/potential_layouts/runner' then 1 else 0 end ;;
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

  measure: avg_time_of_session{
    type:  average
    sql: ${minutes_time_of_session} ;;
    label: "Avg. Session Time"
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
