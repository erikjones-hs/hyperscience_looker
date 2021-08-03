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

  measure: num_opps {
    type: count_distinct
    sql:  ${opportunity_id} ;;
    drill_fields: [detail*]
  }

  measure: num_screens {
    type: sum
    sql:  ${screen_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_interviews {
    type: sum
    sql:  ${interview_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_offers {
    type: sum
    sql:  ${offer_fl} ;;
    drill_fields: [detail*]
  }

  measure: num_hires {
    type: sum
    sql:  ${hire_fl} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      opportunity_id,
      opp_name,
      post_dept,
      post_team,
      opp_create_dte_time,
      opp_archived_at_time,
      opp_archive_reason,
      origin,
      screen_fl,
      interview_fl,
      offer_fl,
      hire_fl
    ]
  }
}
