  view: current_fq_renewals_growth_acounting {
    sql_table_name: (select * from dev.erikjones.current_fq_renewals);;

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

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    label: "# Opps"
  }

  measure: total_potential_churn {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    label: "Total ARR up for Renewal"
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
    label: "Total ARR Churned"
  }

  measure: flat_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_flat"]
    drill_fields: [detail*]
    label: "# Flat Renewal Opps"
  }

  measure: flat_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_flat"]
    drill_fields: [detail*]
    label: "Total ARR Flat Renewals"
  }

  measure: arr_churn_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_churn"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Churn Opps"
  }

  measure: arr_churn_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_churn"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Churn"
  }

  measure: arr_churn_amount {
    type: sum
    sql: ${renewal_arr_change} ;;
    filters: [renewal_type: "renewal_churn"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Churn Amount "
  }

  measure: expansion_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "Total # Renewal Expansion"
  }

  measure: expansion_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "Total ARR Renewal Expansion"
  }

  measure: expansion_amount {
    type: sum
    sql: ${renewal_arr_change} ;;
    filters: [renewal_type: "renewal_expansion"]
    drill_fields: [detail*]
    label: "Total AR Renewal Expansion Amount"
  }

  measure: outstanding_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [outstanding_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "# Past Renewal Date Opps"
  }

  measure: outstanding_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [outstanding_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "Total Past Renewal ARR"
  }

  measure: upcoming_opps {
    type: count_distinct
    sql_distinct_key: ${existing_opp_id} ;;
    sql: ${existing_opp_id} ;;
    filters: [upcoming_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "Total # Upcoming Renewal Opps"
  }

  measure: upcoming_arr {
    type: sum
    sql: -1*${potential_churn_amount} ;;
    filters: [upcoming_renewal_flag: "1"]
    drill_fields: [detail*]
    label: "Total ARR Upcoming Renewals"
  }

  measure: net_renewal_amount {
    type: sum
    sql: ${renewal_arr_change} ;;
    drill_fields: [detail*]
    label: "Net Renewal Amount"
  }

  measure: current_quarter_renewal_retention {
    type: number
    sql: ${net_renewal_amount} / ${total_potential_churn} ;;
    label: "Current QTR ARR Renewal Retention"
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
