view: saas_metrics_qtr {
  sql_table_name: (select * from prod.saas_metrics.saas_metrics_qtr);;


  dimension_group: qtr_end_dte {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."QTR_END_DTE" ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}."METRIC" ;;
    order_by_field: metric_order_by_column
  }

  dimension: metric_order_by_column {
    type: number
    sql: ${TABLE}."METRIC_ORDER_BY_COLUMN" ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  measure: forecast {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
  }

  measure: actuals {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
  }

  measure: budget_variance {
    type: sum
    sql: ${TABLE}."BUDGET_VARIANCE" ;;
  }

  measure: forecast_variance {
    type: sum
    sql: ${TABLE}."FORECAST_VARIANCE" ;;
  }

  measure: percent_budget_variance {
    type: sum
    sql: ${TABLE}."PERCENT_BUDGET_VARIANCE" ;;
  }

  measure: percent_forecast_variance {
    type: sum
    sql: ${TABLE}."PERCENT_FORECAST_VARIANCE" ;;
  }

  measure: budget_arr {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "ARR"]
    value_format: "$#,##0"
    label: "ARR (Budget)"
  }

  measure: budget_revenue {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "REVENUE"]
    value_format: "$#,##0"
    label: "Revenue (Budget)"
  }

  measure: budget_ndr {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "NET_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Net Dollar Retention (Budget)"
  }

  measure: budget_gdr {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "GROSS_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Gross Dollar Retention (Budget)"
  }

  measure: budget_logo_retention {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "NET_Logo_RETENTION"]
    value_format: "#0\%"
    label: "Net Logo Retention (Budget)"
  }

  measure: budget_gross_margin {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "GROSS_MARGIN"]
    value_format: "$#,##0"
    label: "Gross Margin (Budget)"
  }

  measure: budget_gross_margin_perc {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "GROSS_MARGIN_PERCENT"]
    value_format: "#0\%"
    label: "Gross Margin % (Budget)"
  }

  measure: budget_cac_payback {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "CAC_PAYBACK_PERIOD"]
 #   value_format: "#0\%"
    label: "CAC Payback Period (BVP Calc.) (Budget)"
  }

  measure: budget_cash_conversion {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "CASH_CONVERSION_SCORE"]
#    value_format: "#0\%"
    label: "Cash Conversion Score (Budget)"
  }

  measure: budget_rule_40 {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "RULE_OF_40"]
#    value_format: "#0\%"
    label: "Rule of 40 (Budget)"
  }

  measure: budget_magic_number {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "MAGIC_NUMBER"]
#    value_format: "#0\%"
    label: "Magic Number (Budget)"
  }

  measure: budget_ltv_cac {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "LTV_TO_CAC"]
#    value_format: "#0\%"
    label: "LTV to CAC Ratio (Budget)"
  }

  measure: budget_fcf_margin {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "FCF_MARGIN"]
    value_format: "#0\%"
    label: "FCF Margin (Budget)"
  }

  measure: budget_net_new_arr {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "NET_NEW_ARR"]
    value_format: "$#,##0"
    label: "Net New ARR (Budget)"
  }

  measure: budget_burn_multiple {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Burn Multiple (Budget)"
  }

  measure: budget_aws {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "AWS_EXPENSE"]
    value_format: "$#,##0"
    label: "Cloud Expense (AWS) (Budget)"
 }

  measure: budget_software_fte {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "SOFTWARE_PER_FTE"]
    value_format: "$#,##0"
    label: "SOftware Expense / FTE (Budget)"
  }

  measure: budget_real_estate {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "REAL_ESTATE_EXPENSE"]
    value_format: "$#,##0"
    label: "Real Estate Expense (Budget)"
  }

  measure: budget_r_d {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "R_AND_D_EXPENSE"]
    value_format: "$#,##0"
    label: "R&D Expense (Budget)"
  }

  measure: budget_s_m {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "S_AND_M_EXPENSE"]
    value_format: "$#,##0"
    label: "S&M Expense (Budget)"
  }

  measure: budget_g_a {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "G_AND_A_EXPENSE"]
    value_format: "$#,##0"
    label: "G&A Expense (Budget)"
  }

  measure: budget_opex {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "TOTAL_OPEX"]
    value_format: "$#,##0"
    label: "Total Operating Expense (Budget)"
  }

  measure: budget_rev_fte {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "GAAP Revenue / FTE (Budget)"
  }

  measure: budget_comp_benefits_rev {
    type: sum
    sql: 100*${budget} ;;
    filters: [metric: "COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Compensation & Benefits / GAAP Revenue (Budget)"
  }

  measure: budget_eng {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "ENG_FTE"]
#    value_format: "#0\%"
    label: "Engineering FTEs (Budget)"
  }

  measure: budget_sales {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "SALES_FTE"]
#    value_format: "#0\%"
    label: "SALES FTEs (Budget)"
  }

  measure: budget_cx {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "CX_FTE"]
#    value_format: "#0\%"
    label: "Customer Experience FTEs (Budget)"
  }

  measure: budget_marketing {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "MARKETING_FTE"]
#    value_format: "#0\%"
    label: "MARKETING FTEs (Budget)"
  }

  measure: budget_product {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "PRODUCT_FTE"]
#    value_format: "#0\%"
    label: "Product FTEs (Budget)"
  }

  measure: budget_finance {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "FINANCE_FTE"]
#    value_format: "#0\%"
    label: "FInance FTEs (Budget)"
  }

  measure: budget_people {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "PEOPLE_FTE"]
#    value_format: "#0\%"
    label: "People FTEs (Budget)"
  }

  measure: budget_legal {
    type: sum
    sql: ${budget} ;;
    filters: [metric: "LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Legal FTEs (Budget)"
  }
}
