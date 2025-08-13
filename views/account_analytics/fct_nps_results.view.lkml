view: fct_nps_results {
  sql_table_name: PROD.MARTS_ACCOUNT_ANALYTICS.FCT_NPS_RESULTS ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    hidden: yes
  }

  dimension: nps_name {
    type: string
    sql: ${TABLE}.NPS_NAME ;;
    label: "NPS Survey Name"
  }

  dimension: cohort_group {
    type: string
    sql: ${TABLE}.COHORT_GROUP ;;
    label: "Cohort Group"
  }

  dimension: nps_score {
    type: number
    sql: ${TABLE}.NPS_SCORE ;;
    label: "NPS Score"
  }

  measure: count {
    type: count
    label: "Number of NPS Responses"
  }
}
