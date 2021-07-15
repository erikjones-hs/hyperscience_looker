view: opportunity {
  sql_table_name: (select * from fivetran_database.salesforce.opportunity where not(is_deleted)) ;;
  drill_fields: [global_opportunity_id_c]

  dimension: global_opportunity_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}."global_opportunity_id_c" ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_fivetran_synced" ;;
  }

  dimension: acceptance_criteria_language_c {
    type: string
    sql: ${TABLE}."acceptance_criteria_language_c" ;;
  }

  dimension: acceptance_criteria_language_status_c {
    type: string
    sql: ${TABLE}."acceptance_criteria_language_status_c" ;;
  }

  dimension: account_contact_c {
    type: string
    sql: ${TABLE}."account_contact_c" ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."account_id" ;;
  }

  dimension: account_lead_c {
    type: string
    sql: ${TABLE}."account_lead_c" ;;
  }

  dimension: account_plan_c {
    type: string
    sql: ${TABLE}."account_plan_c" ;;
  }

  dimension: account_team_email_c {
    type: string
    sql: ${TABLE}."account_team_email_c" ;;
  }

  dimension: active_opportunity_c {
    type: yesno
    sql: ${TABLE}."active_opportunity_c" ;;
  }

  dimension_group: actual_go_live_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."actual_go_live_date_c" ;;
  }

  dimension: ae_discovery_stage_c {
    type: yesno
    sql: ${TABLE}."ae_discovery_stage_c" ;;
  }

  dimension: alternatives_being_considered_c {
    type: string
    sql: ${TABLE}."alternatives_being_considered_c" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension_group: anticipated_deployment_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."anticipated_deployment_date_c" ;;
  }

  dimension: anticipated_time_required_for_instance_c {
    type: string
    sql: ${TABLE}."anticipated_time_required_for_instance_c" ;;
  }

  dimension: any_feedback_for_product_c {
    type: string
    sql: ${TABLE}."any_feedback_for_product_c" ;;
  }

  dimension: architecture_plan_infrastructure_tech_st_c {
    type: string
    sql: ${TABLE}."architecture_plan_infrastructure_tech_st_c" ;;
  }

  dimension: architecture_plan_status_c {
    type: string
    sql: ${TABLE}."architecture_plan_status_c" ;;
  }

  dimension: arr_mirror_c {
    type: number
    sql: ${TABLE}."arr_mirror_c" ;;
  }

  dimension: authentication_c {
    type: string
    sql: ${TABLE}."authentication_c" ;;
  }

  dimension: authentication_status_c {
    type: string
    sql: ${TABLE}."authentication_status_c" ;;
  }

  dimension: authority_c {
    type: string
    sql: ${TABLE}."authority_c" ;;
  }

  dimension: avp_arr_c {
    type: number
    sql: ${TABLE}."avp_arr_c" ;;
  }

  dimension: avp_commit_status_c {
    type: string
    sql: ${TABLE}."avp_commit_status_c" ;;
  }

  dimension: avp_upside_c {
    type: number
    sql: ${TABLE}."avp_upside_c" ;;
  }

  dimension_group: best_case_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."best_case_c" ;;
  }

  dimension: best_case_check_c {
    type: yesno
    sql: ${TABLE}."best_case_check_c" ;;
  }

  dimension_group: bgov_2_award_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_award_date_c" ;;
  }

  dimension: bgov_2_awardee_c {
    type: string
    sql: ${TABLE}."bgov_2_awardee_c" ;;
  }

  dimension: bgov_2_bgov_url_c {
    type: string
    sql: ${TABLE}."bgov_2_bgov_url_c" ;;
  }

  dimension: bgov_2_classification_code_c {
    type: string
    sql: ${TABLE}."bgov_2_classification_code_c" ;;
  }

  dimension: bgov_2_classification_description_c {
    type: string
    sql: ${TABLE}."bgov_2_classification_description_c" ;;
  }

  dimension: bgov_2_competition_c {
    type: string
    sql: ${TABLE}."bgov_2_competition_c" ;;
  }

  dimension: bgov_2_composite_external_id_c {
    type: string
    sql: ${TABLE}."bgov_2_composite_external_id_c" ;;
  }

  dimension: bgov_2_contract_number_c {
    type: string
    sql: ${TABLE}."bgov_2_contract_number_c" ;;
  }

  dimension: bgov_2_contract_specialist_c {
    type: string
    sql: ${TABLE}."bgov_2_contract_specialist_c" ;;
  }

  dimension: bgov_2_contracting_agency_c {
    type: string
    sql: ${TABLE}."bgov_2_contracting_agency_c" ;;
  }

  dimension: bgov_2_contracting_bureau_c {
    type: string
    sql: ${TABLE}."bgov_2_contracting_bureau_c" ;;
  }

  dimension: bgov_2_contracting_office_c {
    type: string
    sql: ${TABLE}."bgov_2_contracting_office_c" ;;
  }

  dimension: bgov_2_current_burn_rate_c {
    type: number
    sql: ${TABLE}."bgov_2_current_burn_rate_c" ;;
  }

  dimension_group: bgov_2_current_completion_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_current_completion_date_c" ;;
  }

  dimension: bgov_2_customer_information_c {
    type: string
    sql: ${TABLE}."bgov_2_customer_information_c" ;;
  }

  dimension_group: bgov_2_end_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_end_date_c" ;;
  }

  dimension: bgov_2_estimated_rfp_release_date_c {
    type: string
    sql: ${TABLE}."bgov_2_estimated_rfp_release_date_c" ;;
  }

  dimension: bgov_2_funding_agency_c {
    type: string
    sql: ${TABLE}."bgov_2_funding_agency_c" ;;
  }

  dimension: bgov_2_funding_bureau_c {
    type: string
    sql: ${TABLE}."bgov_2_funding_bureau_c" ;;
  }

  dimension: bgov_2_funding_office_c {
    type: string
    sql: ${TABLE}."bgov_2_funding_office_c" ;;
  }

  dimension: bgov_2_idv_type_c {
    type: string
    sql: ${TABLE}."bgov_2_idv_type_c" ;;
  }

  dimension: bgov_2_incumbent_cage_code_c {
    type: string
    sql: ${TABLE}."bgov_2_incumbent_cage_code_c" ;;
  }

  dimension: bgov_2_incumbent_contract_task_order_number_c {
    type: string
    sql: ${TABLE}."bgov_2_incumbent_contract_task_order_number_c" ;;
  }

  dimension: bgov_2_incumbent_vendor_name_c {
    type: string
    sql: ${TABLE}."bgov_2_incumbent_vendor_name_c" ;;
  }

  dimension: bgov_2_incumbent_vendor_url_c {
    type: string
    sql: ${TABLE}."bgov_2_incumbent_vendor_url_c" ;;
  }

  dimension_group: bgov_2_last_date_to_order_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_last_date_to_order_c" ;;
  }

  dimension: bgov_2_naics_code_c {
    type: string
    sql: ${TABLE}."bgov_2_naics_code_c" ;;
  }

  dimension: bgov_2_naics_description_c {
    type: string
    sql: ${TABLE}."bgov_2_naics_description_c" ;;
  }

  dimension: bgov_2_new_requirement_c {
    type: string
    sql: ${TABLE}."bgov_2_new_requirement_c" ;;
  }

  dimension_group: bgov_2_next_action_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_next_action_date_c" ;;
  }

  dimension: bgov_2_obligations_c {
    type: number
    sql: ${TABLE}."bgov_2_obligations_c" ;;
  }

  dimension: bgov_2_offers_received_c {
    type: number
    sql: ${TABLE}."bgov_2_offers_received_c" ;;
  }

  dimension: bgov_2_original_solicitation_number_c {
    type: string
    sql: ${TABLE}."bgov_2_original_solicitation_number_c" ;;
  }

  dimension_group: bgov_2_origination_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_origination_date_c" ;;
  }

  dimension: bgov_2_parent_vendor_c {
    type: string
    sql: ${TABLE}."bgov_2_parent_vendor_c" ;;
  }

  dimension: bgov_2_place_of_performance_city_c {
    type: string
    sql: ${TABLE}."bgov_2_place_of_performance_city_c" ;;
  }

  dimension: bgov_2_place_of_performance_state_c {
    type: string
    sql: ${TABLE}."bgov_2_place_of_performance_state_c" ;;
  }

  dimension: bgov_2_product_service_code_c {
    type: string
    sql: ${TABLE}."bgov_2_product_service_code_c" ;;
  }

  dimension: bgov_2_product_service_description_c {
    type: string
    sql: ${TABLE}."bgov_2_product_service_description_c" ;;
  }

  dimension: bgov_2_recompete_c {
    type: string
    sql: ${TABLE}."bgov_2_recompete_c" ;;
  }

  dimension: bgov_2_recompete_solicitation_c {
    type: string
    sql: ${TABLE}."bgov_2_recompete_solicitation_c" ;;
  }

  dimension: bgov_2_related_contract_number_c {
    type: string
    sql: ${TABLE}."bgov_2_related_contract_number_c" ;;
  }

  dimension: bgov_2_related_contract_title_vehicle_c {
    type: string
    sql: ${TABLE}."bgov_2_related_contract_title_vehicle_c" ;;
  }

  dimension_group: bgov_2_rfp_release_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_rfp_release_date_c" ;;
  }

  dimension_group: bgov_2_rfp_response_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_rfp_response_date_c" ;;
  }

  dimension: bgov_2_set_aside_type_c {
    type: string
    sql: ${TABLE}."bgov_2_set_aside_type_c" ;;
  }

  dimension: bgov_2_sole_source_c {
    type: string
    sql: ${TABLE}."bgov_2_sole_source_c" ;;
  }

  dimension: bgov_2_solicitation_number_c {
    type: string
    sql: ${TABLE}."bgov_2_solicitation_number_c" ;;
  }

  dimension: bgov_2_source_of_value_c {
    type: string
    sql: ${TABLE}."bgov_2_source_of_value_c" ;;
  }

  dimension_group: bgov_2_start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bgov_2_start_date_c" ;;
  }

  dimension: bgov_2_status_c {
    type: string
    sql: ${TABLE}."bgov_2_status_c" ;;
  }

  dimension: bgov_2_subcontracting_plan_status_c {
    type: string
    sql: ${TABLE}."bgov_2_subcontracting_plan_status_c" ;;
  }

  dimension: bgov_2_sum_of_transactions_c {
    type: string
    sql: ${TABLE}."bgov_2_sum_of_transactions_c" ;;
  }

  dimension: bgov_2_task_order_number_c {
    type: string
    sql: ${TABLE}."bgov_2_task_order_number_c" ;;
  }

  dimension: bgov_2_total_burn_rate_c {
    type: number
    sql: ${TABLE}."bgov_2_total_burn_rate_c" ;;
  }

  dimension: bgov_2_total_value_c {
    type: number
    sql: ${TABLE}."bgov_2_total_value_c" ;;
  }

  dimension: bgov_2_updates_c {
    type: string
    sql: ${TABLE}."bgov_2_updates_c" ;;
  }

  dimension: bgov_2_value_max_c {
    type: number
    sql: ${TABLE}."bgov_2_value_max_c" ;;
  }

  dimension: bgov_2_value_min_c {
    type: number
    sql: ${TABLE}."bgov_2_value_min_c" ;;
  }

  dimension: bgov_2_vendor_contacts_c {
    type: string
    sql: ${TABLE}."bgov_2_vendor_contacts_c" ;;
  }

  dimension: bgov_2_weapon_code_c {
    type: string
    sql: ${TABLE}."bgov_2_weapon_code_c" ;;
  }

  dimension: bgov_2_weapon_description_c {
    type: string
    sql: ${TABLE}."bgov_2_weapon_description_c" ;;
  }

  dimension: billing_contact_email_c {
    type: string
    sql: ${TABLE}."billing_contact_email_c" ;;
  }

  dimension: billing_contact_name_c {
    type: string
    sql: ${TABLE}."billing_contact_name_c" ;;
  }

  dimension: bizible_2_bizible_opportunity_amount_c {
    type: number
    sql: ${TABLE}."bizible_2_bizible_opportunity_amount_c" ;;
  }

  dimension: budget_confirmed_c {
    type: yesno
    sql: ${TABLE}."budget_confirmed_c" ;;
  }

  dimension: business_challenge_c {
    type: string
    sql: ${TABLE}."business_challenge_c" ;;
  }

  dimension: business_priority_c {
    type: string
    sql: ${TABLE}."business_priority_c" ;;
  }

  dimension: business_strategy_c {
    type: string
    sql: ${TABLE}."business_strategy_c" ;;
  }

  dimension_group: bv_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bv_date_c" ;;
  }

  dimension: bv_stage_c {
    type: yesno
    sql: ${TABLE}."bv_stage_c" ;;
  }

  dimension: c_c {
    type: yesno
    sql: ${TABLE}."c_c" ;;
  }

  dimension: c_level_insights_c {
    type: string
    sql: ${TABLE}."c_level_insights_c" ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."campaign_id" ;;
  }

  dimension: champion_c {
    type: string
    sql: ${TABLE}."champion_c" ;;
  }

  dimension: champion_gaps_plan_to_address_c {
    type: string
    sql: ${TABLE}."champion_gaps_plan_to_address_c" ;;
  }

  dimension: champion_status_c {
    type: string
    sql: ${TABLE}."champion_status_c" ;;
  }

  dimension: channel_manager_c {
    type: string
    sql: ${TABLE}."channel_manager_c" ;;
  }

  dimension: click_through_bonus_c {
    type: yesno
    sql: ${TABLE}."click_through_bonus_c" ;;
  }

  dimension: clickthrough_msa_bonus_c {
    type: yesno
    sql: ${TABLE}."clickthrough_msa_bonus_c" ;;
  }

  dimension: client_signed_off_on_proposal_c {
    type: yesno
    sql: ${TABLE}."client_signed_off_on_proposal_c" ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."close_date" ;;
  }

  dimension_group: closed_lost_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."closed_lost_date_c" ;;
  }

  dimension_group: closed_won_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."closed_won_date_c" ;;
  }

  dimension: closed_won_prediction_c {
    type: number
    sql: ${TABLE}."closed_won_prediction_c" ;;
  }

  dimension: commit_check_c {
    type: yesno
    sql: ${TABLE}."commit_check_c" ;;
  }

  dimension_group: commit_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."commit_date_c" ;;
  }

  dimension: commit_status_c {
    type: string
    sql: ${TABLE}."commit_status_c" ;;
  }

  dimension: competition_c {
    type: string
    sql: ${TABLE}."competition_c" ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."contact_id" ;;
  }

  dimension: corporate_strategy_c {
    type: string
    sql: ${TABLE}."corporate_strategy_c" ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}."created_by_id" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_date" ;;
  }

  dimension: days_open {
    type: number
    sql: datediff(days, ${created_raw}, coalesce(${close_raw}, current_date) ) ;;
  }

  dimension: created_to_closed_in_60 {
    hidden: yes
    type: yesno
    sql: ${days_open} <= 60 AND ${is_closed} = 'yes' AND ${is_won} = 'yes' ;;
  }

  dimension: current_pain_points_to_solve_c {
    type: string
    sql: ${TABLE}."current_pain_points_to_solve_c" ;;
  }

  dimension: current_pain_points_to_solve_status_c {
    type: string
    sql: ${TABLE}."current_pain_points_to_solve_status_c" ;;
  }

  dimension: current_state_negative_consequences_c {
    type: string
    sql: ${TABLE}."current_state_negative_consequences_c" ;;
  }

  dimension_group: custom_demo_delivered_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."custom_demo_delivered_date_c" ;;
  }

  dimension: customer_sla_s_c {
    type: string
    sql: ${TABLE}."customer_sla_s_c" ;;
  }

  dimension: customer_sla_s_status_c {
    type: string
    sql: ${TABLE}."customer_sla_s_status_c" ;;
  }

  dimension: cx_ready_c {
    type: yesno
    sql: ${TABLE}."cx_ready_c" ;;
  }

  dimension: dashboards_gsp_close_date_extensions_c {
    type: number
    sql: ${TABLE}."dashboards_gsp_close_date_extensions_c" ;;
  }

  dimension: dashboards_gsp_close_date_month_extensions_c {
    type: number
    sql: ${TABLE}."dashboards_gsp_close_date_month_extensions_c" ;;
  }

  dimension_group: dashboards_gsp_date_opportunity_was_closed_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dashboards_gsp_date_opportunity_was_closed_c" ;;
  }

  dimension: dashboards_gsp_days_open_delete_c {
    type: number
    sql: ${TABLE}."dashboards_gsp_days_open_delete_c" ;;
  }

  dimension_group: dashboards_gsp_last_stage_change_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dashboards_gsp_last_stage_change_date_c" ;;
  }

  dimension: days_shifted_c {
    type: number
    sql: ${TABLE}."days_shifted_c" ;;
  }

  dimension: dc_c {
    type: yesno
    sql: ${TABLE}."dc_c" ;;
  }

  dimension: decision_criteria_c {
    type: string
    sql: ${TABLE}."decision_criteria_c" ;;
  }

  dimension: decision_criteria_gaps_plan_c {
    type: string
    sql: ${TABLE}."decision_criteria_gaps_plan_c" ;;
  }

  dimension: decision_criteria_status_c {
    type: string
    sql: ${TABLE}."decision_criteria_status_c" ;;
  }

  dimension: decision_process_c {
    type: string
    sql: ${TABLE}."decision_process_c" ;;
  }

  dimension: decision_process_gap_plan_c {
    type: string
    sql: ${TABLE}."decision_process_gap_plan_c" ;;
  }

  dimension: decision_process_status_c {
    type: string
    sql: ${TABLE}."decision_process_status_c" ;;
  }

  dimension: demo_url_c {
    type: string
    sql: ${TABLE}."demo_url_c" ;;
  }

  dimension: department_c {
    type: string
    sql: ${TABLE}."department_c" ;;
  }

  dimension: deployment_goals_c {
    type: string
    sql: ${TABLE}."deployment_goals_c" ;;
  }

  dimension: deployment_lead_c {
    type: string
    sql: ${TABLE}."deployment_lead_c" ;;
  }

  dimension: deployment_location_c {
    type: string
    sql: ${TABLE}."deployment_location_c" ;;
  }

  dimension: deployment_location_status_c {
    type: string
    sql: ${TABLE}."deployment_location_status_c" ;;
  }

  dimension: deployment_notes_c {
    type: string
    sql: ${TABLE}."deployment_notes_c" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension_group: desired_start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."desired_start_date_c" ;;
  }

  dimension: desired_state_positive_outcomes_c {
    type: string
    sql: ${TABLE}."desired_state_positive_outcomes_c" ;;
  }

  dimension_group: discovery_call_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."discovery_call_date_c" ;;
  }

  dimension: discovery_call_occurred_c {
    type: string
    sql: ${TABLE}."discovery_call_occurred_c" ;;
  }

  dimension: discovery_completed_c {
    type: yesno
    sql: ${TABLE}."discovery_completed_c" ;;
  }

  dimension: doc_types_needed_c {
    type: string
    sql: ${TABLE}."doc_types_needed_c" ;;
  }

  dimension: document_type_c {
    type: string
    sql: ${TABLE}."document_type_c" ;;
  }

  dimension: dp_c {
    type: yesno
    sql: ${TABLE}."dp_c" ;;
  }

  dimension: e_c {
    type: yesno
    sql: ${TABLE}."e_c" ;;
  }

  dimension: eb_c {
    type: string
    sql: ${TABLE}."eb_c" ;;
  }

  dimension: eb_gap_plan_c {
    type: string
    sql: ${TABLE}."eb_gap_plan_c" ;;
  }

  dimension_group: eb_go_no_go_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."eb_go_no_go_date_c" ;;
  }

  dimension: eb_go_no_go_stage_c {
    type: yesno
    sql: ${TABLE}."eb_go_no_go_stage_c" ;;
  }

  dimension_group: eb_review_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."eb_review_date_c" ;;
  }

  dimension: eb_status_c {
    type: string
    sql: ${TABLE}."eb_status_c" ;;
  }

  dimension: ebreview_stage_c {
    type: yesno
    sql: ${TABLE}."ebreview_stage_c" ;;
  }

  dimension: einstein_prediction_c {
    type: number
    sql: ${TABLE}."einstein_prediction_c" ;;
  }

  dimension_group: end_renewal_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_renewal_date_c" ;;
  }

  dimension: existing_system_used_c {
    type: string
    sql: ${TABLE}."existing_system_used_c" ;;
  }

  dimension: expectations_timeline_rollout_c {
    type: string
    sql: ${TABLE}."expectations_timeline_rollout_c" ;;
  }

  dimension: expectations_timeline_rollout_st_status_c {
    type: string
    sql: ${TABLE}."expectations_timeline_rollout_st_status_c" ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}."expected_revenue" ;;
  }

  dimension: extraction_technology_type_c {
    type: string
    sql: ${TABLE}."extraction_technology_type_c" ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}."fiscal" ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}."fiscal_quarter" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."fiscal_year" ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}."forecast_category" ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}."forecast_category_name" ;;
  }

  dimension_group: go_live_goal_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."go_live_goal_date_c" ;;
  }

  dimension: goals_c {
    type: string
    sql: ${TABLE}."goals_c" ;;
  }

  dimension: gong_current_generators_c {
    type: string
    sql: ${TABLE}."gong_current_generators_c" ;;
  }

  dimension: gong_delivery_installation_status_c {
    type: string
    sql: ${TABLE}."gong_delivery_installation_status_c" ;;
  }

  dimension: gong_main_competitors_c {
    type: string
    sql: ${TABLE}."gong_main_competitors_c" ;;
  }

  dimension: gong_order_number_c {
    type: string
    sql: ${TABLE}."gong_order_number_c" ;;
  }

  dimension: gong_tracking_number_c {
    type: string
    sql: ${TABLE}."gong_tracking_number_c" ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}."has_open_activity" ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}."has_opportunity_line_item" ;;
  }

  dimension: has_overdue_task {
    type: yesno
    sql: ${TABLE}."has_overdue_task" ;;
  }

  dimension: i_c {
    type: yesno
    sql: ${TABLE}."i_c" ;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: id_time_based_pain_c {
    type: string
    sql: ${TABLE}."id_time_based_pain_c" ;;
  }

  dimension: id_time_based_pain_gaps_plan_c {
    type: string
    sql: ${TABLE}."id_time_based_pain_gaps_plan_c" ;;
  }

  dimension: id_time_based_pain_status_c {
    type: string
    sql: ${TABLE}."id_time_based_pain_status_c" ;;
  }

  dimension: implementation_team_c {
    type: string
    sql: ${TABLE}."implementation_team_c" ;;
  }

  dimension: implementation_team_status_c {
    type: string
    sql: ${TABLE}."implementation_team_status_c" ;;
  }

  dimension_group: initial_meeting_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."initial_meeting_date_c" ;;
  }

  dimension: initial_term_length_c {
    type: number
    sql: ${TABLE}."initial_term_length_c" ;;
  }

  dimension: initiatives_c {
    type: string
    sql: ${TABLE}."initiatives_c" ;;
  }

  dimension: integrations_needed_c {
    type: string
    sql: ${TABLE}."integrations_needed_c" ;;
  }

  dimension: integrations_needed_status_c {
    type: string
    sql: ${TABLE}."integrations_needed_status_c" ;;
  }

  dimension: internal_business_champion_contact_c {
    type: string
    sql: ${TABLE}."internal_business_champion_contact_c" ;;
  }

  dimension: internal_technical_lead_contact_c {
    type: string
    sql: ${TABLE}."internal_technical_lead_contact_c" ;;
  }

  dimension: intriguing_peripheral_features_c {
    type: string
    sql: ${TABLE}."intriguing_peripheral_features_c" ;;
  }

  dimension: intriguing_peripheral_features_status_c {
    type: string
    sql: ${TABLE}."intriguing_peripheral_features_status_c" ;;
  }

  dimension: invoice_1_amount_c {
    type: number
    sql: ${TABLE}."invoice_1_amount_c" ;;
  }

  dimension_group: invoice_1_issue_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."invoice_1_issue_date_c" ;;
  }

  dimension: invoice_terms_c {
    type: string
    sql: ${TABLE}."invoice_terms_c" ;;
  }

  dimension: invoicing_method_c {
    type: string
    sql: ${TABLE}."invoicing_method_c" ;;
  }

  dimension: ironclad_workflow_oppfld_c {
    type: string
    sql: ${TABLE}."ironclad_workflow_oppfld_c" ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}."is_closed" ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}."is_deleted" ;;
  }

  dimension: is_lost {
    type: yesno
    sql: ${is_closed} AND NOT ${is_won} ;;
  }

  dimension: probability_group {
    case: {
      when: {
        sql: ${probability} = 100 ;;
        label: "Won"
      }
      when: {
        sql: ${probability} > 80 ;;
        label: "Above 80%"
      }
      when: {
        sql: ${probability} > 60 ;;
        label: "60 - 80%"
      }
      when: {
        sql: ${probability} > 40 ;;
        label: "40 - 60%"
      }
      when: {
        sql: ${probability} > 20 ;;
        label: "20 - 40%"
      }
      when: {
        sql: ${probability} > 0 ;;
        label: "Under 20%"
      }
      when: {
        sql: ${probability} = 0 ;;
        label: "Lost"
      }
    }
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}."is_won" ;;
  }

  dimension: key_value_drivers_c {
    type: string
    sql: ${TABLE}."key_value_drivers_c" ;;
  }

  dimension: keying_team_c {
    type: string
    sql: ${TABLE}."keying_team_c" ;;
  }

  dimension: keying_team_status_c {
    type: string
    sql: ${TABLE}."keying_team_status_c" ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."last_activity_date" ;;
  }

  dimension: last_amount_changed_history_id {
    type: string
    sql: ${TABLE}."last_amount_changed_history_id" ;;
  }

  dimension: last_close_date_changed_history_id {
    type: string
    sql: ${TABLE}."last_close_date_changed_history_id" ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}."last_modified_by_id" ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."last_modified_date" ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."last_referenced_date" ;;
  }

  dimension_group: last_stage_change_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."last_stage_change_date_c" ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."last_viewed_date" ;;
  }

  dimension: layouts_blanks_models_c {
    type: string
    sql: ${TABLE}."layouts_blanks_models_c" ;;
  }

  dimension: layouts_blanks_models_status_c {
    type: string
    sql: ${TABLE}."layouts_blanks_models_status_c" ;;
  }

  dimension_group: lead_created_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."lead_created_date_c" ;;
  }

  dimension: lead_engineer_c {
    type: string
    sql: ${TABLE}."lead_engineer_c" ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}."lead_source" ;;
  }

  dimension: lead_source_channel_c {
    type: string
    sql: ${TABLE}."lead_source_channel_c" ;;
  }

  dimension: lean_data_days_in_stage_c {
    type: number
    sql: ${TABLE}."lean_data_days_in_stage_c" ;;
  }

  dimension: lean_data_order_number_c {
    type: string
    sql: ${TABLE}."lean_data_order_number_c" ;;
  }

  dimension_group: lean_data_reporting_last_run_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lean_data_reporting_last_run_date_c" ;;
  }

  dimension: lean_data_reporting_opportunity_source_c {
    type: string
    sql: ${TABLE}."lean_data_reporting_opportunity_source_c" ;;
  }

  dimension: lean_data_reporting_total_marketing_touches_c {
    type: number
    sql: ${TABLE}."lean_data_reporting_total_marketing_touches_c" ;;
  }

  dimension: lean_data_reporting_won_number_c {
    type: string
    sql: ${TABLE}."lean_data_reporting_won_number_c" ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}."lean_data_routing_action_c" ;;
  }

  dimension: legacy_arr_c {
    type: number
    sql: ${TABLE}."legacy_arr_c" ;;
  }

  dimension: legacy_system_accuracy_rate_c {
    type: number
    sql: ${TABLE}."legacy_system_accuracy_rate_c" ;;
  }

  dimension: legacy_system_c {
    type: string
    sql: ${TABLE}."legacy_system_c" ;;
  }

  dimension: license_payment_terms_c {
    type: string
    sql: ${TABLE}."license_payment_terms_c" ;;
  }

  dimension: lid_current_generators_c {
    type: string
    sql: ${TABLE}."lid_current_generators_c" ;;
  }

  dimension: lid_delivery_installation_status_c {
    type: string
    sql: ${TABLE}."lid_delivery_installation_status_c" ;;
  }

  dimension: lid_is_influenced_c {
    type: yesno
    sql: ${TABLE}."lid_is_influenced_c" ;;
  }

  dimension: lid_linked_in_company_id_c {
    type: string
    sql: ${TABLE}."lid_linked_in_company_id_c" ;;
  }

  dimension: lid_main_competitors_c {
    type: string
    sql: ${TABLE}."lid_main_competitors_c" ;;
  }

  dimension_group: lid_my_date_time_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lid_my_date_time_c" ;;
  }

  dimension: lid_my_geolocation_latitude_s {
    type: number
    sql: ${TABLE}."lid_my_geolocation_latitude_s" ;;
  }

  dimension: lid_my_geolocation_longitude_s {
    type: number
    sql: ${TABLE}."lid_my_geolocation_longitude_s" ;;
  }

  dimension: lid_order_number_c {
    type: string
    sql: ${TABLE}."lid_order_number_c" ;;
  }

  dimension: lid_tracking_number_c {
    type: string
    sql: ${TABLE}."lid_tracking_number_c" ;;
  }

  dimension: logo_churn_c {
    type: yesno
    sql: ${TABLE}."logo_churn_c" ;;
  }

  dimension_group: logo_churn_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."logo_churn_date_c" ;;
  }

  dimension: loss_reason_c {
    type: string
    sql: ${TABLE}."loss_reason_c" ;;
  }

  dimension: loss_reason_description_c {
    type: string
    sql: ${TABLE}."loss_reason_description_c" ;;
  }

  dimension: m_c {
    type: yesno
    sql: ${TABLE}."m_c" ;;
  }

  dimension: marketing_rights_c {
    type: yesno
    sql: ${TABLE}."marketing_rights_c" ;;
  }

  dimension: metrics_c {
    type: string
    sql: ${TABLE}."metrics_c" ;;
  }

  dimension: metrics_gap_plan_c {
    type: string
    sql: ${TABLE}."metrics_gap_plan_c" ;;
  }

  dimension: metrics_status_c {
    type: string
    sql: ${TABLE}."metrics_status_c" ;;
  }

  dimension_group: most_recent_next_step_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."most_recent_next_step_date_c" ;;
  }

  dimension: most_recent_note_c {
    type: string
    sql: ${TABLE}."most_recent_note_c" ;;
  }

  dimension_group: mql_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."mql_date_c" ;;
  }

  dimension: mrcs_c {
    type: string
    sql: ${TABLE}."mrcs_c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension_group: nbm_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."nbm_date_c" ;;
  }

  dimension_group: nbm_meeting_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."nbm_meeting_date_c" ;;
  }

  dimension: nbm_occurred_c {
    type: string
    sql: ${TABLE}."nbm_occurred_c" ;;
  }

  dimension: nbm_stage_c {
    type: yesno
    sql: ${TABLE}."nbm_stage_c" ;;
  }

  dimension_group: negotiate_and_close_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."negotiate_and_close_c" ;;
  }

  dimension: negotiate_and_close_stage_c {
    type: yesno
    sql: ${TABLE}."negotiate_and_close_stage_c" ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}."next_step" ;;
  }

  dimension: next_step_new_c {
    type: string
    sql: ${TABLE}."next_step_new_c" ;;
  }

  dimension: next_steps_avp_se_only_c {
    type: string
    sql: ${TABLE}."next_steps_avp_se_only_c" ;;
  }

  dimension: next_steps_c_c {
    type: string
    sql: ${TABLE}."next_steps_c_c" ;;
  }

  dimension: next_steps_old_c {
    type: string
    sql: ${TABLE}."next_steps_old_c" ;;
  }

  dimension: notes_c {
    type: string
    sql: ${TABLE}."notes_c" ;;
  }

  dimension: number_of_contacts_on_opp_c {
    type: number
    sql: ${TABLE}."number_of_contacts_on_opp_c" ;;
  }

  dimension: number_of_contacts_roles_assigned_c {
    type: number
    sql: ${TABLE}."number_of_contacts_roles_assigned_c" ;;
  }

  dimension: opportunity_details_c {
    type: string
    sql: ${TABLE}."opportunity_details_c" ;;
  }

  dimension: other_document_types_info_c {
    type: string
    sql: ${TABLE}."other_document_types_info_c" ;;
  }

  dimension: other_integrations_c {
    type: string
    sql: ${TABLE}."other_integrations_c" ;;
  }

  dimension: overage_details_c {
    type: string
    sql: ${TABLE}."overage_details_c" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."owner_id" ;;
  }

  dimension: paid_c {
    type: yesno
    sql: ${TABLE}."paid_c" ;;
  }

  dimension: paper_process_c {
    type: string
    sql: ${TABLE}."paper_process_c" ;;
  }

  dimension: partner_account_c {
    type: string
    sql: ${TABLE}."partner_account_c" ;;
  }

  dimension: partner_fee_amount_c {
    type: number
    sql: ${TABLE}."partner_fee_amount_c" ;;
  }

  dimension: partner_referral_fee_eligible_c {
    type: string
    sql: ${TABLE}."partner_referral_fee_eligible_c" ;;
  }

  dimension: partnership_introduction_type_c {
    type: string
    sql: ${TABLE}."partnership_introduction_type_c" ;;
  }

  dimension: payment_schedule_c {
    type: string
    sql: ${TABLE}."payment_schedule_c" ;;
  }

  dimension: payment_terms_notes_c {
    type: string
    sql: ${TABLE}."payment_terms_notes_c" ;;
  }

  dimension: percentage_paid_c {
    type: number
    sql: ${TABLE}."percentage_paid_c" ;;
  }

  dimension: pilot_signed_c {
    type: yesno
    sql: ${TABLE}."pilot_signed_c" ;;
  }

  dimension_group: pilot_signed_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."pilot_signed_date_c" ;;
  }

  dimension: planning_engineer_customer_meetings_c {
    type: string
    sql: ${TABLE}."planning_engineer_customer_meetings_c" ;;
  }

  dimension: poc_accuracy_c {
    type: number
    sql: ${TABLE}."poc_accuracy_c" ;;
  }

  dimension: poc_automation_c {
    type: number
    sql: ${TABLE}."poc_automation_c" ;;
  }

  dimension_group: poc_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."poc_date_c" ;;
  }

  dimension_group: poc_end_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."poc_end_date_c" ;;
  }

  dimension: poc_fields_processed_c {
    type: number
    sql: ${TABLE}."poc_fields_processed_c" ;;
  }

  dimension: poc_notes_c {
    type: string
    sql: ${TABLE}."poc_notes_c" ;;
  }

  dimension: poc_pages_processed_c {
    type: number
    sql: ${TABLE}."poc_pages_processed_c" ;;
  }

  dimension: poc_signed_c {
    type: yesno
    sql: ${TABLE}."poc_signed_c" ;;
  }

  dimension_group: poc_signed_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."poc_signed_date_c" ;;
  }

  dimension_group: poc_start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."poc_start_date_c" ;;
  }

  dimension: potential_integrations_required_c {
    type: string
    sql: ${TABLE}."potential_integrations_required_c" ;;
  }

  dimension: potential_leveragable_partner_c {
    type: string
    sql: ${TABLE}."potential_leveragable_partner_c" ;;
  }

  dimension: pre_closed_lost_commit_status_c {
    type: string
    sql: ${TABLE}."pre_closed_lost_commit_status_c" ;;
  }

  dimension: pre_closed_lost_stage_c {
    type: string
    sql: ${TABLE}."pre_closed_lost_stage_c" ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}."pricebook_2_id" ;;
  }

  dimension: primary_ae_second_ae_split_c {
    type: number
    sql: ${TABLE}."primary_ae_second_ae_split_c" ;;
  }

  dimension: primary_contact_assigned_c {
    type: yesno
    sql: ${TABLE}."primary_contact_assigned_c" ;;
  }

  dimension: prior_ml_automation_experience_c {
    type: string
    sql: ${TABLE}."prior_ml_automation_experience_c" ;;
  }

  dimension: prior_ml_automation_experience_status_c {
    type: string
    sql: ${TABLE}."prior_ml_automation_experience_status_c" ;;
  }

  dimension: prior_opportunity_c {
    type: string
    sql: ${TABLE}."prior_opportunity_c" ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."probability" ;;
  }

  dimension: process_mapping_c {
    type: string
    sql: ${TABLE}."process_mapping_c" ;;
  }

  dimension: process_mapping_status_c {
    type: string
    sql: ${TABLE}."process_mapping_status_c" ;;
  }

  dimension: product_feedback_c {
    type: string
    sql: ${TABLE}."product_feedback_c" ;;
  }

  dimension: product_feedback_status_c {
    type: string
    sql: ${TABLE}."product_feedback_status_c" ;;
  }

  dimension: product_testing_requirements_c {
    type: string
    sql: ${TABLE}."product_testing_requirements_c" ;;
  }

  dimension: product_testing_requirements_status_c {
    type: string
    sql: ${TABLE}."product_testing_requirements_status_c" ;;
  }

  dimension: proejct_timeline_c {
    type: string
    sql: ${TABLE}."proejct_timeline_c" ;;
  }

  dimension: projected_volume_c {
    type: string
    sql: ${TABLE}."projected_volume_c" ;;
  }

  dimension: purchase_order_c {
    type: string
    sql: ${TABLE}."purchase_order_c" ;;
  }

  dimension: qualification_notes_c {
    type: string
    sql: ${TABLE}."qualification_notes_c" ;;
  }

  dimension: release_plan_c {
    type: string
    sql: ${TABLE}."release_plan_c" ;;
  }

  dimension: relevant_customer_stories_c {
    type: string
    sql: ${TABLE}."relevant_customer_stories_c" ;;
  }

  dimension: renewal_payment_override_amount_c {
    type: number
    sql: ${TABLE}."renewal_payment_override_amount_c" ;;
  }

  dimension: renewal_payment_override_c {
    type: yesno
    sql: ${TABLE}."renewal_payment_override_c" ;;
  }

  dimension: required_integrations_c {
    type: string
    sql: ${TABLE}."required_integrations_c" ;;
  }

  dimension: revenue_churn_amount_c {
    type: number
    sql: ${TABLE}."revenue_churn_amount_c" ;;
  }

  dimension: revenue_churn_c {
    type: yesno
    sql: ${TABLE}."revenue_churn_c" ;;
  }

  dimension_group: revenue_churn_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."revenue_churn_date_c" ;;
  }

  dimension: revenue_type_c {
    type: string
    sql: ${TABLE}."revenue_type_c" ;;
  }

  dimension: risk_documentation_c {
    type: string
    sql: ${TABLE}."risk_documentation_c" ;;
  }

  dimension: risk_documentation_status_c {
    type: string
    sql: ${TABLE}."risk_documentation_status_c" ;;
  }

  dimension: risks_capabilities_c {
    type: string
    sql: ${TABLE}."risks_capabilities_c" ;;
  }

  dimension: roi_analysis_completed_c {
    type: yesno
    sql: ${TABLE}."roi_analysis_completed_c" ;;
  }

  dimension: sales_loft_1_most_recent_cadence_name_c {
    type: string
    sql: ${TABLE}."sales_loft_1_most_recent_cadence_name_c" ;;
  }

  dimension: sales_loft_1_most_recent_last_completed_step_c {
    type: number
    sql: ${TABLE}."sales_loft_1_most_recent_last_completed_step_c" ;;
  }

  dimension: sales_loft_1_primary_contact_c {
    type: string
    sql: ${TABLE}."sales_loft_1_primary_contact_c" ;;
  }

  dimension: salesperson_c {
    type: string
    sql: ${TABLE}."salesperson_c" ;;
  }

  dimension: sample_documents_c {
    type: string
    sql: ${TABLE}."sample_documents_c" ;;
  }

  dimension: sample_documents_status_c {
    type: string
    sql: ${TABLE}."sample_documents_status_c" ;;
  }

  dimension: sdr_2_nd_sdr_split_c {
    type: number
    sql: ${TABLE}."sdr_2_nd_sdr_split_c" ;;
  }

  dimension: sdr_c {
    type: string
    sql: ${TABLE}."sdr_c" ;;
  }

  dimension: sdr_call_scheduled_check_c {
    type: yesno
    sql: ${TABLE}."sdr_call_scheduled_check_c" ;;
  }

  dimension_group: sdrcall_schedule_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."sdrcall_schedule_date_c" ;;
  }

  dimension_group: se_assignment_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."se_assignment_date_c" ;;
  }

  dimension: se_stage_c {
    type: string
    sql: ${TABLE}."se_stage_c" ;;
  }

  dimension: secondary_ae_c {
    type: string
    sql: ${TABLE}."secondary_ae_c" ;;
  }

  dimension: secondary_lead_source_c {
    type: string
    sql: ${TABLE}."secondary_lead_source_c" ;;
  }

  dimension: secondary_sdr_c {
    type: string
    sql: ${TABLE}."secondary_sdr_c" ;;
  }

  dimension: security_concerns_c {
    type: string
    sql: ${TABLE}."security_concerns_c" ;;
  }

  dimension: security_concerns_status_c {
    type: string
    sql: ${TABLE}."security_concerns_status_c" ;;
  }

  dimension: services_payment_terms_c {
    type: string
    sql: ${TABLE}."services_payment_terms_c" ;;
  }

  dimension: software_install_location_c {
    type: string
    sql: ${TABLE}."software_install_location_c" ;;
  }

  dimension: solution_consultant_c {
    type: string
    sql: ${TABLE}."solution_consultant_c" ;;
  }

  dimension: solutions_engineer_c {
    type: string
    sql: ${TABLE}."solutions_engineer_c" ;;
  }

  dimension: sow_checklist_url_c {
    type: string
    sql: ${TABLE}."sow_checklist_url_c" ;;
  }

  dimension_group: sql_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."sql_date_c" ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}."stage_name" ;;
  }

  dimension: standard_payment_term_override_c {
    type: yesno
    sql: ${TABLE}."standard_payment_term_override_c" ;;
  }

  dimension_group: start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date_c" ;;
  }

  dimension: supervision_qa_being_used_status_c {
    type: string
    sql: ${TABLE}."supervision_qa_being_used_status_c" ;;
  }

  dimension: synced_quote_id {
    type: string
    sql: ${TABLE}."synced_quote_id" ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."system_modstamp" ;;
  }

  dimension: tdd_approved_c {
    type: yesno
    sql: ${TABLE}."tdd_approved_c" ;;
  }

  dimension_group: tdd_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."tdd_date_c" ;;
  }

  dimension: tdd_stage_c {
    type: yesno
    sql: ${TABLE}."tdd_stage_c" ;;
  }

  dimension: tspc_cpdeal_c {
    type: string
    sql: ${TABLE}."tspc_cpdeal_c" ;;
  }

  dimension_group: tspc_cplast_opp_update_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."tspc_cplast_opp_update_date_c" ;;
  }

  dimension: tve_skipped_c {
    type: yesno
    sql: ${TABLE}."tve_skipped_c" ;;
  }

  dimension: tve_stage_c {
    type: yesno
    sql: ${TABLE}."tve_stage_c" ;;
  }

  dimension: tve_use_case_c {
    type: string
    sql: ${TABLE}."tve_use_case_c" ;;
  }

  dimension: tve_use_case_status_c {
    type: string
    sql: ${TABLE}."tve_use_case_status_c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: type_of_preferred_deployment_c {
    type: string
    sql: ${TABLE}."type_of_preferred_deployment_c" ;;
  }

  dimension: unqualified_reasons_c {
    type: string
    sql: ${TABLE}."unqualified_reasons_c" ;;
  }

  dimension: usage_limits_c {
    type: number
    sql: ${TABLE}."usage_limits_c" ;;
  }

  dimension: use_case_c {
    type: string
    sql: ${TABLE}."use_case_c" ;;
  }

  dimension: utilizing_supervision_qa_c {
    type: string
    sql: ${TABLE}."utilizing_supervision_qa_c" ;;
  }

  dimension: value_to_the_business_c {
    type: string
    sql: ${TABLE}."value_to_the_business_c" ;;
  }

  dimension_group: vf_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."vf_date_c" ;;
  }

  dimension: vf_stage_c {
    type: yesno
    sql: ${TABLE}."vf_stage_c" ;;
  }

  dimension: vo_check_c {
    type: yesno
    sql: ${TABLE}."vo_check_c" ;;
  }

  dimension_group: vo_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."vo_date_c" ;;
  }

  dimension: volume_per_use_case_c {
    type: string
    sql: ${TABLE}."volume_per_use_case_c" ;;
  }

  dimension: volume_per_use_case_status_c {
    type: string
    sql: ${TABLE}."volume_per_use_case_status_c" ;;
  }

  dimension: walmart_data_fee_c {
    type: yesno
    sql: ${TABLE}."walmart_data_fee_c" ;;
  }

  dimension: why_do_anything_c {
    type: string
    sql: ${TABLE}."why_do_anything_c" ;;
  }

  dimension: why_do_anything_relevant_customer_c {
    type: string
    sql: ${TABLE}."why_do_anything_relevant_customer_c" ;;
  }

  dimension: why_hyperscience_c {
    type: string
    sql: ${TABLE}."why_hyperscience_c" ;;
  }

  dimension: why_hyperscience_relevant_customer_c {
    type: string
    sql: ${TABLE}."why_hyperscience_relevant_customer_c" ;;
  }

  dimension: why_now_c {
    type: string
    sql: ${TABLE}."why_now_c" ;;
  }

  dimension: why_now_relevant_customers_c {
    type: string
    sql: ${TABLE}."why_now_relevant_customers_c" ;;
  }

  dimension: will_they_build_post_processing_c {
    type: string
    sql: ${TABLE}."will_they_build_post_processing_c" ;;
  }

  dimension: will_they_build_post_processing_status_c {
    type: string
    sql: ${TABLE}."will_they_build_post_processing_status_c" ;;
  }

  dimension_group: working_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."working_date_c" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_revenue {
    type: sum
    sql: ${amount} ;;
    value_format: "$#,##0"
  }

  measure: average_revenue_won {
    label: "Average Revenue (Closed/Won)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_won
      value: "Yes"
    }

    value_format: "$#,##0"
  }

  measure: average_revenue_lost {
    label: "Average Revenue (Closed/Lost)"
    type: average
    sql: ${amount} ;;

    filters: {
      field: is_lost
      value: "Yes"
    }

    value_format: "$#,##0"
  }

  measure: total_pipeline_revenue {
    type: sum
    sql: ${amount} ;;

    filters: {
      field: is_closed
      value: "No"
    }

    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  measure: average_deal_size {
    type: average
    sql: ${amount} ;;
    value_format: "$#,##0"
  }

  measure: count_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: average_days_open {
    type: average
    sql: ${days_open} ;;
  }

  measure: count_closed {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }
  }

  measure: count_open {
    type: count

    filters: {
      field: is_closed
      value: "No"
    }
  }

  measure: count_lost {
    type: count

    filters: {
      field: is_closed
      value: "Yes"
    }

    filters: {
      field: is_won
      value: "No"
    }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: win_percentage {
    type: number
    sql: 100.00 * ${count_won} / NULLIF(${count_closed}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: open_percentage {
    type: number
    sql: 100.00 * ${count_open} / NULLIF(${count}, 0) ;;
    value_format: "#0.00\%"
  }

  measure: count_new_business_won {
    type: count

    filters: {
      field: is_won
      value: "Yes"
    }

    # filters: {
    #   field: opportunity.type
    #   value: "\"New Business\""
    # }

    drill_fields: [opportunity.id, account.name, type]
  }

  measure: count_new_business {
    type: count

    # filters: {
    #   field: opportunity.type
    #   value: "\"New Business\""
    # }

    drill_fields: [opportunity.id, account.name, type]
  }

  # ---- Begin added 5/03/21 forward ----- #

  dimension: is_hyperscience_arr {
    hidden: yes
    type: yesno
    sql: ${stage_name} = 'Closed Won' and ${active_opportunity_c} = 'Yes' ;;
  }

  dimension: is_parter_influenced {
    type: yesno
    sql: ${lead_source} = 'Partner' or ${partner_account_c} is not null ;;
  }

  dimension: recurring_arr_type {
    case: {
      when: {
        sql: ${dates.bucket_month} > ${start_date_c_month} ;;
        label: "Started Before Month"
      }
      when: {
        sql: ${dates.bucket_month} = ${start_date_c_month} ;;
        label: "Started During Month"
      }
    }
  }

  dimension: pipeline_classification {
    case: {
      when: {
        label: "Pipeline"
        sql: ${commit_status_c} = 'Pipeline' ;;
      }
      else: "Qualified Pipeline"
    }
  }

  dimension: stage_name_order {
    case: {
      when: {
        sql: ${stage_name} = 'Value/Fit' ;;
        label: "1"
      }
      when: {
        sql: ${stage_name} = 'TDD' ;;
        label: "2"
      }
      when: {
        sql: ${stage_name} = 'EB Go/No-Go' ;;
        label: "3"
      }
      when: {
        sql: ${stage_name} = 'TVE' ;;
        label: "4"
      }
      when: {
        sql: ${stage_name} = 'EB Revisit' ;;
        label: "5"
      }
      when: {
        sql: ${stage_name} = 'Negotiate and Close' ;;
        label: "6"
      }
      when: {
        sql: ${stage_name} = 'Closed Won' ;;
        label: "7"
      }
    }
  }

  dimension: duration_of_sales_cycle {
    type: duration_day
    hidden: yes
    sql_start: ${created_raw} ;;
    sql_end: ${close_raw} ;;
  }


  dimension: duration_service {
    type: duration_day
    sql_start: ${start_date_c_date} ;;
    sql_end: ${end_renewal_date_c_date} ;;
  }

  measure: total_arr {
    label: "ARR"
    description: "ARR for all active opportunities in 'Closed Won' stage"
    type: sum
    filters: [is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: total_arr_from_active_accounts {
    label: "ARR for Active Accounts"
    description: "ARR from accounts that are not lost"
    hidden: yes
    type: sum
    filters: [account_facts.is_lost_account: "-Yes", is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [detail*]
  }

  measure: cumulative_arr {
    type: running_total
    label: "Cumulative ARR"
    description: "Running sum of all revenue types minus ARR from churned Logos (accounts)"
    sql: ${total_arr_from_active_accounts};;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: total_churned_arr {
    type: sum
    label: "Churned ARR"
    description: "ARR from churned accounts"
    filters: [account_facts.is_lost_account: "Yes", is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: total_net_new_arr {
    type: sum
    label: "Net New ARR"
    description: "ARR from Revenue Type = “New Customer”"
    filters: [revenue_type_c: "New Customer",  is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: total_upsell_arr {
    type: sum
    label: "Upsell ARR"
    description: "ARR from Revenue Type = Expansion + Renewal w/ Upsell”"
    filters: [revenue_type_c: "Expansion, Renewal w/ Upsell", is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: average_net_new_arr_per_client {
    type: average
    label: "Net New ARR per Client"
    description: "Avg ARR from all of an accounts opportunities"
    filters: [revenue_type_c: "New Customer", is_hyperscience_arr: "Yes"]
    sql: ${arr_mirror_c} ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [id, created_date, start_date_c_date, end_renewal_date_c_date, amount]
  }

  measure: average_duration_of_sales_cycle {
    type: average
    label: "Sales Cycle"
    description: "The number of days between the date an opportunity is created and when it is closed won"
    filters: [is_hyperscience_arr: "Yes"]
    sql: ${duration_of_sales_cycle} ;;
    value_format_name: decimal_1
  }

  measure: count_distinct_clients {
    type: count_distinct
    label: "Distinct Clients"
    description: "Count of accounts with at least one Closed Won opportunity"
    filters: [stage_name: "Closed Won", is_hyperscience_arr: "Yes", logo_churn_c: "-true"]
    sql: ${account_id} ;;
  }

  measure: count_closed_won {
    type: count_distinct
    # hidden: yes
    filters: [stage_name: "Closed Won"]
    sql: ${id} ;;
  }

  measure: deals_per_client {
    type: number
    label: "Deals per Client"
    description: "Count of Closed Won opportunities per Account (Client?)"
    sql: ${count_closed_won}::real/nullif(${count_distinct_clients}::real,0) ;;
    value_format_name: decimal_1
  }

  measure: count_partner_influenced_opportunities {
    type: count
    hidden: yes
    filters: [is_parter_influenced: "Yes"]
  }

  measure: percent_of_parter_influenced_opportunities {
    type: number
    label: "% Partner Influence (Opportunities)"
    sql: (${count_partner_influenced_opportunities}::real)/nullif(${count}::real,0) ;;
    value_format_name: percent_0
  }

  measure: count_partner_influenced_accounts {
    type: count_distinct
    hidden: yes
    filters: [is_parter_influenced: "Yes"]
    sql: ${account_id} ;;
  }

  measure: count_distinct_accounts {
    type: count_distinct
    label: "Distinct Accounts"
    description: "Distinct count of all accounts with opportunities"
    sql: ${account_id} ;;
  }

  measure: percent_of_partner_influenced_accounts {
    type: number
    label: "% Partner Influence (Accounts)"
    sql: ${count_partner_influenced_accounts}::real/nullif(${count_distinct_accounts}::real,0);;
    value_format_name: percent_0
  }

  measure: total_partner_influenced_pipeline_revenue {
    type: sum
    filters: [is_closed: "No", is_parter_influenced: "Yes" ]
    sql: ${amount} ;;
  }

  measure: percent_of_partner_influenced_pipeline {
    type: number
    label: "% Partner Influence (Pipeline)"
    sql: ${total_partner_influenced_pipeline_revenue}::real/nullif(${total_pipeline_revenue}::real,0) ;;
    value_format_name: percent_0
  }

  measure: count_open_percent_of_total {
    type: percent_of_total
    sql: ${count_open} ;;
    html: {{ rendered_value }} <br/> {{ count._rendered_value }} ;;
  }

  # ---- End added 5/03/21 forward ----- #

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      global_opportunity_id_c,
      name,
      stage_name,
      forecast_category_name,
      account.name,
      account.global_account_id_c,
      campaign.id,
      campaign.name,
      contact.last_name,
      contact.first_name,
      contact.middle_name,
      contact.name,
      contact.jigsaw_contact_id
    ]
  }
}
