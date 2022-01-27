  view: marketing_mqls {
    sql_table_name: (select * from dev.erikjones.monthly_kpis_marketing_mqls);;
    drill_fields: [detail*]

  dimension_group: mql_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."MQL_DTE" ;;
  }

  dimension: person_id {
    type: string
    sql: ${TABLE}."PERSON_ID" ;;
    }

  dimension: lead_source {
    type: string
    sql: ${TABLE}."LEAD_SOURCE" ;;
    }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_leads {
    type: count_distinct
    sql:${person_id} ;;
    drill_fields: [detail*]
  }

    dimension_group: current_date {
      type: time
      timeframes: [date, month, quarter, year]
      sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
    }

  set: detail {
    fields: [mql_dte_date, person_id, lead_source, email]
  }
}
