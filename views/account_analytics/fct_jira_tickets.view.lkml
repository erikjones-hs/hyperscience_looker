view: fct_jira_tickets {
  sql_table_name: PROD.MARTS_ACCOUNT_ANALYTICS.FCT_JIRA_TICKETS ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  measure: total_p1_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P1_TICKETS ;;
    label: "Total P1 Tickets"
  }
  measure: open_p1_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P1_TICKETS ;;
    label: "Open P1 Tickets"
  }
  measure: total_p2_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P2_TICKETS ;;
    label: "Total P2 Tickets"
  }
  measure: open_p2_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P2_TICKETS ;;
    label: "Open P2 Tickets"
  }
  measure: total_p3_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P3_TICKETS ;;
    label: "Total P3 Tickets"
  }
  measure: open_p3_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P3_TICKETS ;;
    label: "Open P3 Tickets"
  }

  measure: total_open_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_OPEN_TICKETS ;;
    label: "Total Open Tickets"
  }

  measure: total_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_TICKETS ;;
    label: "Total Tickets"
  }

}
