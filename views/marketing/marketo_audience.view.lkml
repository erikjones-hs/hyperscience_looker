view: Marketo_Audience {
    sql_table_name: (select * from dev.marketing.marketo_audience_view) ;;


  dimension: MARKETO_ID  {
    primary_key: yes
    type: string
    sql:  ${TABLE}.MARKETO_ID ;;
  }


  dimension_group: CREATED_DATE {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_DATE ;;
  }

  dimension: ACTIVE_LEAD {
    type: yesno
    sql: ${TABLE}.ACTIVE_LEAD ;;
  }

  dimension: IS_TIED_TO_AN_ACTIVE_ACCOUNT {
    type: yesno
    sql: ${TABLE}.IS_TIED_TO_AN_ACTIVE_ACCOUNT ;;
  }

  dimension: LEAD_STATUS {
    type: string
    sql: ${TABLE}.LEAD_STATUS ;;
  }

  dimension: LIFECYCLE_STATUS {
    type: string
    sql: ${TABLE}.LIFECYCLE_STATUS ;;
  }

  dimension: SFDC_CONTACT_ID {
    type: string
    sql: ${TABLE}.SFDC_CONTACT_ID ;;
  }

  dimension: SFDC_LEAD_ID {
    type: string
    sql: ${TABLE}.SFDC_LEAD_ID ;;
  }

  dimension: SFDC_LEAD_OWNER_ID {
    type: string
    sql: ${TABLE}.SFDC_LEAD_OWNER_ID ;;
  }

  dimension: SFDC_ACCOUNT_ID {
    type: string
    sql: ${TABLE}.SFDC_ACCOUNT_ID ;;
  }

  dimension: SFDC_TYPE {
    type: string
    sql: ${TABLE}.SFDC_TYPE ;;
  }

  dimension: GLOBAL_REGION {
    type: string
    sql: ${TABLE}.GLOBAL_REGION ;;
  }

  dimension: COUNTRY {
    type: string
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: SALES_REGION {
    type: string
    sql: ${TABLE}.SALES_REGION ;;
  }

  dimension: EMAIL {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: EMAIL_MATCHES_COMPANY_NAME {
    type: string
    sql: ${TABLE}.EMAIL_MATCHES_COMPANY_NAME ;;
  }

  dimension: FIRST_NAME {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: LAST_NAME {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: FULL_NAME {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: JOB_TITLE {
    type: string
    sql: ${TABLE}.JOB_TITLE ;;
  }

  dimension: PERSONA {
    type: string
    sql: ${TABLE}.PERSONA ;;
  }

  dimension: COMPANY {
    type: string
    sql: ${TABLE}.COMPANY ;;
  }

  dimension: PROFILE_SCORE {
    type: string
    sql: ${TABLE}.PROFILE_SCORE ;;
  }

  dimension: ENGAGEMENT_SCORE {
    type: string
    sql: ${TABLE}.ENGAGEMENT_SCORE ;;
  }

  dimension: LEAD_SCORE {
    type: string
    sql: ${TABLE}.LEAD_SCORE ;;
  }

  dimension: SEGMENT_MEMBERSHIP {
    type: string
    sql: ${TABLE}.SEGMENT_MEMBERSHIP ;;
  }

  dimension: SEGMENTATION_MEMBERSHIP {
    type: string
    sql: ${TABLE}.SEGMENTATION_MEMBERSHIP ;;
  }

  measure: AUDIENCE {
    type: count_distinct
    sql: ${MARKETO_ID} ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
