view: sales_pipeline_current {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_pipeline_current_month);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."DATE_RAN" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}."ACCOUNT_INDUSTRY" ;;
  }

  dimension: account_sales_region {
    type: string
    sql: ${TABLE}."ACCOUNT_SALES_REGION" ;;
  }

  dimension: partner_account_name {
    type: string
    sql: ${TABLE}."PARTNER_ACCOUNT_NAME" ;;
  }

  dimension: stage_ordering {
    type: number
    sql:
      CASE
        WHEN lower(${opp_stage_name}) = 'pipeline generation' THEN 1
        WHEN lower(${opp_stage_name}) = 'discovery & qualification' THEN 2
        WHEN lower(${opp_stage_name}) = 'alignment' THEN 3
        WHEN lower(${opp_stage_name}) = 'eb sponsorship' THEN 4
        WHEN lower(${opp_stage_name}) = 'value & validation' THEN 5
        WHEN lower(${opp_stage_name}) = 'eb signoff & contracts' THEN 6
        ELSE 8
      END ;;
    hidden: yes
    description: "This dimension is used to force sort the stage name dimension."
  }

  dimension: stage_custom_new {
    label: "New Stage (custom sort)"
    case: {
      when: {
        sql: lower(${opp_stage_name}) = 'pipeline generation' ;;
        label: "1. Pipeline Generation"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'discovery & qualification' ;;
        label: "2. Discovery & Qualification"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'alignment' ;;
        label: "3. Alignment"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb sponsorship' ;;
        label: "4. EB Sponsorship"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'value & validation' ;;
        label: "5. Value & Validation"
      }
      when: {
        sql: lower(${opp_stage_name}) = 'eb signoff & contracts' ;;
        label: "6. EB Sign-Off & Contracts"
      }
    }
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
    order_by_field: stage_ordering
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension: opp_is_partner_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_PARTNER_INFLUENCED_FLAG" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    timeframes: [raw, date, month, month_name, month_num, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

  dimension: opp_pipeline_category {
    type: string
    sql: ${TABLE}."OPP_PIPELINE_CATEGORY" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_commit_status {
    type: string
    sql: ${TABLE}."OPP_COMMIT_STATUS" ;;
  }

  dimension: pipeline_type {
    type: string
    sql: CASE WHEN lower(${opp_commit_status}) in ('best case','committed') then 'Best Case / Committed' else 'Pipeline' end;;
    label: "Pipeline Category (New)"
  }

  measure: total_pipeline_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Opportunities"
    drill_fields: [detail*]
  }

  measure: total_arr {
    type: sum_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_arr} ;;
    value_format: "$#,##0"
    label: "Total ARR"
    drill_fields: [detail*]
  }

  measure: total_net_new_arr {
    type: sum_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_net_new_arr} ;;
    value_format: "$#,##0"
    label: "Total Net New ARR"
    drill_fields: [detail*]
  }

  measure: total_arr_pipeline_mktg {
    type:  sum
    sql:  ${opp_arr};;
    value_format: "$#,##0"
    filters: [opp_is_marketing_influenced_flag: "1"]
    drill_fields: [detail*]
    label: "Total ARR Marketing Influenced"
  }

  measure: total_arr_pipeline_partner {
    type:  sum
    sql:  ${opp_arr};;
    value_format: "$#,##0"
    filters: [opp_is_partner_influenced_flag: "1"]
    drill_fields: [detail*]
    label: "Total ARR Partner Influenced"
  }

  measure: percent_total_arr_mktg {
    type:  number
    sql: 100* ${total_arr_pipeline_mktg} / ${total_arr};;
    label: "% Marketing Influenced Pipeline"
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_total_arr_partner {
    type:  number
    sql: 100* ${total_arr_pipeline_partner} / ${total_arr};;
    label: "% Partner Influenced Pipeline"
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: total_non_qual_pipeline_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Pipeline Opportunities"
    filters: [opp_pipeline_category: "pipeline"]
    drill_fields: [detail*]
  }

  measure: total_qual_pipeline_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Qualified Pipeline Opportunities"
    filters: [opp_pipeline_category: "qualified_pipeline"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_pipeline {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "pipeline"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_qualified_pipeline {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "qualified_pipeline"]
    drill_fields: [detail*]
  }

  measure: total_pipeline {
    type:  number
    sql:  ${total_net_new_arr_pipeline} + ${total_net_new_arr_qualified_pipeline} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_pipeline_mktg {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "pipeline", opp_is_marketing_influenced_flag: "1"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_qualified_pipeline_mktg {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "qualified_pipeline", opp_is_marketing_influenced_flag: "1"]
    drill_fields: [detail*]
  }

  measure: total_pipeline_mktg {
    type:  number
    sql:  ${total_net_new_arr_pipeline_mktg} + ${total_net_new_arr_qualified_pipeline_mktg} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: percent_pipeline_mktg {
    type:  number
    sql: 100* ${total_net_new_arr_pipeline_mktg} / ${total_net_new_arr_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_qualified_pipeline_mktg {
    type:  number
    sql: 100* ${total_net_new_arr_qualified_pipeline_mktg} / ${total_net_new_arr_qualified_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_total_pipeline_mktg {
    type:  number
    sql: 100* ${total_pipeline_mktg} / ${total_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: total_pipeline_opps_new {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Pipeline Opportunities (New)"
    filters: [opp_commit_status: "Pipeline"]
    drill_fields: [detail*]
  }

  measure: total_qual_pipeline_opps_new {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Qualified Pipeline Opportunities (New)"
    filters: [opp_commit_status: "Best Case, Committed"]
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      date_ran_date,
      opp_id,
      opp_name,
      account_name,
      account_industry,
      account_sales_region,
      partner_account_name,
      opp_stage_name,
      opp_lead_source,
      opp_is_marketing_influenced_flag,
      opp_close_dte_date,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner,
      owner_description,
      opp_pipeline_category
    ]
  }
}
