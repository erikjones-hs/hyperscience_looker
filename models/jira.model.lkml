connection: "looker-snowflake"

include: "/views/jira/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: issues_components_versions {}
explore: escalation_engineer_ratio {}
explore: worklogs_escalations {}
