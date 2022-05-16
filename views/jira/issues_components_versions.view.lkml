view: issues_components_versions {
  sql_table_name: (select * from prod.jira.fct_jira_issues_components_versions);;
  drill_fields: [detail*]

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

  dimension_group: resolution_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RESOLUTION_DTE" ;;
  }

  dimension_group: created_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."CREATED_DTE" ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Week"
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

  dimension: version_is_active {
    type: yesno
    sql: ${TABLE}."VERSION_IS_ACTIVE" ;;
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

  measure: num_tickets {
    type: count_distinct
    sql: ${issue_id} ;;
    label: "# Tickets"
  }

  set: detail {
    fields: [
      issue_key,
      priority,
      priority_name,
      assignee_name,
      status,
      status_category_name,
      creator_name,
      project_key,
      project_name,
      resolution_stage,
      resolution_dte_date,
      created_dte_date,
      component,
      component_is_active,
      version_name,
      version_is_active,
      feedback_category,
      customer_name
    ]
  }
}
