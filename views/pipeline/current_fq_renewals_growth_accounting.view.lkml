  view: current_fq_renewals_growth_acounting {
    sql_table_name: (select * from prod.renewals.fct_renewals);;

  dimension_group: renewal_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."RENEWAL_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: existing_opp_id {
    type: string
    sql: ${TABLE}."EXISTING_OPP_ID" ;;
  }

  dimension: existing_opp_name {
    type: string
    sql: ${TABLE}."EXISTING_OPP_NAME" ;;
  }

  dimension: potential_churn_amount {
    type: number
    sql: ${TABLE}."POTENTIAL_CHURN_AMOUNT" ;;
  }

  dimension: has_renewed_flag {
    type: number
    sql: ${TABLE}."HAS_RENEWED_FLAG" ;;
  }

  dimension: renewal_arr_change {
    type: number
    sql: ${TABLE}."RENEWAL_ARR_CHANGE" ;;
  }

  dimension: renewal_type {
    type: string
    sql: ${TABLE}."RENEWAL_TYPE" ;;
  }

  dimension: has_churned_flag {
    type: number
    sql: ${TABLE}."HAS_CHURNED_FLAG" ;;
  }

  dimension: outstanding_renewal_flag {
    type: number
    sql: ${TABLE}."OUTSTANDING_RENEWAL_FLAG" ;;
  }

  dimension: upcoming_renewal_flag {
    type: number
    sql: ${TABLE}."UPCOMING_RENEWAL_FLAG" ;;
  }

  dimension: existing_opp_renewal_date {
    type: date
    sql: ${TABLE}."EXISTING_OPP_RENEWAL_DATE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    label: "# Opps up for Renwaal"
  }

  measure: total_potential_churn {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    label: "ARR up for Renewal"
  }

  measure: churned_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [has_churned_flag: "1"]
    drill_fields: [detail*]
    label: "# Churned Opps"
  }

  measure: churned_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [has_churned_flag: "1"]
    drill_fields: [detail*]
    label: "ARR Churned"
  }

  measure: churned_arr_waterfall {
    type: sum
    sql: ${potential_churn_amount} ;;
    filters: [has_churned_flag: "1"]
    drill_fields: [detail*]
    label: "ARR Churned (Waterfall)"
  }

  measure: flat_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_flat"]
    drill_fields: [detail*]
    label: "# Flat Opps"
  }

  measure: flat_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_flat"]
    drill_fields: [detail*]
    label: "ARR Flat Renewals"
  }

  measure: arr_churn_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_arr_churn"]
    drill_fields: [detail*]
    label: "# ARR Churn"
  }

  measure: arr_churn_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_arr_churn"]
    drill_fields: [detail*]
    label: "ARR Renewal w/ Churn"
  }

  measure: arr_churn_amount {
    type: sum
    sql: -1*${renewal_arr_change} ;;
    filters: [renewal_type: "renewal_arr_churn"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Churn Amount"
  }

  measure: arr_churn_amount_waterfall {
    type: sum
    sql: ${renewal_arr_change} ;;
    filters: [renewal_type: "renewal_arr_churn"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Churn Amount (Waterfall)"
  }

  measure: expansion_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "# Renewal w/ Expansion"
  }

  measure: expansion_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "ARR Renewal w/ Expansion"
  }

  measure: expansion_amount {
    type: sum
    sql: ${renewal_arr_change} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Expansion Amount"
  }

  measure: past_due_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [outstanding_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "# Past Due Opps"
  }

  measure: past_due_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [outstanding_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "ARR Past Due"
  }

  measure: upcoming_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [upcoming_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "# Upcoming Opps"
  }

  measure: upcoming_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [upcoming_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "ARR Upcoming"
  }

  measure: outstanding_opps {
    type: number
    sql: ${past_due_opps} + ${upcoming_opps} ;;
    label: "# Outstanding Renewals"
  }

  measure: outstanding_arr {
    type: number
    sql: ${past_due_arr} + ${upcoming_arr} ;;
    label: "ARR Outstanding"
  }

  measure: ending_renewal_amount {
    type: number
    sql: ${total_potential_churn} + ${expansion_amount} + ${arr_churn_amount_waterfall} + ${churned_arr_waterfall} ;;
    label: "Expected EOQ Renewal Amount"
  }

  measure: current_qtr_renewal_retention {
    type: number
    sql: ${ending_renewal_amount} / ${total_potential_churn} ;;
    label: "Current Qtr. Renewal ARR Retention"
  }

  measure: perc_expanion_renewals {
    type: number
    sql: 100*(${expansion_opps} / NULLIFZERO(${num_opps})) ;;
    label: "% Expansion"
    value_format:"0.0\%"
  }

  measure: perc_arr_churn_renewals {
    type: number
    sql: 100*(${arr_churn_opps} / NULLIFZERO(${num_opps})) ;;
    label: "% ARR Churn"
    value_format:"0.0\%"
  }

  measure: perc_logo_churn_renewals {
    type: number
    sql: 100*(${churned_opps} / NULLIFZERO(${num_opps})) ;;
    label: "% Churn"
    value_format:"0.0\%"
  }

  measure: perc_flat_renewals {
    type: number
    sql: 100*(${flat_opps} / NULLIFZERO(${num_opps})) ;;
    label: "% Flat"
    value_format:"0.0\%"
  }

    set: detail {
      fields: [
        renewal_month_date,
        account_id,
        account_name,
        existing_opp_id,
        existing_opp_name,
        potential_churn_amount,
        has_renewed_flag,
        renewal_arr_change,
        renewal_type,
        has_churned_flag,
        outstanding_renewal_flag,
        upcoming_renewal_flag,
        existing_opp_renewal_date
      ]
    }

}
