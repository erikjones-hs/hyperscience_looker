  view: marketing_mqls {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_marketing_mqls);;
    drill_fields: [detail*]

  dimension_group: mql_dte {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}."MQL_DTE" ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}."LEAD_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_leads {
    type: count_distinct
    sql:${lead_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [mql_dte_date, lead_id]
  }
}
