view: dim_account_health {
  sql_table_name: PROD.ACCOUNT_ANALYTICS.DIM_ACCOUNT_HEALTH ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  measure: csm_account_score {
    type: string
    sql: ${TABLE}.CSM_ACCOUNT_SCORE ;;
    label: "CSM Account Score"
  }

  measure: cx_engagement_level {
    type: string
    sql: ${TABLE}.CX_ENGAGEMENT_LEVEL ;;
    label: "CX Engagement Level"
  }

  measure: technical_health {
    type: string
    sql: ${TABLE}.TECHNICAL_HEALTH ;;
    label: "Technical Health"
  }

  measure: business_alignment {
    type: string
    sql: ${TABLE}.BUSINESS_ALIGNMENT ;;
    label: "Business Alignment"
  }

  measure: complexity_rank {
    type: string
    sql: ${TABLE}.COMPLEXITY_RANK ;;
    label: "Complexity Rank"
  }

  measure: latest_nps_score {
    type: string
    sql: ${TABLE}.LATEST_NPS_SCORE ;;
    label: "Latest NPS Score"
  }
}
