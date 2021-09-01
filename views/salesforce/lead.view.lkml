view: lead {
  sql_table_name: fivetran_database.salesforce.lead ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: abm_target_type_c {
    type: string
    sql: ${TABLE}.abm_target_type_c ;;
  }

  dimension: account_name_c {
    type: string
    sql: ${TABLE}.account_name_c ;;
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

  dimension: additional_feedback_for_product_c {
    type: string
    sql: ${TABLE}.additional_feedback_for_product_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: annual_revenue_range_c {
    type: string
    sql: ${TABLE}.annual_revenue_range_c ;;
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

  dimension: bizible_marketing_channel_group_lc {
    type:  string
    sql: CASE
      WHEN ${bizible_2_marketing_channel_lc_c} = "Conference" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Content Syndication" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Direct" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Display" THEN "Paid"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Email" THEN "Owned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Event" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Marketplace" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Organic Search" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Other" THEN "Other"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Paid Search" THEN "Paid"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Paid Social" THEN "Paid"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Partner" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Podcast" THEN "Owned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "PR" THEN "Owned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Social" THEN "Owned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Telemarketing" THEN "Owned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Web Referral" THEN "Earned"
      WHEN ${bizible_2_marketing_channel_lc_c} = "Webinar" THEN "Earned"
      ELSE "Other"
    ;;
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

  dimension_group: bombora_app_bombora_last_date_time_updated_c {
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
    sql: ${TABLE}.bombora_app_bombora_last_date_time_updated_c ;;
  }

  dimension: bombora_app_bombora_surge_record_count_c {
    type: number
    sql: ${TABLE}.bombora_app_bombora_surge_record_count_c ;;
  }

  dimension: bombora_app_bombora_total_composite_score_c {
    type: number
    sql: ${TABLE}.bombora_app_bombora_total_composite_score_c ;;
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

  dimension: call_scheduled_stage_checkbox_c {
    type: yesno
    sql: ${TABLE}.call_scheduled_stage_checkbox_c ;;
  }

  dimension_group: call_scheduled_stage_date_c {
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
    sql: ${TABLE}.call_scheduled_stage_date_c ;;
  }

  dimension_group: circle_back_date_c {
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
    sql: ${TABLE}.circle_back_date_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_phone_c {
    type: string
    sql: ${TABLE}.company_phone_c ;;
  }

  dimension: company_size_c {
    type: number
    sql: ${TABLE}.company_size_c ;;
  }

  dimension: company_size_range_cleaned_c {
    type: string
    sql: ${TABLE}.company_size_range_cleaned_c ;;
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension_group: converted {
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
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: da_scoop_composer_email_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_email_2_c ;;
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

  dimension: demo_url_c {
    type: string
    sql: ${TABLE}.demo_url_c ;;
  }

  dimension: direct_mail_opt_out_c {
    type: yesno
    sql: ${TABLE}.direct_mail_opt_out_c ;;
  }

  dimension: disqualified_picklist_c {
    type: string
    sql: ${TABLE}.disqualified_picklist_c ;;
  }

  dimension: disqualified_reason_description_c {
    type: string
    sql: ${TABLE}.disqualified_reason_description_c ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
  }

  dimension_group: do_not_call_date_c {
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
    sql: ${TABLE}.do_not_call_date_c ;;
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

  dimension_group: dq_date_c {
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
    sql: ${TABLE}.dq_date_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_bounced_c {
    type: yesno
    sql: ${TABLE}.email_bounced_c ;;
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

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
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

  dimension: idle_status_c {
    type: string
    sql: ${TABLE}.idle_status_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: industry_cleaned_c {
    type: string
    sql: ${TABLE}.industry_cleaned_c ;;
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

  dimension_group: initial_disco_date_c {
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
    sql: ${TABLE}.initial_disco_date_c ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
  }

  dimension: job_function_cleaned_c {
    type: string
    sql: ${TABLE}.job_function_cleaned_c ;;
  }

  dimension: job_level_cleaned_c {
    type: string
    sql: ${TABLE}.job_level_cleaned_c ;;
  }

  dimension: last_5_marketing_c {
    type: string
    sql: ${TABLE}.last_5_marketing_c ;;
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

  dimension_group: last_logged_prospect_engagement_with_sdr_c {
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
    sql: ${TABLE}.last_logged_prospect_engagement_with_sdr_c ;;
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

  dimension_group: last_sdr_outreach_date_c {
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
    sql: ${TABLE}.last_sdr_outreach_date_c ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: ld_account_named_status_c {
    type: string
    sql: ${TABLE}.ld_account_named_status_c ;;
  }

  dimension: ld_account_tier_c {
    type: string
    sql: ${TABLE}.ld_account_tier_c ;;
  }

  dimension: lead_assignment_id_new_del_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.lead_assignment_id_new_del_c ;;
  }

  dimension: lead_campaigns_involved_c {
    type: string
    sql: ${TABLE}.lead_campaigns_involved_c ;;
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

  dimension_group: lead_owner_assignment_date_c {
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
    sql: ${TABLE}.lead_owner_assignment_date_c ;;
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

  dimension: lead_source_campaign_most_recent_c {
    type: string
    sql: ${TABLE}.lead_source_campaign_most_recent_c ;;
  }

  dimension: lead_source_campaign_original_c {
    type: string
    sql: ${TABLE}.lead_source_campaign_original_c ;;
  }

  dimension: lead_source_most_recent_c {
    type: string
    sql: ${TABLE}.lead_source_most_recent_c ;;
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

  dimension: lead_source_original_c {
    type: string
    sql: ${TABLE}.lead_source_original_c ;;
  }

  dimension: lead_stage_c {
    type: string
    sql: ${TABLE}.lead_stage_c ;;
  }

  dimension: lead_type_c {
    type: string
    sql: ${TABLE}.lead_type_c ;;
  }

  dimension: lean_data_a_2_b_account_c {
    type: string
    sql: ${TABLE}.lean_data_a_2_b_account_c ;;
  }

  dimension: lean_data_a_2_b_group_c {
    type: string
    sql: ${TABLE}.lean_data_a_2_b_group_c ;;
  }

  dimension: lean_data_ld_segment_c {
    type: string
    sql: ${TABLE}.lean_data_ld_segment_c ;;
  }

  dimension_group: lean_data_marketing_sys_created_date_c {
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
    sql: ${TABLE}.lean_data_marketing_sys_created_date_c ;;
  }

  dimension: lean_data_matched_account_c {
    type: string
    sql: ${TABLE}.lean_data_matched_account_c ;;
  }

  dimension: lean_data_matched_buyer_persona_c {
    type: string
    sql: ${TABLE}.lean_data_matched_buyer_persona_c ;;
  }

  dimension: lean_data_matched_lead_c {
    type: string
    sql: ${TABLE}.lean_data_matched_lead_c ;;
  }

  dimension: lean_data_modified_score_c {
    type: number
    sql: ${TABLE}.lean_data_modified_score_c ;;
  }

  dimension: lean_data_new_routing_log_c {
    type: string
    sql: ${TABLE}.lean_data_new_routing_log_c ;;
  }

  dimension: lean_data_reporting_matched_account_c {
    type: string
    sql: ${TABLE}.lean_data_reporting_matched_account_c ;;
  }

  dimension_group: lean_data_reporting_timestamp_c {
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
    sql: ${TABLE}.lean_data_reporting_timestamp_c ;;
  }

  dimension: lean_data_router_status_c {
    type: string
    sql: ${TABLE}.lean_data_router_status_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: lean_data_routing_status_c {
    type: string
    sql: ${TABLE}.lean_data_routing_status_c ;;
  }

  dimension: lean_data_search_c {
    type: string
    sql: ${TABLE}.lean_data_search_c ;;
  }

  dimension: lean_data_search_index_c {
    type: string
    sql: ${TABLE}.lean_data_search_index_c ;;
  }

  dimension: lean_data_status_info_c {
    type: string
    sql: ${TABLE}.lean_data_status_info_c ;;
  }

  dimension: lean_data_tag_c {
    type: string
    sql: ${TABLE}.lean_data_tag_c ;;
  }

  dimension: lid_linked_in_company_id_c {
    type: string
    sql: ${TABLE}.lid_linked_in_company_id_c ;;
  }

  dimension: lid_linked_in_member_token_c {
    type: string
    sql: ${TABLE}.lid_linked_in_member_token_c ;;
  }

  dimension: lifecycle_status_c {
    type: string
    sql: ${TABLE}.lifecycle_status_c ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: loss_reason_description_c {
    type: string
    sql: ${TABLE}.loss_reason_description_c ;;
  }

  dimension: lost_reason_c {
    type: string
    sql: ${TABLE}.lost_reason_c ;;
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

  dimension: message_initial_c {
    type: string
    sql: ${TABLE}.message_initial_c ;;
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

  dimension: mkto_si_msicontact_id_c {
    type: string
    sql: ${TABLE}.mkto_si_msicontact_id_c ;;
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

  dimension: mql_c {
    type: yesno
    sql: ${TABLE}.mql_c ;;
  }

  dimension_group: mql_check_date_c {
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
    sql: ${TABLE}.mql_check_date_c ;;
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

  dimension: new_drift_meeting_lead_owner_c {
    type: string
    sql: ${TABLE}.new_drift_meeting_lead_owner_c ;;
  }

  dimension: no_longer_at_company_c {
    type: string
    sql: ${TABLE}.no_longer_at_company_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: number_of_employees_tier {
    type: tier
    tiers: [
      0,
      1,
      11,
      51,
      201,
      501,
      1001,
      5001,
      10000
    ]
    sql: ${number_of_employees} ;;
    style: integer
    description: "Number of Employees as reported on the Salesforce lead"
  }

  dimension_group: nurture_date_c {
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
    sql: ${TABLE}.nurture_date_c ;;
  }

  dimension: ocr_providers_used_c {
    type: string
    sql: ${TABLE}.ocr_providers_used_c ;;
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

  dimension: outbound_email_counter_c {
    type: number
    sql: ${TABLE}.outbound_email_counter_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: partner_account_c {
    type: string
    sql: ${TABLE}.partner_account_c ;;
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

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: pre_dq_lead_stage_c {
    type: string
    sql: ${TABLE}.pre_dq_lead_stage_c ;;
  }

  dimension: profile_score_c {
    type: string
    sql: ${TABLE}.profile_score_c ;;
  }

  dimension: qualification_criteria_c {
    type: string
    sql: ${TABLE}.qualification_criteria_c ;;
  }

  dimension: qualification_notes_c {
    type: string
    sql: ${TABLE}.qualification_notes_c ;;
  }

  dimension_group: qualifying_start_date_c {
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
    sql: ${TABLE}.qualifying_start_date_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: round_robin_id_new_c {
    type: number
    value_format_name: id
    sql: ${TABLE}.round_robin_id_new_c ;;
  }

  dimension: rpa_providers_used_c {
    type: string
    sql: ${TABLE}.rpa_providers_used_c ;;
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

  dimension: sdr_bucket_c {
    type: string
    sql: ${TABLE}.sdr_bucket_c ;;
  }

  dimension: sdr_c {
    type: string
    sql: ${TABLE}.sdr_c ;;
  }

  dimension_group: sdr_call_scheduled_date_c {
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
    sql: ${TABLE}.sdr_call_scheduled_date_c ;;
  }

  dimension: sdr_owner_s_sales_region_c {
    type: string
    sql: ${TABLE}.sdr_owner_s_sales_region_c ;;
  }

  dimension: sdr_priority_c {
    type: string
    sql: ${TABLE}.sdr_priority_c ;;
  }

  dimension: secondary_lead_source_c {
    type: string
    sql: ${TABLE}.secondary_lead_source_c ;;
  }

  dimension: segment_c {
    type: string
    sql: ${TABLE}.segment_c ;;
  }

  dimension: skip_router_c {
    type: yesno
    sql: ${TABLE}.skip_router_c ;;
  }

  dimension: sql_accepted_c {
    type: string
    sql: ${TABLE}.sql_accepted_c ;;
  }

  dimension: sql_c {
    type: yesno
    sql: ${TABLE}.sql_c ;;
  }

  dimension_group: sql_check_date_c {
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
    sql: ${TABLE}.sql_check_date_c ;;
  }

  dimension: sql_qualification_reason_c {
    type: string
    sql: ${TABLE}.sql_qualification_reason_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: sub_industry_c {
    type: string
    sql: ${TABLE}.sub_industry_c ;;
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

  dimension: timeline_c {
    type: string
    sql: ${TABLE}.timeline_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type_of_deployment_discussed_c {
    type: string
    sql: ${TABLE}.type_of_deployment_discussed_c ;;
  }

  dimension: type_of_mql_c {
    type: string
    sql: ${TABLE}.type_of_mql_c ;;
  }

  dimension: update_now_button_c {
    type: yesno
    sql: ${TABLE}.update_now_button_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
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
    sql: ${TABLE}.working_date_c ;;
  }

  dimension: working_stage_checkbox_c {
    type: yesno
    sql: ${TABLE}.working_stage_checkbox_c ;;
  }

  dimension: wrong_need_use_case_c {
    type: string
    sql: ${TABLE}.wrong_need_use_case_c ;;
  }

  dimension: zi_company_phone_c {
    type: string
    sql: ${TABLE}.zi_company_phone_c ;;
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

  dimension: zisf_zoom_info_industry_c {
    type: string
    sql: ${TABLE}.zisf_zoom_info_industry_c ;;
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

  dimension: zisf_zoom_info_trigger_c {
    type: yesno
    sql: ${TABLE}.zisf_zoom_info_trigger_c ;;
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

  dimension: zoom_info_annual_revenue_c {
    type: number
    sql: ${TABLE}.zoom_info_annual_revenue_c ;;
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

  dimension: zoom_info_no_employees_c {
    type: number
    sql: ${TABLE}.zoom_info_no_employees_c ;;
  }

  dimension: zoom_info_state_c {
    type: string
    sql: ${TABLE}.zoom_info_state_c ;;
  }

  dimension: days_mql_to_sal {
    type: number
    sql:  DATEDIFF( day, ${date_stage_mql_c_date}, ${date_stage_sal_c_date}) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, middle_name, name]
  }

  measure: converted_to_contact_count {
    type: count

    filters: {
      field: converted_contact_id
      value: "-null"
    }
  }

  measure: converted_to_account_count {
    type: count

    filters: {
      field: converted_account_id
      value: "-null"
    }
  }

  measure: converted_to_opportunity_count {
    type: count
    filters: {
      field: converted_opportunity_id
      value: "-null"
    }
  }

  measure: conversion_to_contact_percent {
    sql: 100.00 * ${converted_to_contact_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_account_percent {
    sql: 100.00 * ${converted_to_account_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: conversion_to_opportunity_percent {
    sql: 100.00 * ${converted_to_opportunity_count} / NULLIF(${count},0) ;;
    type: number
    value_format: "0.00\%"
  }

  measure: mal_count {
    type: count
    filters: [date_stage_mal_c_date: "-NULL"]

  }

  measure: mel_count {
    type: count
    filters: [date_stage_mel_c_date: "-NULL"]

  }

  measure: mql_count {
    type: count
    filters: [date_stage_mql_c_date: "-NULL"]

  }

  measure: sal_count {
    type: count
    filters: [date_stage_sal_c_date: "-NULL"]

  }

  measure: sql_count {
    type: count
    filters: [converted_opportunity_id: "-NULL"]

  }

  measure: time_mql_to_sal {
    type: average
    sql:  ${days_mql_to_sal} ;;
    filters: [date_stage_mql_c_date: "-NULL", date_stage_sal_c_date: "-NULL"]
  }



}
