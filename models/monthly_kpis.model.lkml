connection: "looker-snowflake"

include: "/views/monthly_kpis/sales.view.lkml"                # include all views in the views/ folder in this project

explore: sales {}
