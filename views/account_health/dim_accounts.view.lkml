view: dim_accounts {
  sql_table_name: PROD.PRODUCT_REPORTING.DIM_ACCOUNTS ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.ACCOUNT_NAME ;;
    label: "Account Name"
  }

  dimension: global_account_id {
    type: string
    sql: ${TABLE}.GLOBAL_ACCOUNT_ID ;;
    label: "Global Account ID"
  }

  dimension: customer_status {
    type: string
    sql: ${TABLE}.CUSTOMER_STATUS ;;
    label: "Customer Status"
  }

  dimension: account_record_type {
    type: string
    sql: ${TABLE}.ACCOUNT_RECORD_TYPE ;;
    label: "Account Record Type"
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.ACCOUNT_OWNER ;;
    label: "Account Owner"
  }

  dimension: solution_architect {
    type: string
    sql: ${TABLE}.SOLUTION_ARCHITECT ;;
    label: "Solution Architect"
  }

  dimension: msp_bpo_owner {
    type: string
    sql: ${TABLE}.MSP_BPO_OWNER ;;
    label: "MSP/BPO Owner"
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
    label: "Platform"
  }

  dimension: sales_region {
    type: string
    sql: ${TABLE}.SALES_REGION ;;
    label: "Sales Region"
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}.BUSINESS_UNIT ;;
    label: "Business Unit"
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.INDUSTRY ;;
    label: "Industry"
  }

  dimension: current_prod_version_number {
    type: number
    sql: ${TABLE}.CURRENT_PROD_VERSION_NUMBER ;;
    label: "Current Prod Version"
  }

  dimension_group: golive_date_sfdc {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.GOLIVE_DATE_SFDC ;;
    label: "Go-Live Date (SFDC)"
  }

  dimension: csm_account_score {
    type: string
    sql: ${TABLE}.CSM_ACCOUNT_SCORE ;;
    label: "CSM Account Score"
  }

  dimension: active_subscription_opportunity_id {
    type: string
    sql: ${TABLE}.ACTIVE_SUBSCRIPTION_OPPORTUNITY_ID ;;
    hidden: yes
  }

  dimension: upcoming_renewal_opportunity_id {
    type: string
    sql: ${TABLE}.UPCOMING_RENEWAL_OPPORTUNITY_ID ;;
    hidden: yes
  }

  measure: total_p1_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P1_TICKETS ;;
    label: "Total P1 Tickets"
  }
  measure: open_p1_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P1_TICKETS ;;
    label: "Open P1 Tickets"
  }
  measure: total_p2_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P2_TICKETS ;;
    label: "Total P2 Tickets"
  }
  measure: open_p2_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P2_TICKETS ;;
    label: "Open P2 Tickets"
  }
  measure: total_p3_tickets {
    type: sum
    sql: ${TABLE}.TOTAL_P3_TICKETS ;;
    label: "Total P3 Tickets"
  }
  measure: open_p3_tickets {
    type: sum
    sql: ${TABLE}.OPEN_P3_TICKETS ;;
    label: "Open P3 Tickets"
  }

  measure: count {
    type: count
    label: "Number of Accounts"
  }
}
