view: bizible_touchpoint_final {
  sql_table_name: (select * from dev.chrismee.bizible_touchpoint_final);;


  dimension: abm_target_type {
    type: string
    sql: ${TABLE}."ABM_TARGET_TYPE" ;;
  }

  dimension_group: account_created {
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
    sql: ${TABLE}."ACCOUNT_CREATED_DATE" ;;
  }

  dimension: account_csm {
    type: string
    sql: ${TABLE}."ACCOUNT_CSM" ;;
  }

  dimension: account_domain {
    type: string
    sql: ${TABLE}."ACCOUNT_DOMAIN" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}."ACCOUNT_INDUSTRY" ;;
  }

  dimension: account_manager {
    type: string
    sql: ${TABLE}."ACCOUNT_MANAGER" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_number_of_employees {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER_OF_EMPLOYEES" ;;
  }

  dimension: account_owner_id {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER_ID" ;;
  }

  dimension: account_owner_name {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER_NAME" ;;
  }

  dimension: account_sales_region {
    type: string
    sql: ${TABLE}."ACCOUNT_SALES_REGION" ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}."ACCOUNT_TYPE" ;;
  }

  dimension: ad_campaign_id {
    type: string
    sql: ${TABLE}."AD_CAMPAIGN_ID" ;;
  }

  dimension: ad_campaign_name {
    type: string
    sql: ${TABLE}."AD_CAMPAIGN_NAME" ;;
  }

  dimension: ad_content {
    type: string
    sql: ${TABLE}."AD_CONTENT" ;;
  }

  dimension: ad_destination_url {
    type: string
    sql: ${TABLE}."AD_DESTINATION_URL" ;;
  }

  dimension: ad_group_id {
    type: string
    sql: ${TABLE}."AD_GROUP_ID" ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}."AD_GROUP_NAME" ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}."AD_ID" ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}."ANNUAL_REVENUE" ;;
  }

  dimension: authority {
    type: string
    sql: ${TABLE}."AUTHORITY" ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}."BILLING_COUNTRY" ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}."BILLING_POSTAL_CODE" ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}."BILLING_STATE" ;;
  }

  dimension: bizible_account_score {
    type: string
    sql: ${TABLE}."BIZIBLE_ACCOUNT_SCORE" ;;
  }

  dimension_group: bizible_person_created {
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
    sql: ${TABLE}."BIZIBLE_PERSON_CREATED_DATE" ;;
  }

  dimension: bizible_person_id {
    type: string
    sql: ${TABLE}."BIZIBLE_PERSON_ID" ;;
  }

  dimension: budget {
    type: string
    sql: ${TABLE}."BUDGET" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }

  dimension: channel_path {
    type: string
    sql: ${TABLE}."CHANNEL_PATH" ;;
  }

  dimension: company_size {
    type: number
    sql: ${TABLE}."COMPANY_SIZE" ;;
  }

  dimension: contact_authority {
    type: string
    sql: ${TABLE}."CONTACT_AUTHORITY" ;;
  }

  dimension: contact_budget {
    type: string
    sql: ${TABLE}."CONTACT_BUDGET" ;;
  }

  dimension_group: contact_created {
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
    sql: ${TABLE}."CONTACT_CREATED_DATE" ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}."CONTACT_EMAIL" ;;
  }

  dimension: contact_global_region {
    type: string
    sql: ${TABLE}."CONTACT_GLOBAL_REGION" ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}."CONTACT_ID" ;;
  }

  dimension: contact_lead_source {
    type: string
    sql: ${TABLE}."CONTACT_LEAD_SOURCE" ;;
  }

  dimension: contact_mql_checkbox {
    type: yesno
    sql: ${TABLE}."CONTACT_MQL_CHECKBOX" ;;
  }

  dimension: contact_sales_region {
    type: string
    sql: ${TABLE}."CONTACT_SALES_REGION" ;;
  }

  dimension: contact_title {
    type: string
    sql: ${TABLE}."CONTACT_TITLE" ;;
  }

  dimension: contact_type {
    type: string
    sql: ${TABLE}."CONTACT_TYPE" ;;
  }

  dimension: custom_model_attribution {
    type: number
    sql: ${TABLE}."CUSTOM_MODEL_ATTRIBUTION" ;;
  }

  dimension: custom_model_attribution_2 {
    type: number
    sql: ${TABLE}."CUSTOM_MODEL_ATTRIBUTION_2" ;;
  }

  dimension: custom_model_count {
    type: number
    sql: ${TABLE}."CUSTOM_MODEL_COUNT" ;;
  }

  dimension: custom_model_count_2 {
    type: number
    sql: ${TABLE}."CUSTOM_MODEL_COUNT_2" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_touch_attribution {
    type: number
    sql: ${TABLE}."FIRST_TOUCH_ATTRIBUTION" ;;
  }

  dimension: first_touch_count {
    type: number
    sql: ${TABLE}."FIRST_TOUCH_COUNT" ;;
  }

  dimension: form_url {
    type: string
    sql: ${TABLE}."FORM_URL" ;;
  }

  dimension: form_url_raw {
    type: string
    sql: ${TABLE}."FORM_URL_RAW" ;;
  }

  dimension: global_account_id {
    type: string
    sql: ${TABLE}."GLOBAL_ACCOUNT_ID" ;;
  }

  dimension: keyword_id {
    type: string
    sql: ${TABLE}."KEYWORD_ID" ;;
  }

  dimension: keyword_text {
    type: string
    sql: ${TABLE}."KEYWORD_TEXT" ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}."LANDING_PAGE" ;;
  }

  dimension: landing_page_raw {
    type: string
    sql: ${TABLE}."LANDING_PAGE_RAW" ;;
  }

  dimension: lead_abm_target_type {
    type: string
    sql: ${TABLE}."LEAD_ABM_TARGET_TYPE" ;;
  }

  dimension: lead_annual_revenue {
    type: number
    sql: ${TABLE}."LEAD_ANNUAL_REVENUE" ;;
  }

  dimension: lead_company {
    type: string
    sql: ${TABLE}."LEAD_COMPANY" ;;
  }

  dimension: lead_conversion_touch_attribution {
    type: number
    sql: ${TABLE}."LEAD_CONVERSION_TOUCH_ATTRIBUTION" ;;
  }

  dimension_group: lead_converted {
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
    sql: ${TABLE}."LEAD_CONVERTED_DATE" ;;
  }

  dimension: lead_country {
    type: string
    sql: ${TABLE}."LEAD_COUNTRY" ;;
  }

  dimension_group: lead_created {
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
    sql: ${TABLE}."LEAD_CREATED_DATE" ;;
  }

  dimension: lead_creation_touch_count {
    type: number
    sql: ${TABLE}."LEAD_CREATION_TOUCH_COUNT" ;;
  }

  dimension: lead_email {
    type: string
    sql: ${TABLE}."LEAD_EMAIL" ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}."LEAD_ID" ;;
  }

  dimension: lead_is_converted {
    type: yesno
    sql: ${TABLE}."LEAD_IS_CONVERTED" ;;
  }

  dimension: lead_mql_checkbox {
    type: yesno
    sql: ${TABLE}."LEAD_MQL_CHECKBOX" ;;
  }

  dimension: lead_number_of_employees {
    type: number
    sql: ${TABLE}."LEAD_NUMBER_OF_EMPLOYEES" ;;
  }

  dimension: lead_owner_id {
    type: string
    sql: ${TABLE}."LEAD_OWNER_ID" ;;
  }

  dimension: lead_sales_region {
    type: string
    sql: ${TABLE}."LEAD_SALES_REGION" ;;
  }

  dimension: lead_score {
    type: string
    sql: ${TABLE}."LEAD_SCORE" ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}."LEAD_SOURCE" ;;
  }

  dimension: lead_state {
    type: string
    sql: ${TABLE}."LEAD_STATE" ;;
  }

  dimension: lead_title {
    type: string
    sql: ${TABLE}."LEAD_TITLE" ;;
  }

  dimension: lead_website {
    type: string
    sql: ${TABLE}."LEAD_WEBSITE" ;;
  }

  dimension: match_type {
    type: string
    sql: ${TABLE}."MATCH_TYPE" ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}."MEDIUM" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."OBJECT" ;;
  }

  dimension: opportunity_amount {
    type: number
    sql: ${TABLE}."OPPORTUNITY_AMOUNT" ;;
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

  dimension_group: opportunity_closed_won {
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
    sql: ${TABLE}."OPPORTUNITY_CLOSED_WON_DATE" ;;
  }

  dimension_group: opportunity_closed_lost {
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
    sql: ${TABLE}."OPPORTUNITY_CLOSED_LOST_DATE" ;;
  }

  dimension: opportunity_created_by_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_CREATED_BY_ID" ;;
  }

  dimension_group: opportunity_created {
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
    sql: ${TABLE}."OPPORTUNITY_CREATED_DATE" ;;
  }

  dimension_group: opportunity_end_renewal {
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
    sql: ${TABLE}."OPPORTUNITY_END_RENEWAL_DATE" ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: opportunity_is_closed {
    type: yesno
    sql: ${TABLE}."OPPORTUNITY_IS_CLOSED" ;;
  }

  dimension: opportunity_is_won {
    type: yesno
    sql: ${TABLE}."OPPORTUNITY_IS_WON" ;;
  }

  dimension_group: opportunity_last_activity {
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
    sql: ${TABLE}."OPPORTUNITY_LAST_ACTIVITY_DATE" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME" ;;
  }

  dimension: opportunity_owner_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER_ID" ;;
  }

  dimension: opportunity_owner_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER_NAME" ;;
  }

  dimension: opportunity_probability {
    type: number
    sql: ${TABLE}."OPPORTUNITY_PROBABILITY" ;;
  }

  dimension: opportunity_stage {
    type: string
    sql: ${TABLE}."OPPORTUNITY_STAGE" ;;
  }

  dimension_group: opportunity_start {
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
    sql: ${TABLE}."OPPORTUNITY_START_DATE" ;;
  }

  dimension: opportunity_vo_check {
    type: yesno
    sql: ${TABLE}."OPPORTUNITY_VO_CHECK" ;;
  }

  dimension_group: opportunity_vo {
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
    sql: ${TABLE}."OPPORTUNITY_VO_DATE" ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}."PLACEMENT_ID" ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}."PLACEMENT_NAME" ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: referrer_page {
    type: string
    sql: ${TABLE}."REFERRER_PAGE" ;;
  }

  dimension: referrer_page_raw {
    type: string
    sql: ${TABLE}."REFERRER_PAGE_RAW" ;;
  }

  dimension: search_phrase {
    type: string
    sql: ${TABLE}."SEARCH_PHRASE" ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }

  dimension: sf_campaign_name {
    type: string
    sql: ${TABLE}."SF_CAMPAIGN_NAME" ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}."SITE_ID" ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}."SITE_NAME" ;;
  }

  dimension_group: touchpoint_created {
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
    sql: ${TABLE}."TOUCHPOINT_CREATED_DATE" ;;
  }

  dimension_group: touchpoint {
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
    sql: ${TABLE}."TOUCHPOINT_DATE" ;;
  }

  dimension: touchpoint_id {
    type: string
    sql: ${TABLE}."TOUCHPOINT_ID" ;;
  }

  dimension: touchpoint_position {
    type: string
    sql: ${TABLE}."TOUCHPOINT_POSITION" ;;
  }

  dimension: touchpoint_source {
    type: string
    sql: ${TABLE}."TOUCHPOINT_SOURCE" ;;
  }

  dimension: touchpoint_type {
    type: string
    sql: ${TABLE}."TOUCHPOINT_TYPE" ;;
  }

  dimension: u_shaped_attribution {
    type: number
    sql: ${TABLE}."U_SHAPED_ATTRIBUTION" ;;
  }

  dimension: u_shaped_count {
    type: number
    sql: ${TABLE}."U_SHAPED_COUNT" ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: w_shaped_attribution {
    type: number
    sql: ${TABLE}."W_SHAPED_ATTRIBUTION" ;;
  }

  dimension: w_shaped_count {
    type: number
    sql: ${TABLE}."W_SHAPED_COUNT" ;;
  }

  dimension: working_checkbox {
    type: yesno
    sql: ${TABLE}."LEAD_WORKING_STAGE_CHECKBOX" ;;
  }

  dimension: lead_status {
    type: string
    sql: ${TABLE}."LEAD_STATUS";;
  }

  dimension: lead_disqualified_reason_description {
    type: string
    sql: ${TABLE}."LEAD_DISQUALIFIED_REASON_DESCRIPTION";;
  }

  dimension: lead_disqualified_reason {
    type: string
    sql: ${TABLE}."LEAD_DISQUALIFIED_REASON";;
  }

  dimension: lead_dq_date {
    type: date
    sql: ${TABLE}."lead_dq_date" ;;
  }

  dimension: mql_checkbox {
    type: yesno
    sql: ${TABLE}."MQL_CHECKBOX" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: lc_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%LC%'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: mal_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%MAL%'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: mel_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%MEL%'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: mql_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%MQL%'
       AND ${mql_checkbox} = 'true'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: sal_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%SAL%'
      AND ${working_checkbox} = 'true'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: sel_count {
    type: count_distinct
    sql:
       CASE WHEN ${bizible_touchpoint_final.touchpoint_position} LIKE '%SEL%'
          THEN ${bizible_person_id}
          ELSE NULL
          END;;
  }

  measure: sql_count{
    type: count_distinct
    sql: ${opportunity_id};;
  }

  measure: sql_pipeline {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql_distinct_key: ${opportunity_id} ;;
    sql: ${bizible_touchpoint_final.opportunity_amount};;
  }

  measure: vo_sql_count{
    type: count_distinct
    filters: [opportunity_vo_check: "true"]
    sql: ${opportunity_id};;
  }

  measure: vo_sql_pipeline {
    type: sum_distinct
    value_format: "$#,##0.00"
    filters: [opportunity_vo_check: "true"]
    sql_distinct_key: ${opportunity_id} ;;
    sql: ${bizible_touchpoint_final.opportunity_amount};;
  }

  measure: cw_count{
    type: count_distinct
    filters: [opportunity_stage: "Closed Won"]
    sql: ${opportunity_id};;
  }

  measure: cw_revenue {
    type: sum_distinct
    value_format: "$#,##0.00"
    filters: [opportunity_stage: "Closed Won"]
    sql_distinct_key: ${opportunity_id} ;;
    sql: ${bizible_touchpoint_final.opportunity_amount};;
  }

  dimension_group: opportunity_created_date_group {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${opportunity_created_date} ;;
  }

  dimension_group: opportunity_close_date_group {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${opportunity_close_date};;
  }

  dimension_group: opportunity_closed_won_date_group {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${opportunity_closed_won_date};;
  }

  dimension_group: opportunity_closed_lost_date_group {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${opportunity_closed_lost_date};;
  }

  dimension_group: touchpoint_date_group {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${touchpoint_date};;
  }

  dimension: mql_date {
    type: date
    sql: ${TABLE}."BIZIBLE_MQL_DATE" ;;
    datatype: date
  }

  dimension_group: mql_date_group {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${mql_date};;
  }

  dimension: sal_date {
    type: date
    sql: ${TABLE}."BIZIBLE_SAL_DATE" ;;
    datatype: date
  }

  dimension_group: sal_date_group {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${sal_date};;
  }

  parameter: start_date{
    type: date_time
    description: "Use this field to select the starting date"
  }

  parameter: end_date{
    type: date_time
    description: "Use this field to select the end date"
  }

  parameter: date_selector {
    type: date_time
    description: "Use this field to base the charts on a specfic date"
    allowed_value: {
      label: "MQL Date"
      value: "mql_date"
    }
    allowed_value: {
      label: "SQL Date"
      value: "opportunity_created_date"
    }
  }

  dimension_group: date_selector_calc {
    type: time
    convert_tz: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CASE WHEN ${date_selector} = "mql_date" THEN ${mql_date}
          WHEN ${date_selector} = "opportunity_created_date" THEN ${opportunity_created_date}
          END;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ad_campaign_name,
      opportunity_owner_name,
      opportunity_name,
      site_name,
      placement_name,
      ad_group_name,
      account_owner_name,
      account_name,
      sf_campaign_name
    ]
  }
}
