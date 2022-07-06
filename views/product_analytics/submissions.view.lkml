view: submissions {
  sql_table_name: (select * from dev.erikjones.prana_fct_submissions);;


  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}."SESSION_ID" ;;
  }

  dimension_group: time {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: customer_environment {
    type: string
    sql: ${TABLE}."CUSTOMER_ENVIRONMENT" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: environment_type {
    type: string
    sql: ${TABLE}."ENVIRONMENT_TYPE" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: product_event {
    type: string
    sql: ${TABLE}."PRODUCT_EVENT" ;;
  }

  measure: num_events {
    type: count_distinct
    sql_distinct_key: ${event_id} ;;
    sql: ${event_id} ;;
    label: "# Events"
  }

  set: detail {
    fields: [
      user_id,
      event_id,
      session_id,
      time_date,
      domain,
      customer_environment,
      customer,
      environment_type,
      title,
      product_event
    ]
  }
}
