view: pages_processed {
    sql_table_name: (select * from "DEV"."CX"."CUSTOMER_DATA_FCT_MONTHLY_PAGES");;
    drill_fields: [detail*]

    dimension: customer {
      type: string
      sql: ${TABLE}."CUSTOMER" ;;
    }

    dimension_group: first_full_month {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."FIRST_FULL_MONTH" ;;
    }

    dimension_group: dte_month {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."DTE_MONTH" ;;
    }

    dimension_group: cohort_start_qtr {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."COHORT_START_QTR" ;;
    }

    dimension_group: dte_qtr {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."DTE_QTR" ;;
    }

    dimension: num_months_sending_data {
      type: number
      sql: ${TABLE}."NUM_MONTHS_SENDING_DATA" ;;
    }

    dimension_group: last_month_sending_data {
      type: time
      timeframes: [date, month, quarter, year]
      sql: ${TABLE}."LAST_MONTH_SENDING_DATA" ;;
    }

    dimension: num_months_since {
      type: number
      sql: ${TABLE}."NUM_MONTHS_SINCE" ;;
    }

    dimension: num_quarters_since {
      type: number
      sql: ${TABLE}."NUM_QUARTERS_SINCE" ;;
    }

    dimension: total_pages_created {
      type: number
      sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
    }

    dimension: diff_monthly_pages {
      type: number
      sql: ${TABLE}."DIFF_MONTHLY_PAGES" ;;
    }

    dimension: monthly_pages_increase_fl {
      type: number
      sql: ${TABLE}."MONTHLY_PAGES_INCREASE_FL" ;;
    }

    dimension: monthly_pages_decrease_fl {
      type: number
      sql: ${TABLE}."MONTHLY_PAGES_DECREASE_FL" ;;
    }

  dimension: perc_change_monthly_pages {
    type: number
    sql: ${TABLE}."PERC_CHANGE_MONTHLY_PAGES" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_customers {
    type: count_distinct
    sql: ${customer} ;;
    drill_fields: [detail*]
  }

  measure: pages_processed {
    type: sum
    sql:  ${total_pages_created} ;;
    link: {
      label: "Page Volume Details Dashboard"
      url: "https://hyperscience.cloud.looker.com/dashboards-next/42"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  measure: avg_percent_change {
    type: median
    sql: ${perc_change_monthly_pages} ;;
    label: "Average Monthly Percent Change"
  }

    set: detail {
      fields: [
        customer,
        num_months_sending_data,
        total_pages_created,
        diff_monthly_pages,
        monthly_pages_increase_fl,
        monthly_pages_decrease_fl
      ]
    }
  }
