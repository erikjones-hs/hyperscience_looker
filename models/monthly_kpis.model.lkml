connection: "looker-snowflake"

include: "/views/monthly_kpis/*.view.lkml"                # include all views in the views/ folder in this project

explore: sales {}
explore: pages_processed {}
explore: hr {}
explore: sales_pipeline_history {}
explore: sales_pipeline_current {}
explore: cx_go_live_ttv {}
