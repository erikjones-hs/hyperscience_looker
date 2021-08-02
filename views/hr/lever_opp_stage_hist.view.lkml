view: lever_opp_stage_hist {
  sql_table_name: (select * from dev.hr.lever_fct_opp_stage_hist);;
  drill_fields: [detail*]

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: post_dept {
    type: string
    sql: ${TABLE}."POST_DEPT" ;;
  }

  dimension: post_team {
    type: string
    sql: ${TABLE}."POST_TEAM" ;;
  }

  dimension: from_stage {
    type: string
    sql: ${TABLE}."FROM_STAGE" ;;
  }

  dimension: to_stage {
    type: string
    sql: ${TABLE}."TO_STAGE" ;;
  }

  dimension: stage_seq {
    type: string
    sql: ${TABLE}."STAGE_SEQ" ;;
  }

  dimension_group: from_stage_updated_at {
    type: time
    sql: ${TABLE}."FROM_STAGE_UPDATED_AT" ;;
  }

  dimension_group: to_stage_updated_at {
    type: time
    sql: ${TABLE}."TO_STAGE_UPDATED_AT" ;;
  }

  dimension_group: opp_create_dte {
    type: time
    sql: ${TABLE}."OPP_CREATE_DTE" ;;
  }

  dimension_group: opp_archived_at {
    type: time
    sql: ${TABLE}."OPP_ARCHIVED_AT" ;;
  }

  dimension: opp_archive_reason {
    type: string
    sql: ${TABLE}."OPP_ARCHIVE_REASON" ;;
  }

  dimension: days_between_stages {
    type: number
    sql: ${TABLE}."DAYS_BETWEEN_STAGES" ;;
  }

  dimension: days_in_current_stage {
    type: number
    sql: ${TABLE}."DAYS_IN_CURRENT_STAGE" ;;
  }

  dimension: days_to_archive {
    type: number
    sql: ${TABLE}."DAYS_TO_ARCHIVE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_opps {
    type: count_distinct
    sql:  ${opp_id} ;;
    drill_fields: [detail*]
  }

  measure: median_days_between_stages {
    type: median
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: mean_days_between_stages {
    type: average
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: min_days_between_stages {
    type: min
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: max_days_between_stages {
    type: max
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_days_between_stages {
    type: percentile
    percentile:  25
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_days_between_stages {
    type: percentile
    percentile:  75
    sql: ${days_between_stages} ;;
    drill_fields: [detail*]
  }

  measure: median_days_to_archive {
    type: median
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: mean_days_to_archive {
    type: average
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: min_days_to_archive {
    type: min
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: max_days_to_archive {
    type: max
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_days_to_archive {
    type: percentile
    percentile:  25
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_days_to_archive {
    type: percentile
    percentile:  75
    sql: ${days_to_archive} ;;
    drill_fields: [detail*]
  }

  measure: median_days_current_stage {
    type: median
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }

  measure: mean_days_current_stage {
    type: average
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }

  measure: min_days_current_stage {
    type: min
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }

  measure: max_days_current_stage {
    type: max
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_days_current_stage {
    type: percentile
    percentile:  25
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_days_current_stage {
    type: percentile
    percentile:  75
    sql: ${days_in_current_stage} ;;
    drill_fields: [detail*]
  }



  set: detail {
    fields: [
      opp_id,
      opp_name,
      post_dept,
      post_team,
      from_stage,
      to_stage,
      stage_seq,
      from_stage_updated_at_time,
      to_stage_updated_at_time,
      opp_create_dte_time,
      opp_archived_at_time,
      opp_archive_reason,
      days_between_stages,
      days_in_current_stage,
      days_to_archive
    ]
  }
}
