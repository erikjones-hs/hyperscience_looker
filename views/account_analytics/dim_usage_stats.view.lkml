view: dim_usage_stats {
  sql_table_name: PROD.ACCOUNT_ANALYTICS.DIM_USAGE_STATS ;;
  label: "Usage Stats"

  dimension: account_id {
    primary_key: yes
    hidden: yes
    description: "The unique identifier for the Salesforce account."
    type: string
    sql: ${TABLE}.account_id ;;
    label: "Account ID"
  }

  dimension: pipeline_source {
    description: "Indicates whether the usage data was reported automatically or manually."
    type: string
    sql: ${TABLE}.pipeline_source ;;
    label: "Pipeline Source"
  }

  dimension_group: latest_date_received {
    description: "The most recent date that usage data was received for this account."
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.latest_date_received ;;
    label: "Latest Date Received"
  }

  dimension: num_days_since_last_received {
    description: "The number of days that have passed since usage data was last received."
    type: number
    sql: ${TABLE}.num_days_since_last_received ;;
    label: "Number Days Since Last Received"
  }

  measure: count {
    type: count
    drill_fields: [dim_accounts.account_name]
  }
}
