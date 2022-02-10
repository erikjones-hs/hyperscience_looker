view: ml_team_metrics {
  sql_table_name: (select * from fivetran_database.google_sheets.ml_monthly_metrics);;

  dimension: _row {
    type: number
    sql: ${TABLE}."_ROW" ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}."DATE" ;;
  }

  dimension: field_id {
    type: number
    sql: ${TABLE}."FIELD_ID" ;;
  }

  dimension: accuracy_english_handwritten {
    type: number
    sql: ${TABLE}."ACCURACY_ENGLISH_HANDWRITTEN" ;;
  }

  dimension: accuracy_non_english_handwritten {
    type: number
    sql: ${TABLE}."ACCURACY_NON_ENGLISH_HANDWRITTEN" ;;
  }

  dimension: accuracy_arabic_printed {
    type: number
    sql: ${TABLE}."ACCURACY_ARABIC_PRINTED" ;;
  }

  dimension: mobile {
    type: number
    sql: ${TABLE}."MOBILE" ;;
  }

  dimension: field_id_without_multiple_occurrence {
    type: number
    sql: ${TABLE}."FIELD_ID_WITHOUT_MULTIPLE_OCCURRENCE" ;;
  }

  dimension: unstructured_nlp {
    type: number
    sql: ${TABLE}."UNSTRUCTURED_NLP" ;;
  }

  dimension: accuracy_english_printed {
    type: number
    sql: ${TABLE}."ACCURACY_ENGLISH_PRINTED" ;;
  }

  dimension: tables {
    type: number
    sql: ${TABLE}."TABLES" ;;
  }

  dimension: tables_minus_nested {
    type: number
    sql: ${TABLE}."TABLES_MINUS_NESTED" ;;
  }

  dimension: accuracy_arabic_handwritten {
    type: number
    sql: ${TABLE}."ACCURACY_ARABIC_HANDWRITTEN" ;;
  }

  dimension: accuracy_non_english_printed {
    type: number
    sql: ${TABLE}."ACCURACY_NON_ENGLISH_PRINTED" ;;
  }

  dimension: segmentation {
    type: number
    sql: ${TABLE}."SEGMENTATION" ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
  }

  measure: count {
    type: count
  }

  measure: english_handwritten_accuracy {
    type: sum
    sql:  ${accuracy_english_handwritten} ;;
    value_format: "0.00%"
  }

  measure: non_english_handwritten_accuracy {
    type:  sum
    sql:  ${accuracy_non_english_handwritten} ;;
    value_format: "0.00%"
  }

  measure: arabic_handwritten_accuracy {
    type:  sum
    sql:  ${accuracy_arabic_handwritten};;
    value_format: "0.00%"
  }

  measure: field_ident {
    type:  sum
    sql:  ${field_id} ;;
    value_format: "0.00%"
  }

  measure: mobile_ident {
    type:  sum
    sql:  ${mobile} ;;
    value_format: "0.00%"
  }

  measure: field_no_multiple {
    type:  sum
    sql:  ${field_id_without_multiple_occurrence} ;;
    value_format: "0.00%"
  }

  measure: nlp_unstructured {
    type:  sum
    sql:  ${unstructured_nlp} ;;
    value_format: "0.00%"
  }

  measure: english_printed_accuracy {
    type:  sum
    sql:  ${accuracy_english_printed} ;;
    value_format: "0.00%"
  }

  measure: tables_ident {
    type:  sum
    sql:  ${tables} ;;
    value_format: "0.00%"
  }

  measure: tables_no_nested {
    type:  sum
    sql:  ${tables_minus_nested} ;;
    value_format: "0.00%"
  }

  measure: non_english_printed_accuracy {
    type:  sum
    sql:  ${accuracy_non_english_printed} ;;
    value_format: "0.00%"
  }

  measure: segmentation_ident {
    type:  sum
    sql:  ${segmentation} ;;
    value_format: "0.00%"
  }


}
