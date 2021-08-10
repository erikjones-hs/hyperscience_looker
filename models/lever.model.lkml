connection: "looker-snowflake"

include: "/views/hr/*.view.lkml"


explore: lever_agg_postings {}

explore: lever_opp_stage_hist { hidden: yes }

explore: lever_opp_stage_funnel { hidden: yes }

explore: lever_agg_offer { hidden: yes }
