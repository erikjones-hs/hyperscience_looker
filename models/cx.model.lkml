connection: "looker-snowflake"

include: "/views/cx/*.view.lkml"

explore: renewals_dash {}
explore: forecast_actuals {}
explore: utilization_run_rate {}
explore: project_backlog {}
