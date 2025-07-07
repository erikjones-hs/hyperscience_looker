view: fct_nps_results {
  sql_table_name: PROD.PRODUCT_REPORTING.FCT_NPS_RESULTS ;;

  dimension: nps_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.NPS_ID ;;
    label: "NPS ID"
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    hidden: yes
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

  dimension: nps_name {
    type: string
    sql: ${TABLE}.NPS_NAME ;;
    label: "NPS Survey Name"
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

  measure: average_nps_score {
    type: average
    sql: ${nps_score} ;;
    value_format: "0.0"
    label: "Average NPS Score"
  }

  measure: count {
    type: count
    label: "Number of NPS Responses"
  }
}
