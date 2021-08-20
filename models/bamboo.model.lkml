connection: "looker-snowflake"

include: "/views/hr/bamboo_dim_employee.view.lkml"
fiscal_month_offset:  2


explore: bamboo_dim_employee {}
