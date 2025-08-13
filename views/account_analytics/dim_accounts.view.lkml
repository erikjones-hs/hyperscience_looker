view: dim_accounts {
  sql_table_name: PROD.MARTS_ACCOUNT_ANALYTICS.DIM_ACCOUNTS ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  dimension: global_account_id {
    type: string
    sql: ${TABLE}.GLOBAL_ACCOUNT_ID ;;
    label: "Global Account ID"
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.ACCOUNT_NAME ;;
    label: "Account Name"
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

  dimension: msp_bpo_owner_id {
    type: string
    hidden: yes
    sql: ${TABLE}.MSP_BPO_OWNER_ID ;;
    label: "MSP/BPO Owner Id"
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

  dimension: contracted_pages_annual {
    type: number
    sql: ${TABLE}.CONTRACTED_PAGES_ANNUAL ;;
    label: "Contracted Pages Annual"
  }

  dimension: upcoming_renewal_opportunity_id {
    type: string
    sql: ${TABLE}.UPCOMING_RENEWAL_OPPORTUNITY_ID ;;
    label: "Upcoming Renewal Opportunity Id"
  }

  dimension: is_current_customer {
    type: yesno
    sql: ${TABLE}.IS_CURRENT_CUSTOMER ;;
    label: "Is Current Customer"
  }

  measure: count {
    type: count
    label: "Number of Accounts"
  }
}
