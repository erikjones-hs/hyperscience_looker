view: renewals_dash {
    sql_table_name: (select * from dev.cx.customer_data_renewals_dashboard);;
    drill_fields: [detail*]

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

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Account/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_arr {
    type: number
    sql: ${TABLE}."OPP_ARR" ;;
  }

  dimension: opp_net_new_arr {
    type: number
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: opp_commit_status {
    type: string
    sql: ${TABLE}."OPP_COMMIT_STATUS" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension_group: opp_start_date {
    type: time
    timeframes: [date,week,month,year]
    sql: ${TABLE}."OPP_START_DTE" ;;
  }

  dimension_group: opp_close_date {
    type: time
    timeframes: [date,week,month,year]
    sql: ${TABLE}."OPP_CLOSE_DTE" ;;
  }

  dimension_group: opp_renewal_dte {
    type: time
    timeframes: [date,week,month,year]
    sql: ${TABLE}."OPP_RENEWAL_DTE" ;;
  }

  dimension: opp_owner_id {
    type: string
    sql: ${TABLE}."OPP_OWNER_ID" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

  dimension: owner_description {
    type: string
    sql: ${TABLE}."OWNER_DESCRIPTION" ;;
  }

#  dimension: company_id_gsid {
#    type: string
#    sql: ${TABLE}."COMPANY_ID_GSID" ;;
#    link: {
#      label: "Gainsight"
#      url: "https://hyperscience.gainsightcloud.com/v1/ui/customersuccess360?cid={{ value }}"
#      icon_url: "http://gainsight.com/favicon.jpg"
#    }
#  }

  dimension: csm_name {
    type: string
    sql: ${TABLE}."CSM_NAME" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  dimension_group: activity_dte {
    type: time
    timeframes: [date,week,month,year]
    sql: ${TABLE}."ACTIVITY_DTE" ;;
  }

  dimension: renewal_status {
    type: string
    sql: ${TABLE}."RENEWAL_STATUS" ;;
  }

  dimension: renewal_status_name {
    type: string
    sql: ${TABLE}."RENEWAL_STATUS_NAME" ;;
  }

  dimension: renewal_type {
    type: string
    sql: ${TABLE}."RENEWAL_TYPE" ;;
  }

  dimension: renewal_type_name {
    type: string
    sql: ${TABLE}."RENEWAL_TYPE_NAME" ;;
  }

  dimension: sentiment_change {
    type: string
    sql: ${TABLE}."SENTIMENT_CHANGE" ;;
  }

  dimension: sentiment_change_name {
    type: string
    sql: ${TABLE}."SENTIMENT_CHANGE_NAME" ;;
  }

  dimension: company_forecast_name {
    type: string
    sql: ${TABLE}."COMPANY_FORECAST_NAME" ;;
  }

  dimension: current_term_page_forecast {
    type: number
    sql: ${TABLE}."CURRENT_TERM_PAGE_FORECAST" ;;
  }

  dimension: projected_run_rate {
    type: number
    sql: ${TABLE}."PROJECTED_RUN_RATE" ;;
  }

  dimension: contracted_pages_over_term {
    type: number
    sql: ${TABLE}."CONTRACTED_PAGES_OVER_TERM" ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      account_id,
      account_name,
      opp_arr,
      opp_net_new_arr,
      csm_name,
      notes,
      renewal_status,
      renewal_status_name,
      renewal_type,
      renewal_type_name,
      company_forecast_name,
      current_term_page_forecast,
      projected_run_rate
    ]
  }
}
