view: agg_ticket {
  sql_table_name: (select * from dev.cx.zendesk_agg_ticket);;
  drill_fields: [detail*]

  dimension: ticket_id {
    type: string
    sql: ${TABLE}."TICKET_ID" ;;
    link: {
      label: "Zendesk"
      url: "http://hyperscience.zendesk.com/tickets/{{ value }}"
      icon_url: "http://zendesk.com/favicon.ico"
  }
}

  dimension: ticket_via_channel {
    type: string
    sql: ${TABLE}."TICKET_VIA_CHANNEL" ;;
  }

  dimension: ticket_source_from_address {
    type: string
    sql: ${TABLE}."TICKET_SOURCE_FROM_ADDRESS" ;;
  }

  dimension: ticket_source_to_address {
    type: string
    sql: ${TABLE}."TICKET_SOURCE_TO_ADDRESS" ;;
  }

  dimension_group: ticket_created_at {
    type: time
    sql: ${TABLE}."TICKET_CREATED_AT" ;;
  }

  dimension_group: ticket_updated_at {
    type: time
    sql: ${TABLE}."TICKET_UPDATED_AT" ;;
  }

  dimension: ticket_type {
    type: string
    sql: ${TABLE}."TICKET_TYPE" ;;
  }

  dimension: ticket_subject {
    type: string
    sql: ${TABLE}."TICKET_SUBJECT" ;;
  }

  dimension: ticket_description {
    type: string
    sql: ${TABLE}."TICKET_DESCRIPTION" ;;
  }

  dimension: ticket_default_priority {
    type: string
    sql: ${TABLE}."TICKET_DEFAULT_PRIORITY" ;;
  }

  dimension: ticket_status {
    type: string
    sql: ${TABLE}."TICKET_STATUS" ;;
  }

  dimension: ticket_recipient {
    type: string
    sql: ${TABLE}."TICKET_RECIPIENT" ;;
  }

  dimension: ticket_custom_priority_customer {
    type: string
    sql: ${TABLE}."TICKET_CUSTOM_PRIORITY_CUSTOMER" ;;
  }

  dimension: ticket_total_time_spent {
    type: number
    sql: ${TABLE}."TICKET_TOTAL_TIME_SPENT" ;;
  }

  dimension: ticket_time_spent_since_last_update {
    type: number
    sql: ${TABLE}."TICKET_TIME_SPENT_SINCE_LAST_UPDATE" ;;
  }

  dimension: ticket_custom_customer_name {
    type: string
    sql: ${TABLE}."TICKET_CUSTOM_CUSTOMER_NAME" ;;
  }

  dimension: ticket_custom_project_fl {
    type: string
    sql: ${TABLE}."TICKET_CUSTOM_PROJECT_FL" ;;
  }

  dimension: ticket_problem_source {
    type: string
    sql: ${TABLE}."TICKET_PROBLEM_SOURCE" ;;
  }

  dimension: ticket_custom_customer_type {
    type: string
    sql: ${TABLE}."TICKET_CUSTOM_CUSTOMER_TYPE" ;;
  }

  dimension: ticket_resolution_code {
    type: string
    sql: ${TABLE}."TICKET_RESOLUTION_CODE" ;;
  }

  dimension: ticket_custom_environment {
    type: string
    sql: ${TABLE}."TICKET_CUSTOM_ENVIRONMENT" ;;
  }

  dimension: ticket_jira_id {
    type: string
    sql: ${TABLE}."TICKET_JIRA_ID" ;;
    link: {
      label: "JIRA"
      url: "https://hyperscience.atlassian.net/browse/{{ value }}"
      icon_url: "http://atlassian.net/favicon.ico"
    }
  }

  dimension: ticket_problem_codes {
    type: string
    sql: ${TABLE}."TICKET_PROBLEM_CODES" ;;
  }

  dimension: ticket_severity {
    type: string
    sql: ${TABLE}."TICKET_SEVERITY" ;;
  }

  dimension: ticket_major_version {
    type: string
    sql: ${TABLE}."TICKET_MAJOR_VERSION" ;;
  }

  dimension: ticket_hotfix {
    type: string
    sql: ${TABLE}."TICKET_HOTFIX" ;;
  }

  dimension: ticket_duplicate_fl {
    type: number
    sql: ${TABLE}."TICKET_DUPLICATE_FL" ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}."ORGANIZATION_ID" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}."REQUESTER_ID" ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}."SUBMITTER_ID" ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}."ASSIGNEE_ID" ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}."GROUP_NAME" ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}."ORGANIZATION_NAME" ;;
  }

  dimension: org_csm {
    type: string
    sql: ${TABLE}."ORG_CSM" ;;
  }

  dimension: org_global_id {
    type: string
    sql: ${TABLE}."ORG_GLOBAL_ID" ;;
  }

  dimension: org_type {
    type: string
    sql: ${TABLE}."ORG_TYPE" ;;
  }

  dimension: org_customer_lifecycle {
    type: string
    sql: ${TABLE}."ORG_CUSTOMER_LIFECYCLE" ;;
  }

  dimension_group: assignee_updated_at {
    type: time
    sql: ${TABLE}."ASSIGNEE_UPDATED_AT" ;;
  }

  dimension_group: requester_updated_at {
    type: time
    sql: ${TABLE}."REQUESTER_UPDATED_AT" ;;
  }

  dimension_group: status_updated_at {
    type: time
    sql: ${TABLE}."STATUS_UPDATED_AT" ;;
  }

  dimension_group: initially_assigned_at {
    type: time
    sql: ${TABLE}."INITIALLY_ASSIGNED_AT" ;;
  }

  dimension_group: solved_at {
    type: time
    sql: ${TABLE}."SOLVED_AT" ;;
  }

  dimension_group: last_updated_at {
    type: time
    sql: ${TABLE}."LAST_UPDATED_AT" ;;
  }

  dimension_group: first_reply_time {
    type: time
    sql: ${TABLE}."FIRST_REPLY_TIME" ;;
  }

  dimension: time_to_first_reply_seconds {
    type: number
    sql: ${TABLE}."TIME_TO_FIRST_REPLY_SECONDS" ;;
  }

  dimension: group_stations {
    type: number
    sql: ${TABLE}."GROUP_STATIONS" ;;
  }

  dimension: assignee_stations {
    type: number
    sql: ${TABLE}."ASSIGNEE_STATIONS" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."ASSIGNEE_NAME" ;;
  }

  dimension: assignee_email {
    type: string
    sql: ${TABLE}."ASSIGNEE_EMAIL" ;;
  }

  dimension: requester_name {
    type: string
    sql: ${TABLE}."REQUESTER_NAME" ;;
  }

  dimension: requester_email {
    type: string
    sql: ${TABLE}."REQUESTER_EMAIL" ;;
  }

  dimension: submitter_name {
    type: string
    sql: ${TABLE}."SUBMITTER_NAME" ;;
  }

  dimension: submitter_email {
    type: string
    sql: ${TABLE}."SUBMITTER_EMAIL" ;;
  }

  measure: num_tickets {
    type: count_distinct
    sql:  $(ticket_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      ticket_id,
      ticket_via_channel,
      ticket_source_from_address,
      ticket_source_to_address,
      ticket_created_at_time,
      ticket_updated_at_time,
      ticket_type,
      ticket_subject,
      ticket_description,
      ticket_default_priority,
      ticket_status,
      ticket_recipient,
      ticket_custom_priority_customer,
      ticket_total_time_spent,
      ticket_time_spent_since_last_update,
      ticket_custom_customer_name,
      ticket_custom_project_fl,
      ticket_problem_source,
      ticket_custom_customer_type,
      ticket_resolution_code,
      ticket_custom_environment,
      ticket_jira_id,
      ticket_problem_codes,
      ticket_severity,
      ticket_major_version,
      ticket_hotfix,
      ticket_duplicate_fl,
      organization_id,
      group_id,
      requester_id,
      submitter_id,
      assignee_id,
      group_name,
      organization_name,
      org_csm,
      org_global_id,
      org_type,
      org_customer_lifecycle,
      assignee_updated_at_time,
      requester_updated_at_time,
      status_updated_at_time,
      initially_assigned_at_time,
      solved_at_time,
      last_updated_at_time,
      first_reply_time_time,
      time_to_first_reply_seconds,
      group_stations,
      assignee_stations,
      assignee_name,
      assignee_email,
      requester_name,
      requester_email,
      submitter_name,
      submitter_email
    ]
  }
}
