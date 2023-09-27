view: nrr {
  sql_table_name: (select * from prod.monthly_kpis.nrr);;

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

  dimension_group: opp_start_dte {
    type: time
    timeframes: [raw, date, month, month_num, month_name, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."OPP_START_DTE" ;;
  }

  measure: opp_services_nrr {
    type: sum
    sql: ${TABLE}."OPP_SERVICES_NRR" ;;
    value_format: "$#,##0"
    label: "NRR"
  }

  set: detail {
    fields: [
      account_id,
      account_name,
      opp_id,
      opp_name,
      opp_start_dte_date,
      opp_services_nrr
    ]
  }
}
