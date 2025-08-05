view: fct_opportunities {
  sql_table_name: PROD.ACCOUNT_ANALYTICS.FCT_OPPORTUNITIES ;;

  dimension: opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.OPPORTUNITY_ID ;;
    label: "Opportunity ID"
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    hidden: yes
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.OPPORTUNITY_NAME ;;
    label: "Opportunity Name"
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.STAGE_NAME ;;
    label: "Stage"
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}.OPPORTUNITY_OWNER ;;
    label: "Opportunity Owner"
  }

  dimension: main_partner_account_id {
    type: string
    sql: ${TABLE}.MAIN_PARTNER_ACCOUNT_ID ;;
    hidden: yes
  }

  dimension: main_partner_account {
    type: string
    sql: ${TABLE}.MAIN_PARTNER_ACCOUNT ;;
    label: "Main Partner Account"
  }

  dimension: revenue_type {
    type: string
    sql: ${TABLE}.REVENUE_TYPE ;;
    label: "Revenue Type"
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.ARR ;;
    value_format_name: usd_0
    label: "ARR"
  }

  dimension: net_new_arr {
    type: number
    sql: ${TABLE}.NET_NEW_ARR ;;
    value_format_name: usd_0
    label: "Net New ARR"
  }

  dimension: services_nrr {
    type: number
    sql: ${TABLE}.SERVICES_NRR ;;
    value_format_name: usd_0
    label: "Services NRR"
  }

  dimension_group: subscription_start_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.SUBSCRIPTION_START_DATE ;;
    label: "Subscription Start Date"
  }

  dimension_group: subscription_end_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.SUBSCRIPTION_END_DATE ;;
    label: "Subscription End Date"
  }

  dimension: subscription_term_months {
    type: number
    sql: ${TABLE}.SUBSCRIPTION_TERM_MONTHS ;;
    label: "Subscription Term (Months)"
  }

  dimension: page_volume_annual {
    type: number
    sql: ${TABLE}.PAGE_VOLUME_ANNUAL ;;
    label: "Page Volume Annual"
  }

  dimension: deployment_type {
    type: string
    sql: ${TABLE}.DEPLOYMENT_TYPE ;;
    label: "Deployment Type"
  }

  dimension_group: close_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.CLOSE_DATE ;;
    label: "Close Date"
  }

  dimension_group: go_live_date_goal {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.GO_LIVE_DATE_GOAL ;;
    label: "Go-Live Goal Date"
  }

  dimension_group: go_live_date_actual {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.GO_LIVE_DATE_ACTUAL ;;
    label: "Go-Live Actual Date"
  }

  dimension: doc_types {
    type: string
    sql: ${TABLE}.DOC_TYPES ;;
    label: "Doc Types"
  }

  dimension: is_active_subscription {
    type: yesno
    sql: ${TABLE}.IS_ACTIVE_SUBSCRIPTION ;;
    label: "Is Active Subscription?"
  }

  dimension: is_upcoming_renewal {
    type: yesno
    sql: ${TABLE}.IS_UPCOMING_RENEWAL ;;
    label: "Is Upcoming Renewal?"
  }

  measure: count {
    type: count
    label: "Number of Opportunities"
  }
}
