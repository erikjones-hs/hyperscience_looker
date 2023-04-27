  view: marketing_mqls {
    sql_table_name: (select * from prod.monthly_kpis.marketing_mqls);;
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

  dimension: lead_type {
    type: string
    sql: ${TABLE}."LEAD_TYPE" ;;
  }

  dimension: secondary_lead_source {
    type: string
    sql: ${TABLE}."SECONDARY_LEAD_SOURCE" ;;
  }

  dimension: first_lead_source_detail {
    type: string
    sql: ${TABLE}."SOURCE_FIRST_LEAD_SOURCE_DETAIL" ;;
  }

  dimension: last_lead_source {
    type: string
    sql: ${TABLE}."LAST_LEAD_SOURCE" ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}."EMAIL_DOMAIN" ;;
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
    fields: [mql_dte_date, person_id, lead_source, first_lead_source_detail, email]
  }
}
