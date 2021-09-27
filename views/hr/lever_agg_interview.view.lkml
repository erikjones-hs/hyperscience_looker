view: lever_agg_interview {

      sql_table_name: (select * from dev.hr.lever_agg_interview);;
      drill_fields: [detail*]

    dimension: interview_id {
      type: string
      sql: ${TABLE}."INTERVIEW_ID" ;;
    }

    dimension: interviewer_id {
      type: string
      sql: ${TABLE}."INTERVIEWER_ID" ;;
    }

    dimension: interviewer_name {
      type: string
      sql: ${TABLE}."INTERVIEWER_NAME" ;;
    }

    dimension: interviewer_email {
      type: string
      sql: ${TABLE}."INTERVIEWER_EMAIL" ;;
    }

    dimension: interview_candidate_id {
      type: string
      sql: ${TABLE}."INTERVIEW_CANDIDATE_ID" ;;
    }

  dimension: interview_panel_id {
    type: string
    sql: ${TABLE}."INTERVIEW_PANEL_ID" ;;
  }

    dimension: interview_subject {
      type: string
      sql: ${TABLE}."INTERVIEW_SUBJECT" ;;
    }

    dimension: interview_duration {
      type: number
      sql: ${TABLE}."INTERVIEW_DURATION" ;;
    }

    dimension: interview_stage_name {
      type: string
      sql: ${TABLE}."INTERVIEW_STAGE_NAME" ;;
    }

    dimension_group: interview_create_dte {
      type: time
      timeframes: [date, week, month, quarter]
      sql: ${TABLE}."INTERVIEW_CREATE_DTE" ;;
    }

    dimension_group: interview_dte {
      type: time
      timeframes: [date, week, month, quarter]
      sql: ${TABLE}."INTERVIEW_DTE" ;;
    }

    dimension_group: interview_canceled_dte {
      type: time
      timeframes: [date, week, month, quarter]
      sql: ${TABLE}."INTERVIEW_CANCELED_DTE" ;;
    }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_candidates {
    type: count_distinct
    sql: ${interview_candidate_id} ;;
    drill_fields: [detail*]
  }

  measure: num_panels {
    type: count_distinct
    sql: ${interview_panel_id} ;;
    drill_fields: [detail*]
  }

  measure: num_interviews {
    type: count_distinct
    sql: ${interview_id} ;;
    drill_fields: [detail*]
  }

    set: detail {
      fields: [
        interview_id,
        interviewer_id,
        interviewer_name,
        interviewer_email,
        interview_candidate_id,
        interview_subject,
        interview_duration,
        interview_stage_name,
      ]
    }
  }
