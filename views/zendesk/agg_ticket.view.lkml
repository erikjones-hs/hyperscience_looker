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
    timeframes: [time, date, week, month, quarter]
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
      icon_url: "https://wac-cdn.atlassian.com/assets/img/favicons/atlassian/favicon.png"
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

  dimension: ticket_activity {
    type: string
    sql: ${TABLE}."TICKET_ACTIVITY" ;;
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

  dimension: time_to_first_reply_minutes {
    type: number
    sql: ${TABLE}."TIME_TO_FIRST_REPLY_MINUTES" ;;
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

  dimension: upgrade_fl {
    type: yesno
    sql: contains (lower(${agg_ticket.ticket_problem_codes}),'upgrades')
         OR
         contains (lower(${agg_ticket.ticket_subject}), 'upgrade')
         OR
         contains (lower(${agg_ticket.ticket_activity}), 'upgrade')
        ;;
  }

  dimension: install_fl {
    type: yesno
    sql: contains (lower(${agg_ticket.ticket_problem_codes}),'install')
         OR
         contains (lower(${agg_ticket.ticket_subject}), 'installation')
         OR
         contains (lower(${agg_ticket.ticket_activity}), 'installation')
        ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: is_tse_fl {
    type: number
    sql: ${TABLE}."IS_TSE_FL" ;;
  }

  dimension: is_level_2_fl {
    type: number
    sql: ${TABLE}."IS_LEVEL_2_SUPPORT_FL" ;;
  }

  dimension: is_gainsight_fl {
    type: number
    sql: ${TABLE}."IS_GAINSIGHT_FL" ;;
  }

  dimension: is_csm_fl {
    type: number
    sql: ${TABLE}."IS_CSM_FL" ;;
  }

  dimension: is_implementation_fl {
    type: number
    sql: ${TABLE}."IS_IMPLEMENTATION_FL" ;;
  }

  dimension: is_support_fl {
    type: number
    sql: ${TABLE}."IS_SUPPORT_FL" ;;
  }

  dimension: is_p1_fl {
    type: number
    sql: ${TABLE}."IS_P1_FL" ;;
  }

  dimension: is_p2_fl {
    type: number
    sql: ${TABLE}."IS_P2_FL" ;;
  }

  dimension: is_p3_fl {
    type: number
    sql: ${TABLE}."IS_P3_FL" ;;
  }

  dimension: is_closed_fl {
    type: yesno
    sql: ${agg_ticket.ticket_status} = 'closed');;
  }

  dimension: is_solved_fl {
    type: yesno
    sql: ${agg_ticket.ticket_status} = 'solved');;
  }

  dimension: is_open_fl {
    type: yesno
    sql: ${agg_ticket.ticket_status} = 'open');;
  }

  dimension: is_hold_fl {
    type: yesno
    sql: ${agg_ticket.ticket_status} = 'hold');;
  }

  dimension: is_pending_fl {
    type: yesno
    sql: ${agg_ticket.ticket_status} = 'pending');;
  }

  measure: num_tse_tickets  {
    type: number
    sql:  SUM(${is_tse_fl}) ;;
  }

  measure: num_level_2_tickets  {
    type: number
    sql:  SUM(${is_level_2_fl}) ;;
  }

  measure: num_gainsight_tickets  {
    type: number
    sql:  SUM(${is_gainsight_fl}) ;;
  }

  measure: num_csm_tickets  {
    type: number
    sql:  SUM(${is_csm_fl}) ;;
  }

  measure: num_implementation_tickets  {
    type: number
    sql:  SUM(${is_implementation_fl}) ;;
  }

  measure: num_support_tickets  {
    type: number
    sql:  SUM(${is_support_fl}) ;;
  }

  measure: num_p1_tickets  {
    type: number
    sql:  SUM(${is_p1_fl}) ;;
  }

  measure: num_p2_tickets  {
    type: number
    sql:  SUM(${is_p2_fl}) ;;
  }

  measure: num_p3_tickets  {
    type: number
    sql:  SUM(${is_p3_fl}) ;;
  }

  measure: num_tickets {
    type: count_distinct
    sql:  ${ticket_id} ;;
    drill_fields: [detail*]
  }

  measure: tse_solve_rate {
    type: number
    sql:  100.00 * ${num_tse_tickets} / NULLIFZERO(${num_tickets}) ;;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  measure: mean_time_to_first_reply {
    type: average_distinct
    sql_distinct_key: ${ticket_created_at_date} ;;
    sql: ${time_to_first_reply_minutes} ;;
  }

  measure: median_time_to_first_reply {
    type: median
    sql: ${time_to_first_reply_minutes} ;;
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
      time_to_first_reply_minutes,
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
