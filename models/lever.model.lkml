connection: "looker-snowflake"

include: "/views/hr/*.view.lkml"


explore: lever_agg_postings {}

explore: lever_opp_stage_hist {}

explore: lever_opp_stage_funnel {}

explore: lever_agg_offer {}
