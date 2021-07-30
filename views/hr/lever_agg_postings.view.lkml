view: lever_agg_postings {
  sql_table_name: (select * from dev.hr.lever_agg_opp_app_post);;
  drill_fields: [detail*]

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: opp_location {
    type: string
    sql: ${TABLE}."OPP_LOCATION" ;;
  }

  dimension: contact_emails {
    type: string
    sql: ${TABLE}."CONTACT_EMAILS" ;;
  }

  dimension: contact_links {
    type: string
    sql: ${TABLE}."CONTACT_LINKS" ;;
  }

  dimension: contact_phone_nums {
    type: string
    sql: ${TABLE}."CONTACT_PHONE_NUMS" ;;
  }

  dimension: opp_headline {
    type: string
    sql: ${TABLE}."OPP_HEADLINE" ;;
  }

  dimension: opp_origin {
    type: string
    sql: ${TABLE}."OPP_ORIGIN" ;;
  }

  dimension_group: opp_create_dte {
    type: time
    sql: ${TABLE}."OPP_CREATE_DTE" ;;
  }

  dimension_group: opp_last_interaction {
    type: time
    sql: ${TABLE}."OPP_LAST_INTERACTION" ;;
  }

  dimension_group: opp_last_advanced_at {
    type: time
    sql: ${TABLE}."OPP_LAST_ADVANCED_AT" ;;
  }

  dimension: opp_source {
    type: string
    sql: ${TABLE}."OPP_SOURCE" ;;
  }

  dimension: opp_tag {
    type: string
    sql: ${TABLE}."OPP_TAG" ;;
  }

  dimension_group: opp_archived_at {
    type: time
    sql: ${TABLE}."OPP_ARCHIVED_AT" ;;
  }


  dimension: opp_archive_reason {
    type: string
    sql: ${TABLE}."OPP_ARCHIVE_REASON" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_status {
    type: string
    sql: ${TABLE}."OPP_STATUS" ;;
  }

  dimension: opp_owner {
    type: string
    sql: ${TABLE}."OPP_OWNER" ;;
  }

  dimension: opp_owner_email {
    type: string
    sql: ${TABLE}."OPP_OWNER_EMAIL" ;;
  }

  dimension: opp_referrer_name {
    type: string
    sql: ${TABLE}."OPP_REFERRER_NAME" ;;
  }

  dimension: application_id {
    type: string
    sql: ${TABLE}."APPLICATION_ID" ;;
  }

  dimension: application_type {
    type: string
    sql: ${TABLE}."APPLICATION_TYPE" ;;
  }

  dimension: application_create_dte {
    type: date
    sql: ${TABLE}."APPLICATION_CREATE_DTE" ;;
  }

  dimension: application_archived_dte {
    type: date
    sql: ${TABLE}."APPLICATION_ARCHIVED_DTE" ;;
  }

  dimension: application_archive_reason {
    type: string
    sql: ${TABLE}."APPLICATION_ARCHIVE_REASON" ;;
  }

  dimension: application_hiring_manager_id {
    type: string
    sql: ${TABLE}."APPLICATION_HIRING_MANAGER_ID" ;;
  }

  dimension: application_hiring_manager {
    type: string
    sql: ${TABLE}."APPLICATION_HIRING_MANAGER" ;;
  }

  dimension: application_hiring_manager_email {
    type: string
    sql: ${TABLE}."APPLICATION_HIRING_MANAGER_EMAIL" ;;
  }

  dimension: application_ref_id {
    type: string
    sql: ${TABLE}."APPLICATION_REF_ID" ;;
  }

  dimension: application_ref_name {
    type: string
    sql: ${TABLE}."APPLICATION_REF_NAME" ;;
  }

  dimension: application_ref_email {
    type: string
    sql: ${TABLE}."APPLICATION_REF_EMAIL" ;;
  }

  dimension: req_for_hire_id {
    type: string
    sql: ${TABLE}."REQ_FOR_HIRE_ID" ;;
  }

  dimension: post_id {
    type: string
    sql: ${TABLE}."POST_ID" ;;
  }

  dimension: post_state {
    type: string
    sql: ${TABLE}."POST_STATE" ;;
  }

  dimension: post_name {
    type: string
    sql: ${TABLE}."POST_NAME" ;;
  }

  dimension: post_create_dte {
    type: date
    sql: ${TABLE}."POST_CREATE_DTE" ;;
  }

  dimension: post_team {
    type: string
    sql: ${TABLE}."POST_TEAM" ;;
  }

  dimension: post_dept {
    type: string
    sql: ${TABLE}."POST_DEPT" ;;
  }

  dimension: post_locations {
    type: string
    sql: ${TABLE}."POST_LOCATIONS" ;;
  }

  dimension: post_commit {
    type: string
    sql: ${TABLE}."POST_COMMIT" ;;
  }

  dimension: post_level {
    type: string
    sql: ${TABLE}."POST_LEVEL" ;;
  }

  dimension: post_req_code {
    type: string
    sql: ${TABLE}."POST_REQ_CODE" ;;
  }

  dimension: post_creator_id {
    type: string
    sql: ${TABLE}."POST_CREATOR_ID" ;;
  }

  dimension: post_creator_name {
    type: string
    sql: ${TABLE}."POST_CREATOR_NAME" ;;
  }

  dimension: post_creator_email {
    type: string
    sql: ${TABLE}."POST_CREATOR_EMAIL" ;;
  }

  dimension: post_owner_id {
    type: string
    sql: ${TABLE}."POST_OWNER_ID" ;;
  }

  dimension: post_owner_name {
    type: string
    sql: ${TABLE}."POST_OWNER_NAME" ;;
  }

  dimension: post_owner_email {
    type: string
    sql: ${TABLE}."POST_OWNER_EMAIL" ;;
  }

  dimension: post_tags {
    type: string
    sql: ${TABLE}."POST_TAGS" ;;
  }

  dimension: post_dist_channels {
    type: string
    sql: ${TABLE}."POST_DIST_CHANNELS" ;;
  }

  dimension: time_since_posting {
    type: number
    sql: DATEDIFF( day, ${post_create_dte}, now()) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_postings {
    type: count_distinct
    sql: ${post_id} ;;
    drill_fields: [detail_post*]
  }

  measure: num_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    drill_fields: [detail_opp*]
  }

  measure: num_apps {
    type: count_distinct
    sql: ${application_id} ;;
    drill_fields: [detail*]
  }

  set: detail_post {
    fields: [
      post_id,
      post_state,
      post_name,
      post_create_dte,
      post_team,
      post_dept,
      post_locations,
      post_commit,
      post_level,
      post_req_code,
      post_creator_id,
      post_creator_name,
      post_creator_email,
      post_owner_id,
      post_owner_name,
      post_owner_email,
      post_tags,
      post_dist_channels
    ]
  }

  set: detail_opp {
    fields: [
      opp_id,
      opp_name,
      opp_location,
      contact_emails,
      contact_links,
      contact_phone_nums,
      opp_headline,
      opp_origin,
      opp_create_dte_time,
      opp_last_interaction_time,
      opp_last_advanced_at_time,
      opp_source,
      opp_tag,
      opp_archive_reason,
      opp_stage_name,
      opp_status,
      opp_owner,
      opp_owner_email,
      opp_referrer_name
    ]
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      opp_location,
      contact_emails,
      contact_links,
      contact_phone_nums,
      opp_headline,
      opp_origin,
      opp_create_dte_time,
      opp_last_interaction_time,
      opp_last_advanced_at_time,
      opp_source,
      opp_tag,
      opp_archive_reason,
      opp_stage_name,
      opp_status,
      opp_owner,
      opp_owner_email,
      opp_referrer_name,
      application_id,
      application_type,
      application_create_dte,
      application_archived_dte,
      application_archive_reason,
      application_hiring_manager_id,
      application_hiring_manager,
      application_hiring_manager_email,
      application_ref_id,
      application_ref_name,
      application_ref_email,
      req_for_hire_id,
      post_id,
      post_state,
      post_name,
      post_create_dte,
      post_team,
      post_dept,
      post_locations,
      post_commit,
      post_level,
      post_req_code,
      post_creator_id,
      post_creator_name,
      post_creator_email,
      post_owner_id,
      post_owner_name,
      post_owner_email,
      post_tags,
      post_dist_channels
    ]
  }
}
