view: fct_nps_results {
  sql_table_name: PROD.ACCOUNT_ANALYTICS.FCT_NPS_RESULTS ;;

  dimension: nps_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.NPS_ID ;;
    label: "NPS ID"
  }

  dimension: nps_name {
    type: string
    sql: ${TABLE}.NPS_NAME ;;
    label: "NPS Survey Name"
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    hidden: yes
  }

  dimension: nps_group {
    type: string
    sql: ${TABLE}.NPS_GROUP ;;
    label: "NPS Group (Promoter/Passive/Detractor)"
  }

  dimension: nps_score {
    type: number
    sql: ${TABLE}.NPS_SCORE ;;
    label: "NPS Score"
  }

  dimension: nps_contact_id {
    type: string
    sql: ${TABLE}.NPS_CONTACT_ID ;;
    label: "NPS Contact ID"
  }

  dimension: cohort_group {
    type: string
    sql: ${TABLE}.COHORT_GROUP ;;
    label: "Cohort Group"
  }

  dimension: cohort_year {
    type: string
    sql: SPLIT_PART(${cohort_group}, '-', 1) ;;
    label: "Cohort Year"
  }

  dimension: cohort_quarter {
    type: string
    sql: SPLIT_PART(${cohort_group}, '-', 2) ;;
    label: "Cohort Quarter"
  }

  measure: count {
    type: count
    label: "Number of NPS Responses"
  }
}
