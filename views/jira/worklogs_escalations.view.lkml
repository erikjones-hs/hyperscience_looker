view: worklogs_escalations {
  sql_table_name: (select * from dev.erikjones.jira_worklogs);;
  drill_fields: [detail*]

  dimension: issue_id {
    type: number
    sql: ${TABLE}."ISSUE_ID" ;;
  }

  dimension_group: started_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."STARTED_DTE" ;;
  }

  dimension_group: updated_dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."UPDATED_DTE" ;;
  }

  dimension: time_spent_seconds {
    type: number
    sql: ${TABLE}."TIME_SPENT_SECONDS" ;;
  }

  dimension: author_id {
    type: string
    sql: ${TABLE}."AUTHOR_ID" ;;
  }

  dimension: author_name {
    type: string
    sql: ${TABLE}."AUTHOR_NAME" ;;
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

  dimension: resolution_stage {
    type: string
    sql: ${TABLE}."RESOLUTION_STAGE" ;;
  }

  dimension: priority_name {
    type: string
    sql: ${TABLE}."PRIORITY_NAME" ;;
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

  dimension: project_key {
    type: string
    sql: ${TABLE}."PROJECT_KEY" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."PROJECT_NAME" ;;
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

  measure: total_time_spent {
    type: sum_distinct
    sql_distinct_key: ${issue_id} ;;
    sql: ${time_spent_seconds} / 60 ;;
    label: "Total Time Spent (Minutes)"
  }

  set: detail {
    fields: [
      issue_id,
      started_dte_date,
      updated_dte_date,
      time_spent_seconds,
      author_id,
      author_name,
      issue_key,
      resolution_stage,
      priority_name,
      assignee_name,
      status,
      status_category_name,
      creator_name,
      issue_type_name,
      project_key,
      project_name,
      resolution_dte_date,
      created_dte_date
    ]
  }
}
