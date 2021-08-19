view: salesforce_lead_lifecycle {
  sql_table_name: "CHRISMEE"."SALESFORCE_LEAD_LIFECYCLE"
    ;;

  dimension: abm_target_type {
    type: string
    sql: ${TABLE}."ABM_TARGET_TYPE" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}."ACCOUNT_INDUSTRY" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_tier {
    type: string
    sql: ${TABLE}."ACCOUNT_TIER" ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}."ANNUAL_REVENUE" ;;
  }

  dimension: arr_forecast {
    type: number
    sql: ${TABLE}."ARR_FORECAST" ;;
  }

  dimension: arr_mirror {
    type: number
    sql: ${TABLE}."ARR_MIRROR" ;;
  }

  dimension: bizible_touchpoint_campaign_name_first_touch {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_CAMPAIGN_NAME_FIRST_TOUCH" ;;
  }

  dimension: bizible_touchpoint_campaign_name_lead_creation {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_CAMPAIGN_NAME_LEAD_CREATION" ;;
  }

  dimension_group: bizible_touchpoint_date_first_touch {
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
    sql: CAST(${TABLE}."BIZIBLE_TOUCHPOINT_DATE_FIRST_TOUCH" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: bizible_touchpoint_date_lead_creation {
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
    sql: CAST(${TABLE}."BIZIBLE_TOUCHPOINT_DATE_LEAD_CREATION" AS TIMESTAMP_NTZ) ;;
  }

  dimension: bizible_touchpoint_landing_page_first_touch {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_LANDING_PAGE_FIRST_TOUCH" ;;
  }

  dimension: bizible_touchpoint_landing_page_lead_creation {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_LANDING_PAGE_LEAD_CREATION" ;;
  }

  dimension: bizible_touchpoint_marketing_channel_first_touch {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_MARKETING_CHANNEL_FIRST_TOUCH" ;;
  }

  dimension: bizible_touchpoint_marketing_channel_lead_creation {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_MARKETING_CHANNEL_LEAD_CREATION" ;;
  }

  dimension: bizible_touchpoint_source_first_touch {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_SOURCE_FIRST_TOUCH" ;;
  }

  dimension: bizible_touchpoint_source_lead_creation {
    type: string
    sql: ${TABLE}."BIZIBLE_TOUCHPOINT_SOURCE_LEAD_CREATION" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}."COMPANY_SIZE" ;;
  }

  dimension: converted_check {
    type: yesno
    sql: ${TABLE}."CONVERTED_CHECK" ;;
  }

  dimension_group: converted {
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
    sql: ${TABLE}."CONVERTED_DATE" ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}."CONVERTED_OPPORTUNITY_ID" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension_group: customer_stage {
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
    sql: ${TABLE}."CUSTOMER_STAGE_DATE" ;;
  }

  dimension: disqualified_reason {
    type: string
    sql: ${TABLE}."DISQUALIFIED_REASON" ;;
  }

  dimension: disqualified_reason_description {
    type: string
    sql: ${TABLE}."DISQUALIFIED_REASON_DESCRIPTION" ;;
  }

  dimension_group: disqualified_stage {
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
    sql: ${TABLE}."DISQUALIFIED_STAGE_DATE" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension_group: former_customer_stage {
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
    sql: ${TABLE}."FORMER_CUSTOMER_STAGE_DATE" ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}."FULL_NAME" ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: lead_account_id {
    type: string
    sql: ${TABLE}."LEAD_ACCOUNT_ID" ;;
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

  dimension: lead_industry {
    type: string
    sql: ${TABLE}."LEAD_INDUSTRY" ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}."LEAD_SOURCE" ;;
  }

  dimension_group: mal_stage {
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
    sql: ${TABLE}."MAL_STAGE_DATE" ;;
  }

  dimension_group: mel_stage {
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
    sql: ${TABLE}."MEL_STAGE_DATE" ;;
  }

  dimension: most_recent_lead_source {
    type: string
    sql: ${TABLE}."MOST_RECENT_LEAD_SOURCE" ;;
  }

  dimension: most_recent_lead_source_campaign {
    type: string
    sql: ${TABLE}."MOST_RECENT_LEAD_SOURCE_CAMPAIGN" ;;
  }

  dimension: most_recent_lead_source_offer {
    type: string
    sql: ${TABLE}."MOST_RECENT_LEAD_SOURCE_OFFER" ;;
  }

  dimension: most_recent_lead_source_offer_type {
    type: string
    sql: ${TABLE}."MOST_RECENT_LEAD_SOURCE_OFFER_TYPE" ;;
  }

  dimension: mql_check {
    type: yesno
    sql: ${TABLE}."MQL_CHECK" ;;
  }

  dimension_group: mql_stage {
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
    sql: ${TABLE}."MQL_STAGE_DATE" ;;
  }

  dimension_group: mrl_stage {
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
    sql: ${TABLE}."MRL_STAGE_DATE" ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}."NUMBER_OF_EMPLOYEES" ;;
  }

  dimension_group: opportunity_close {
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
    sql: ${TABLE}."OPPORTUNITY_CLOSE_DATE" ;;
  }

  dimension_group: opportunity_close_lost {
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
    sql: ${TABLE}."OPPORTUNITY_CLOSE_LOST_DATE" ;;
  }

  dimension_group: opportunity_close_won {
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
    sql: ${TABLE}."OPPORTUNITY_CLOSE_WON_DATE" ;;
  }

  dimension_group: opportunity_created {
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
    sql: CAST(${TABLE}."OPPORTUNITY_CREATED_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME" ;;
  }

  dimension: opportunity_type {
    type: string
    sql: ${TABLE}."OPPORTUNITY_TYPE" ;;
  }

  dimension: original_lead_source {
    type: string
    sql: ${TABLE}."ORIGINAL_LEAD_SOURCE" ;;
  }

  dimension: original_lead_source_ad_group {
    type: string
    sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_AD_GROUP" ;;
  }

  dimension: original_lead_source_campaign {
    type: string
    sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_CAMPAIGN" ;;
  }

  dimension: original_lead_source_offer {
    type: string
    sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_OFFER" ;;
  }

  dimension: original_lead_source_offer_type {
    type: string
    sql: ${TABLE}."ORIGINAL_LEAD_SOURCE_OFFER_TYPE" ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}."PERSONA" ;;
  }

  dimension_group: sal_stage {
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
    sql: ${TABLE}."SAL_STAGE_DATE" ;;
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}."SALES_REGION" ;;
  }

  dimension: secondary_lead_source {
    type: string
    sql: ${TABLE}."SECONDARY_LEAD_SOURCE" ;;
  }

  dimension: sql_check {
    type: yesno
    sql: ${TABLE}."SQL_CHECK" ;;
  }

  dimension_group: sql_stage {
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
    sql: ${TABLE}."SQL_STAGE_DATE" ;;
  }

  dimension_group: srl_stage {
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
    sql: ${TABLE}."SRL_STAGE_DATE" ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}."STAGE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: zoom_info_company_name {
    type: string
    sql: ${TABLE}."ZOOM_INFO_COMPANY_NAME" ;;
  }

  dimension: zoom_info_country {
    type: string
    sql: ${TABLE}."ZOOM_INFO_COUNTRY" ;;
  }

  dimension: zoom_info_employees {
    type: number
    sql: ${TABLE}."ZOOM_INFO_EMPLOYEES" ;;
  }

  dimension: zoom_info_job_function {
    type: string
    sql: ${TABLE}."ZOOM_INFO_JOB_FUNCTION" ;;
  }

  dimension: zoom_info_job_level {
    type: string
    sql: ${TABLE}."ZOOM_INFO_JOB_LEVEL" ;;
  }

  dimension: zoom_info_job_title {
    type: string
    sql: ${TABLE}."ZOOM_INFO_JOB_TITLE" ;;
  }

  dimension: zoom_info_revenue {
    type: number
    sql: ${TABLE}."ZOOM_INFO_REVENUE" ;;
  }

  dimension: zoominfo_sub_industry {
    type: string
    sql: ${TABLE}."ZOOMINFO_SUB_INDUSTRY" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: unique_leads {
    type: count_distinct
    sql_distinct_key: ${lead_id} ;;
  }

  measure: mel_count {
    type:  count_distinct
    sql_distinct_key:  ${lead_id} ;;
    filters: [mel_stage_date: "-null"]

  }

  measure: mql_count {
    type:  count_distinct
    sql_distinct_key:  ${lead_id} ;;
    filters: [mql_stage_date: "-null"]

  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      account_name
    ]
  }
}
