view: fct_arr_partners {
  sql_table_name: (select * from prod.monthly_kpis.opps_partner_arr);;

  dimension_group: date_month {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DATE_MONTH" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: opp_partner_account {
    type: string
    sql: ${TABLE}."OPP_PARTNER_ACCOUNT" ;;
  }

  dimension: partner_account_name {
    type: string
    sql: ${TABLE}."PARTNER_ACCOUNT_NAME" ;;
  }

  dimension: is_ibm_partner {
    type: number
    sql: CASE WHEN ${opp_partner_account} in ('001Dm000002jS2nIAE','0011R00002e99gWQAQ','0013600001hWo0yAAC') then 1 else 0 end ;;
    label: "IBM Partner Flag"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: opp_arr {
    type: sum
    sql: ${TABLE}."OPP_ARR" ;;
    label: "Opp ARR"
  }

  measure: account_arr {
    type: sum
    sql: ${TABLE}."ACCOUNT_ARR" ;;
    label: "Account ARR"
  }

  set: detail {
    fields: [
      date_month_date,
      account_id,
      account_name,
      opp_id,
      opp_name,
      opp_arr,
      account_arr,
      opp_partner_account,
      partner_account_name
    ]
  }
}
