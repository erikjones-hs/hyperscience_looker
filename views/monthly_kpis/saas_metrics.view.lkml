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

  measure: aws_expense {
    type: sum
    sql: ${TABLE}."AWS_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: aws_expense_fy {
    type: sum
    sql: ${TABLE}."AWS_EXPENSE_FY" ;;
    value_format: "$#,##0.00"
  }

  measure: hosting_engineering_expense {
    type: sum
    sql: ${TABLE}."HOSTING_ENGINEERING_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: hosting_engineering_expense_fy {
    type: sum
    sql: ${TABLE}."HOSTING_ENGINEERING_EXPENSE_FY" ;;
    value_format: "$#,##0.00"
  }

  measure: hosting_ml_expense {
    type: sum
    sql: ${TABLE}."HOSTING_ML_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: hosting_ml_expense_fy {
    type: sum
    sql: ${TABLE}."HOSTING_ML_EXPENSE_FY" ;;
    value_format: "$#,##0.00"
  }

  measure: software_engineering_expense {
    type: sum
    sql: ${TABLE}."SOFTWARE_ENGINEERING_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: software_engineering_expense_fy {
    type: sum
    sql: ${TABLE}."SOFTWARE_ENGINEERING_EXPENSE_FY" ;;
    value_format: "$#,##0.00"
  }

  measure: work_facilities_expense {
    type: sum
    sql: ${TABLE}."WORK_FACILITIES_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: work_facilities_expense_fy {
    type: sum
    sql: ${TABLE}."WORK_FACILITIES_EXPENSE_FY" ;;
    value_format: "$#,##0.00"
  }

  measure: all_departments_cor_comp_expense {
    type: sum
    sql: ${TABLE}."ALL_DEPARTMENTS_COR_COMP_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: all_departments_expense {
    type: sum
    sql: ${TABLE}."ALL_DEPARTMENTS_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: sales_expense {
    type: sum
    sql: ${TABLE}."SALES_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: marketing_expense {
    type: sum
    sql: ${TABLE}."MARKETING_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: cx_cost_of_rev {
    type: sum
    sql: ${TABLE}."CX_COST_OF_REV" ;;
    value_format: "$#,##0.00"
  }

  measure: sales_and_marketing_expense {
    type: sum
    sql: ${TABLE}."SALES_AND_MARKETING_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: engineering_cost_of_rev {
    type: sum
    sql: ${TABLE}."ENGINEERING_COST_OF_REV" ;;
    value_format: "$#,##0.00"
  }

  measure: product_cost_of_rev {
    type: sum
    sql: ${TABLE}."PRODUCT_COST_OF_REV" ;;
    value_format: "$#,##0.00"
  }

  measure: r_and_d_expense {
    type: sum
    sql: ${TABLE}."R_AND_D_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: g_and_a_expense {
    type: sum
    sql: ${TABLE}."G_AND_A_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: g_and_a_stock_expense {
    type: sum
    sql: ${TABLE}."G_AND_A_STOCK_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: all_dept_expense {
    type: sum
    sql: ${TABLE}."ALL_DEPT_EXPENSE" ;;
    value_format: "$#,##0.00"
  }

  measure: opex {
    type: number
    sql: ${all_dept_expense} - ${g_and_a_stock_expense} ;;
    value_format: "$#,##0.00"
    label: "Opex Spend"
  }

  measure: opex_percent_revenue {
    type: number
    sql: ${opex} / ${revenue} ;;
    value_format: "0\%"
    label: "Opex % of revenue"
  }

  measure: eng_fte {
    type: sum
    sql: ${TABLE}."ENG_FTE" ;;
  }

  measure: sales_fte {
    type: sum
    sql: ${TABLE}."SALES_FTE" ;;
    label: "Sales Headcount"
  }

  measure: cx_fte {
    type: sum
    sql: ${TABLE}."CX_FTE" ;;
    label: "CX Headcount"
  }

  measure: new_eng_fte {
    type: sum
    sql: ${TABLE}."NEW_ENG_FTE" ;;
  }

  measure: people_fte {
    type: sum
    sql: ${TABLE}."PEOPLE_FTE" ;;
  }

  measure: product_fte {
    type: sum
    sql: ${TABLE}."PRODUCT_FTE" ;;
    label: "Product Headcount"
  }

  measure: marketing_fte {
    type: sum
    sql: ${TABLE}."MARKETING_FTE" ;;
    label: "Marketing Headcount"
  }

  measure: finance_fte {
    type: sum
    sql: ${TABLE}."FINANCE_FTE" ;;
    label: "Finance Headcount"
  }

  measure: corp_dev_fte {
    type: sum
    sql: ${TABLE}."CORP_DEV_FTE" ;;
  }

  measure: legal_fte {
    type: sum
    sql: ${TABLE}."LEGAL_FTE" ;;
    label: "Legal Headcount"
  }

  measure: operations_fte {
    type: sum
    sql: ${TABLE}."OPERATIONS_FTE" ;;
  }

  measure: all_dept_fte {
    type: sum
    sql: ${TABLE}."ALL_DEPT_FTE" ;;
    label: "Total Headcount"
  }

  measure: cloud_spend {
    type: number
    sql: ${aws_expense} + ${hosting_engineering_expense} + ${hosting_ml_expense} + ${software_engineering_expense} ;;
    value_format: "$#,##0.00"
    label: "Cloud Spend"
  }

  measure: cloud_percent_rev {
    type: number
    sql: ${cloud_spend} / ${revenue} ;;
    value_format: "0\%"
    label: "Cloud Spend % of Revenue"
  }

  measure: real_estate_percent_revenue {
    type: number
    sql: ${work_facilities_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "Real Estate % of Revenue"
  }

  measure: all_org_comp {
    type: number
    sql: ${all_departments_cor_comp_expense} + ${all_departments_expense} ;;
    value_format: "$#,##0.00"
    label: "All Org. Compensation"
  }

  measure: all_org_comp_percent_rev {
    type: number
    sql: ${all_org_comp} / ${revenue} ;;
    value_format: "0\%"
    label: "Org. Compensation % of Revenue"
  }

  measure: sales_expense_percent_revenue {
    type: number
    sql: ${sales_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "Sales Expense % of Revenue"
  }

  measure: marketing_expense_percent_revenue {
    type: number
    sql: ${marketing_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "Marketing Expense % of Revenue"
  }

  measure: sales_marketing_cx_expense {
    type: number
    sql: ${sales_and_marketing_expense} + ${cx_cost_of_rev} ;;
    value_format: "$#,##0.00"
    label: "Sales + Marketing + CX Expense "
  }

  measure: s_m_expense_percent_revenue {
    type: number
    sql: ${sales_marketing_cx_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "Sales + Marketing + CX Expense % of Revenue"
  }

  measure: r_d_expense {
    type: number
    sql: ${engineering_cost_of_rev} + ${product_cost_of_rev} + ${r_and_d_expense} ;;
    value_format: "$#,##0.00"
    label: "R&D Expense"
  }

  measure: r_d_expense_percent_revenue {
    type: number
    sql: ${r_d_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "R&D Expense % of Revenue"
  }

  measure: g_a_expense {
    type: number
    sql: ${g_and_a_expense} - ${g_and_a_stock_expense} ;;
    value_format: "$#,##0.00"
    label: "G&A Expense"
  }

  measure: g_a_expense_percent_revenue {
    type: number
    sql: ${g_a_expense} / ${revenue} ;;
    value_format: "0\%"
    label: "G&A Expense % of Revenue"
  }

  measure: engineering_fte {
    type: number
    sql: ${eng_fte} + ${new_eng_fte} ;;
    label: "Engineering Headcount"
  }

  measure: people_ftes {
    type: number
    sql: ${people_fte} - 7 ;;
    label: "People Team Headcount"
  }

  measure: corp_dev_ops_fte {
    type: number
    sql: ${corp_dev_fte} + ${operations_fte} + 7 ;;
    label: "Corp. Dev + Operations Headcount"
  }

  measure: eng_percent_total_fte {
    type: number
    sql: ${engineering_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Engineering % of Headcount"
  }

  measure: sales_percent_total_fte {
    type: number
    sql: ${sales_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Sales % of Headcount"
  }

  measure: cx_percent_total_fte {
    type: number
    sql: ${cx_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "CX % of Headcount"
  }

  measure: people_percent_total_fte {
    type: number
    sql: ${people_ftes} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "People Team % of Headcount"
  }

  measure: product_percent_total_fte {
    type: number
    sql: ${product_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Product % of Headcount"
  }

  measure: marketing_percent_total_fte {
    type: number
    sql: ${marketing_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Marketing % of Headcount"
  }

  measure: corp_dev_ops_percent_total_fte {
    type: number
    sql: ${corp_dev_ops_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Corp. Dev + Ops. % of Headcount"
  }

  measure: finance_percent_total_fte {
    type: number
    sql: ${finance_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Finance % of Headcount"
  }

  measure: legal_percent_total_fte {
    type: number
    sql: ${legal_fte} / ${all_dept_fte} ;;
    value_format: "0\%"
    label: "Legal % of Headcount"
  }

  measure: cloud_spend_25 {
    type: average
    sql: ${TABLE}."CLOUD_SPEND_25" ;;
  }

  measure: cloud_spend_median {
    type: average
    sql: ${TABLE}."CLOUD_SPEND_MEDIAN" ;;
  }

  measure: cloud_spend_75 {
    type: average
    sql: ${TABLE}."CLOUD_SPEND_75" ;;
  }

  measure: real_estate_spend_25 {
    type: average
    sql: ${TABLE}."REAL_ESTATE_SPEND_25" ;;
  }

  measure: real_estate_spend_median {
    type: average
    sql: ${TABLE}."REAL_ESTATE_SPEND_MEDIAN" ;;
  }

  measure: real_estate_spend_75 {
    type: average
    sql: ${TABLE}."REAL_ESTATE_SPEND_75" ;;
  }

  measure: r_d_25 {
    type: average
    sql: ${TABLE}."R_D_25" ;;
  }

  measure: r_d_median {
    type: average
    sql: ${TABLE}."R_D_MEDIAN" ;;
  }

  measure: r_d_75 {
    type: average
    sql: ${TABLE}."R_D_75" ;;
  }

  measure: s_m_25 {
    type: average
    sql: ${TABLE}."S_M_25" ;;
  }

  measure: s_m_median {
    type: average
    sql: ${TABLE}."S_M_MEDIAN" ;;
  }

  measure: s_m_75 {
    type: average
    sql: ${TABLE}."S_M_75" ;;
  }

  measure: g_a_25 {
    type: average
    sql: ${TABLE}."G_A_25" ;;
  }

  measure: g_a_median {
    type: average
    sql: ${TABLE}."G_A_MEDIAN" ;;
  }

  measure: g_a_75 {
    type: average
    sql: ${TABLE}."G_A_75" ;;
  }

  measure: opex_25_sector {
    type: average
    sql: ${TABLE}."OPEX_25_SECTOR" ;;
  }

  measure: opex_median_sector {
    type: average
    sql: ${TABLE}."OPEX_MEDIAN_SECTOR" ;;
  }

  measure: opex_75_sector {
    type: average
    sql: ${TABLE}."OPEX_75_SECTOR" ;;
  }

  measure: opex_25_rev_range {
    type: average
    sql: ${TABLE}."OPEX_25_REV_RANGE" ;;
  }

  measure: opex_median_rev_range {
    type: average
    sql: ${TABLE}."OPEX_MEDIAN_REV_RANGE" ;;
  }

  measure: opex_75_rev_range {
    type: average
    sql: ${TABLE}."OPEX_75_REV_RANGE" ;;
  }

  measure: eng_25 {
    type: average
    sql: ${TABLE}."ENG_25" ;;
  }

  measure: eng_med {
    type: average
    sql: ${TABLE}."ENG_MED" ;;
  }

  measure: eng_75 {
    type: average
    sql: ${TABLE}."ENG_75" ;;
  }

  measure: sales_25 {
    type: average
    sql: ${TABLE}."SALES_25" ;;
  }

  measure: sales_med {
    type: average
    sql: ${TABLE}."SALES_MED" ;;
  }

  measure: sales_75 {
    type: average
    sql: ${TABLE}."SALES_75" ;;
  }

  measure: cx_25 {
    type: average
    sql: ${TABLE}."CX_25" ;;
  }

  measure: cx_median {
    type: average
    sql: ${TABLE}."CX_MEDIAN" ;;
  }

  measure: cx_75 {
    type: average
    sql: ${TABLE}."CX_75" ;;
  }

  measure: people_25 {
    type: average
    sql: ${TABLE}."PEOPLE_25" ;;
  }

  measure: people_median {
    type: average
    sql: ${TABLE}."PEOPLE_MEDIAN" ;;
  }

  measure: people_75 {
    type: average
    sql: ${TABLE}."PEOPLE_75" ;;
  }

  measure: product_25 {
    type: average
    sql: ${TABLE}."PRODUCT_25" ;;
  }

  measure: product_median {
    type: average
    sql: ${TABLE}."PRODUCT_MEDIAN" ;;
  }

  measure: product_75 {
    type: average
    sql: ${TABLE}."PRODUCT_75" ;;
  }

  measure: marketing_25 {
    type: average
    sql: ${TABLE}."MARKETING_25" ;;
  }

  measure: marketing_median {
    type: average
    sql: ${TABLE}."MARKETING_MEDIAN" ;;
  }

  measure: marketing_75 {
    type: average
    sql: ${TABLE}."MARKETING_75" ;;
  }

  measure: corp_dev_25 {
    type: average
    sql: ${TABLE}."CORP_DEV_25" ;;
  }

  measure: corp_dev_median {
    type: average
    sql: ${TABLE}."CORP_DEV_MEDIAN" ;;
  }

  measure: corp_dev_75 {
    type: average
    sql: ${TABLE}."CORP_DEV_75" ;;
  }

  measure: finance_25 {
    type: average
    sql: ${TABLE}."FINANCE_25" ;;
  }

  measure: finance_median {
    type: average
    sql: ${TABLE}."FINANCE_MEDIAN" ;;
  }

  measure: finance_75 {
    type: average
    sql: ${TABLE}."FINANCE_75" ;;
  }

  measure: legal_25 {
    type: average
    sql: ${TABLE}."LEGAL_25" ;;
  }

  measure: legal_median {
    type: average
    sql: ${TABLE}."LEGAL_MEDIAN" ;;
  }

  measure: legal_75 {
    type: average
    sql: ${TABLE}."LEGAL_75" ;;
  }

}
