  view: clicks_tasks {
    sql_table_name: (select * from dev.erikjones.product_analytics_tasks);;

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

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: product_event {
    type: string
    sql: ${TABLE}."PRODUCT_EVENT" ;;
  }

  dimension: transcription_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_transcription' then 1 else 0 end ;;
  }

  dimension: flex_extract_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_flexible_extraction' then 1 else 0 end ;;
  }

  dimension: document_classification_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_document_classification' then 1 else 0 end ;;
  }

  dimension: identification_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_identification' then 1 else 0 end ;;
  }

  dimension: qa_document_classification_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_qa_document_classification' then 1 else 0 end ;;
  }

  dimension: qa_transcription_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_qa_transcription' then 1 else 0 end ;;
  }

  dimension: qa_identification_fl {
    type: number
    sql: CASE WHEN ${product_event} = 'perform_tasks_qa_identification' then 1 else 0 end ;;
  }

  measure: num_transcription_events {
    type: sum
    sql: ${transcription_fl} ;;
    label: "# Transctiption Events"
  }

  measure: num_flex_extract_events {
    type: sum
    sql: ${flex_extract_fl};;
    label: "# Flexible Extraction Events"
  }

  measure: num_document_classification_events {
    type: sum
    sql: ${document_classification_fl};;
    label: "# Document Classification Events"
  }

  measure: num_identification_events {
    type: sum
    sql: ${identification_fl};;
    label: "# Identification Events"
  }

  measure: num_qa_document_classification_events {
    type: sum
    sql: ${qa_document_classification_fl};;
    label: "# QA Document Classification Events"
  }

  measure: num_qa_transcription_events {
    type: sum
    sql: ${qa_transcription_fl} ;;
    label: "# QA Transctiption Events"
  }

  measure: num_qa_identification_events {
    type: sum
    sql: ${qa_identification_fl} ;;
    label: "# QA Identification Events"
  }

  measure: num_qa_identification_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [qa_identification_fl: "= 1"]
    label: "# QA Identification Users"
  }

  measure: num_qa_transcription_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [qa_transcription_fl: "= 1"]
    label: "# QA Transcription Users"
  }

  measure: num_qa_doc_class_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [qa_document_classification_fl: "= 1"]
    label: "# QA Document Classification Users"
  }

  measure: num_doc_class_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [document_classification_fl: "= 1"]
    label: "# Document Classification Users"
  }

  measure: num_transcription_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [transcription_fl: "= 1"]
    label: "# Transcription Users"
  }

  measure: num_identification_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [identification_fl: "= 1"]
    label: "# Identification Users"
  }

  measure: num_flex_extract_users {
    type: count_distinct
    sql_distinct_key: ${user_id} ;;
    sql: ${user_id} ;;
    filters: [flex_extract_fl: "= 1"]
    label: "# Flexible Extraction Users"
  }



  set: detail {
    fields: [
      user_id,
      event_id,
      session_id,
      time_date,
      domain,
      customer,
      product_event
    ]
  }
}
