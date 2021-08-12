connection: "looker-snowflake"

include: "/views/customer_data/*.view.lkml"
fiscal_month_offset:  2


explore: fct_pages_expansion {
  sql_always_where: ${dte_date} >= '2019-01-01';;
}
