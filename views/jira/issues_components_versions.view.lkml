view: issues_components_versions {
  sql_table_name: (select * from prod.jira.fct_jira_history);;
  drill_fields: [detail*]

  dimension_group: dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}."ISSUE_ID" ;;
  }

  dimension: issue_key {
    type: string
    sql: ${TABLE}."ISSUE_KEY" ;;
    link: {
      label: "JIRA"
      url: "https://hyperscience.atlassian.net/browse/{{ value }}"
      icon_url: "https://wac-cdn.atlassian.com/assets/img/favicons/atlassian/favicon.png"
    }
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}."EPIC_NAME" ;;
  }

  dimension: resolution_stage {
    type: string
    sql: ${TABLE}."RESOLUTION_STAGE" ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}."PRIORITY" ;;
    order_by_field: priority_ordering
  }

  dimension: priority_name {
    type: string
    sql: ${TABLE}."PRIORITY_NAME" ;;
    order_by_field: priority_ordering
  }

  dimension: assignee_id {
    type: string
    sql: ${TABLE}."ASSIGNEE_ID" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."ASSIGNEE_NAME" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_category_name {
    type: string
    sql: ${TABLE}."STATUS_CATEGORY_NAME" ;;
  }

  dimension: creator_name {
    type: string
    sql: ${TABLE}."CREATOR_NAME" ;;
  }

  dimension: issue_type_name {
    type: string
    sql: ${TABLE}."ISSUE_TYPE_NAME" ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: project_key {
    type: string
    sql: ${TABLE}."PROJECT_KEY" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."PROJECT_NAME" ;;
  }

  dimension: project_category {
    type: string
    sql: ${TABLE}."PROJECT_CATEGORY" ;;
  }

  dimension_group: resolution_dte_raw {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RESOLUTION_DTE_RAW" ;;
  }

  dimension_group: resolution_dte_transformed {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RESOLUTION_DTE_TRANSFORMED" ;;
  }

  dimension: open_ticket_fl {
    type: number
    sql: ${TABLE}."OPEN_TICKET_FL" ;;
  }

  dimension: closed_ticket_fl {
    type: number
    sql: ${TABLE}."CLOSED_TICKET_FL" ;;
  }

  dimension: ticket_resolution_category {
    type: string
    sql: ${TABLE}."TICKET_RESOLUTION_CATEGORY" ;;
  }

  dimension: created_dte_fl {
    type: number
    sql: ${TABLE}."CREATED_DTE_FL" ;;
  }

  dimension: resolved_dte_fl {
    type: number
    sql: ${TABLE}."RESOLVED_DTE_FL" ;;
  }

  dimension: created_week_fl {
    type: number
    sql: ${TABLE}."CREATED_WEEK_FL" ;;
  }

  dimension: resolved_week_fl {
    type: number
    sql: ${TABLE}."RESOLVED_WEEK_FL" ;;
  }

  dimension: created_month_fl {
    type: number
    sql: ${TABLE}."CREATED_MONTH_FL" ;;
  }

  dimension: resolved_month_fl {
    type: number
    sql: ${TABLE}."RESOLVED_MONTH_FL" ;;
  }

  dimension_group: created_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CREATED_DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Month"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN ${created_dte_date}
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${created_dte_week}
    WHEN{% parameter timeframe_picker %} = 'Month' THEN ${created_dte_month}
    END ;;
  }

  dimension: dynamic_timeframe_resolution {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN ${resolution_dte_raw_date}
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${resolution_dte_raw_week}
    WHEN{% parameter timeframe_picker %} = 'Month' THEN ${resolution_dte_raw_month}
    END ;;
  }

  dimension: priority_ordering {
    type: number
    sql:
      CASE
        WHEN ${priority_name} = 'Lowest' THEN 1
        WHEN ${priority_name} = 'Low' THEN 2
        WHEN ${priority_name} = 'Medium' THEN 3
        WHEN ${priority_name} = 'High' THEN 4
        WHEN ${priority_name} = 'Highest' THEN 5
        ELSE 6
      END ;;
    hidden: yes
    description: "This dimension is used to force sort the priority dimension."
  }

  dimension: component {
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }

  dimension: component_is_active {
    type: yesno
    sql: ${TABLE}."COMPONENT_IS_ACTIVE" ;;
  }

  dimension: version_name {
    type: string
    sql: ${TABLE}."VERSION_NAME" ;;
  }

  dimension: fix_version_name {
    type: string
    sql: ${TABLE}."FIX_VERSION_NAME" ;;
  }

  dimension: feedback_category {
    type: string
    sql: ${TABLE}."FEEDBACK_CATEGORY" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: version_category {
    type: string
    sql: split_part(${version_name},'.',1) ;;
  }

  dimension: fix_version_category {
    type: string
    sql: split_part(${fix_version_name},'.',1) ;;
  }

  dimension_group: time_to_resolution {
    type: duration
    intervals: [day, hour, minute]
    sql_start: ${created_dte_raw} ;;
    sql_end: ${resolution_dte_raw_raw} ;;
  }

  dimension_group: time_open {
    type: duration
    sql_start: ${created_dte_date} ;;
    sql_end: ${current_date_date} ;;
    intervals: [day]
  }

  measure: num_tickets {
    type: count_distinct
    sql: ${issue_id} ;;
    label: "# Tickets"
  }

  measure: num_created_tickets_weeks {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [created_week_fl: "= 1"]
    label: "# Created Tickets (weeks)"
  }

  measure: num_closed_tickets_weeks {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [resolved_week_fl: "= 1"]
    label: "# Closed Tickets (weeks)"
  }

  measure: num_created_tickets_months {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [created_month_fl: "= 1"]
    label: "# Created Tickets (months)"
  }

  measure: num_closed_tickets_months {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [resolved_month_fl: "= 1"]
    label: "# Closed Tickets (months)"
  }

  measure: num_open_tickets_months {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [ticket_resolution_category: "= open"]
    label: "# Open Tickets (months)"
  }

  measure: num_open_tickets_weeks {
    type: count_distinct
    sql: ${issue_id} ;;
    filters: [ticket_resolution_category: "= open"]
    label: "# Open Tickets (weeks)"
  }

  measure: mean_time_to_resolution {
    type: average
    sql: ${hours_time_to_resolution};;
    label: "Mean Time to Resolution (Hours)"
  }

  measure: time_to_resolution_hours {
    type: sum
    sql: ${hours_time_to_resolution};;
    label: "Time to Resolution (Hours)"
  }

  measure: documentation_published{
    type: count_distinct
    sql: ${issue_id};;
    filters: [issue_type_name: "Documentation task", status: "published, Done"]
    label: "Documentation Tasks (Published)"
  }


  dimension: fix_version_filter {
    type: string
    sql: CASE WHEN (split_part(${fix_version_name},'.',1) rlike '[0-9][0-9]' AND split_part(${fix_version_name},'.',1) >=32) then fix_version_name else 'Older Version' end ;;
  }


  set: detail {
    fields: [
      issue_key,
      priority_name,
      assignee_name,
      status,
      creator_name,
      project_key,
      resolution_stage,
      resolution_dte_raw_date,
      created_dte_date,
    ]
  }
}
