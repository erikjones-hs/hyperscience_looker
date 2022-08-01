view: usage_combined {
  sql_table_name: (select * from prod.customer_usage.usage_all_customers);;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte_month {
    type: time
    timeframes: [raw, week, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: sfdc_account_name {
    type: string
    sql: ${TABLE}."SFDC_ACCOUNT_NAME" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  dimension: latest_date_received {
    type: date
    sql: ${TABLE}."LATEST_DATE_RECEIVED" ;;
  }

  dimension: first_date_received {
    type: date
    sql: ${TABLE}."FIRST_DATE_RECEIVED" ;;
  }

  measure: total_pages_created {
    type: sum
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  measure: prev_pages_created {
    type: sum
    sql: ${TABLE}."PREV_PAGES_CREATED" ;;
  }

  measure: prev2_pages_created {
    type: sum
    sql: ${TABLE}."PREV2_PAGES_CREATED" ;;
  }

  measure: prev3_pages_created {
    type: sum
    sql: ${TABLE}."PREV3_PAGES_CREATED" ;;
  }

  measure: mom_direction_sum {
    type: sum
    sql: ${TABLE}."MOM_DIRECTION_SUM" ;;
  }

  measure: mean_pages_processed {
    type: sum
    sql: ${TABLE}."MEAN_PAGES_PROCESSED" ;;
    label: "Mean (Pages Processed)"
  }

  measure: std_dev_pages_processed {
    type: sum
    sql: ${TABLE}."STD_DEV_PAGES_PROCESSED" ;;
    label: "Standard Deviation (pages Processed)"
  }

  measure: ucl_3sd {
    type: number
    sql: ${mean_pages_processed} + (3 * ${std_dev_pages_processed}) ;;
    label: "Upper Control Limit (+3 SD)"
  }

  measure: lcl_3sd {
    type: number
    sql: ${mean_pages_processed} - (3 * ${std_dev_pages_processed}) ;;
    label: "Lower Control Limit (-3 SD)"
  }

  measure: ucl_2sd {
    type: number
    sql: ${mean_pages_processed} + (2 * ${std_dev_pages_processed}) ;;
    label: "Upper Control Limit (+2 SD)"
  }

  measure: lcl_2sd {
    type: number
    sql: ${mean_pages_processed} - (2 * ${std_dev_pages_processed}) ;;
    label: "Lower Control Limit (-2 SD)"
  }

  measure: ucl_1sd {
    type: number
    sql: ${mean_pages_processed} + (1 * ${std_dev_pages_processed}) ;;
    label: "Upper Control Limit (+1 SD)"
  }

  measure: lcl_1sd {
    type: number
    sql: ${mean_pages_processed} - (1 * ${std_dev_pages_processed}) ;;
    label: "Lower Control Limit (-1 SD)"
  }

  measure: num_months_sending_data {
    type: count_distinct
    sql: ${dte_month_month} ;;
    label: "# Months Sending Data"
  }

  measure: above_ucl {
    type:  number
    sql: CASE WHEN ${total_pages_created} > ${ucl_1sd} then 1 else 0 end ;;
    label: "Above UCL (Flag)"
  }

  measure: below_ucl {
    type:  number
    sql: CASE WHEN ${total_pages_created} < ${lcl_1sd} then 1 else 0 end ;;
    label: "Below UCL (Flag)"
  }

  measure: diff_from_mean {
    type: sum
    sql: ${TABLE}."DIFF_FROM_MEAN" ;;
  }

  measure: diff_from_mean_direction {
    type: sum
    sql: ${TABLE}."DIFF_FROM_MEAN_DIRECTION" ;;
  }

  measure: prev_diff_from_mean_direction {
    type: sum
    sql: ${TABLE}."PREV_DIFF_FROM_MEAN_DIRECTION" ;;
  }

  measure: prev2_diff_from_mean_direction {
    type: sum
    sql: ${TABLE}."PREV2_DIFF_FROM_MEAN_DIRECTION" ;;
  }

  measure: direction_sum {
    type: sum
    sql: ${TABLE}."DIRECTION_SUM" ;;
  }

  measure: cross_over_point_fl {
    type: sum
    sql: ${TABLE}."CROSS_OVER_POINT_FL" ;;
  }

  measure: num_cross_over_points {
    type: sum
    sql: ${TABLE}."NUM_CROSS_OVER_POINTS" ;;
  }

  measure: long_term_trend_up_fl {
    type: sum
    sql: ${TABLE}."LONG_TERM_TREND_UP_FL" ;;
  }

  measure: short_term_trend_up_fl {
    type: sum
    sql: ${TABLE}."SHORT_TERM_TREND_UP_FL" ;;
  }

  measure: long_term_trend_down_fl {
    type: sum
    sql: ${TABLE}."LONG_TERM_TREND_DOWN_FL" ;;
  }

  measure: short_term_trend_down_fl {
    type: sum
    sql: ${TABLE}."SHORT_TERM_TREND_DOWN_FL" ;;
  }

  measure: down_fl {
    type: sum
    sql: ${TABLE}."DOWN_FL" ;;
  }

  measure: up_fl {
    type: sum
    sql: ${TABLE}."UP_FL" ;;
  }

  measure: customer_direction {
    type: sum
    sql: ${TABLE}."CUSTOMER_DIRECTION" ;;
    label: "Customer Direction"
  }


  set: detail {
    fields: [customer, dte_month_date, total_pages_created, mean_pages_processed, std_dev_pages_processed]
  }
}
