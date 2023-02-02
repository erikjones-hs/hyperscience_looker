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
#    order_by_field: metric_order_by_column
  }

  dimension: metric_label {
    type: string
    sql: ${TABLE}."METRIC_LABEL" ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}."FORECAST" ;;
  }

  dimension: actuals {
    type: number
    sql: ${TABLE}."ACTUALS" ;;
  }

  measure: budget_calcs {
    type: sum
    sql: ${TABLE}."BUDGET" ;;
  }

  measure: budget_dollars_format {
    type: sum
    sql: ${TABLE}."BUDGET" ;;
    filters: [metric: "ARR, REVENUE, GROSS_MARGIN, NET_NEW_ARR, AWS_EXPENSE, SOFTWARE_PER_FTE, REAL_ESTATE_EXPENSE,
                       R_AND_D_EXPENSE, S_AND_M_EXPENSE, G_AND_A_EXPENSE, TOTAL_OPEX, GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "Budget ($$)"
  }

  measure: budget_percent_format {
    type: sum
    sql: CASE
         WHEN ${TABLE}."METRIC" in ('NET_DOLLAR_RETENTION', 'GROSS_DOLAR_RETENTION', 'GROSS_MARGIN_PERCENT','FCF_MARGIN',
                                    'COMP_AND_BENEFITS_PER_REV')
         THEN 100*(${TABLE}."BUDGET")
         ELSE ${TABLE}."BUDGET" END;;
    filters: [metric: "NET_DOLLAR_RETENTION, GROSS_DOLAR_RETENTION, NET_LOGO_RETENTION, GROSS_MARGIN_PERCENT,
                       FCF_MARGIN, COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Budget (%)"
  }

  measure: budget_number_format {
    type: sum
    sql: ${TABLE}."BUDGET" ;;
    filters: [metric: "CAC_PAYBACK_PERIOD, CASH_CONVERSION_SCORE, RULE_OF_40, MAGIC_NUMBER, LTV_TO_CAC, BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Budget (#)"
  }

  measure: budget_fte_format {
    type: sum
    sql: ${TABLE}."BUDGET" ;;
    filters: [metric: "ENG_FTE, SALES_FTE, CX_FTE, MARKETING_FTE, PRODUCT_FTE, FINANCE_FTE, PEOPLE_FTE, LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Budget (FTEs)"
  }

  measure: forecast_calcs {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
  }

  measure: forecast_dollars_format {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
    filters: [metric: "ARR, REVENUE, GROSS_MARGIN, NET_NEW_ARR, AWS_EXPENSE, SOFTWARE_PER_FTE, REAL_ESTATE_EXPENSE,
    R_AND_D_EXPENSE, S_AND_M_EXPENSE, G_AND_A_EXPENSE, TOTAL_OPEX, GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "Forecast ($$)"
  }

  measure: forecast_percent_format {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
    filters: [metric: "NET_DOLLAR_RETENTION, GROSS_DOLAR_RETENTION, NET_LOGO_RETENTION, GROSS_MARGIN_PERCENT,
    FCF_MARGIN, COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Forecast (%)"
  }

  measure: forecast_number_format {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
    filters: [metric: "CAC_PAYBACK_PERIOD, CASH_CONVERSION_SCORE, RULE_OF_40, MAGIC_NUMBER, LTV_TO_CAC, BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Forecast (#)"
  }

  measure: forecast_fte_format {
    type: sum
    sql: ${TABLE}."FORECAST" ;;
    filters: [metric: "ENG_FTE, SALES_FTE, CX_FTE, MARKETING_FTE, PRODUCT_FTE, FINANCE_FTE, PEOPLE_FTE, LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Forecast (FTEs)"
  }

  measure: actuals_calcs {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
  }

  measure: actuals_dollars_format {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
    filters: [metric: "ARR, REVENUE, GROSS_MARGIN, NET_NEW_ARR, AWS_EXPENSE, SOFTWARE_PER_FTE, REAL_ESTATE_EXPENSE,
    R_AND_D_EXPENSE, S_AND_M_EXPENSE, G_AND_A_EXPENSE, TOTAL_OPEX, GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "Actuals ($$)"
  }

  measure: actuals_percent_format {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
    filters: [metric: "NET_DOLLAR_RETENTION, GROSS_DOLAR_RETENTION, NET_LOGO_RETENTION, GROSS_MARGIN_PERCENT,
    FCF_MARGIN, COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Actuals (%)"
  }

  measure: actuals_number_format {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
    filters: [metric: "CAC_PAYBACK_PERIOD, CASH_CONVERSION_SCORE, RULE_OF_40, MAGIC_NUMBER, LTV_TO_CAC, BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Actuals (#)"
  }

  measure: actuals_fte_format {
    type: sum
    sql: ${TABLE}."ACTUALS" ;;
    filters: [metric: "ENG_FTE, SALES_FTE, CX_FTE, MARKETING_FTE, PRODUCT_FTE, FINANCE_FTE, PEOPLE_FTE, LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Actuals (FTEs)"
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

########################## BUDGET FILTERED MEASURES ###############################

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
    filters: [metric: "NET_LOGO_RETENTION"]
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

  ########################## FORECAST FILTERED MEASURES ###############################

  measure: forecast_arr {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "ARR"]
    value_format: "$#,##0"
    label: "ARR (Forecast)"
  }

  measure: forecast_revenue {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "REVENUE"]
    value_format: "$#,##0"
    label: "Revenue (Forecast)"
  }

  measure: forecast_ndr {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "NET_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Net Dollar Retention (Forecast)"
  }

  measure: forecast_gdr {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "GROSS_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Gross Dollar Retention (Forecast)"
  }

  measure: forecast_logo_retention {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "NET_LOGO_RETENTION"]
    value_format: "#0\%"
    label: "Net Logo Retention (Forecast)"
  }

  measure: forecast_gross_margin {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "GROSS_MARGIN"]
    value_format: "$#,##0"
    label: "Gross Margin (Forecast)"
  }

  measure: forecast_gross_margin_perc {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "GROSS_MARGIN_PERCENT"]
    value_format: "#0\%"
    label: "Gross Margin % (Forecast)"
  }

  measure: forecast_cac_payback {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "CAC_PAYBACK_PERIOD"]
    #   value_format: "#0\%"
    label: "CAC Payback Period (BVP Calc.) (Forecast)"
  }

  measure: forecast_cash_conversion {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "CASH_CONVERSION_SCORE"]
#    value_format: "#0\%"
    label: "Cash Conversion Score (Forecast)"
  }

  measure: forecast_rule_40 {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "RULE_OF_40"]
#    value_format: "#0\%"
    label: "Rule of 40 (Forecast)"
  }

  measure: forecast_magic_number {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "MAGIC_NUMBER"]
#    value_format: "#0\%"
    label: "Magic Number (Forecast)"
  }

  measure: forecast_ltv_cac {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "LTV_TO_CAC"]
#    value_format: "#0\%"
    label: "LTV to CAC Ratio (Forecast)"
  }

  measure: forecast_fcf_margin {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "FCF_MARGIN"]
    value_format: "#0\%"
    label: "FCF Margin (Forecast)"
  }

  measure: forecast_net_new_arr {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "NET_NEW_ARR"]
    value_format: "$#,##0"
    label: "Net New ARR (Forecast)"
  }

  measure: forecast_burn_multiple {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Burn Multiple (Forecast)"
  }

  measure: forecast_aws {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "AWS_EXPENSE"]
    value_format: "$#,##0"
    label: "Cloud Expense (AWS) (Forecast)"
  }

  measure: forecast_software_fte {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "SOFTWARE_PER_FTE"]
    value_format: "$#,##0"
    label: "SOftware Expense / FTE (Forecast)"
  }

  measure: forecast_real_estate {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "REAL_ESTATE_EXPENSE"]
    value_format: "$#,##0"
    label: "Real Estate Expense (Forecast)"
  }

  measure: forecast_r_d {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "R_AND_D_EXPENSE"]
    value_format: "$#,##0"
    label: "R&D Expense (Forecast)"
  }

  measure: forecast_s_m {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "S_AND_M_EXPENSE"]
    value_format: "$#,##0"
    label: "S&M Expense (Forecast)"
  }

  measure: forecast_g_a {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "G_AND_A_EXPENSE"]
    value_format: "$#,##0"
    label: "G&A Expense (Forecast)"
  }

  measure: forecast_opex {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "TOTAL_OPEX"]
    value_format: "$#,##0"
    label: "Total Operating Expense (Forecast)"
  }

  measure: forecast_rev_fte {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "GAAP Revenue / FTE (Forecast)"
  }

  measure: forecast_comp_benefits_rev {
    type: sum
    sql: 100*${forecast} ;;
    filters: [metric: "COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Compensation & Benefits / GAAP Revenue (Forecast)"
  }

  measure: forecast_eng {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "ENG_FTE"]
#    value_format: "#0\%"
    label: "Engineering FTEs (Forecast)"
  }

  measure: forecast_sales {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "SALES_FTE"]
#    value_format: "#0\%"
    label: "SALES FTEs (Forecast)"
  }

  measure: forecast_cx {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "CX_FTE"]
#    value_format: "#0\%"
    label: "Customer Experience FTEs (Forecast)"
  }

  measure: forecast_marketing {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "MARKETING_FTE"]
#    value_format: "#0\%"
    label: "MARKETING FTEs (Forecast)"
  }

  measure: forecast_product {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "PRODUCT_FTE"]
#    value_format: "#0\%"
    label: "Product FTEs (Forecast)"
  }

  measure: forecast_finance {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "FINANCE_FTE"]
#    value_format: "#0\%"
    label: "FInance FTEs (Forecast)"
  }

  measure: forecast_people {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "PEOPLE_FTE"]
#    value_format: "#0\%"
    label: "People FTEs (Forecast)"
  }

  measure: forecast_legal {
    type: sum
    sql: ${forecast} ;;
    filters: [metric: "LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Legal FTEs (Forecast)"
  }

  ########################## ACTUALS FILTERED MEASURES ###############################

  measure: actuals_arr {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "ARR"]
    value_format: "$#,##0"
    label: "ARR (Actuals)"
  }

  measure: actuals_revenue {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "REVENUE"]
    value_format: "$#,##0"
    label: "Revenue (Actuals)"
  }

  measure: actuals_ndr {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "NET_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Net Dollar Retention (Actuals)"
  }

  measure: actuals_gdr {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "GROSS_DOLLAR_RETENTION"]
    value_format: "#0\%"
    label: "Gross Dollar Retention (Actuals)"
  }

  measure: actuals_logo_retention {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "NET_LOGO_RETENTION"]
    value_format: "#0\%"
    label: "Net Logo Retention (Actuals)"
  }

  measure: actuals_gross_margin {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "GROSS_MARGIN"]
    value_format: "$#,##0"
    label: "Gross Margin (Actuals)"
  }

  measure: actuals_gross_margin_perc {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "GROSS_MARGIN_PERCENT"]
    value_format: "#0\%"
    label: "Gross Margin % (Actuals)"
  }

  measure: actuals_cac_payback {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "CAC_PAYBACK_PERIOD"]
    #   value_format: "#0\%"
    label: "CAC Payback Period (BVP Calc.) (Actuals)"
  }

  measure: actuals_cash_conversion {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "CASH_CONVERSION_SCORE"]
#    value_format: "#0\%"
    label: "Cash Conversion Score (Actuals)"
  }

  measure: actuals_rule_40 {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "RULE_OF_40"]
#    value_format: "#0\%"
    label: "Rule of 40 (Actuals)"
  }

  measure: actuals_magic_number {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "MAGIC_NUMBER"]
#    value_format: "#0\%"
    label: "Magic Number (Actuals)"
  }

  measure: actuals_ltv_cac {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "LTV_TO_CAC"]
#    value_format: "#0\%"
    label: "LTV to CAC Ratio (Actuals)"
  }

  measure: actuals_fcf_margin {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "FCF_MARGIN"]
    value_format: "#0\%"
    label: "FCF Margin (Actuals)"
  }

  measure: actuals_net_new_arr {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "NET_NEW_ARR"]
    value_format: "$#,##0"
    label: "Net New ARR (Actuals)"
  }

  measure: actuals_burn_multiple {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "BURN_MULTIPLE"]
#    value_format: "#0\%"
    label: "Burn Multiple (Actuals)"
  }

  measure: actuals_aws {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "AWS_EXPENSE"]
    value_format: "$#,##0"
    label: "Cloud Expense (AWS) (Actuals)"
  }

  measure: actuals_software_fte {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "SOFTWARE_PER_FTE"]
    value_format: "$#,##0"
    label: "SOftware Expense / FTE (Actuals)"
  }

  measure: actuals_real_estate {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "REAL_ESTATE_EXPENSE"]
    value_format: "$#,##0"
    label: "Real Estate Expense (Actuals)"
  }

  measure: actuals_r_d {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "R_AND_D_EXPENSE"]
    value_format: "$#,##0"
    label: "R&D Expense (Actuals)"
  }

  measure: actuals_s_m {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "S_AND_M_EXPENSE"]
    value_format: "$#,##0"
    label: "S&M Expense (Actuals)"
  }

  measure: actuals_g_a {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "G_AND_A_EXPENSE"]
    value_format: "$#,##0"
    label: "G&A Expense (Actuals)"
  }

  measure: actuals_opex {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "TOTAL_OPEX"]
    value_format: "$#,##0"
    label: "Total Operating Expense (Actuals)"
  }

  measure: actuals_rev_fte {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "GAAP_REV_PER_FTE"]
    value_format: "$#,##0"
    label: "GAAP Revenue / FTE (Actuals)"
  }

  measure: actuals_comp_benefits_rev {
    type: sum
    sql: 100*${actuals} ;;
    filters: [metric: "COMP_AND_BENEFITS_PER_REV"]
    value_format: "#0\%"
    label: "Compensation & Benefits / GAAP Revenue (Actuals)"
  }

  measure: actuals_eng {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "ENG_FTE"]
#    value_format: "#0\%"
    label: "Engineering FTEs (Actuals)"
  }

  measure: actuals_sales {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "SALES_FTE"]
#    value_format: "#0\%"
    label: "SALES FTEs (Actuals)"
  }

  measure: actuals_cx {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "CX_FTE"]
#    value_format: "#0\%"
    label: "Customer Experience FTEs (Actuals)"
  }

  measure: actuals_marketing {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "MARKETING_FTE"]
#    value_format: "#0\%"
    label: "MARKETING FTEs (Actuals)"
  }

  measure: actuals_product {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "PRODUCT_FTE"]
#    value_format: "#0\%"
    label: "Product FTEs (Actuals)"
  }

  measure: actuals_finance {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "FINANCE_FTE"]
#    value_format: "#0\%"
    label: "FInance FTEs (Actuals)"
  }

  measure: actuals_people {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "PEOPLE_FTE"]
#    value_format: "#0\%"
    label: "People FTEs (Actuals)"
  }

  measure: actuals_legal {
    type: sum
    sql: ${actuals} ;;
    filters: [metric: "LEGAL_FTE"]
#    value_format: "#0\%"
    label: "Legal FTEs (Actuals)"
  }

########################## ACTUALS - Budget Deltas ###############################

  measure: budget_actuals_arr {
    type: number
    sql: ${actuals_arr} - ${budget_arr} ;;
    value_format: "$#,##0"
    label: "ARR Delta (Budget/Actuals)"
  }

  measure: budget_actuals_revenue {
    type: number
    sql: ${actuals_revenue} - ${budget_revenue} ;;
    value_format: "$#,##0"
    label: "Revenue (Budget/Actuals)"
  }

  measure: budget_actuals_ndr {
    type: number
    sql: 100*(${actuals_ndr} - ${budget_ndr}) ;;
    value_format: "#0\%"
    label: "Net Dollar Retention (Budget/Actuals)"
  }

  measure: budget_actuals_gdr {
    type: number
    sql: 100*(${actuals_gdr} - ${budget_gdr}) ;;
    value_format: "#0\%"
    label: "Gross Dollar Retention (Budget/Actuals)"
  }

  measure: budget_actuals_logo_retention {
    type: number
    sql: ${actuals_logo_retention} - ${budget_logo_retention} ;;
    value_format: "#0\%"
    label: "Net Logo Retention (Budget/Actuals)"
  }

  measure: budget_actuals_gross_margin {
    type: number
    sql: ${actuals_gross_margin} - ${budget_gross_margin} ;;
    value_format: "$#,##0"
    label: "Gross Margin (Budget/Actuals)"
  }

  measure: budget_actuals_gross_margin_perc {
    type: number
    sql: 100*(${actuals_gross_margin_perc} - ${budget_gross_margin_perc}) ;;
    value_format: "#0\%"
    label: "Gross Margin % (Budget/Actuals)"
  }

  measure: budget_actuals_cac_payback {
    type: number
    sql: ${actuals_cac_payback} - ${budget_cac_payback} ;;
    #   value_format: "#0\%"
    label: "CAC Payback Period (BVP Calc.) (Budget/Actuals)"
  }

  measure: budget_actuals_cash_conversion {
    type: number
    sql: 100*(${actuals_cash_conversion} - ${budget_cash_conversion}) ;;
#    value_format: "#0\%"
    label: "Cash Conversion Score (Budget/Actuals)"
  }

  measure: budget_actuals_rule_40 {
    type: number
    sql: ${actuals_rule_40} - ${budget_rule_40} ;;
#    value_format: "#0\%"
    label: "Rule of 40 (Budget/Actuals)"
  }

  measure: budget_actuals_magic_number {
    type: number
    sql: ${actuals_magic_number} - ${budget_magic_number} ;;
#    value_format: "#0\%"
    label: "Magic Number (Budget/Actuals)"
  }

  measure: budget_actuals_ltv_cac {
    type: number
    sql: ${actuals_ltv_cac} - ${budget_ltv_cac} ;;
#    value_format: "#0\%"
    label: "LTV to CAC Ratio (Budget/Actuals)"
  }

  measure: budget_actuals_fcf_margin {
    type: number
    sql: 100*(${actuals_fcf_margin} - ${budget_fcf_margin}) ;;
    value_format: "#0\%"
    label: "FCF Margin (Budget/Actuals)"
  }

  measure: budget_actuals_net_new_arr {
    type: number
    sql: ${actuals_net_new_arr} - ${budget_net_new_arr} ;;
    value_format: "$#,##0"
    label: "Net New ARR (Budget/Actuals)"
  }

  measure: budget_actuals_burn_multiple {
    type: number
    sql: ${actuals_burn_multiple} - ${budget_burn_multiple} ;;
#    value_format: "#0\%"
    label: "Burn Multiple (Budget/Actuals)"
  }

  measure: budget_actuals_aws {
    type: number
    sql: ${actuals_aws} - ${budget_aws} ;;
    value_format: "$#,##0"
    label: "Cloud Expense (AWS) (Budget/Actuals)"
  }

  measure: budget_actuals_software_fte {
    type: number
    sql: ${actuals_software_fte} - ${budget_software_fte} ;;
    value_format: "$#,##0"
    label: "SOftware Expense / FTE (Budget/Actuals)"
  }

  measure: budget_actuals_real_estate {
    type: number
    sql: ${actuals_real_estate} - ${budget_real_estate} ;;
    value_format: "$#,##0"
    label: "Real Estate Expense (Budget/Actuals)"
  }

  measure: budget_actuals_r_d {
    type: number
    sql: ${actuals_r_d} - ${budget_r_d} ;;
    value_format: "$#,##0"
    label: "R&D Expense (Budget/Actuals)"
  }

  measure: budget_actuals_s_m {
    type: number
    sql: ${actuals_s_m} = ${budget_s_m} ;;
    value_format: "$#,##0"
    label: "S&M Expense (Budget/Actuals)"
  }

  measure: budget_actuals_g_a {
    type: number
    sql: ${actuals_g_a} - ${budget_g_a} ;;
    value_format: "$#,##0"
    label: "G&A Expense (Budget/Actuals)"
  }

  measure: budget_actuals_opex {
    type: number
    sql: ${actuals_opex} - ${budget_opex} ;;
    value_format: "$#,##0"
    label: "Total Operating Expense (Budget/Actuals)"
  }

  measure: budget_actuals_rev_fte {
    type: number
    sql: ${actuals_rev_fte} - ${budget_rev_fte} ;;
    value_format: "$#,##0"
    label: "GAAP Revenue / FTE (Budget/Actuals)"
  }

  measure: budget_actuals_comp_benefits_rev {
    type: number
    sql: 100*(${actuals_comp_benefits_rev} - ${budget_comp_benefits_rev}) ;;
    value_format: "#0\%"
    label: "Compensation & Benefits / GAAP Revenue (Budget/Actuals)"
  }

  measure: budget_actuals_eng {
    type: number
    sql: ${actuals_eng} - ${budget_eng} ;;
#    value_format: "#0\%"
    label: "Engineering FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_sales {
    type: number
    sql: ${actuals_sales} - ${budget_sales} ;;
#    value_format: "#0\%"
    label: "SALES FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_cx {
    type: number
    sql: ${actuals_cx} - ${budget_cx} ;;
#    value_format: "#0\%"
    label: "Customer Experience FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_marketing {
    type: number
    sql: ${actuals_marketing} - ${budget_marketing} ;;
#    value_format: "#0\%"
    label: "MARKETING FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_product {
    type: number
    sql: ${actuals_product} - ${budget_product} ;;
#    value_format: "#0\%"
    label: "Product FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_finance {
    type: number
    sql: ${actuals_finance} - ${budget_finance} ;;
#    value_format: "#0\%"
    label: "FInance FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_people {
    type: number
    sql: ${actuals_people} - ${budget_people} ;;
#    value_format: "#0\%"
    label: "People FTEs (Budget/Actuals)"
  }

  measure: budget_actuals_legal {
    type: number
    sql: ${actuals_legal} - ${budget_legal} ;;
#    value_format: "#0\%"
    label: "Legal FTEs (Budget/Actuals)"
  }

########################## ACTUALS - Forecast Deltas ###############################

  measure: forecast_actuals_arr {
    type: number
    sql: ${actuals_arr} - ${forecast_arr} ;;
    value_format: "$#,##0"
    label: "ARR Delta (Forecast/Actuals)"
  }

  measure: forecast_actuals_revenue {
    type: number
    sql: ${actuals_revenue} - ${forecast_revenue} ;;
    value_format: "$#,##0"
    label: "Revenue (Forecast/Actuals)"
  }

  measure: forecast_actuals_ndr {
    type: number
    sql: 100*(${actuals_ndr} - ${forecast_ndr}) ;;
    value_format: "#0\%"
    label: "Net Dollar Retention (Forecast/Actuals)"
  }

  measure: forecast_actuals_gdr {
    type: number
    sql: 100*(${actuals_gdr} - ${forecast_gdr}) ;;
    value_format: "#0\%"
    label: "Gross Dollar Retention (Forecast/Actuals)"
  }

  measure: forecast_actuals_logo_retention {
    type: number
    sql: ${actuals_logo_retention} - ${forecast_logo_retention} ;;
    value_format: "#0\%"
    label: "Net Logo Retention (Forecast/Actuals)"
  }

  measure: forecast_actuals_gross_margin {
    type: number
    sql: ${actuals_gross_margin} - ${forecast_gross_margin} ;;
    value_format: "$#,##0"
    label: "Gross Margin (Forecast/Actuals)"
  }

  measure: forecast_actuals_gross_margin_perc {
    type: number
    sql: 100*(${actuals_gross_margin_perc} - ${forecast_gross_margin_perc}) ;;
    value_format: "#0\%"
    label: "Gross Margin % (Forecast/Actuals)"
  }

  measure: forecast_actuals_cac_payback {
    type: number
    sql: ${actuals_cac_payback} - ${forecast_cac_payback} ;;
    #   value_format: "#0\%"
    label: "CAC Payback Period (BVP Calc.) (Forecast/Actuals)"
  }

  measure: forecast_actuals_cash_conversion {
    type: number
    sql: 100*(${actuals_cash_conversion} - ${forecast_cash_conversion}) ;;
#    value_format: "#0\%"
    label: "Cash Conversion Score (Forecast/Actuals)"
  }

  measure: forecast_actuals_rule_40 {
    type: number
    sql: ${actuals_rule_40} - ${forecast_rule_40} ;;
#    value_format: "#0\%"
    label: "Rule of 40 (Forecast/Actuals)"
  }

  measure: forecast_actuals_magic_number {
    type: number
    sql: ${actuals_magic_number} - ${forecast_magic_number} ;;
#    value_format: "#0\%"
    label: "Magic Number (Forecast/Actuals)"
  }

  measure: forecast_actuals_ltv_cac {
    type: number
    sql: ${actuals_ltv_cac} - ${forecast_ltv_cac} ;;
#    value_format: "#0\%"
    label: "LTV to CAC Ratio (Forecast/Actuals)"
  }

  measure: forecast_actuals_fcf_margin {
    type: number
    sql: 100*(${actuals_fcf_margin} - ${forecast_fcf_margin}) ;;
    value_format: "#0\%"
    label: "FCF Margin (Forecast/Actuals)"
  }

  measure: forecast_actuals_net_new_arr {
    type: number
    sql: ${actuals_net_new_arr} - ${forecast_net_new_arr} ;;
    value_format: "$#,##0"
    label: "Net New ARR (Forecast/Actuals)"
  }

  measure: forecast_actuals_burn_multiple {
    type: number
    sql: ${actuals_burn_multiple} - ${forecast_burn_multiple} ;;
#    value_format: "#0\%"
    label: "Burn Multiple (Forecast/Actuals)"
  }

  measure: forecast_actuals_aws {
    type: number
    sql: ${actuals_aws} - ${forecast_aws} ;;
    value_format: "$#,##0"
    label: "Cloud Expense (AWS) (Forecast/Actuals)"
  }

  measure: forecast_actuals_software_fte {
    type: number
    sql: ${actuals_software_fte} - ${forecast_software_fte} ;;
    value_format: "$#,##0"
    label: "SOftware Expense / FTE (Forecast/Actuals)"
  }

  measure: forecast_actuals_real_estate {
    type: number
    sql: ${actuals_real_estate} - ${forecast_real_estate} ;;
    value_format: "$#,##0"
    label: "Real Estate Expense (Forecast/Actuals)"
  }

  measure: forecast_actuals_r_d {
    type: number
    sql: ${actuals_r_d} - ${forecast_r_d} ;;
    value_format: "$#,##0"
    label: "R&D Expense (Forecast/Actuals)"
  }

  measure: forecast_actuals_s_m {
    type: number
    sql: ${actuals_s_m} = ${forecast_s_m} ;;
    value_format: "$#,##0"
    label: "S&M Expense (Forecast/Actuals)"
  }

  measure: forecast_actuals_g_a {
    type: number
    sql: ${actuals_g_a} - ${forecast_g_a} ;;
    value_format: "$#,##0"
    label: "G&A Expense (Forecast/Actuals)"
  }

  measure: forecast_actuals_opex {
    type: number
    sql: ${actuals_opex} - ${forecast_opex} ;;
    value_format: "$#,##0"
    label: "Total Operating Expense (Forecast/Actuals)"
  }

  measure: forecast_actuals_rev_fte {
    type: number
    sql: ${actuals_rev_fte} - ${forecast_rev_fte} ;;
    value_format: "$#,##0"
    label: "GAAP Revenue / FTE (Forecast/Actuals)"
  }

  measure: forecast_actuals_comp_benefits_rev {
    type: number
    sql: 100*(${actuals_comp_benefits_rev} - ${forecast_comp_benefits_rev}) ;;
    value_format: "#0\%"
    label: "Compensation & Benefits / GAAP Revenue (Forecast/Actuals)"
  }

  measure: forecast_actuals_eng {
    type: number
    sql: ${actuals_eng} - ${forecast_eng} ;;
#    value_format: "#0\%"
    label: "Engineering FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_sales {
    type: number
    sql: ${actuals_sales} - ${forecast_sales} ;;
#    value_format: "#0\%"
    label: "SALES FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_cx {
    type: number
    sql: ${actuals_cx} - ${forecast_cx} ;;
#    value_format: "#0\%"
    label: "Customer Experience FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_marketing {
    type: number
    sql: ${actuals_marketing} - ${forecast_marketing} ;;
#    value_format: "#0\%"
    label: "MARKETING FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_product {
    type: number
    sql: ${actuals_product} - ${forecast_product} ;;
#    value_format: "#0\%"
    label: "Product FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_finance {
    type: number
    sql: ${actuals_finance} - ${forecast_finance} ;;
#    value_format: "#0\%"
    label: "FInance FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_people {
    type: number
    sql: ${actuals_people} - ${forecast_people} ;;
#    value_format: "#0\%"
    label: "People FTEs (Forecast/Actuals)"
  }

  measure: forecast_actuals_legal {
    type: number
    sql: ${actuals_legal} - ${forecast_legal} ;;
#    value_format: "#0\%"
    label: "Legal FTEs (Forecast/Actuals)"
  }

}
