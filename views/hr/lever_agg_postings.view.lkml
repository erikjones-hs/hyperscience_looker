view: lever_agg_postings {
  sql_table_name: (select * from dev.hr.lever_agg_opp_app_post);;
  drill_fields: [detail*]

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

  dimension_group: application_create_dte {
    type: time
    sql: ${TABLE}."APPLICATION_CREATE_DTE" ;;
  }

  dimension_group: application_archived_dte {
    type: time
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
    link: {
      label: "Lever"
      url: "https://hire.lever.co/reports/postings/{{ value }}"
      icon_url: "https://lever.co/favicon.ico"
    }
  }

  dimension: post_state {
    type: string
    sql: ${TABLE}."POST_STATE" ;;
  }

  dimension: post_name {
    type: string
    sql: ${TABLE}."POST_NAME" ;;
  }

  dimension_group: post_create_dte {
    type: time
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
    sql: DATEDIFF( day, ${post_create_dte_date}, current_date()) ;;
  }

  dimension: applicant_funnel_stage {
    case: {
      when: {
        sql: lower(${opp_stage_name}) in ('New applicant','New lead') ;;
        label: "Unprocessed Applicants"
      }
      when: {
        sql: lower(${opp_stage_name}) in ('Intro call','Reached out','Responded','Sell action') ;;
        label: "Pre-Interview"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'Recruiter screen' ;;
        label: "Recruiter Screen"
      }
      when: {
        sql: lower(${opp_stage_name}) in ('Skills test','Phone screen');;
        label: "Technical Screen"
      }
      when: {
        sql: lower(${opp_stage_name}) in ('On-site interview','Additional interview') ;;
        label: "On-Site"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'Offer' ;;
        label: "Offer"
      }
    }
  }

  dimension: location {
    case: {
      when: {
        sql: ${post_locations} in ('Washington DC','Washington DC, Remote','New York City, NY','West Coast, US Remote','Chicago, Illinois','New York City - NY, US Remote') ;;
        label: "USA"
      }
      when: {
        sql: ${post_locations} in ('New York City, NY [Contract]','New York City - NY, US Remote [Contract]') ;;
        label: "USA Contract"
      }
      when: {
        sql: ${post_locations} in ('Europe - Remote','Zurich, Switzerland','Germany','France, Switzerland, Europe Remote','Ireland','Paris, France');;
        label: "Europe"
      }
      when: {
        sql: ${post_locations} = 'Toronto, Canada' ;;
        label: "Canada"
      }
      when: {
        sql: ${post_locations} = 'London, England' ;;
        label: "UK"
      }
      when: {
        sql: ${post_locations} = 'Sofia, Bulgaria' ;;
        label: "Bulgaria"
      }
      when: {
        sql: ${post_locations} = 'Portugal' ;;
        label: "Portugal"
      }
      when: {
        sql: ${post_locations} = 'Remote' ;;
        label: "Remote"
      }
      when: {
        sql: ${post_locations} in ('Sydney, Australia','Dubai','India') ;;
        label: "APAC"
      }
    }
  }

  dimension: intern_fl {
    case: {
      when: {
        sql: lower(${post_name}) like '%intern%';;
        label: "Intern Positions"
      }
      when: {
        sql: lower(${post_name}) not like '%intern%';;
        label: "Non-Intern Positions"
      }
    }
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

  measure: num_locations {
    type: count_distinct
    sql: ${opp_location} ;;
    drill_fields: [detail*]
  }

  measure: num_hiring_managers {
    type: count_distinct
    sql: ${application_hiring_manager_id} ;;
    drill_fields: [detail*]
  }

  set: detail_post {
    fields: [
      post_id,
      post_state,
      post_name,
      post_create_dte_date,
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
      opp_origin,
      opp_create_dte_time,
      opp_last_interaction_time,
      opp_last_advanced_at_time,
      opp_archive_reason,
      opp_stage_name,
      opp_status,
      opp_owner,
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
      #application_create_dte,
      #application_archived_dte,
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
      post_create_dte_date,
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
