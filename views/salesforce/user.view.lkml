view: user {
  sql_table_name: fivetran_database.salesforce.user ;;
  drill_fields: [id]

  filter: name_select {
    suggest_dimension: name
  }

  filter: department_select {
    suggest_dimension: department
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
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

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: age_in_years {
    type: number
    sql: date_part('year', current_date) - ${created_year} ;;
  }

  dimension: age_in_months {
    type: number
    sql: ${age_in_years}*12 + (date_part('month', current_date) - date_part('month', ${created_date})) ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: badge_text {
    type: string
    sql: ${TABLE}.badge_text ;;
  }

  dimension: banner_photo_url {
    type: string
    sql: ${TABLE}.banner_photo_url ;;
  }

  dimension: call_center_id {
    type: string
    sql: ${TABLE}.call_center_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: community_nickname {
    type: string
    sql: ${TABLE}.community_nickname ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_id ;;
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

  dimension_group: current_role_start_c {
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
    sql: ${TABLE}.current_role_start_c ;;
  }

  dimension: da_scoop_composer_default_groove_team_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_default_groove_team_c ;;
  }

  dimension: da_scoop_composer_email_alias_1_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_email_alias_1_c ;;
  }

  dimension: da_scoop_composer_email_alias_2_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_email_alias_2_c ;;
  }

  dimension: da_scoop_composer_google_plus_id_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_google_plus_id_c ;;
  }

  dimension: da_scoop_composer_is_unresolved_items_agent_c {
    type: yesno
    sql: ${TABLE}.da_scoop_composer_is_unresolved_items_agent_c ;;
  }

  dimension: da_scoop_composer_my_unresolved_items_agent_c {
    type: string
    sql: ${TABLE}.da_scoop_composer_my_unresolved_items_agent_c ;;
  }

  dimension: default_group_notification_frequency {
    type: string
    sql: ${TABLE}.default_group_notification_frequency ;;
  }

  dimension: delegated_approver_id {
    type: string
    sql: ${TABLE}.delegated_approver_id ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digest_frequency {
    type: string
    sql: ${TABLE}.digest_frequency ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: dsfs_dspro_sfmembership_status_c {
    type: string
    sql: ${TABLE}.dsfs_dspro_sfmembership_status_c ;;
  }

  dimension: dsfs_dspro_sfpassword_c {
    type: string
    sql: ${TABLE}.dsfs_dspro_sfpassword_c ;;
  }

  dimension: dsfs_dspro_sfusername_c {
    type: string
    sql: ${TABLE}.dsfs_dspro_sfusername_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_encoding_key {
    type: string
    sql: ${TABLE}.email_encoding_key ;;
  }

  dimension: email_preferences_auto_bcc {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc ;;
  }

  dimension: email_preferences_auto_bcc_stay_in_touch {
    type: yesno
    sql: ${TABLE}.email_preferences_auto_bcc_stay_in_touch ;;
  }

  dimension: email_preferences_stay_in_touch_reminder {
    type: yesno
    sql: ${TABLE}.email_preferences_stay_in_touch_reminder ;;
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: federation_identifier {
    type: string
    sql: ${TABLE}.federation_identifier ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: for_sdr_global_region_c {
    type: string
    sql: ${TABLE}.for_sdr_global_region_c ;;
  }

  dimension: forecast_enabled {
    type: yesno
    sql: ${TABLE}.forecast_enabled ;;
  }

  dimension: full_photo_url {
    type: string
    sql: ${TABLE}.full_photo_url ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: gong_recording_c {
    type: yesno
    sql: ${TABLE}.gong_recording_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_ext_indicator_visible {
    type: yesno
    sql: ${TABLE}.is_ext_indicator_visible ;;
  }

  dimension: is_profile_photo_active {
    type: yesno
    sql: ${TABLE}.is_profile_photo_active ;;
  }

  dimension: language_locale_key {
    type: string
    sql: ${TABLE}.language_locale_key ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_date ;;
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

  dimension_group: last_password_change {
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
    sql: ${TABLE}.last_password_change_date ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: locale_sid_key {
    type: string
    sql: ${TABLE}.locale_sid_key ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: medium_banner_photo_url {
    type: string
    sql: ${TABLE}.medium_banner_photo_url ;;
  }

  dimension: medium_photo_url {
    type: string
    sql: ${TABLE}.medium_photo_url ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mkto_si_is_caching_anon_web_activity_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_anon_web_activity_list_c ;;
  }

  dimension: mkto_si_is_caching_best_bets_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_best_bets_c ;;
  }

  dimension: mkto_si_is_caching_email_activity_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_email_activity_list_c ;;
  }

  dimension: mkto_si_is_caching_grouped_web_activity_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_grouped_web_activity_list_c ;;
  }

  dimension: mkto_si_is_caching_interesting_moments_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_interesting_moments_list_c ;;
  }

  dimension: mkto_si_is_caching_scoring_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_scoring_list_c ;;
  }

  dimension: mkto_si_is_caching_stream_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_stream_list_c ;;
  }

  dimension: mkto_si_is_caching_watch_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_watch_list_c ;;
  }

  dimension: mkto_si_is_caching_web_activity_list_c {
    type: yesno
    sql: ${TABLE}.mkto_si_is_caching_web_activity_list_c ;;
  }

  dimension: mkto_si_sales_insight_counter_c {
    type: number
    sql: ${TABLE}.mkto_si_sales_insight_counter_c ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_failed_logins {
    type: number
    sql: ${TABLE}.number_of_failed_logins ;;
  }

  dimension_group: offline_pda_trial_expiration {
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
    sql: ${TABLE}.offline_pda_trial_expiration_date ;;
  }

  dimension_group: offline_trial_expiration {
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
    sql: ${TABLE}.offline_trial_expiration_date ;;
  }

  dimension: out_of_office_message {
    type: string
    sql: ${TABLE}.out_of_office_message ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: receives_admin_info_emails {
    type: yesno
    sql: ${TABLE}.receives_admin_info_emails ;;
  }

  dimension: receives_info_emails {
    type: yesno
    sql: ${TABLE}.receives_info_emails ;;
  }

  dimension: rep_comparitor {
    sql: CASE
        WHEN {% condition name_select %} ${name} {% endcondition %}
          THEN CONCAT('1 - ', ${name})
        WHEN {% condition department_select %} ${account.business_segment} {% endcondition %}
          THEN CONCAT('2 - Rest of ', ${account.business_segment})
      ELSE '3 - Rest of Sales Team'
      END
       ;;
  }

  dimension: salary_c {
    type: number
    sql: ${TABLE}.salary_c ;;
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.sender_email ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sender_name ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: small_banner_photo_url {
    type: string
    sql: ${TABLE}.small_banner_photo_url ;;
  }

  dimension: small_photo_url {
    type: string
    sql: ${TABLE}.small_photo_url ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: stay_in_touch_note {
    type: string
    sql: ${TABLE}.stay_in_touch_note ;;
  }

  dimension: stay_in_touch_signature {
    type: string
    sql: ${TABLE}.stay_in_touch_signature ;;
  }

  dimension: stay_in_touch_subject {
    type: string
    sql: ${TABLE}.stay_in_touch_subject ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
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

  dimension: time_zone_sid_key {
    type: string
    sql: ${TABLE}.time_zone_sid_key ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_permissions_avantgo_user {
    type: yesno
    sql: ${TABLE}.user_permissions_avantgo_user ;;
  }

  dimension: user_permissions_call_center_auto_login {
    type: yesno
    sql: ${TABLE}.user_permissions_call_center_auto_login ;;
  }

  dimension: user_permissions_chatter_answers_user {
    type: yesno
    sql: ${TABLE}.user_permissions_chatter_answers_user ;;
  }

  dimension: user_permissions_interaction_user {
    type: yesno
    sql: ${TABLE}.user_permissions_interaction_user ;;
  }

  dimension: user_permissions_marketing_user {
    type: yesno
    sql: ${TABLE}.user_permissions_marketing_user ;;
  }

  dimension: user_permissions_offline_user {
    type: yesno
    sql: ${TABLE}.user_permissions_offline_user ;;
  }

  dimension: user_permissions_sfcontent_user {
    type: yesno
    sql: ${TABLE}.user_permissions_sfcontent_user ;;
  }

  dimension: user_permissions_support_user {
    type: yesno
    sql: ${TABLE}.user_permissions_support_user ;;
  }

  dimension: user_preferences_activity_reminders_popup {
    type: yesno
    sql: ${TABLE}.user_preferences_activity_reminders_popup ;;
  }

  dimension: user_preferences_apex_pages_developer_mode {
    type: yesno
    sql: ${TABLE}.user_preferences_apex_pages_developer_mode ;;
  }

  dimension: user_preferences_cache_diagnostics {
    type: yesno
    sql: ${TABLE}.user_preferences_cache_diagnostics ;;
  }

  dimension: user_preferences_create_lexapps_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_create_lexapps_wtshown ;;
  }

  dimension: user_preferences_dis_comment_after_like_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_comment_after_like_email ;;
  }

  dimension: user_preferences_dis_mentions_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_mentions_comment_email ;;
  }

  dimension: user_preferences_dis_prof_post_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_dis_prof_post_comment_email ;;
  }

  dimension: user_preferences_disable_all_feeds_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_all_feeds_email ;;
  }

  dimension: user_preferences_disable_bookmark_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_bookmark_email ;;
  }

  dimension: user_preferences_disable_change_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_change_comment_email ;;
  }

  dimension: user_preferences_disable_endorsement_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_endorsement_email ;;
  }

  dimension: user_preferences_disable_file_share_notifications_for_api {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_file_share_notifications_for_api ;;
  }

  dimension: user_preferences_disable_followers_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_followers_email ;;
  }

  dimension: user_preferences_disable_later_comment_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_later_comment_email ;;
  }

  dimension: user_preferences_disable_like_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_like_email ;;
  }

  dimension: user_preferences_disable_mentions_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_mentions_post_email ;;
  }

  dimension: user_preferences_disable_message_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_message_email ;;
  }

  dimension: user_preferences_disable_profile_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_profile_post_email ;;
  }

  dimension: user_preferences_disable_share_post_email {
    type: yesno
    sql: ${TABLE}.user_preferences_disable_share_post_email ;;
  }

  dimension: user_preferences_enable_auto_sub_for_feeds {
    type: yesno
    sql: ${TABLE}.user_preferences_enable_auto_sub_for_feeds ;;
  }

  dimension: user_preferences_event_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.user_preferences_event_reminders_checkbox_default ;;
  }

  dimension: user_preferences_exclude_mail_app_attachments {
    type: yesno
    sql: ${TABLE}.user_preferences_exclude_mail_app_attachments ;;
  }

  dimension: user_preferences_favorites_show_top_favorites {
    type: yesno
    sql: ${TABLE}.user_preferences_favorites_show_top_favorites ;;
  }

  dimension: user_preferences_favorites_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_favorites_wtshown ;;
  }

  dimension: user_preferences_global_nav_bar_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_global_nav_bar_wtshown ;;
  }

  dimension: user_preferences_global_nav_grid_menu_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_global_nav_grid_menu_wtshown ;;
  }

  dimension: user_preferences_has_celebration_badge {
    type: yesno
    sql: ${TABLE}.user_preferences_has_celebration_badge ;;
  }

  dimension: user_preferences_hide_bigger_photo_callout {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_bigger_photo_callout ;;
  }

  dimension: user_preferences_hide_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_csndesktop_task {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_csndesktop_task ;;
  }

  dimension: user_preferences_hide_csnget_chatter_mobile_task {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_csnget_chatter_mobile_task ;;
  }

  dimension: user_preferences_hide_end_user_onboarding_assistant_modal {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_end_user_onboarding_assistant_modal ;;
  }

  dimension: user_preferences_hide_lightning_migration_modal {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_lightning_migration_modal ;;
  }

  dimension: user_preferences_hide_s_1_browser_ui {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_s_1_browser_ui ;;
  }

  dimension: user_preferences_hide_second_chatter_onboarding_splash {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_second_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_sfx_welcome_mat {
    type: yesno
    sql: ${TABLE}.user_preferences_hide_sfx_welcome_mat ;;
  }

  dimension: user_preferences_lightning_experience_preferred {
    type: yesno
    sql: ${TABLE}.user_preferences_lightning_experience_preferred ;;
  }

  dimension: user_preferences_native_email_client {
    type: yesno
    sql: ${TABLE}.user_preferences_native_email_client ;;
  }

  dimension: user_preferences_new_lightning_report_run_page_enabled {
    type: yesno
    sql: ${TABLE}.user_preferences_new_lightning_report_run_page_enabled ;;
  }

  dimension: user_preferences_path_assistant_collapsed {
    type: yesno
    sql: ${TABLE}.user_preferences_path_assistant_collapsed ;;
  }

  dimension: user_preferences_preview_custom_theme {
    type: yesno
    sql: ${TABLE}.user_preferences_preview_custom_theme ;;
  }

  dimension: user_preferences_preview_lightning {
    type: yesno
    sql: ${TABLE}.user_preferences_preview_lightning ;;
  }

  dimension: user_preferences_receive_no_notifications_as_approver {
    type: yesno
    sql: ${TABLE}.user_preferences_receive_no_notifications_as_approver ;;
  }

  dimension: user_preferences_receive_notifications_as_delegated_approver {
    type: yesno
    sql: ${TABLE}.user_preferences_receive_notifications_as_delegated_approver ;;
  }

  dimension: user_preferences_record_home_reserved_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_record_home_reserved_wtshown ;;
  }

  dimension: user_preferences_record_home_section_collapse_wtshown {
    type: yesno
    sql: ${TABLE}.user_preferences_record_home_section_collapse_wtshown ;;
  }

  dimension: user_preferences_reminder_sound_off {
    type: yesno
    sql: ${TABLE}.user_preferences_reminder_sound_off ;;
  }

  dimension: user_preferences_show_city_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_city_to_external_users ;;
  }

  dimension: user_preferences_show_city_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_city_to_guest_users ;;
  }

  dimension: user_preferences_show_country_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_country_to_external_users ;;
  }

  dimension: user_preferences_show_country_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_country_to_guest_users ;;
  }

  dimension: user_preferences_show_email_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_email_to_external_users ;;
  }

  dimension: user_preferences_show_email_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_email_to_guest_users ;;
  }

  dimension: user_preferences_show_fax_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_fax_to_external_users ;;
  }

  dimension: user_preferences_show_fax_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_fax_to_guest_users ;;
  }

  dimension: user_preferences_show_manager_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_manager_to_external_users ;;
  }

  dimension: user_preferences_show_manager_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_manager_to_guest_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_external_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_guest_users ;;
  }

  dimension: user_preferences_show_postal_code_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_postal_code_to_external_users ;;
  }

  dimension: user_preferences_show_postal_code_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_postal_code_to_guest_users ;;
  }

  dimension: user_preferences_show_profile_pic_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_profile_pic_to_guest_users ;;
  }

  dimension: user_preferences_show_state_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_state_to_external_users ;;
  }

  dimension: user_preferences_show_state_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_state_to_guest_users ;;
  }

  dimension: user_preferences_show_street_address_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_street_address_to_external_users ;;
  }

  dimension: user_preferences_show_street_address_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_street_address_to_guest_users ;;
  }

  dimension: user_preferences_show_title_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_title_to_external_users ;;
  }

  dimension: user_preferences_show_title_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_title_to_guest_users ;;
  }

  dimension: user_preferences_show_work_phone_to_external_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_work_phone_to_external_users ;;
  }

  dimension: user_preferences_show_work_phone_to_guest_users {
    type: yesno
    sql: ${TABLE}.user_preferences_show_work_phone_to_guest_users ;;
  }

  dimension: user_preferences_sort_feed_by_comment {
    type: yesno
    sql: ${TABLE}.user_preferences_sort_feed_by_comment ;;
  }

  dimension: user_preferences_srhoverride_activities {
    type: yesno
    sql: ${TABLE}.user_preferences_srhoverride_activities ;;
  }

  dimension: user_preferences_suppress_event_sfxreminders {
    type: yesno
    sql: ${TABLE}.user_preferences_suppress_event_sfxreminders ;;
  }

  dimension: user_preferences_suppress_task_sfxreminders {
    type: yesno
    sql: ${TABLE}.user_preferences_suppress_task_sfxreminders ;;
  }

  dimension: user_preferences_task_reminders_checkbox_default {
    type: yesno
    sql: ${TABLE}.user_preferences_task_reminders_checkbox_default ;;
  }

  dimension: user_preferences_user_debug_mode_pref {
    type: yesno
    sql: ${TABLE}.user_preferences_user_debug_mode_pref ;;
  }

  dimension: user_role_id {
    type: string
    sql: ${TABLE}.user_role_id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_revenue_pipeline {
    type: number
    sql: 1.0 * ${opportunity.total_pipeline_revenue} / NULLIF(${count},0) ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    drill_fields: [account.name, opportunity.type, opportunity.closed_date, opportunity.total_acv]
  }

  # Begin added 05/06/21 forward #

  dimension: employee_last_day {
    type: date
    sql: case when not(${is_active}) then ${last_login_date} end ;;
  }

  dimension: is_hired_previous_year {
    type: yesno
    sql: extract(year from current_date) - ${created_year} = 1 ;;
  }

  dimension: is_hired_previous_quarter {
    type: yesno
    sql: to_char(date_trunc('quarter', current_date)::date - 1, 'yyyy-q')
      = to_char(date_trunc('quarter', ${created_raw})::date, 'yyyy-q') ;;
  }

  dimension: is_hired_previous_month {
    type: yesno
    sql: to_char(date_trunc('month', current_date)::date - 1, 'yyyy-mm')
      = to_char(date_trunc('month', ${created_raw})::date, 'yyyy-mm') ;;
  }

  measure: count_hired_previous_year {
    type: count
    filters: [is_hired_previous_year: "Yes"]
  }

  measure: count_hired_previous_year_still_employed {
    type: count
    filters: [is_active: "Yes", is_hired_previous_year: "Yes"]
  }

  measure: percent_hired_previous_year_still_employed {
    type: number
    sql: ${count_hired_previous_year_still_employed}::real/nullif(${count_hired_previous_year}::real,0) ;;
    value_format_name: percent_0
  }

  measure: count_hired_previous_quarter {
    type: count
    filters: [is_hired_previous_quarter: "Yes"]
  }

  measure: count_hired_previous_quarter_still_employed {
    type: count
    filters: [is_active: "Yes", is_hired_previous_quarter: "Yes"]
  }

  measure: percent_hired_previous_quarter_still_employed {
    type: number
    sql: ${count_hired_previous_quarter_still_employed}::real/nullif(${count_hired_previous_quarter}::real,0) ;;
    value_format_name: percent_0
  }

  measure: count_hired_previous_month {
    type: count
    filters: [is_hired_previous_month: "Yes"]
  }

  measure: count_hired_previous_month_still_employed {
    type: count
    filters: [is_active: "Yes", is_hired_previous_month: "Yes"]
  }

  measure: percent_hired_previous_month_still_employed {
    type: number
    sql: ${count_hired_previous_month_still_employed}::real/nullif(${count_hired_previous_month}::real,0) ;;
    value_format_name: percent_0
  }





  # Enterprise Account Executive in Sales

  # End added 05/06/21 forward #

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      username,
      last_name,
      first_name,
      middle_name,
      name,
      company_name,
      sender_name,
      community_nickname,
      contact.last_name,
      contact.first_name,
      contact.middle_name,
      contact.name,
      contact.jigsaw_contact_id,
      account.name,
      account.global_account_id_c
    ]
  }

  set: opportunity_set {
    fields: [average_revenue_pipeline]
  }
}
