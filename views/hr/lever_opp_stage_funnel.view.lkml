view: lever_opp_stage_funnel {
    sql_table_name: (select * from dev.hr.lever_fct_opp_stage_funnel);;
    drill_fields: [detail*]

  dimension: opportunity_id {
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

  dimension: interaction_num {
    type: number
    sql: ${TABLE}."INTERACTION_NUM" ;;
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

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: screen_fl {
    type: number
    sql: ${TABLE}."SCREEN_FL" ;;
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

  dimension: days_between_stages {
    type: number
    sql: ${TABLE}."DAYS_BETWEEN_STAGES" ;;
  }

  dimension: days_in_current_stage {
    type: number
    sql: ${TABLE}."DAYS_IN_CURRENT_STAGE" ;;
  }

  dimension: days_to_offer {
    type: number
    sql: ${TABLE}."DAYS_TO_OFFER" ;;
  }

  dimension: days_to_archive {
    type: number
    sql: ${TABLE}."DAYS_TO_ARCHIVE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql:  ${opportunity_id} ;;
    drill_fields: [detail*]
  }

  measure: num_screens {
    type: sum_distinct
    sql_distinct_key: ${opportunity_id};;
    sql:  ${screen_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_interviews {
    type: sum_distinct
    sql_distinct_key: ${opportunity_id};;
    sql:  ${interview_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_offers {
    type: sum_distinct
    sql_distinct_key: ${opportunity_id};;
    sql:  ${offer_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_hires {
    type: sum_distinct
    sql_distinct_key: ${opportunity_id};;
    sql:  ${hire_fl} ;;
    drill_fields: [detail*]
  }

  measure: screen_rate {
    type: number
    sql:  100.00 * ${num_screens} / NULLIFZERO(${num_opps}) ;;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  measure: interview_rate {
    type: number
    sql:  100.00 * ${num_interviews} / NULLIFZERO(${num_opps}) ;;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  measure: offer_rate {
    type: number
    sql:  100.00 * ${num_offers} / NULLIFZERO(${num_opps}) ;;
    value_format: "#0.00\%"
    drill_fields: [detail*]
  }

  measure: hire_rate {
    type: number
    sql:  100.00 * ${num_hires} / NULLIFZERO(${num_opps}) ;;
    value_format: "#0.00\%"
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

  measure: median_days_to_offer {
    type: median
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  measure: mean_days_to_offer {
    type: average
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  measure: min_days_to_offer {
    type: min
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  measure: max_days_to_offer {
    type: max
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  measure: percentile_25_days_to_offer {
    type: percentile
    percentile:  25
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  measure: percentile_75_days_to_offer {
    type: percentile
    percentile:  75
    sql: ${days_to_offer} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      opportunity_id,
      opp_name,
      post_dept,
      post_team,
      from_stage,
      to_stage,
      stage_seq,
      from_stage_updated_at_time,
      to_stage_updated_at_time,
      interaction_num,
      opp_create_dte_time,
      opp_archived_at_time,
      opp_archive_reason,
      origin,
      screen_fl,
      interview_fl,
      offer_fl,
      hire_fl,
      days_between_stages,
      days_in_current_stage,
      days_to_offer,
      days_to_archive
    ]
  }
}
