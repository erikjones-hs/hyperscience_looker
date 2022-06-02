view: saas_metrics {
    sql_table_name: (select * from prod.saas_metrics.saas_metrics);;

  dimension_group: dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
  }

  measure: total_arr {
    type: sum
    sql: ${TABLE}."TOTAL_ARR" ;;
    value_format: "$#,##0.00"
    label: "Total ARR"
  }

  measure: arr_percent_growth {
    type: sum
    sql: 100 * ${TABLE}."ARR_PERCENT_GROWTH" ;;
    value_format: "0\%"
    label: "ARR % Growth"
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}."REVENUE" ;;
    value_format: "$#,##0.00"
    label: "Revenue"
  }

  measure: revenue_percent_growth {
    type: sum
    sql: 100 * ${TABLE}."REVENUE_PERCENT_GROWTH" ;;
    value_format: "0\%"
    label: "Revenue % Growth"
  }

  measure: revenue_fy {
    type: sum
    sql: ${TABLE}."REVENUE_FY" ;;
    value_format: "$#,##0.00"
    label: "FY Revenue"
  }

  measure: net_dollar_retention {
    type: sum
    sql: 100 * ${TABLE}."NET_DOLLAR_RETENTION" ;;
    value_format: "0\%"
    label: "Net $$ Retention"
  }

  measure: gross_dollar_retention {
    type: sum
    sql: 100 * ${TABLE}."GROSS_DOLLAR_RETENTION" ;;
    value_format: "0\%"
    label: "Gross $$ Retention"
  }

  measure: gross_profit {
    type: sum
    sql: ${TABLE}."GROSS_PROFIT" ;;
    value_format: "$#,##0.00"
    label: "Gross Profit"
  }

  measure: gross_profit_fy {
    type: sum
    sql: ${TABLE}."GROSS_PROFIT_FY" ;;
    value_format: "$#,##0.00"
    label: "FY Gross Profit"
  }

  measure: gross_margin {
    type: sum
    sql: 100 * ${TABLE}."GROSS_MARGIN" ;;
    value_format: "0\%"
    label: "Gross Margin"
  }

  measure: net_logo_churn {
    type: sum
    sql: 100 * ${TABLE}."NET_LOGO_CHURN" ;;
    value_format: "0\%"
    label: "Net Logo Churn"
  }

  measure: cac_payback_months {
    type: sum
    sql: ${TABLE}."CAC_PAYBACK_MONTHS" ;;
    label: "CAC Payback (BVP Calc)"
  }

  measure: cash_conversion_score {
    type: sum
    sql: ${TABLE}."CASH_CONVERSION_SCORE" ;;
    label: "Cash Conversion Score"
  }

  measure: net_burn {
    type: sum
    sql: -1 * ${TABLE}."NET_BURN" ;;
    value_format: "$#,##0.00"
    label: "Net Burn"
  }

  measure: net_burn_fy {
    type: sum
    sql: ${TABLE}."NET_BURN_FY" ;;
    value_format: "$#,##0.00"
    label: "FY Net Burn"
  }

  measure: fcf_margin {
    type: sum
    sql: 100 * ${TABLE}."FCF_MARGIN" ;;
    value_format: "0\%"
    label: "FCF Margin"
  }

  measure: rule_of_40 {
    type: sum
    sql: 100 * ${TABLE}."RULE_OF_40" ;;
    value_format: "0\%"
    label: "Rule of 40"
  }

  measure: ltv_to_cac {
    type: sum
    sql: ${TABLE}."LTV_TO_CAC" ;;
    label: "LTV-to-CAC"
  }

  measure: arr_growth_percent_goal_25 {
    type: sum
    sql: 100 * ${TABLE}."ARR_GROWTH_PERCENT_GOAL_25" ;;
    value_format: "0\%"
  }

  measure: arr_growth_percent_goal_median {
    type: sum
    sql: 100 * ${TABLE}."ARR_GROWTH_PERCENT_GOAL_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: arr_growth_percent_goal_75 {
    type: sum
    sql: 100 * ${TABLE}."ARR_GROWTH_PERCENT_GOAL_75" ;;
    value_format: "0\%"
  }

  measure: revenue_growth_percent_25 {
    type: sum
    sql: 100 * ${TABLE}."REVENUE_GROWTH_PERCENT_25" ;;
    value_format: "0\%"
  }

  measure: revenue_growth_percent_median {
    type: sum
    sql: 100 * ${TABLE}."REVENUE_GROWTH_PERCENT_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: revenue_growth_percent_75 {
    type: sum
    sql: 100 * ${TABLE}."REVENUE_GROWTH_PERCENT_75" ;;
    value_format: "0\%"
  }

  measure: net_dollar_retention_25 {
    type: sum
    sql: 100 * ${TABLE}."NET_DOLLAR_RETENTION_25" ;;
    value_format: "0\%"
  }

  measure: net_dollar_retention_median {
    type: sum
    sql: 100 * ${TABLE}."NET_DOLLAR_RETENTION_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: net_dollar_retention_75 {
    type: sum
    sql: 100 * ${TABLE}."NET_DOLLAR_RETENTION_75" ;;
    value_format: "0\%"
  }

  measure: gross_dollar_retention_25 {
    type: sum
    sql: 100 * ${TABLE}."GROSS_DOLLAR_RETENTION_25" ;;
    value_format: "0\%"
  }

  measure: gross_dollar_retention_median {
    type: sum
    sql: 100 * ${TABLE}."GROSS_DOLLAR_RETENTION_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: gross_dollar_retention_75 {
    type: sum
    sql: 100 * ${TABLE}."GROSS_DOLLAR_RETENTION_75" ;;
    value_format: "0\%"
  }

  measure: gross_margin_25 {
    type: sum
    sql: 100 * ${TABLE}."GROSS_MARGIN_25" ;;
    value_format: "0\%"
  }

  measure: gross_margin_median {
    type: sum
    sql: 100 * ${TABLE}."GROSS_MARGIN_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: gross_margin_75 {
    type: sum
    sql: 100 * ${TABLE}."GROSS_MARGIN_75" ;;
    value_format: "0\%"
  }

  measure: net_logo_churn_25 {
    type: sum
    sql: 100 * ${TABLE}."NET_LOGO_CHURN_25" ;;
    value_format: "0\%"
  }

  measure: net_logo_churn_median {
    type: sum
    sql: 100 * ${TABLE}."NET_LOGO_CHURN_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: net_logo_churn_75 {
    type: sum
    sql: 100 * ${TABLE}."NET_LOGO_CHURN_75" ;;
    value_format: "0\%"
  }

  measure: cac_payback_median {
    type: sum
    sql: ${TABLE}."CAC_PAYBACK_MEDIAN" ;;
  }

  measure: cash_conversion_score_25 {
    type: sum
    sql: ${TABLE}."CASH_CONVERSION_SCORE_25" ;;
  }

  measure: cash_conversion_score_median {
    type: sum
    sql: ${TABLE}."CASH_CONVERSION_SCORE_MEDIAN" ;;
  }

  measure: cash_conversion_score_75 {
    type: sum
    sql: ${TABLE}."CASH_CONVERSION_SCORE_75" ;;
  }

  measure: fcf_25 {
    type: sum
    sql: 100 * ${TABLE}."FCF_25" ;;
    value_format: "0\%"
  }

  measure: fcf_median {
    type: sum
    sql: 100 * ${TABLE}."FCF_MEDIAN" ;;
    value_format: "0\%"
  }

  measure: fcf_75 {
    type: sum
    sql: 100 * ${TABLE}."FCF_75" ;;
    value_format: "0\%"
  }

  measure: rule_of_40_median {
    type: sum
    sql: 100 * ${TABLE}."RULE_OF_40_MEDIAN" ;;
    value_format: "0\%"
  }

}
