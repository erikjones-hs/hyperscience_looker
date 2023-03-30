connection: "looker-snowflake"

include: "/views/data_qc/*.view.lkml"                # include all views in the views/ folder in this project
fiscal_month_offset:  2

explore: opp_contracted_pages_history {}
explore: usage_no_lookup {}
explore: new_saas_usage {}
explore: new_closed_won_opps {}
explore: renewals_moved_to_closed_lost {}
explore: renewals_moved_to_closed_won {}
