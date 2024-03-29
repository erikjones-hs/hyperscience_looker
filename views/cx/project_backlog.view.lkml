view: project_backlog {
  sql_table_name: (select * from DEV.CX.PROJECT_BACKLOG);;
  drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension: month {
    type: date
    sql: date_trunc('month',${TABLE}."MONTH") ;;
  }

  dimension: fy_qtr_year {
    type: string
    sql: ${TABLE}."FY_QTR_YEAR" ;;
  }

  dimension: fy_qtr_start_dte {
    type: date
    sql: ${TABLE}."FY_QTR_START_DTE" ;;
  }

  dimension: fy_qtr_end_dte {
    type: date
    sql: ${TABLE}."FY_QTR_END_DTE" ;;
  }

  dimension: project_in_backlog {
    type: number
    sql: ${TABLE}."PROJECT_IN_BACKLOG" ;;
  }

  dimension: arr_in_backlog {
    type: number
    sql: ${TABLE}."ARR_IN_BACKLOG" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: project_manager_name {
    type: string
    sql: ${TABLE}."PROJECT_MANAGER_NAME" ;;
  }

  dimension: implementation_manager_name {
    type: string
    sql: ${TABLE}."IMPLEMENTATION_MANAGER_NAME" ;;
  }

  dimension: company_id_name {
    type: string
    sql: ${TABLE}."COMPANY_ID_NAME" ;;
  }

  dimension_group: go_live_date {
    type: time
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension_group: go_live_goal {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."GO_LIVE_GOAL" ;;
  }

  dimension: project_end_date {
    type: date
    sql: ${TABLE}."PROJECT_END_DATE" ;;
  }

  dimension: project_inactive_date {
    type: date
    sql: ${TABLE}."PROJECT_INACTIVE_DATE" ;;
  }


  dimension_group: ttv_days {
    type: duration
    intervals: [day, week, month]
    sql_start: ${TABLE}."KPI_START_DATE" ;;
    sql_end: ${TABLE}."GO_LIVE_GOAL";;
    drill_fields: [detail*]
  }

  dimension: ttv_tier {
    type: tier
    tiers: [0, 30, 60, 90, 120, 150, 180]
    style: relational
    sql: ${days_ttv_days} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  dimension_group: kpi_start_date {
    type: time
    sql: ${TABLE}."KPI_START_DATE" ;;
  }

  measure: total_projects_in_backlog {
    type: sum
    sql: ${project_in_backlog} ;;
  }

  measure: total_arr_in_backlog {
    type: sum
    sql: ${arr_in_backlog} ;;
  }

  set: detail {
    fields: [
      company_id_name,
      name,
      project_manager_name,
      implementation_manager_name,
      project_inactive_date,
      go_live_date_time,
      kpi_start_date_time,
      project_in_backlog,
      arr_in_backlog,
      fy_year,
      month,
      fy_qtr_year,
      fy_qtr_start_dte,
      fy_qtr_end_dte
    ]
  }
}
