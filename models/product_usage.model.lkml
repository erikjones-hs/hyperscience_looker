connection: "looker-snowflake"

include: "/views/user_defined_usage/*.view.lkml"                # include all views in the views/ folder in this project

explore: user_defined_usage_data {}
