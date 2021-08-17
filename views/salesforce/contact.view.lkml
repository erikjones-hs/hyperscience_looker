view: contact {
  sql_table_name: fivetran_database.salesforce.contact ;;
  drill_fields: [jigsaw_contact_id]

  dimension: jigsaw_contact_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: acquisition_date_c {
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
    sql: ${TABLE}.acquisition_date_c ;;
  }

  dimension: acquisition_program_c {
    type: string
    sql: ${TABLE}.acquisition_program_c ;;
  }

  dimension: assistant_contact_c {
    type: string
    sql: ${TABLE}.assistant_contact_c ;;
  }

  dimension: associated_partner_account_c {
    type: string
    sql: ${TABLE}.associated_partner_account_c ;;
  }

  dimension: authority_c {
    type: string
    sql: ${TABLE}.authority_c ;;
  }

  dimension: bizible_2_ad_campaign_name_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_ad_campaign_name_ft_c ;;
  }

  dimension: bizible_2_ad_campaign_name_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_ad_campaign_name_lc_c ;;
  }

  dimension: bizible_2_bizible_id_c {
    type: string
    sql: ${TABLE}.bizible_2_bizible_id_c ;;
  }

  dimension: bizible_2_landing_page_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_landing_page_ft_c ;;
  }

  dimension: bizible_2_landing_page_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_landing_page_lc_c ;;
  }

  dimension: bizible_2_marketing_channel_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_marketing_channel_ft_c ;;
  }

  dimension: bizible_2_marketing_channel_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_marketing_channel_lc_c ;;
  }

  dimension_group: bizible_2_touchpoint_date_ft_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_date_ft_c ;;
  }

  dimension_group: bizible_2_touchpoint_date_lc_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_date_lc_c ;;
  }

  dimension: bizible_2_touchpoint_source_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_touchpoint_source_ft_c ;;
  }

  dimension: bizible_2_touchpoint_source_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_touchpoint_source_lc_c ;;
  }

  dimension: budget_c {
    type: string
    sql: ${TABLE}.budget_c ;;
  }

  dimension: business_challenge_c {
    type: string
    sql: ${TABLE}.business_challenge_c ;;
  }

  dimension: business_priority_c {
    type: string
    sql: ${TABLE}.business_priority_c ;;
  }

  dimension: company_phone_c {
    type: string
    sql: ${TABLE}.company_phone_c ;;
  }

  dimension: contact_type_c {
    type: string
    sql: ${TABLE}.contact_type_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
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
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: created_date_c {
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
    sql: ${TABLE}.created_date_c ;;
  }

  dimension: da_scoop_composer_black_list_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_black_list_c ;;
  }

  dimension: da_scoop_composer_email_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_email_2_c ;;
  }

  dimension: da_scoop_composer_email_domain_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_email_domain_c ;;
  }

  dimension: da_scoop_composer_groove_notes_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_groove_notes_c ;;
  }

  dimension: da_scoop_composer_is_created_by_groove_c {
    type: yesno
    sql: ${TABLE}.da_scoop_composer_is_created_by_groove_c ;;
  }

  dimension: da_scoop_composer_normalized_mobile_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_normalized_mobile_c ;;
  }

  dimension: da_scoop_composer_normalized_phone_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_normalized_phone_c ;;
  }

  dimension_group: date_stage_customer_c {
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
    sql: ${TABLE}.date_stage_customer_c ;;
  }

  dimension_group: date_stage_disqualifed_c {
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
    sql: ${TABLE}.date_stage_disqualifed_c ;;
  }

  dimension_group: date_stage_former_customer_c {
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
    sql: ${TABLE}.date_stage_former_customer_c ;;
  }

  dimension_group: date_stage_mal_c {
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
    sql: ${TABLE}.date_stage_mal_c ;;
  }

  dimension_group: date_stage_mel_c {
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
    sql: ${TABLE}.date_stage_mel_c ;;
  }

  dimension_group: date_stage_mql_c {
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
    sql: ${TABLE}.date_stage_mql_c ;;
  }

  dimension_group: date_stage_mrl_c {
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
    sql: ${TABLE}.date_stage_mrl_c ;;
  }

  dimension_group: date_stage_sal_c {
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
    sql: ${TABLE}.date_stage_sal_c ;;
  }

  dimension_group: date_stage_sql_c {
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
    sql: ${TABLE}.date_stage_sql_c ;;
  }

  dimension_group: date_stage_srl_c {
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
    sql: ${TABLE}.date_stage_srl_c ;;
  }

  dimension_group: date_stage_working_c {
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
    sql: ${TABLE}.date_stage_working_c ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: direct_mail_opt_out_c {
    type: yesno
    sql: ${TABLE}.direct_mail_opt_out_c ;;
  }

  dimension: discovery_call_complete_c {
    type: yesno
    sql: ${TABLE}.discovery_call_complete_c ;;
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
    sql: ${TABLE}.discovery_call_date_c ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
  }

  dimension: do_not_contact_c {
    type: yesno
    sql: ${TABLE}.do_not_contact_c ;;
  }

  dimension: do_not_email_c {
    type: yesno
    sql: ${TABLE}.do_not_email_c ;;
  }

  dimension: do_not_email_reason_c {
    type: string
    sql: ${TABLE}.do_not_email_reason_c ;;
  }

  dimension: dozisf_zoom_info_company_id_c {
    type: string
    sql: ${TABLE}.dozisf_zoom_info_company_id_c ;;
  }

  dimension_group: dozisf_zoom_info_first_updated_c {
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
    sql: ${TABLE}.dozisf_zoom_info_first_updated_c ;;
  }

  dimension: dozisf_zoom_info_id_c {
    type: string
    sql: ${TABLE}.dozisf_zoom_info_id_c ;;
  }

  dimension_group: dozisf_zoom_info_last_updated_c {
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
    sql: ${TABLE}.dozisf_zoom_info_last_updated_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_bounced {
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
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: email_secondary_c {
    type: string
    sql: ${TABLE}.email_secondary_c ;;
  }

  dimension: engagement_score_c {
    type: string
    sql: ${TABLE}.engagement_score_c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension_group: first_reply_date_c {
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
    sql: ${TABLE}.first_reply_date_c ;;
  }

  dimension: gift_opt_out_c {
    type: yesno
    sql: ${TABLE}.gift_opt_out_c ;;
  }

  dimension: global_region_c {
    type: string
    sql: ${TABLE}.global_region_c ;;
  }

  dimension: groove_active_flows_count_c {
    type: number
    sql: ${TABLE}.groove_active_flows_count_c ;;
  }

  dimension_group: groove_added_to_flow_date_c {
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
    sql: ${TABLE}.groove_added_to_flow_date_c ;;
  }

  dimension: groove_engagement_score_c {
    type: number
    sql: ${TABLE}.groove_engagement_score_c ;;
  }

  dimension_group: groove_flow_completed_date_c {
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
    sql: ${TABLE}.groove_flow_completed_date_c ;;
  }

  dimension_group: groove_last_engagement_c {
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
    sql: ${TABLE}.groove_last_engagement_c ;;
  }

  dimension: groove_last_engagement_type_c {
    type: string
    sql: ${TABLE}.groove_last_engagement_type_c ;;
  }

  dimension: groove_last_flow_name_c {
    type: string
    sql: ${TABLE}.groove_last_flow_name_c ;;
  }

  dimension: groove_last_flow_status_c {
    type: string
    sql: ${TABLE}.groove_last_flow_status_c ;;
  }

  dimension: groove_last_flow_step_number_c {
    type: number
    sql: ${TABLE}.groove_last_flow_step_number_c ;;
  }

  dimension: groove_last_flow_step_type_c {
    type: string
    sql: ${TABLE}.groove_last_flow_step_type_c ;;
  }

  dimension_group: groove_last_step_completed_c {
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
    sql: ${TABLE}.groove_last_step_completed_c ;;
  }

  dimension: groove_last_step_skipped_c {
    type: string
    sql: ${TABLE}.groove_last_step_skipped_c ;;
  }

  dimension_group: groove_last_touch_c {
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
    sql: ${TABLE}.groove_last_touch_c ;;
  }

  dimension: groove_last_touch_type_c {
    type: string
    sql: ${TABLE}.groove_last_touch_type_c ;;
  }

  dimension_group: groove_next_step_due_date_c {
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
    sql: ${TABLE}.groove_next_step_due_date_c ;;
  }

  dimension: groove_outbound_email_counter_c {
    type: number
    sql: ${TABLE}.groove_outbound_email_counter_c ;;
  }

  dimension: groove_overdue_by_days_c {
    type: number
    sql: ${TABLE}.groove_overdue_by_days_c ;;
  }

  dimension_group: groove_removed_from_flow_date_c {
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
    sql: ${TABLE}.groove_removed_from_flow_date_c ;;
  }

  dimension: groove_removed_from_flow_reason_c {
    type: string
    sql: ${TABLE}.groove_removed_from_flow_reason_c ;;
  }

  dimension: hand_raise_c {
    type: yesno
    sql: ${TABLE}.hand_raise_c ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension_group: has_opted_out_of_email_date_c {
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
    sql: ${TABLE}.has_opted_out_of_email_date_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: implementation_team_for_cx_c {
    type: string
    sql: ${TABLE}.implementation_team_for_cx_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: inferred_city_c {
    type: string
    sql: ${TABLE}.inferred_city_c ;;
  }

  dimension: inferred_company_c {
    type: string
    sql: ${TABLE}.inferred_company_c ;;
  }

  dimension: inferred_country_c {
    type: string
    sql: ${TABLE}.inferred_country_c ;;
  }

  dimension: inferred_state_region_c {
    type: string
    sql: ${TABLE}.inferred_state_region_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.is_email_bounced ;;
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
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension_group: last_curequest {
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
    sql: ${TABLE}.last_curequest_date ;;
  }

  dimension_group: last_cuupdate {
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
    sql: ${TABLE}.last_cuupdate_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_reply_date_c {
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
    sql: ${TABLE}.last_reply_date_c ;;
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
    sql: ${TABLE}.last_viewed_date ;;
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
    sql: ${TABLE}.lead_created_date_c ;;
  }

  dimension: lead_score_c {
    type: string
    sql: ${TABLE}.lead_score_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_ad_group_original_c {
    type: string
    sql: ${TABLE}.lead_source_ad_group_original_c ;;
  }

  dimension: lead_source_channel_c {
    type: string
    sql: ${TABLE}.lead_source_channel_c ;;
  }

  dimension: lead_source_channel_campaign_last_c {
    type: string
    sql: ${TABLE}.lead_source_channel_campaign_last_c ;;
  }

  dimension: lead_source_channel_campaign_original_c {
    type: string
    sql: ${TABLE}.lead_source_channel_campaign_original_c ;;
  }

  dimension: lead_source_channel_last_c {
    type: string
    sql: ${TABLE}.lead_source_channel_last_c ;;
  }

  dimension: lead_source_channel_original_c {
    type: string
    sql: ${TABLE}.lead_source_channel_original_c ;;
  }

  dimension: lead_source_offer_last_c {
    type: string
    sql: ${TABLE}.lead_source_offer_last_c ;;
  }

  dimension: lead_source_offer_original_c {
    type: string
    sql: ${TABLE}.lead_source_offer_original_c ;;
  }

  dimension: lead_source_offer_type_last_c {
    type: string
    sql: ${TABLE}.lead_source_offer_type_last_c ;;
  }

  dimension: lead_source_offer_type_original_c {
    type: string
    sql: ${TABLE}.lead_source_offer_type_original_c ;;
  }

  dimension: lean_data_ld_segment_c {
    type: string
    sql: ${TABLE}.lean_data_ld_segment_c ;;
  }

  dimension: lean_data_matched_buyer_persona_c {
    type: string
    sql: ${TABLE}.lean_data_matched_buyer_persona_c ;;
  }

  dimension: lean_data_modified_score_c {
    type: number
    sql: ${TABLE}.lean_data_modified_score_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: lean_data_tag_c {
    type: string
    sql: ${TABLE}.lean_data_tag_c ;;
  }

  dimension: left_company_c {
    type: yesno
    sql: ${TABLE}.left_company_c ;;
  }

  dimension: lid_languages_c {
    type: string
    sql: ${TABLE}.lid_languages_c ;;
  }

  dimension: lid_level_c {
    type: string
    sql: ${TABLE}.lid_level_c ;;
  }

  dimension: lid_linked_in_company_id_c {
    type: string
    sql: ${TABLE}.lid_linked_in_company_id_c ;;
  }

  dimension: lid_linked_in_member_token_c {
    type: string
    sql: ${TABLE}.lid_linked_in_member_token_c ;;
  }

  dimension: lid_no_longer_at_company_c {
    type: string
    sql: ${TABLE}.lid_no_longer_at_company_c ;;
  }

  dimension: lifecycle_status_c {
    type: string
    sql: ${TABLE}.lifecycle_status_c ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
  }

  dimension: mailing_country {
    type: string
    sql: ${TABLE}.mailing_country ;;
  }

  dimension: mailing_geocode_accuracy {
    type: string
    sql: ${TABLE}.mailing_geocode_accuracy ;;
  }

  dimension: mailing_latitude {
    type: number
    sql: ${TABLE}.mailing_latitude ;;
  }

  dimension: mailing_longitude {
    type: number
    sql: ${TABLE}.mailing_longitude ;;
  }

  dimension: mailing_postal_code {
    type: string
    sql: ${TABLE}.mailing_postal_code ;;
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}.mailing_state ;;
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
  }

  dimension: marketing_email_opt_in_c {
    type: yesno
    sql: ${TABLE}.marketing_email_opt_in_c ;;
  }

  dimension_group: marketing_email_opt_in_date_c {
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
    sql: ${TABLE}.marketing_email_opt_in_date_c ;;
  }

  dimension: marketing_nurture_cadence_c {
    type: string
    sql: ${TABLE}.marketing_nurture_cadence_c ;;
  }

  dimension_group: marketing_nurture_cadence_start_date_c {
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
    sql: ${TABLE}.marketing_nurture_cadence_start_date_c ;;
  }

  dimension: marketing_nurture_cadence_status_c {
    type: string
    sql: ${TABLE}.marketing_nurture_cadence_status_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension_group: mkto_si_hide_date_c {
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
    sql: ${TABLE}.mkto_si_hide_date_c ;;
  }

  dimension_group: mkto_si_last_interesting_moment_date_c {
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
    sql: ${TABLE}.mkto_si_last_interesting_moment_date_c ;;
  }

  dimension: mkto_si_last_interesting_moment_desc_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_desc_c ;;
  }

  dimension: mkto_si_last_interesting_moment_source_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_source_c ;;
  }

  dimension: mkto_si_last_interesting_moment_type_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_type_c ;;
  }

  dimension: mkto_si_mkto_lead_score_c {
    type: number
    sql: ${TABLE}.mkto_si_mkto_lead_score_c ;;
  }

  dimension: mkto_si_priority_c {
    type: number
    sql: ${TABLE}.mkto_si_priority_c ;;
  }

  dimension: mkto_si_relative_score_value_c {
    type: number
    sql: ${TABLE}.mkto_si_relative_score_value_c ;;
  }

  dimension: mkto_si_urgency_value_c {
    type: number
    sql: ${TABLE}.mkto_si_urgency_value_c ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: most_recent_opportunity_closed_c {
    type: yesno
    sql: ${TABLE}.most_recent_opportunity_closed_c ;;
  }

  dimension: most_recent_opportunity_stage_c {
    type: string
    sql: ${TABLE}.most_recent_opportunity_stage_c ;;
  }

  dimension: mql_c {
    type: yesno
    sql: ${TABLE}.mql_c ;;
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
    sql: ${TABLE}.mql_date_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nbm_complete_c {
    type: yesno
    sql: ${TABLE}.nbm_complete_c ;;
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
    sql: ${TABLE}.nbm_date_c ;;
  }

  dimension: need_c {
    type: string
    sql: ${TABLE}.need_c ;;
  }

  dimension: opportunity_dq_reason_c {
    type: string
    sql: ${TABLE}.opportunity_dq_reason_c ;;
  }

  dimension: original_message_c {
    type: string
    sql: ${TABLE}.original_message_c ;;
  }

  dimension: original_referrer_c {
    type: string
    sql: ${TABLE}.original_referrer_c ;;
  }

  dimension: original_search_engine_c {
    type: string
    sql: ${TABLE}.original_search_engine_c ;;
  }

  dimension: original_search_phrase_c {
    type: string
    sql: ${TABLE}.original_search_phrase_c ;;
  }

  dimension: original_source_info_c {
    type: string
    sql: ${TABLE}.original_source_info_c ;;
  }

  dimension: original_source_type_c {
    type: string
    sql: ${TABLE}.original_source_type_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: persona_c {
    type: string
    sql: ${TABLE}.persona_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: profile_score_c {
    type: string
    sql: ${TABLE}.profile_score_c ;;
  }

  dimension: qualification_notes_c {
    type: string
    sql: ${TABLE}.qualification_notes_c ;;
  }

  dimension: referrer_c {
    type: string
    sql: ${TABLE}.referrer_c ;;
  }

  dimension: reports_to_id {
    type: string
    sql: ${TABLE}.reports_to_id ;;
  }

  dimension: role_for_cx_c {
    type: string
    sql: ${TABLE}.role_for_cx_c ;;
  }

  dimension: sales_loft_1_most_recent_cadence_name_c {
    type: string
    sql: ${TABLE}.sales_loft_1_most_recent_cadence_name_c ;;
  }

  dimension_group: sales_loft_1_most_recent_cadence_next_step_due_date_c {
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
    sql: ${TABLE}.sales_loft_1_most_recent_cadence_next_step_due_date_c ;;
  }

  dimension: sales_loft_1_most_recent_last_completed_step_c {
    type: number
    sql: ${TABLE}.sales_loft_1_most_recent_last_completed_step_c ;;
  }

  dimension: sales_region_c {
    type: string
    sql: ${TABLE}.sales_region_c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: score_at_mql_c {
    type: string
    sql: ${TABLE}.score_at_mql_c ;;
  }

  dimension: score_c {
    type: number
    sql: ${TABLE}.score_c ;;
  }

  dimension: sdr_c {
    type: string
    sql: ${TABLE}.sdr_c ;;
  }

  dimension: sdr_priority_c {
    type: string
    sql: ${TABLE}.sdr_priority_c ;;
  }

  dimension: secondary_lead_source_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_c ;;
  }

  dimension: skip_router_c {
    type: yesno
    sql: ${TABLE}.skip_router_c ;;
  }

  dimension_group: sql_call_scheduled_date_c {
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
    sql: ${TABLE}.sql_call_scheduled_date_c ;;
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
    sql: ${TABLE}.sql_date_c ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: sync_to_marketo_c {
    type: yesno
    sql: ${TABLE}.sync_to_marketo_c ;;
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension_group: tal_date_c {
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
    sql: ${TABLE}.tal_date_c ;;
  }

  dimension: timeline_c {
    type: string
    sql: ${TABLE}.timeline_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: tql_call_scheduled_date_c {
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
    sql: ${TABLE}.tql_call_scheduled_date_c ;;
  }

  dimension_group: tql_date_c {
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
    sql: ${TABLE}.tql_date_c ;;
  }

  dimension: tspc_facebook_url_c {
    type: string
    sql: ${TABLE}.tspc_facebook_url_c ;;
  }

  dimension: tspc_has_power_c {
    type: yesno
    sql: ${TABLE}.tspc_has_power_c ;;
  }

  dimension: tspc_is_mapped_c {
    type: yesno
    sql: ${TABLE}.tspc_is_mapped_c ;;
  }

  dimension: tspc_linked_in_url_c {
    type: string
    sql: ${TABLE}.tspc_linked_in_url_c ;;
  }

  dimension: tspc_photo_url_c {
    type: string
    sql: ${TABLE}.tspc_photo_url_c ;;
  }

  dimension: tspc_sibling_sort_order_c {
    type: number
    sql: ${TABLE}.tspc_sibling_sort_order_c ;;
  }

  dimension: tspc_twitter_url_c {
    type: string
    sql: ${TABLE}.tspc_twitter_url_c ;;
  }

  dimension: type_of_mql_c {
    type: string
    sql: ${TABLE}.type_of_mql_c ;;
  }

  dimension: zi_contact_city_c {
    type: string
    sql: ${TABLE}.zi_contact_city_c ;;
  }

  dimension: zi_contact_street_c {
    type: string
    sql: ${TABLE}.zi_contact_street_c ;;
  }

  dimension: zi_contact_zip_c {
    type: string
    sql: ${TABLE}.zi_contact_zip_c ;;
  }

  dimension: zisf_person_has_moved_c {
    type: string
    sql: ${TABLE}.zisf_person_has_moved_c ;;
  }

  dimension: zisf_zoom_clean_status_c {
    type: string
    sql: ${TABLE}.zisf_zoom_clean_status_c ;;
  }

  dimension: zisf_zoom_id_c {
    type: string
    sql: ${TABLE}.zisf_zoom_id_c ;;
  }

  dimension: zisf_zoom_info_complete_status_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_complete_status_c ;;
  }

  dimension: zisf_zoom_info_email_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_email_c ;;
  }

  dimension_group: zisf_zoom_info_last_clean_run_c {
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
    sql: ${TABLE}.zisf_zoom_info_last_clean_run_c ;;
  }

  dimension: zisf_zoom_info_phone_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_phone_c ;;
  }

  dimension_group: zisf_zoom_lastupdated_c {
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
    sql: ${TABLE}.zisf_zoom_lastupdated_c ;;
  }

  dimension: zoom_info_company_name_c {
    type: string
    sql: ${TABLE}.zoom_info_company_name_c ;;
  }

  dimension: zoom_info_country_c {
    type: string
    sql: ${TABLE}.zoom_info_country_c ;;
  }

  dimension: zoom_info_job_function_c {
    type: string
    sql: ${TABLE}.zoom_info_job_function_c ;;
  }

  dimension: zoom_info_job_title_c {
    type: string
    sql: ${TABLE}.zoom_info_job_title_c ;;
  }

  dimension: zoom_info_management_level_c {
    type: string
    sql: ${TABLE}.zoom_info_management_level_c ;;
  }

  dimension: zoom_info_mobile_c {
    type: string
    sql: ${TABLE}.zoom_info_mobile_c ;;
  }

  dimension: zoom_info_state_c {
    type: string
    sql: ${TABLE}.zoom_info_state_c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      jigsaw_contact_id,
      last_name,
      first_name,
      middle_name,
      name,
      account.name,
      account.global_account_id_c,
      opportunity.count,
      user.count
    ]
  }
}
