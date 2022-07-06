connection: "looker-snowflake"

include: "/views/user_defined_usage/*.view.lkml" # include all views in the views/ folder in this project
include: "/views/product_analytics/*.view.lkml"

explore: user_defined_usage_data {}
explore: pageviews {}
explore: saas_usage {}
explore: saas_meta_data {}
explore: clicks_tasks {}
explore: pageviews_trash {}
explore: reporting {}
explore: documents {}
explore: flows {}
explore: submissions {}
explore: layouts {}
