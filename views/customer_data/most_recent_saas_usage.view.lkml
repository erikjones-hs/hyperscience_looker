view: most_recent_saas_usage {
  sql_table_name: (select * from dev.erikjones.most_recent_saas_usage);;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: most_recent_day_sent {
    type: date
    sql: ${TABLE}."MOST_RECENT_DAY_SENT" ;;
  }

}
