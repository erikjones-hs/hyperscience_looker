view: lever_agg_interview {

      sql_table_name: (select * from dev.hr.lever_agg_interview);;
      drill_fields: [detail*]

    dimension: interview_id {
      type: string
      sql: ${TABLE}."INTERVIEW_ID" ;;
      link: {
        label: "Lever"
        url: "https://hire.lever.co/reports/interviews/overview/{{ value }}"
        icon_url: "https://lever.co/favicon.ico"
      }
    }

    dimension: interviewer_id {
      type: string
      sql: ${TABLE}."INTERVIEWER_ID" ;;
      link: {
        label: "Lever"
        url: "https://hire.lever.co/reports/interviews/events/overview?byInterviewer%5Bids%5D%5B%5D={{ value }}"
        icon_url: "https://lever.co/favicon.ico"
      }
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
      link: {
        label: "Lever"
        url: "https://hire.lever.co/candidates/{{ value }}"
        icon_url: "https://lever.co/favicon.ico"
      }
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

  dimension: interview_stage_category {
    case: {
      when: {
        sql: lower(${interview_stage_name}) in ('new applicant','new lead') ;;
        label: "Unprocessed Applicants"
      }
      when: {
        sql: lower(${interview_stage_name}) in ('intro call','reached out','responded','sell action') ;;
        label: "Pre-Interview"
      }
      when: {
        sql: lower(${interview_stage_name}) = 'recruiter screen' ;;
        label: "Recruiter Screen"
      }
      when: {
        sql: lower(${interview_stage_name}) in ('skills test','phone screen');;
        label: "Technical Screen"
      }
      when: {
        sql: lower(${interview_stage_name}) in ('on-site interview','additional interview') ;;
        label: "On-Site"
      }
      when: {
        sql: lower(${interview_stage_name}) = 'offer' ;;
        label: "Offer"
      }
    }
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
        interview_dte_date,
        interview_canceled_dte_date
      ]
    }
  }
