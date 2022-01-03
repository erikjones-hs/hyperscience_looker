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
    link: {
      label: "Lever"
      url: "https://hire.lever.co/candidates/{{ value }}"
      icon_url: "https://lever.co/favicon.ico"
    }
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

  dimension: post_id {
    type: string
    sql: ${TABLE}."POST_ID" ;;
    link: {
      label: "Lever"
      url: "https://hire.lever.co/reports/postings/{{ value }}"
      icon_url: "https://lever.co/favicon.ico"
    }
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

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Week"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${application_dte_week}
    WHEN {% parameter timeframe_picker %} = 'Month' THEN ${application_dte_month}
    WHEN{% parameter timeframe_picker %} = 'Quarter' THEN ${application_dte_quarter}
    WHEN{% parameter timeframe_picker %} = 'Year' THEN ${application_dte_year}
    END ;;
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

  dimension: application_fl {
    type: number
    sql: ${TABLE}."APPLICATION_FL" ;;
  }

  dimension: recruiting_screen_fl {
    type: number
    sql: ${TABLE}."RECRUITING_SCREEN_FL" ;;
  }

  dimension: phone_screen_fl {
    type: number
    sql: ${TABLE}."PHONE_SCREEN_FL" ;;
  }

  dimension: interview_fl {
    type: number
    sql: ${TABLE}."INTERVIEW_FL" ;;
  }

  dimension: offer_fl {
    type: number
    sql: ${TABLE}."OFFER_FL" ;;
  }

  dimension: hire_fl {
    type: number
    sql: ${TABLE}."HIRE_FL" ;;
  }

  dimension: application_is_date_month {
    type: number
    sql: ${TABLE}."APPLICATION_IS_DATE_MONTH" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: stage_custom_sort {
    label: "Stage (Custom Sort)"
    case: {
      when: {
        sql: ${opp_stage_name} = 'recruiter_screen' ;;
        label: "Recruiter Screen"
      }
      when: {
        sql: ${opp_stage_name} = 'phone_screen' ;;
        label: "Phone Screen"
      }
      when: {
        sql: ${opp_stage_name} = 'interview' ;;
        label: "Interview"
      }
      when: {
        sql: ${opp_stage_name} = 'offer' ;;
        label: "Offer"
      }
    }
  }

  measure: num_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    drill_fields: [detail*]
  }

  measure: num_postings {
    type:  sum
    sql: ${is_post_created} ;;
    drill_fields: [detail*]
  }

  measure: unique_postings {
    type:  count_distinct
    sql: ${post_name} ;;
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

  measure: num_applications_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [application_is_date_month: "= 1"]
  }

  measure: num_recruiter_screens_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [recruiting_screen_fl: "= 1"]
  }

  measure: num_phone_screens_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [phone_screen_fl: "= 1"]
  }

  measure: num_interviews_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [interview_fl: "= 1"]
  }

  measure: num_offers_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [offer_fl: "= 1"]
  }

  measure: num_hires_pass_through {
    type:  count_distinct
    sql: ${opp_id};;
    filters: [hire_fl: "= 1"]
  }

  measure: application_to_recutiing_screen_yield {
    type: number
    sql:  100.00 * ${num_recruiter_screens_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: recutiing_screen_to_phone_screen_yield {
    type: number
    sql:  100.00 * ${num_phone_screens_pass_through} / NULLIFZERO(${num_recruiter_screens_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: phone_screen_to_interview_yield {
    type: number
    sql:  100.00 * ${num_interviews_pass_through} / NULLIFZERO(${num_phone_screens_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: interview_to_offer_yield {
    type: number
    sql:  100.00 * ${num_offers_pass_through} / NULLIFZERO(${num_interviews_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: offer_to_hire_yield {
    type: number
    sql:  100.00 * ${num_hires_pass_through} / NULLIFZERO(${num_offers_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: hire_rate {
    type: number
    sql:  100.00 * ${num_hires_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: recruiter_screen_rate {
    type: number
    sql:  100.00 * ${num_recruiter_screens_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: phone_screen_rate {
    type: number
    sql:  100.00 * ${num_phone_screens_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: interview_rate {
    type: number
    sql:  100.00 * ${num_interviews_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: offer_rate {
    type: number
    sql:  100.00 * ${num_offers_pass_through} / NULLIFZERO(${num_applications_pass_through}) ;;
    value_format: "#0.00\%"
  }

  measure: phone_to_offer_ratio {
    type: number
    sql:  ${num_phone_screens_pass_through} / NULLIFZERO(${num_offers_pass_through}) ;;
    value_format: "0.0"
  }

  measure: interview_to_offer_ratio {
    type: number
    sql:  ${num_interviews_pass_through} / NULLIFZERO(${num_offers_pass_through}) ;;
    value_format: "0.0"
  }

  measure: phone_to_hire_ratio {
    type: number
    sql:  ${num_phone_screens_pass_through} / NULLIFZERO(${num_hires_pass_through}) ;;
    value_format: "0.0"
  }

  measure: interview_to_hire_ratio {
    type: number
    sql:  ${num_interviews_pass_through} / NULLIFZERO(${num_hires_pass_through}) ;;
    value_format: "0.0"
  }

  measure: open_applications {
    type:  count_distinct
    sql:
       CASE WHEN ${opp_stage_name} not in ('archived','hired') AND ${post_state} = 'published'
       THEN ${opp_id}
       ELSE NULL
      END;;
  }

  measure: open_recruiting_screens{
    type:  count_distinct
    sql: ${opp_id};;
    filters: [opp_stage_name: "recruiter_screen", post_state: "published" ]
  }

  measure: open_phone_screens{
    type:  count_distinct
    sql: ${opp_id};;
    filters: [opp_stage_name: "phone_screen", post_state: "published" ]
  }

  measure: open_interviews{
    type:  count_distinct
    sql: ${opp_id};;
    filters: [opp_stage_name: "interview", post_state: "published" ]
  }

  measure: open_offers{
    type:  count_distinct
    sql: ${opp_id};;
    filters: [opp_stage_name: "offer", post_state: "published" ]
  }

  set: detail {
    fields: [
      post_name,
      post_locations,
      opp_id,
      opp_name,
      opp_stage_name,
      opp_status,
      opp_origin,
      opp_owner,
      post_dept,
      post_team
    ]
  }
}
