view: dim_usage_stats {
  sql_table_name: PROD.MARTS_ACCOUNT_ANALYTICS.DIM_USAGE_STATS ;;
  label: "Usage Stats"

  dimension: account_id {
    primary_key: yes
    hidden: yes
    description: "The unique identifier for the Salesforce account."
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
    label: "Account ID"
  }

  dimension: utilization_health {
    description: "Indicates the health of the utilization data."
    type: string
    sql: ${TABLE}.UTILIZATION_HEALTH ;;
    label: "Utilization Health"
  }

  dimension: ctd_pages_completed {
    description: "Number of pages completed to date."
    type: number
    sql: ${TABLE}.CTD_PAGES_COMPLETED ;;
    label: "CTD Pages Completed"
  }

  dimension: ctd_utilization {
    description: "Utilization rate to date."
    type: number
    sql: ${TABLE}.CTD_UTILIZATION ;;
    label: "CTD Utilization"
  }

  dimension: ctd_utilization_percent {
    description: "Utilization rate to date as a percentage string."
    type: string
    sql: ${TABLE}.CTD_UTILIZATION_PERCENT ;;
    label: "CTD Utilization Percent"
  }

  dimension: projected_pages_completed_at_next_renewal {
    description: "Projected pages completed at next renewal."
    type: number
    sql: ${TABLE}.PROJECTED_PAGES_COMPLETED_AT_NEXT_RENEWAL ;;
    label: "Projected Pages Completed at Next Renewal"
  }

  dimension: projected_utilization_at_next_renewal {
    description: "Projected utilization at next renewal."
    type: number
    sql: ${TABLE}.PROJECTED_UTILIZATION_AT_NEXT_RENEWAL ;;
    label: "Projected Utilization at Next Renewal"
  }

  dimension: projected_utilization_at_next_renewal_percent {
    description: "Projected utilization at next renewal as a percentage string."
    type: string
    sql: ${TABLE}.PROJECTED_UTILIZATION_AT_NEXT_RENEWAL_PERCENT ;;
    label: "Projected Utilization at Next Renewal Percent"
  }

  dimension: utilization_data_health {
    description: "Indicates if the utilization data is healthy."
    type: string
    sql: ${TABLE}.UTILIZATION_DATA_HEALTH ;;
    label: "Utilization Data Health"
  }

  dimension: monthly_utilization {
    description: "Utilization for the most recent month"
    type: number
    sql: ${TABLE}.MONTHLY_UTILIZATION ;;
    label: "Monthly Utilization"
  }

  dimension: monthly_utilization_percent {
    description: "Utilization for the most recent month as a percentage string."
    type: string
    sql: ${TABLE}.MONTHLY_UTILIZATION_PERCENT ;;
    label: "Monthly Utilization Percent"
  }

  dimension: contracted_pages_monthly {
    description: "Contracted pages per month."
    type: number
    sql: ${TABLE}.CONTRACTED_PAGES_MONTHLY ;;
    label: "Contracted Pages Monthly"
  }

  dimension: contracted_pages_annual {
    description: "Contracted pages per year."
    type: number
    sql: ${TABLE}.CONTRACTED_PAGES_ANNUAL ;;
    label: "Contracted Pages Annual"
  }

  dimension: contracted_pages {
    description: "Total contracted pages."
    type: number
    sql: ${TABLE}.CONTRACTED_PAGES ;;
    label: "Contracted Pages"
  }

  dimension: pages_mom_change {
    description: "Month-over-month change in pages processed."
    type: number
    sql: ${TABLE}.PAGES_MOM_CHANGE ;;
    label: "Pages MoM Change"
  }

  dimension: most_recent_month_pages_processed {
    description: "Pages processed in the most recent month."
    type: number
    sql: ${TABLE}.MOST_RECENT_MONTH_PAGES_PROCESSED ;;
    label: "Most Recent Month Pages Processed"
  }

  dimension: pages_3_month_average {
    description: "3-month average pages processed."
    type: number
    sql: ${TABLE}.PAGES_3_MONTH_AVERAGE ;;
    label: "Pages 3-Month Average"
  }

  dimension: pages_6_month_average {
    description: "6-month average pages processed."
    type: number
    sql: ${TABLE}.PAGES_6_MONTH_AVERAGE ;;
    label: "Pages 6-Month Average"
  }

  dimension: pages_12_month_average {
    description: "12-month average pages processed."
    type: number
    sql: ${TABLE}.PAGES_12_MONTH_AVERAGE ;;
    label: "Pages 12-Month Average"
  }

  dimension: pages_rolling_12_months {
    description: "Rolling 12-month pages processed."
    type: number
    sql: ${TABLE}.PAGES_ROLLING_12_MONTHS ;;
    label: "Pages Rolling 12-Months"
  }

  dimension: ytd_pages_processed {
    description: "Year-to-date pages processed."
    type: number
    sql: ${TABLE}.YTD_PAGES_PROCESSED ;;
    label: "YTD Pages Processed"
  }

  dimension_group: latest_date_received {
    description: "The most recent date that usage data was received for this account."
    type: time
    timeframes: [ raw, date, week, month, quarter, year ]
    sql: ${TABLE}.LATEST_DATE_RECEIVED ;;
    label: "Latest Date Received"
  }

  dimension: num_days_since_last_received {
    description: "The number of days that have passed since usage data was last received."
    type: number
    sql: ${TABLE}.NUM_DAYS_SINCE_LAST_RECEIVED ;;
    label: "Number Days Since Last Received"
  }

  dimension: pipeline_source {
    description: "Indicates whether the usage data was reported automatically or manually."
    type: string
    sql: ${TABLE}.PIPELINE_SOURCE ;;
    label: "Pipeline Source"
  }

  measure: count {
    type: count
    drill_fields: [dim_accounts.account_name]
  }
}
