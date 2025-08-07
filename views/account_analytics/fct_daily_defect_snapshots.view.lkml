view: fct_daily_defect_snapshots {
  sql_table_name: PROD.ACCOUNT_ANALYTICS.FCT_DAILY_DEFECT_SNAPSHOTS ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  dimension_group: snapdate {
    description: "The date the snapshot of the data was taken"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.snapdate ;;
    label: "Snap Date"
  }

  measure: open_p1_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P1_TICKETS ;;
    label: "Open P1 Tickets"
  }

  measure: total_p1_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P1_TICKETS ;;
    label: "Total P1 Tickets"
  }

  measure: open_p2_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P2_TICKETS ;;
    label: "Open P2 Tickets"
  }

  measure: total_p2_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P2_TICKETS ;;
    label: "Total P2 Tickets"
  }

  measure: open_p3_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P3_TICKETS ;;
    label: "Open P3 Tickets"
  }

  measure: total_p3_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P3_TICKETS ;;
    label: "Total P3 Tickets"
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
