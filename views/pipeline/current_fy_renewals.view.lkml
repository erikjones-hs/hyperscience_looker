  view: current_fy_renewals {
    sql_table_name: (select * from dev.erikjones.renewals_current_fy_opps);;
    drill_fields: [detail*]

  dimension_group: renewal_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RENEWAL_MONTH" ;;
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

  dimension: existing_opp_id {
    type: string
    sql: ${TABLE}."EXISTING_OPP_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: existing_opp_name {
    type: string
    sql: ${TABLE}."EXISTING_OPP_NAME" ;;
  }

  dimension: potential_churn_amount {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT" ;;
  }

  dimension_group: existing_opp_renewal_date {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."EXISTING_OPP_RENEWAL_DATE" ;;
  }

  dimension: open_opp_id {
    type: string
    sql: ${TABLE}."OPEN_OPP_ID" ;;
    link: {
      label: "Salesforce"
      url: "https://hyperscience.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://salesforce.com/favicon.ico"
    }
  }

  dimension: open_opp_name {
    type: string
    sql: ${TABLE}."OPEN_OPP_NAME" ;;
  }

  dimension: open_opp_arr {
    type: number
    sql: ${TABLE}."OPEN_OPP_ARR" ;;
  }

  dimension: open_opp_net_new_arr_raw {
    type: number
    sql: ${TABLE}."OPEN_OPP_NET_NEW_ARR_RAW" ;;
  }

  dimension_group: open_opp_close_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPEN_OPP_CLOSE_DTE" ;;
  }

  dimension: net_new_arr {
    type: number
    sql: ${TABLE}."NET_NEW_ARR" ;;
  }

  dimension: renewal_type {
    type: string
    sql: ${TABLE}."RENEWAL_TYPE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    label: "# Opportunities"
    drill_fields: [detail*]
  }

  measure: churn_potential {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    label: "Potential ARR Churn"
  }

  measure: open_arr {
    type: sum
    sql: ${open_opp_arr} ;;
    label: "Open ARR"
  }

  measure: open_net_new_arr {
    type: sum
    sql: ${net_new_arr} ;;
    label: "Open Net New ARR"
  }

  measure: open_flat_arr {
    type: sum
    sql: ${open_opp_arr} ;;
    filters: [renewal_type: "flat"]
    label: "Flat Renewal ARR"
  }

  measure: open_expansion_arr {
    type: sum
    sql: ${net_new_arr} ;;
    filters: [renewal_type: "expansion"]
    label: "Expansion Renewal ARR"
  }

  measure: open_churn_arr {
    type: sum
    sql: -1*${net_new_arr} ;;
    filters: [renewal_type: "churn"]
    label: "Churn Renewal ARR"
  }

  measure: recurring_of_churn_arr {
    type: sum
    sql: ${open_opp_arr} ;;
    filters: [renewal_type: "churn"]
    label: "Recurring w/ Churn ARR"
  }

  measure: recurring_of_expansion_arr {
    type: sum
    sql: -1 * ${potential_churn_amount} ;;
    filters: [renewal_type: "expansion"]
    label: "Recurring w/ Expansion ARR"
  }

  measure: total_recurring {
    type:  number
    sql: ${recurring_of_expansion_arr} + ${recurring_of_churn_arr} ;;
    label: "Recurring ARR"
  }

  measure: no_open_arr {
    type: sum
    sql: CASE WHEN ${open_opp_arr} IS NULL then (-1 * ${potential_churn_amount}) else 0 END;;
    label: "No Open Opp (ARR)"
  }

  set: detail {
    fields: [
      renewal_month_date,
      account_id,
      account_name,
      existing_opp_id,
      existing_opp_name,
      potential_churn_amount,
      existing_opp_renewal_date_date,
      open_opp_id,
      open_opp_name,
      open_opp_arr,
      open_opp_net_new_arr_raw,
      open_opp_close_dte_date,
      net_new_arr,
      renewal_type
    ]
  }
}
