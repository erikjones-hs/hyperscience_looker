view: account {
  sql_table_name: (select * from fivetran_database.salesforce.account where not(is_deleted)) ;;
  drill_fields: [global_account_id_c]

  dimension: global_account_id_c {
    primary_key: yes
    type: string
    sql: ${TABLE}.global_account_id_c ;;
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

  dimension: account_manager_c {
    type: string
    sql: ${TABLE}.account_manager_c ;;
  }

  dimension: active_opp_flag_for_zendesk_c {
    type: number
    sql: ${TABLE}.active_opp_flag_for_zendesk_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: annual_revenue_range_cleaned_c {
    type: string
    sql: ${TABLE}.annual_revenue_range_cleaned_c ;;
  }

  dimension: bgov_2_account_owner_c {
    type: string
    sql: ${TABLE}.bgov_2_account_owner_c ;;
  }

  dimension: bgov_2_agency_c {
    type: string
    sql: ${TABLE}.bgov_2_agency_c ;;
  }

  dimension: bgov_2_bgov_agency_contact_search_url_c {
    type: string
    sql: ${TABLE}.bgov_2_bgov_agency_contact_search_url_c ;;
  }

  dimension: bgov_2_bgov_url_c {
    type: string
    sql: ${TABLE}.bgov_2_bgov_url_c ;;
  }

  dimension: bgov_2_bureau_c {
    type: string
    sql: ${TABLE}.bgov_2_bureau_c ;;
  }

  dimension: bgov_2_composite_external_id_c {
    type: string
    sql: ${TABLE}.bgov_2_composite_external_id_c ;;
  }

  dimension: bgov_2_office_c {
    type: string
    sql: ${TABLE}.bgov_2_office_c ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_geocode_accuracy {
    type: string
    sql: ${TABLE}.billing_geocode_accuracy ;;
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: bizible_2_engagement_score_c {
    type: string
    sql: ${TABLE}.bizible_2_engagement_score_c ;;
  }

  dimension: blacklisted_account_c {
    type: yesno
    sql: ${TABLE}.blacklisted_account_c ;;
  }

  dimension: blacklisted_account_reason_c {
    type: string
    sql: ${TABLE}.blacklisted_account_reason_c ;;
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

  dimension: business_segment {
    type: string

    case: {
      when: {
        sql: ${number_of_employees} BETWEEN 0 AND 500 ;;
        label: "Small Business"
      }

      when: {
        sql: ${number_of_employees} BETWEEN 501 AND 1000 ;;
        label: "Mid-Market"
      }

      when: {
        sql: ${number_of_employees} > 1000 ;;
        label: "Enterprise"
      }

      else: "Unknown"
    }
  }


  dimension: company_size_c {
    type: number
    sql: ${TABLE}.company_size_c ;;
  }

  dimension: company_size_range_cleaned_c {
    type: string
    sql: ${TABLE}.company_size_range_cleaned_c ;;
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

  dimension: csm_c {
    type: string
    sql: ${TABLE}.csm_c ;;
  }

  dimension: da_scoop_composer_account_tags_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_account_tags_c ;;
  }

  dimension: da_scoop_composer_alias_1_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_alias_1_c ;;
  }

  dimension: da_scoop_composer_alias_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_alias_2_c ;;
  }

  dimension: da_scoop_composer_churned_customer_c {
    type: yesno
    sql: ${TABLE}.da_scoop_composer_churned_customer_c ;;
  }

  dimension: da_scoop_composer_domain_1_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_domain_1_c ;;
  }

  dimension: da_scoop_composer_domain_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_domain_2_c ;;
  }

  dimension: da_scoop_composer_dont_match_leads_to_this_account_c {
    type: yesno
    sql: ${TABLE}.da_scoop_composer_dont_match_leads_to_this_account_c ;;
  }

  dimension: da_scoop_composer_engagement_status_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_engagement_status_c ;;
  }

  dimension: da_scoop_composer_groove_notes_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_groove_notes_c ;;
  }

  dimension: da_scoop_composer_hash_1_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_hash_1_c ;;
  }

  dimension: da_scoop_composer_hash_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_hash_2_c ;;
  }

  dimension: da_scoop_composer_hash_3_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_hash_3_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain_c {
    type: string
    sql: ${TABLE}.domain_c ;;
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

  dimension: empty_picklist_for_lean_data_c {
    type: string
    sql: ${TABLE}.empty_picklist_for_lean_data_c ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: implementation_partner_c {
    type: string
    sql: ${TABLE}.implementation_partner_c ;;
  }

  dimension: industry_cleaned_c {
    type: string
    sql: ${TABLE}.industry_cleaned_c ;;
  }

  dimension: ironclad_workflow_acctfld_c {
    type: string
    sql: ${TABLE}.ironclad_workflow_acctfld_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
  }

  dimension: label_c {
    type: string
    sql: ${TABLE}.label_c ;;
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

  dimension: ld_automation_should_i_cc_ae_c {
    type: string
    sql: ${TABLE}.ld_automation_should_i_cc_ae_c ;;
  }

  dimension: lean_data_additional_user_cc_1_c {
    type: string
    sql: ${TABLE}.lean_data_additional_user_cc_1_c ;;
  }

  dimension: lean_data_automation_name_of_c {
    type: string
    sql: ${TABLE}.lean_data_automation_name_of_c ;;
  }

  dimension: lean_data_ld_email_domains_c {
    type: string
    sql: ${TABLE}.lean_data_ld_email_domains_c ;;
  }

  dimension: lean_data_reporting_customer_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_customer_c ;;
  }

  dimension: lean_data_reporting_has_opportunity_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_has_opportunity_c ;;
  }

  dimension_group: lean_data_reporting_last_marketing_touch_date_c {
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
    sql: ${TABLE}.lean_data_reporting_last_marketing_touch_date_c ;;
  }

  dimension_group: lean_data_reporting_last_sales_touch_date_c {
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
    sql: ${TABLE}.lean_data_reporting_last_sales_touch_date_c ;;
  }

  dimension: lean_data_reporting_recent_marketing_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_recent_marketing_touches_c ;;
  }

  dimension: lean_data_reporting_target_account_c {
    type: yesno
    sql: ${TABLE}.lean_data_reporting_target_account_c ;;
  }

  dimension: lean_data_reporting_total_leads_and_contacts_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_leads_and_contacts_c ;;
  }

  dimension: lean_data_reporting_total_marketing_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_marketing_touches_c ;;
  }

  dimension: lean_data_reporting_total_sales_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_total_sales_touches_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: lean_data_search_c {
    type: string
    sql: ${TABLE}.lean_data_search_c ;;
  }

  dimension: lid_linked_in_company_id_c {
    type: string
    sql: ${TABLE}.lid_linked_in_company_id_c ;;
  }

  dimension: main_technical_contact_c {
    type: string
    sql: ${TABLE}.main_technical_contact_c ;;
  }

  dimension: manually_override_sales_region_c {
    type: string
    sql: ${TABLE}.manually_override_sales_region_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: msla_partner_c {
    type: string
    sql: ${TABLE}.msla_partner_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nda_signed_c {
    type: yesno
    sql: ${TABLE}.nda_signed_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: ocr_providers_used_c {
    type: string
    sql: ${TABLE}.ocr_providers_used_c ;;
  }

  dimension: ofac_c {
    type: string
    sql: ${TABLE}.ofac_c ;;
  }

  dimension: ofac_company_search_result_c {
    type: string
    sql: ${TABLE}.ofac_company_search_result_c ;;
  }

  dimension: opportunity_use_cases_c {
    type: string
    sql: ${TABLE}.opportunity_use_cases_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension_group: pa_effective_date_c {
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
    sql: ${TABLE}.pa_effective_date_c ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_agreement_c {
    type: string
    sql: ${TABLE}.partner_agreement_c ;;
  }

  dimension: partner_fee_c {
    type: number
    sql: ${TABLE}.partner_fee_c ;;
  }

  dimension: partner_fee_notes_c {
    type: string
    sql: ${TABLE}.partner_fee_notes_c ;;
  }

  dimension: partner_implementation_enablement_c {
    type: string
    sql: ${TABLE}.partner_implementation_enablement_c ;;
  }

  dimension: partner_manager_c {
    type: string
    sql: ${TABLE}.partner_manager_c ;;
  }

  dimension: partner_model_c {
    type: string
    sql: ${TABLE}.partner_model_c ;;
  }

  dimension: partner_operations_c {
    type: string
    sql: ${TABLE}.partner_operations_c ;;
  }

  dimension: partner_product_enablement_c {
    type: string
    sql: ${TABLE}.partner_product_enablement_c ;;
  }

  dimension: partner_sales_enablement_c {
    type: string
    sql: ${TABLE}.partner_sales_enablement_c ;;
  }

  dimension: partner_se_c {
    type: string
    sql: ${TABLE}.partner_se_c ;;
  }

  dimension: partner_status_c {
    type: string
    sql: ${TABLE}.partner_status_c ;;
  }

  dimension: partner_test_instance_url_c {
    type: string
    sql: ${TABLE}.partner_test_instance_url_c ;;
  }

  dimension: partner_type_c {
    type: string
    sql: ${TABLE}.partner_type_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: rpa_providers_used_c {
    type: string
    sql: ${TABLE}.rpa_providers_used_c ;;
  }

  dimension: sales_region_c {
    type: string
    sql: ${TABLE}.sales_region_c ;;
  }

  dimension: scratch_field_c {
    type: string
    sql: ${TABLE}.scratch_field_c ;;
  }

  dimension: sdr_c {
    type: string
    sql: ${TABLE}.sdr_c ;;
  }

  dimension: segment_c {
    type: string
    sql: ${TABLE}.segment_c ;;
  }

  dimension: share_to_operatix_c {
    type: yesno
    sql: ${TABLE}.share_to_operatix_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_geocode_accuracy {
    type: string
    sql: ${TABLE}.shipping_geocode_accuracy ;;
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shipping_latitude ;;
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shipping_longitude ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: sow_partner_c {
    type: string
    sql: ${TABLE}.sow_partner_c ;;
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

  dimension_group: ta_effective_date_c {
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
    sql: ${TABLE}.ta_effective_date_c ;;
  }

  dimension: testing_agreement_c {
    type: string
    sql: ${TABLE}.testing_agreement_c ;;
  }

  dimension_group: testing_agreement_end_c {
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
    sql: ${TABLE}.testing_agreement_end_c ;;
  }

  dimension: tier_c {
    type: string
    sql: ${TABLE}.tier_c ;;
  }

  dimension: total_account_page_volume_millions_c {
    type: number
    sql: ${TABLE}.total_account_page_volume_millions_c ;;
  }

  dimension: total_account_page_volume_millions_range_c {
    type: string
    sql: ${TABLE}.total_account_page_volume_millions_range_c ;;
  }

  dimension: tspc_photo_url_c {
    type: string
    sql: ${TABLE}.tspc_photo_url_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: update_now_c {
    type: yesno
    sql: ${TABLE}.update_now_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zisf_company_id_c {
    type: string
    sql: ${TABLE}.zisf_company_id_c ;;
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

  measure: count {
    type: count
    drill_fields: [global_account_id_c, name, contact.count, opportunity.count, user.count]
  }

  measure: percent_of_accounts {
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: average_annual_revenue {
    type: average
    sql: ${annual_revenue} ;;
    value_format_name: usd
  }

  measure: total_number_of_employees {
    type: sum
    sql: ${number_of_employees} ;;
  }

  measure: average_number_of_employees {
    type: average
    sql: ${number_of_employees} ;;
  }

  measure: count_customers {
    type: count
  }
}
