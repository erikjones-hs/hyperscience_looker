view: sales_pipeline_history {
  sql_table_name: (select * from prod.monthly_kpis.pipeline_history);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
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

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_lead_source {
    type: string
    sql: ${TABLE}."OPP_LEAD_SOURCE" ;;
  }

  dimension: opp_is_marketing_influenced_flag {
    type: number
    sql: ${TABLE}."OPP_IS_MARKETING_INFLUENCED_FLAG" ;;
  }

  dimension_group: opp_created_dte {
    type: time
    sql: ${TABLE}."OPP_CREATED_DTE" ;;
  }

  dimension_group: opp_close_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension_group: opp_closed_won_dte {
    type: time
    sql: ${TABLE}."OPP_CLOSED_WON_DTE" ;;
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

  dimension: is_partner_influenced {
    type: yesno
    sql: ${partner_account_name} IS NOT NULL ;;
  }

  dimension: stage_custom_sort {
    label: "Stage (custom sort)"
    case: {
      when: {
        sql: ${opp_stage_name} = 'AE Discovery' ;;
        label: "Discovery"
      }
      when: {
        sql: ${opp_stage_name} = 'Value/Fit' ;;
        label: "Value/Fit"
      }
      when: {
        sql: ${opp_stage_name} = 'TDD' ;;
        label: "TDD"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Go/No-Go' ;;
        label: "EB Go/No-Go"
      }
      when: {
        sql: ${opp_stage_name} = 'TVE' ;;
        label: "POC"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Revisit' ;;
        label: "EB Review"
      }
      when: {
        sql: ${opp_stage_name} = 'Negotiate and Close' ;;
        label: "Negotiate & Close"
      }
      when: {
        sql: ${opp_stage_name} = 'Closed Won' ;;
        label: "Closed Won"
      }

    }
  }

  dimension: stage_custom_sort_1 {
    label: "Stage (custom sort 1)"
    case: {
      when: {
        sql: ${opp_stage_name} = 'AE Discovery' ;;
        label: "1. Discovery"
      }
      when: {
        sql: ${opp_stage_name} = 'Value/Fit' ;;
        label: "2. Value/Fit"
      }
      when: {
        sql: ${opp_stage_name} = 'TDD' ;;
        label: "3. TDD"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Go/No-Go' ;;
        label: "4. EB Go/No-Go"
      }
      when: {
        sql: ${opp_stage_name} = 'TVE' ;;
        label: "5. POC"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Revisit' ;;
        label: "6. EB Review"
      }
      when: {
        sql: ${opp_stage_name} = 'Negotiate and Close' ;;
        label: "7. Negotiate & Close"
      }
      when: {
        sql: ${opp_stage_name} = 'Closed Won' ;;
        label: "8. Closed Won"
      }

    }
  }

  dimension: is_opp_new_flag {
    type:  number
    sql: CASE WHEN ${opp_created_dte_month} = ${date_ran_month} THEN 1 ELSE 0 END ;;
  }

  dimension: revenue_type_category {
    label: "Revenue Type (bucketed)"
    case: {
      when: {
        sql: ${opp_revenue_type} = 'New Customer' ;;
        label: "New Customer"
      }
      when: {
        sql: ${opp_revenue_type} = 'Data Deal' ;;
        label: "Renewal / Expansion / Data Deal"
      }
      when: {
        sql: ${opp_revenue_type} = 'Expansion' ;;
        label: "Renewal / Expansion / Data Deal"
      }
      when: {
        sql: ${opp_revenue_type} = 'Renewal' ;;
        label: "Renewal / Expansion / Data Deal"
      }
      when: {
        sql: ${opp_revenue_type} = 'Renewal w/ Upsell' ;;
        label: "Renewal / Expansion / Data Deal"
      }
      when: {
        sql: ${opp_revenue_type} = 'Partnership' ;;
        label: "Renewal / Expansion / Data Deal"
      }
      when: {
        sql: ${opp_revenue_type} = 'Upsell' ;;
        label: "Renewal / Expansion / Data Deal"
    }
  }
}

  dimension: is_new_customer_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'New Customer' then 1 else 0 end ;;
  }

  dimension: is_data_deal_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Data Deal' then 1 else 0 end ;;
  }

  dimension: is_expansion_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Expansion' then 1 else 0 end ;;
  }

  dimension: is_renewal_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Renewal' then 1 else 0 end ;;
  }

  dimension: is_renewal_upsell_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Renewal w/ Upsell' then 1 else 0 end ;;
  }

  dimension: is_partnership_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Partnership' then 1 else 0 end ;;
  }

  dimension: is_upsell_flag {
    type:  number
    sql: CASE WHEN ${opp_revenue_type} = 'Upsell' then 1 else 0 end ;;
  }

  measure: total_pipeline_opps {
    type: count_distinct
    sql: ${opp_id} ;;
    label: "Total Opportunities"
    drill_fields: [detail*]
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

  measure: total_net_new_arr {
    type:  sum
    sql:  ${opp_net_new_arr};;
    value_format: "$#,##0"
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

  measure: total_net_new_arr_pipeline_partner {
    type:  sum
    sql:  CASE WHEN ${is_partner_influenced} then ${opp_net_new_arr} else 0 end;;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "pipeline"]
    drill_fields: [detail*]
  }

  measure: total_net_new_arr_qualified_pipeline_partner {
    type:  sum
    sql:  CASE WHEN ${is_partner_influenced} then ${opp_net_new_arr} else 0 end;;
    value_format: "$#,##0"
    filters: [opp_pipeline_category: "qualified_pipeline"]
    drill_fields: [detail*]
  }

  measure: total_pipeline_partner {
    type:  number
    sql:  ${total_net_new_arr_pipeline_partner} + ${total_net_new_arr_qualified_pipeline_partner} ;;
    value_format: "$#,##0"
    drill_fields: [detail*]
  }

  measure: percent_pipeline_partner {
    type:  number
    sql: 100* ${total_net_new_arr_pipeline_partner} / ${total_net_new_arr_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_qualified_pipeline_partner {
    type:  number
    sql: 100* ${total_net_new_arr_qualified_pipeline_partner} / ${total_net_new_arr_qualified_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: percent_total_pipeline_partner {
    type:  number
    sql: 100* ${total_pipeline_partner} / ${total_pipeline};;
    drill_fields: [detail*]
    value_format: "#0.00\%"
  }

  measure: num_new_opps {
    type:  sum
    sql: ${is_opp_new_flag} ;;
  }

  measure: percent_new_opps {
    type:  number
    sql: 100 * ${num_new_opps} / ${total_pipeline_opps} ;;
    value_format: "#0\%"
  }

  measure: num_new_customer_opps {
    type:  sum
    sql: ${is_new_customer_flag} ;;
  }

  measure: num_data_deal_opps {
    type:  sum
    sql: ${is_data_deal_flag};;
  }

  measure: num_expansion_opps {
    type:  sum
    sql: ${is_expansion_flag} ;;
  }

  measure: num_renewal_opps {
    type:  sum
    sql: ${is_renewal_flag} ;;
  }

  measure: num_renewal_upsell_opps {
    type:  sum
    sql: ${is_renewal_upsell_flag} ;;
  }

  measure: num_upsell_opps {
    type:  sum
    sql: ${is_upsell_flag} ;;
  }

  measure: num_partnership_opps {
    type:  sum
    sql: ${is_partnership_flag} ;;
  }

  measure: all_opps {
    type: number
    sql: ${is_data_deal_flag} + ${is_expansion_flag} + ${is_new_customer_flag} + ${is_partnership_flag} + ${is_renewal_flag} + ${is_renewal_upsell_flag} + ${is_upsell_flag} ;;
  }

  measure: percent_new_customers {
    type: number
    sql: 100 * (${is_new_customer_flag} / ${all_opps}) ;;
    value_format: "#0\%"
    label: "% New Customers"
  }

  measure: percent_new_customer_opps {
    type:  number
    sql: 100 * ${num_new_customer_opps} / ${total_pipeline_opps} ;;
    value_format: "#0\%"
  }


  set: detail {
    fields: [
      opp_id,
      opp_name,
      account_name,
      account_industry,
      account_sales_region,
      partner_account_name,
      opp_stage_name,
      opp_lead_source,
      opp_is_marketing_influenced_flag,
      opp_close_dte_time,
      opp_arr,
      opp_net_new_arr,
      opportunity_owner,
      owner_description,
      opp_pipeline_category
    ]
  }
}
