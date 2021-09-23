connection: "looker-snowflake"

include: "/views/salesforce/monthly_kpis.view.lkml"                # include all views in the views/ folder in this project

explore: monthly_kpis {}
