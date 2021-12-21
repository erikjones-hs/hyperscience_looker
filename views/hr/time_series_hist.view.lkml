view: lever_time_series_hist {
  sql_table_name: (select * from dev.hr.lever_time_series_hist);;
  drill_fields: [detail*]

   dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: stage_name_raw {
    type: string
    sql: ${TABLE}."STAGE_NAME_RAW" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_status {
    type: string
    sql: ${TABLE}."OPP_STATUS" ;;
  }

  dimension: opp_origin {
    type: string
    sql: ${TABLE}."OPP_ORIGIN" ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}."OPP_OWNER" ;;
  }

  dimension: post_dept {
    type: string
    sql: ${TABLE}."POST_DEPT" ;;
  }

  dimension: post_team {
    type: string
    sql: ${TABLE}."POST_TEAM" ;;
  }

  dimension_group: post_create_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."POST_CREATE_DTE" ;;
  }

  dimension: is_post_created {
    type: number
    sql: ${TABLE}."IS_POST_CREATED" ;;
  }

  dimension: post_name {
    type: string
    sql: ${TABLE}."POST_NAME" ;;
  }

  dimension: post_state {
    type: string
    sql: ${TABLE}."POST_STATE" ;;
  }

  dimension: post_locations {
    type: string
    sql: ${TABLE}."POST_LOCATIONS" ;;
  }

  dimension: post_level {
    type: string
    sql: ${TABLE}."POST_LEVEL" ;;
  }

  dimension: post_owner_name {
    type: string
    sql: ${TABLE}."POST_OWNER_NAME" ;;
  }

  dimension: post_location_grouped {
    type: string
    sql: ${TABLE}."POST_LOCATION_GROUPED" ;;
  }

  dimension_group: opp_create_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."OPP_CREATE_DTE" ;;
  }

  dimension_group: archive_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."ARCHIVE_DTE" ;;
  }

  dimension: opp_archive_reason {
    type: string
    sql: ${TABLE}."OPP_ARCHIVE_REASON" ;;
  }

  dimension_group: application_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."APPLICATION_DTE" ;;
  }

  dimension_group: recruiter_screen_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."RECRUITER_SCREEN_DTE" ;;
  }

  dimension_group: phone_screen_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."PHONE_SCREEN_DTE" ;;
  }

  dimension_group: interview_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."INTERVIEW_DTE" ;;
  }

  dimension_group: offer_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."OFFER_DTE" ;;
  }

  dimension_group: hire_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."HIRE_DTE" ;;
  }

  dimension: is_application {
    type: number
    sql: ${TABLE}."IS_APPLICATION" ;;
  }

  dimension: is_reccruiter_screen {
    type: number
    sql: ${TABLE}."IS_RECCRUITER_SCREEN" ;;
  }

  dimension: is_phone_screen {
    type: number
    sql: ${TABLE}."IS_PHONE_SCREEN" ;;
  }

  dimension: is_interview {
    type: number
    sql: ${TABLE}."IS_INTERVIEW" ;;
  }

  dimension: is_offer {
    type: number
    sql: ${TABLE}."IS_OFFER" ;;
  }

  dimension: is_hire {
    type: number
    sql: ${TABLE}."IS_HIRE" ;;
  }

  dimension: is_archived {
    type: number
    sql: ${TABLE}."IS_ARCHIVED" ;;
  }

  dimension: is_intern_flag {
    type: number
    sql: ${TABLE}."IS_INTERN_FLAG" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_postings {
    type:  sum
    sql: ${is_post_created} ;;
    drill_fields: [detail*]
  }

  measure: num_applications {
    type:  sum
    sql: ${is_application} ;;
    drill_fields: [detail*]
  }

  measure: num_recruiter_screens {
    type:  sum
    sql: ${is_reccruiter_screen} ;;
    drill_fields: [detail*]
  }

  measure: num_phone_screens {
    type:  sum
    sql: ${is_phone_screen} ;;
    drill_fields: [detail*]
  }

  measure: num_interviews {
    type:  sum
    sql: ${is_interview} ;;
    drill_fields: [detail*]
  }

  measure: num_offers {
    type:  sum
    sql: ${is_offer} ;;
    drill_fields: [detail*]
  }

  measure: num_hires {
    type:  sum
    sql: ${is_hire} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      date_raw,
      opp_id,
      opp_name,
      stage_name_raw,
      opp_stage_name,
      opp_status,
      opp_origin,
      opp_owner,
      post_dept,
      post_team,
      post_create_dte_date,
      is_post_created,
      post_name,
      post_state,
      post_locations,
      post_level,
      post_owner_name,
      post_location_grouped,
      opp_create_dte_date,
      archive_dte_date,
      opp_archive_reason,
      application_dte_date,
      recruiter_screen_dte_date,
      phone_screen_dte_date,
      interview_dte_date,
      offer_dte_date,
      hire_dte_date,
      is_application,
      is_reccruiter_screen,
      is_phone_screen,
      is_interview,
      is_offer,
      is_hire,
      is_archived,
      is_intern_flag
    ]
  }
}
