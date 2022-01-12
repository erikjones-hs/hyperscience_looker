view: salesforce_leads_and_contacts {
  sql_table_name: "MARKETING"."SALESFORCE_LEADS_AND_CONTACTS"
    ;;

  dimension_group: contact_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CONTACT_CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}."CONTACT_ID" ;;
  }

  dimension_group: converted_contact {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CONVERTED_CONTACT_DATE" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: current_person_type {
    type: string
    sql: ${TABLE}."CURRENT_PERSON_TYPE" ;;
  }

  dimension_group: customer {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CUSTOMER_DATE" ;;
  }

  dimension_group: dq {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DQ_DATE" ;;
  }

  dimension: engagement_score {
    type: string
    sql: ${TABLE}."ENGAGEMENT_SCORE" ;;
  }

  dimension_group: former_customer {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FORMER_CUSTOMER_DATE" ;;
  }

  dimension: global_region {
    type: string
    sql: ${TABLE}."GLOBAL_REGION" ;;
  }

  dimension: is_merged {
    type: string
    sql: ${TABLE}."IS_MERGED" ;;
  }

  dimension: job_function {
    type: string
    sql: ${TABLE}."JOB_FUNCTION" ;;
  }

  dimension: job_level {
    type: string
    sql: ${TABLE}."JOB_LEVEL" ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}."JOB_TITLE" ;;
  }

  dimension: last_lead_source {
    type: string
    sql: ${TABLE}."LAST_LEAD_SOURCE" ;;
  }

  dimension: last_secondary_lead_source {
    type: string
    sql: ${TABLE}."LAST_SECONDARY_LEAD_SOURCE" ;;
  }

  dimension_group: lead_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."LEAD_CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}."LEAD_ID" ;;
  }

  dimension: lead_score {
    type: string
    sql: ${TABLE}."LEAD_SCORE" ;;
  }

  dimension: lead_score_at_mql {
    type: string
    sql: ${TABLE}."LEAD_SCORE_AT_MQL" ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}."LEAD_SOURCE" ;;
  }

  dimension: lead_status {
    type: string
    sql: ${TABLE}."LEAD_STATUS" ;;
  }

  dimension_group: mal {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MAL_DATE" ;;
  }

  dimension_group: mel {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MEL_DATE" ;;
  }

  dimension_group: mql {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MQL_DATE" ;;
  }

  dimension_group: mql_date_from_sal {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MQL_DATE_FROM_SAL" ;;
  }

  dimension_group: mrl {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MRL_DATE" ;;
  }

  dimension: original_person_type {
    type: string
    sql: ${TABLE}."ORIGINAL_PERSON_TYPE" ;;
  }

  dimension: person_id {
    type: string
    sql: ${TABLE}."PERSON_ID" ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}."PERSONA" ;;
  }

  dimension: profile_score {
    type: string
    sql: ${TABLE}."PROFILE_SCORE" ;;
  }

  dimension_group: sal {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SAL_DATE" ;;
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}."SALES_REGION" ;;
  }

  dimension: secondary_lead_source {
    type: string
    sql: ${TABLE}."SECONDARY_LEAD_SOURCE" ;;
  }

  dimension: source_first_lead_source_detail {
    type: string
    sql: ${TABLE}."SOURCE_FIRST_LEAD_SOURCE_DETAIL" ;;
  }

  dimension: source_last_lead_source_detail {
    type: string
    sql: ${TABLE}."SOURCE_LAST_LEAD_SOURCE_DETAIL" ;;
  }

  dimension: converted_opportunity_id {

    type: string
    sql:  ${TABLE}."CONVERTED_OPPORTUNITY_ID" ;;

  }

  dimension: opp_stage_name_ordered {

    type: string
    sql: ${TABLE}."OPP_STAGE_NAME_ORDERED" ;;

  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension_group: sql {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SQL_DATE" ;;
  }

  dimension_group: srl {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SRL_DATE" ;;
  }

  dimension: type_of_mql {
    type: string
    sql: ${TABLE}."TYPE_OF_MQL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
