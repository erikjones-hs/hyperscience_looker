view: saas_usage {
  sql_table_name: (select * from dev.erikjones.saas_usage);;

  dimension: report_id {
    type: string
    sql: ${TABLE}."REPORT_ID" ;;
  }

  dimension: customer_int {
    type: string
    sql: ${TABLE}."CUSTOMER_INT" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: period_start {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."PERIOD_START" ;;
  }

  dimension: submissions_created_count {
    type: number
    sql: ${TABLE}."SUBMISSIONS_CREATED_COUNT" ;;
  }

  dimension: submissions_count {
    type: number
    sql: ${TABLE}."SUBMISSIONS_COUNT" ;;
  }

  dimension: forms_created_count {
    type: number
    sql: ${TABLE}."FORMS_CREATED_COUNT" ;;
  }

  dimension: forms_count {
    type: number
    sql: ${TABLE}."FORMS_COUNT" ;;
  }

  dimension: submission_page_created_count {
    type: number
    sql: ${TABLE}."SUBMISSION_PAGE_CREATED_COUNT" ;;
  }

  dimension: submission_page_count {
    type: number
    sql: ${TABLE}."SUBMISSION_PAGE_COUNT" ;;
  }

  dimension: pages_created_structured_count {
    type: number
    sql: ${TABLE}."PAGES_CREATED_STRUCTURED_COUNT" ;;
  }

  dimension: pages_structured_count {
    type: number
    sql: ${TABLE}."PAGES_STRUCTURED_COUNT" ;;
  }

  dimension: pages_created_variable_count {
    type: number
    sql: ${TABLE}."PAGES_CREATED_VARIABLE_COUNT" ;;
  }

  dimension: pages_variable_count {
    type: number
    sql: ${TABLE}."PAGES_VARIABLE_COUNT" ;;
  }

  dimension: pages_with_fields_created_count {
    type: number
    sql: ${TABLE}."PAGES_WITH_FIELDS_CREATED_COUNT" ;;
  }

  dimension: pages_with_fields_count {
    type: number
    sql: ${TABLE}."PAGES_WITH_FIELDS_COUNT" ;;
  }

  dimension: fields_created_count {
    type: number
    sql: ${TABLE}."FIELDS_CREATED_COUNT" ;;
  }

  dimension: fields_completed_count {
    type: number
    sql: ${TABLE}."FIELDS_COMPLETED_COUNT" ;;
  }

  dimension: transcription_characters_count {
    type: number
    sql: ${TABLE}."TRANSCRIPTION_CHARACTERS_COUNT" ;;
  }

  dimension: login_count {
    type: number
    sql: ${TABLE}."LOGIN_COUNT" ;;
  }

  dimension: submissions_files_created_count {
    type: number
    sql: ${TABLE}."SUBMISSIONS_FILES_CREATED_COUNT" ;;
  }

  dimension: machine_transcribed_entries_count {
    type: number
    sql: ${TABLE}."MACHINE_TRANSCRIBED_ENTRIES_COUNT" ;;
  }

  dimension: human_transcribed_entries_count {
    type: number
    sql: ${TABLE}."HUMAN_TRANSCRIBED_ENTRIES_COUNT" ;;
  }

  dimension: machine_identified_fields_count {
    type: number
    sql: ${TABLE}."MACHINE_IDENTIFIED_FIELDS_COUNT" ;;
  }

  dimension: human_identified_fields_count {
    type: number
    sql: ${TABLE}."HUMAN_IDENTIFIED_FIELDS_COUNT" ;;
  }

  dimension: pages_count_machine_sum {
    type: number
    sql: ${TABLE}."PAGES_COUNT_MACHINE_SUM" ;;
  }

  dimension: pages_count_manual_sum {
    type: number
    sql: ${TABLE}."PAGES_COUNT_MANUAL_SUM" ;;
  }

  dimension: template_count_match {
    type: number
    sql: ${TABLE}."TEMPLATE_COUNT_MATCH" ;;
  }

  dimension: manual_checked_transcriptions_count {
    type: number
    sql: ${TABLE}."MANUAL_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: manual_correct_transcriptions_count {
    type: number
    sql: ${TABLE}."MANUAL_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: system_checked_transcriptions_count {
    type: number
    sql: ${TABLE}."SYSTEM_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: system_correct_transcriptions_count {
    type: number
    sql: ${TABLE}."SYSTEM_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: machine_checked_transcriptions_count {
    type: number
    sql: ${TABLE}."MACHINE_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: machine_correct_transcriptions_count {
    type: number
    sql: ${TABLE}."MACHINE_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  dimension: manual_checked_field_id_count {
    type: number
    sql: ${TABLE}."MANUAL_CHECKED_FIELD_ID_COUNT" ;;
  }

  dimension: manual_correct_field_id_count {
    type: number
    sql: ${TABLE}."MANUAL_CORRECT_FIELD_ID_COUNT" ;;
  }

  dimension: system_checked_field_id_count {
    type: number
    sql: ${TABLE}."SYSTEM_CHECKED_FIELD_ID_COUNT" ;;
  }

  dimension: system_correct_field_id_count {
    type: number
    sql: ${TABLE}."SYSTEM_CORRECT_FIELD_ID_COUNT" ;;
  }

  dimension: machine_checked_field_id_count {
    type: number
    sql: ${TABLE}."MACHINE_CHECKED_FIELD_ID_COUNT" ;;
  }

  dimension: machine_correct_field_id_count {
    type: number
    sql: ${TABLE}."MACHINE_CORRECT_FIELD_ID_COUNT" ;;
  }

  dimension: fields_inc_machine_transcribed_count {
    type: number
    sql: ${TABLE}."FIELDS_INC_MACHINE_TRANSCRIBED_COUNT" ;;
  }

  dimension: organize_docs_tasks_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_TASKS_COUNT" ;;
  }

  dimension: organize_docs_pages_shown_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_PAGES_SHOWN_COUNT" ;;
  }

  dimension: organize_docs_pages_processed_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_PAGES_PROCESSED_COUNT" ;;
  }

  dimension: organize_docs_docs_created_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_DOCS_CREATED_COUNT" ;;
  }

  dimension: organize_docs_docs_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_DOCS_COUNT" ;;
  }

  dimension: organize_docs_folders_count {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCS_FOLDERS_COUNT" ;;
  }

  dimension: live_layouts_count {
    type: number
    sql: ${TABLE}."LIVE_LAYOUTS_COUNT" ;;
  }

  dimension: forms_version {
    type: string
    sql: ${TABLE}."FORMS_VERSION" ;;
  }

  dimension: machine_match_nlc_page_count {
    type: number
    sql: ${TABLE}."MACHINE_MATCH_NLC_PAGE_COUNT" ;;
  }

  dimension: human_match_nlc_page_count {
    type: number
    sql: ${TABLE}."HUMAN_MATCH_NLC_PAGE_COUNT" ;;
  }

  dimension: releases_count {
    type: number
    sql: ${TABLE}."RELEASES_COUNT" ;;
  }

  dimension: archived_releases_count {
    type: number
    sql: ${TABLE}."ARCHIVED_RELEASES_COUNT" ;;
  }

  dimension: layouts_count {
    type: number
    sql: ${TABLE}."LAYOUTS_COUNT" ;;
  }

  dimension: archived_layouts_count {
    type: number
    sql: ${TABLE}."ARCHIVED_LAYOUTS_COUNT" ;;
  }

  dimension: layout_versions_count {
    type: number
    sql: ${TABLE}."LAYOUT_VERSIONS_COUNT" ;;
  }

  dimension: live_idp_flows_count {
    type: number
    sql: ${TABLE}."LIVE_IDP_FLOWS_COUNT" ;;
  }

  dimension: cells_created_count {
    type: number
    sql: ${TABLE}."CELLS_CREATED_COUNT" ;;
  }

  dimension: cells_completed_count {
    type: number
    sql: ${TABLE}."CELLS_COMPLETED_COUNT" ;;
  }

  dimension: machine_identified_cells_count {
    type: number
    sql: ${TABLE}."MACHINE_IDENTIFIED_CELLS_COUNT" ;;
  }

  dimension: human_identified_cells_count {
    type: number
    sql: ${TABLE}."HUMAN_IDENTIFIED_CELLS_COUNT" ;;
  }

  dimension: manual_checked_nlc_page_count {
    type: number
    sql: ${TABLE}."MANUAL_CHECKED_NLC_PAGE_COUNT" ;;
  }

  dimension: manual_correct_nlc_page_count {
    type: number
    sql: ${TABLE}."MANUAL_CORRECT_NLC_PAGE_COUNT" ;;
  }

  dimension: system_checked_nlc_page_count {
    type: number
    sql: ${TABLE}."SYSTEM_CHECKED_NLC_PAGE_COUNT" ;;
  }

  dimension: system_correct_nlc_page_count {
    type: number
    sql: ${TABLE}."SYSTEM_CORRECT_NLC_PAGE_COUNT" ;;
  }

  dimension: machine_checked_nlc_page_count {
    type: number
    sql: ${TABLE}."MACHINE_CHECKED_NLC_PAGE_COUNT" ;;
  }

  dimension: machine_correct_nlc_page_count {
    type: number
    sql: ${TABLE}."MACHINE_CORRECT_NLC_PAGE_COUNT" ;;
  }

  dimension: fleex_transcribed_fields_count {
    type: number
    sql: ${TABLE}."FLEEX_TRANSCRIBED_FIELDS_COUNT" ;;
  }

  dimension: fleex_transcribed_table_cells_count {
    type: number
    sql: ${TABLE}."FLEEX_TRANSCRIBED_TABLE_CELLS_COUNT" ;;
  }

  dimension: custom_supervision_transcribed_fields_count {
    type: number
    sql: ${TABLE}."CUSTOM_SUPERVISION_TRANSCRIBED_FIELDS_COUNT" ;;
  }

  measure: submissions_created {
    type: sum
    sql: ${TABLE}."SUBMISSIONS_CREATED_COUNT" ;;
  }

  measure: submissions {
    type: sum
    sql: ${TABLE}."SUBMISSIONS_COUNT" ;;
  }

  measure: forms_created {
    type: sum
    sql: ${TABLE}."FORMS_CREATED_COUNT" ;;
  }

  measure: forms {
    type: sum
    sql: ${TABLE}."FORMS_COUNT" ;;
  }

  measure: submission_page_created {
    type: sum
    sql: ${TABLE}."SUBMISSION_PAGE_CREATED_COUNT" ;;
  }

  measure: submission_page {
    type: sum
    sql: ${TABLE}."SUBMISSION_PAGE_COUNT" ;;
  }

  measure: pages_created_structured {
    type: sum
    sql: ${TABLE}."PAGES_CREATED_STRUCTURED_COUNT" ;;
  }

  measure: pages_structured {
    type: sum
    sql: ${TABLE}."PAGES_STRUCTURED_COUNT" ;;
  }

  measure: pages_created_variable {
    type: sum
    sql: ${TABLE}."PAGES_CREATED_VARIABLE_COUNT" ;;
  }

  measure: pages_variable {
    type: sum
    sql: ${TABLE}."PAGES_VARIABLE_COUNT" ;;
  }

  measure: pages_with_fields_created {
    type: sum
    sql: ${TABLE}."PAGES_WITH_FIELDS_CREATED_COUNT" ;;
  }

  measure: pages_with_fields {
    type: sum
    sql: ${TABLE}."PAGES_WITH_FIELDS_COUNT" ;;
  }

  measure: fields_created {
    type: sum
    sql: ${TABLE}."FIELDS_CREATED_COUNT" ;;
  }

  measure: fields_completed {
    type: sum
    sql: ${TABLE}."FIELDS_COMPLETED_COUNT" ;;
  }

  measure: transcription_characters {
    type: sum
    sql: ${TABLE}."TRANSCRIPTION_CHARACTERS_COUNT" ;;
  }

  measure: num_logins {
    type: sum
    sql: ${TABLE}."LOGIN_COUNT" ;;
  }

  measure: submissions_files_created {
    type: sum
    sql: ${TABLE}."SUBMISSIONS_FILES_CREATED_COUNT" ;;
  }

  measure: machine_transcribed_entries {
    type: sum
    sql: ${TABLE}."MACHINE_TRANSCRIBED_ENTRIES_COUNT" ;;
  }

  measure: human_transcribed_entries {
    type: sum
    sql: ${TABLE}."HUMAN_TRANSCRIBED_ENTRIES_COUNT" ;;
  }

  measure: machine_identified_fields {
    type: sum
    sql: ${TABLE}."MACHINE_IDENTIFIED_FIELDS_COUNT" ;;
  }

  measure: human_identified_fields {
    type: sum
    sql: ${TABLE}."HUMAN_IDENTIFIED_FIELDS_COUNT" ;;
  }

  measure: pages_count_machine {
    type: sum
    sql: ${TABLE}."PAGES_COUNT_MACHINE_SUM" ;;
  }

  measure: pages_count_manual {
    type: sum
    sql: ${TABLE}."PAGES_COUNT_MANUAL_SUM" ;;
  }

  measure: template_match {
    type: sum
    sql: ${TABLE}."TEMPLATE_COUNT_MATCH" ;;
  }

  measure: manual_checked_transcriptions {
    type: sum
    sql: ${TABLE}."MANUAL_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: manual_correct_transcriptions {
    type: sum
    sql: ${TABLE}."MANUAL_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: system_checked_transcriptions {
    type: sum
    sql: ${TABLE}."SYSTEM_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: system_correct_transcriptions {
    type: sum
    sql: ${TABLE}."SYSTEM_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: machine_checked_transcriptions {
    type: sum
    sql: ${TABLE}."MACHINE_CHECKED_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: machine_correct_transcriptions {
    type: sum
    sql: ${TABLE}."MACHINE_CORRECT_TRANSCRIPTIONS_COUNT" ;;
  }

  measure: manual_checked_field_id {
    type: sum
    sql: ${TABLE}."MANUAL_CHECKED_FIELD_ID_COUNT" ;;
  }

  measure: manual_correct_field_id {
    type: sum
    sql: ${TABLE}."MANUAL_CORRECT_FIELD_ID_COUNT" ;;
  }

  measure: system_checked_field_id {
    type: sum
    sql: ${TABLE}."SYSTEM_CHECKED_FIELD_ID_COUNT" ;;
  }

  measure: system_correct_field_id {
    type: sum
    sql: ${TABLE}."SYSTEM_CORRECT_FIELD_ID_COUNT" ;;
  }

  measure: machine_checked_field_id {
    type: sum
    sql: ${TABLE}."MACHINE_CHECKED_FIELD_ID_COUNT" ;;
  }

  measure: machine_correct_field_id {
    type: sum
    sql: ${TABLE}."MACHINE_CORRECT_FIELD_ID_COUNT" ;;
  }

  measure: fields_inc_machine_transcribed {
    type: sum
    sql: ${TABLE}."FIELDS_INC_MACHINE_TRANSCRIBED_COUNT" ;;
  }

  measure: organize_docs_tasks {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_TASKS_COUNT" ;;
  }

  measure: organize_docs_pages_shown {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_PAGES_SHOWN_COUNT" ;;
  }

  measure: organize_docs_pages_processed {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_PAGES_PROCESSED_COUNT" ;;
  }

  measure: organize_docs_docs_created {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_DOCS_CREATED_COUNT" ;;
  }

  measure: organize_docs_docs {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_DOCS_COUNT" ;;
  }

  measure: organize_docs_folders {
    type: sum
    sql: ${TABLE}."ORGANIZE_DOCS_FOLDERS_COUNT" ;;
  }

  measure: live_layouts {
    type: sum
    sql: ${TABLE}."LIVE_LAYOUTS_COUNT" ;;
  }


  measure: machine_match_nlc_page {
    type: sum
    sql: ${TABLE}."MACHINE_MATCH_NLC_PAGE_COUNT" ;;
  }

  measure: human_match_nlc_page {
    type: sum
    sql: ${TABLE}."HUMAN_MATCH_NLC_PAGE_COUNT" ;;
  }

  measure: releases {
    type: sum
    sql: ${TABLE}."RELEASES_COUNT" ;;
  }

  measure: archived_releases {
    type: sum
    sql: ${TABLE}."ARCHIVED_RELEASES_COUNT" ;;
  }

  measure: layouts {
    type: sum
    sql: ${TABLE}."LAYOUTS_COUNT" ;;
  }

  measure: archived_layouts {
    type: sum
    sql: ${TABLE}."ARCHIVED_LAYOUTS_COUNT" ;;
  }

  measure: layout_versions {
    type: sum
    sql: ${TABLE}."LAYOUT_VERSIONS_COUNT" ;;
  }

  measure: live_idp_flows {
    type: sum
    sql: ${TABLE}."LIVE_IDP_FLOWS_COUNT" ;;
  }

  measure: cells_created {
    type: sum
    sql: ${TABLE}."CELLS_CREATED_COUNT" ;;
  }

  measure: cells_completed {
    type: sum
    sql: ${TABLE}."CELLS_COMPLETED_COUNT" ;;
  }

  measure: machine_identified_cells {
    type: sum
    sql: ${TABLE}."MACHINE_IDENTIFIED_CELLS_COUNT" ;;
  }

  measure: human_identified_cells {
    type: sum
    sql: ${TABLE}."HUMAN_IDENTIFIED_CELLS_COUNT" ;;
  }

  measure: manual_checked_nlc_page {
    type: sum
    sql: ${TABLE}."MANUAL_CHECKED_NLC_PAGE_COUNT" ;;
  }

  measure: manual_correct_nlc_page {
    type: sum
    sql: ${TABLE}."MANUAL_CORRECT_NLC_PAGE_COUNT" ;;
  }

  measure: system_checked_nlc_page {
    type: sum
    sql: ${TABLE}."SYSTEM_CHECKED_NLC_PAGE_COUNT" ;;
  }

  measure: system_correct_nlc_page {
    type: sum
    sql: ${TABLE}."SYSTEM_CORRECT_NLC_PAGE_COUNT" ;;
  }

  measure: machine_checked_nlc_page {
    type: sum
    sql: ${TABLE}."MACHINE_CHECKED_NLC_PAGE_COUNT" ;;
  }

  measure: machine_correct_nlc_page {
    type: sum
    sql: ${TABLE}."MACHINE_CORRECT_NLC_PAGE_COUNT" ;;
  }

  measure: fleex_transcribed_fields {
    type: sum
    sql: ${TABLE}."FLEEX_TRANSCRIBED_FIELDS_COUNT" ;;
  }

  measure: fleex_transcribed_table_cells {
    type: sum
    sql: ${TABLE}."FLEEX_TRANSCRIBED_TABLE_CELLS_COUNT" ;;
  }

  measure: custom_supervision_transcribed_fields {
    type: sum
    sql: ${TABLE}."CUSTOM_SUPERVISION_TRANSCRIBED_FIELDS_COUNT" ;;
  }

  # measure: total_pages_created {
  #   group_label: "Page Details"
  #   type: sum
  #   sql: ${number_of_pages_created}  ;;
  #   # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   link: {
  #     label: "Detailed View of pages Created"
  #     url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
  #   }
  # }

  # measure: total_pages_matched_to_form_layouts_created {
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_pages_matched_to_form_layouts_created]
  #   sql: ${number_of_pages_matched_to_form_layouts_created}*1.0 ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_pages_matched_to_flex_layouts_created {
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_pages_matched_to_flex_layouts_created]
  #   sql: ${number_of_pages_matched_to_flex_layouts_created}*1.0 ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_pages_matched_to_layout {
  #   group_label: "Page Details"
  #   label: "% Pages Matched to Layout"
  #   type: number
  #   drill_fields: [details*, total_pages_matched_to_flex_layouts_created, total_pages_matched_to_form_layouts_created]
  #   sql: (${total_pages_matched_to_form_layouts_created} + ${total_pages_matched_to_flex_layouts_created})
  #     /nullif(${total_pages_created}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: total_pages_completed {
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_pages_completed]
  #   sql: ${number_of_pages_completed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_documents_completed {
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_documents_completed]
  #   sql: ${number_of_documents_completed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_submissions_completed {
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_submissions_completed]
  #   sql: ${number_of_submissions_completed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: average_pages_processed_per_document {
  #   group_label: "Page Details"
  #   type: number
  #   drill_fields: [details*, total_pages_completed, total_documents_completed]
  #   sql: ${total_pages_completed}::real/nullif(${total_documents_completed}::real,0) ;;
  #   value_format_name: decimal_2
  # }

  # measure: average_pages_processed_per_submission {
  #   group_label: "Page Details"
  #   type: number
  #   drill_fields: [details*, total_pages_completed, total_submissions_completed]
  #   sql: ${total_pages_completed}::real/nullif(${total_submissions_completed}::real,0) ;;
  #   value_format_name: decimal_2
  # }


  # measure: total_qa_correct_responses_system_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_correct_responses_on_system_transcription]
  #   sql: ${number_of_qa_correct_responses_on_system_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_qa_responses_system_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_responses_on_system_transcription]
  #   sql: ${number_of_qa_responses_on_system_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_fields_machine_transcribed {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_fields_machine_transcribed]
  #   sql: ${number_of_fields_machine_transcribed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_fields_manually_transcribed {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_fields_manually_transcribed]
  #   sql: ${number_of_fields_manually_transcribed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_of_fields_auto_transcribed {
  #   group_label: "Page Details"
  #   type: number
  #   drill_fields: [details*, total_fields_machine_transcribed, total_fields_manually_transcribed]
  #   sql: (${total_fields_machine_transcribed}::real)
  #     /nullif((${total_fields_machine_transcribed}::real + ${total_fields_manually_transcribed}::real),0) ;;
  #   value_format_name: percent_2
  # }

  # measure: percent_correct_of_system_transcription {
  #   group_label: "Page Details"
  #   label: "System Transcription Output Accuracy %"
  #   type: number
  #   drill_fields: [details*, total_qa_correct_responses_system_transcription, total_qa_responses_system_transcription]
  #   sql: ${total_qa_correct_responses_system_transcription}::real/nullif(${total_qa_responses_system_transcription}::real,0) ;;
  #   value_format_name: percent_2
  # }

  # measure: total_qa_correct_responses_manual_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_correct_responses_on_manual_transcription]
  #   sql: ${number_of_qa_correct_responses_on_manual_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_qa_responses_manual_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_responses_on_manual_transcription]
  #   sql: ${number_of_qa_responses_on_manual_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_correct_of_manual_transcription {
  #   group_label: "Page Details"
  #   label: "Manual Transcription Output Accuracy %"
  #   type: number
  #   drill_fields: [details*, total_qa_correct_responses_manual_transcription, total_qa_responses_manual_transcription]
  #   sql: ${total_qa_correct_responses_manual_transcription}::real/nullif(${total_qa_responses_manual_transcription}::real,0) ;;
  #   value_format_name: percent_2
  # }

  # measure: total_qa_correct_responses_machine_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_correct_responses_on_machine_transcription]
  #   sql: ${number_of_qa_correct_responses_on_machine_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_qa_responses_machine_transcription {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_responses_on_machine_transcription]
  #   sql: ${number_of_qa_responses_on_machine_transcription} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_correct_of_machine_transcription {
  #   group_label: "Page Details"
  #   label: "Machine Transcription Output Accuracy %"
  #   type: number
  #   drill_fields: [details*, total_qa_correct_responses_machine_transcription, total_qa_responses_machine_transcription]
  #   sql: ${total_qa_correct_responses_machine_transcription}::real/nullif(${total_qa_responses_machine_transcription}::real,0) ;;
  #   value_format_name: percent_2
  # }

  # measure: percent_field_qa {
  #   group_label: "Page Details"
  #   label: "Field QA %"
  #   type: number
  #   drill_fields: [details*, total_qa_responses_system_transcription, total_fields_machine_transcribed, total_fields_manually_transcribed]
  #   sql: ${total_qa_responses_system_transcription}::real
  #     /nullif((${total_fields_machine_transcribed}::real + ${total_fields_manually_transcribed}::real),0);;
  #   value_format_name: percent_2
  # }

  # measure: total_fields_created {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_fields_completed]
  #   sql: ${number_of_fields_created} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_fields_completed {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_fields_completed]
  #   sql: ${number_of_fields_completed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_characters_completed {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_characters_completed]
  #   sql: ${number_of_characters_completed} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: fields_per_page {
  #   group_label: "Page Details"
  #   label: "Number of Fields per Page"
  #   type: number
  #   drill_fields: [details*, total_fields_completed, total_pages_matched_to_form_layouts_created, total_pages_matched_to_flex_layouts_created]
  #   sql: ${total_fields_completed}::real/nullif((${total_pages_matched_to_form_layouts_created}::real + ${total_pages_matched_to_flex_layouts_created}::real),0);;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: characters_per_page {
  #   group_label: "Page Details"
  #   label: "Number of Characters per Page"
  #   type: number
  #   drill_fields: [details*, total_characters_completed, total_pages_matched_to_form_layouts_created, total_pages_matched_to_flex_layouts_created]
  #   sql: ${total_characters_completed}::real/nullif((${total_pages_matched_to_form_layouts_created}::real + ${total_pages_matched_to_flex_layouts_created}::real),0);;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_table_cells_created {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_table_cells_created]
  #   sql: ${number_of_table_cells_created} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_table_cells_machine_identified {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_table_cells_machine_identified]
  #   sql: ${number_of_table_cells_machine_identified} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_table_cells_manually_identified {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_table_cells_manually_identified]
  #   sql: ${number_of_table_cells_manually_identified} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_table_automation {
  #   group_label: "Page Details"
  #   type: number
  #   drill_fields: [details*, total_table_cells_machine_identified, total_table_cells_manually_identified]
  #   sql: ${total_table_cells_machine_identified}::real
  #     /nullif(${total_table_cells_machine_identified}::real + ${total_table_cells_manually_identified}::real,0) ;;
  #   value_format_name: percent_2
  # }

  # measure: machine_qa_sampling_rate {
  #   group_label: "Page Details"
  #   type: number
  #   drill_fields: [details*, total_qa_responses_machine_transcription, total_fields_machine_transcribed]
  #   sql: ${total_qa_responses_machine_transcription}::real/isnull(${total_fields_machine_transcribed}::real,0) ;;
  #   value_format_name: percent_2
  # }

  # measure: total_live_layouts {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_live_layouts]
  #   sql: ${number_of_live_layouts} ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }


  # ########### ERIK ADDITIONS 7/7/2021
  # measure: total_qa_responses_on_system_non_structured_classification {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, qa_responses_on_system_non_structured_classification]
  #   sql: ${qa_responses_on_system_non_structured_classification}  ;;
  #   # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_pages_classified_manually{
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_pages_classified_manually]
  #   sql: ${number_of_pages_classified_manually}*1.0;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_pages_classified_automatically{
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_pages_classified_automatically]
  #   sql: ${number_of_pages_classified_automatically}*1.0;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }


  # measure: percent_classification_qa {
  #   group_label: "Page Details"
  #   label: "% Classification QA"
  #   type: number
  #   drill_fields: [details*, total_pages_classified_manually, total_pages_classified_automatically, total_qa_responses_on_system_non_structured_classification]
  #   sql: (${total_qa_responses_on_system_non_structured_classification}::real)
  #     /nullif(${total_pages_classified_manually}::real + ${total_pages_classified_automatically}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: percent_classification_automation {
  #   group_label: "Page Details"
  #   label: "% Classification Automation"
  #   type: number
  #   drill_fields: [details*, total_pages_classified_manually, total_pages_classified_automatically]
  #   sql: (${total_pages_classified_automatically}::real)
  #     /nullif(${total_pages_classified_manually}::real + ${total_pages_classified_automatically}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: total_qa_correct_responses_on_system_non_structured_classification {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, qa_correct_responses_on_system_non_structured_classification]
  #   sql: ${qa_correct_responses_on_system_non_structured_classification}  ;;
  #   # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_classification_accuracy {
  #   group_label: "Page Details"
  #   label: "% Classification Accuracy"
  #   type: number
  #   drill_fields: [details*, total_qa_correct_responses_on_system_non_structured_classification, total_qa_responses_on_system_non_structured_classification]
  #   sql: (${total_qa_correct_responses_on_system_non_structured_classification}::real)
  #     /nullif(${total_qa_responses_on_system_non_structured_classification}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: total_qa_responses_on_system_field_identification {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_responses_on_system_field_identification]
  #   sql: ${number_of_qa_responses_on_system_field_identification}  ;;
  #   # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_number_fields_machine_identified{
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_fields_machine_identified]
  #   sql: ${number_of_fields_machine_identified}*1.0;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: total_number_fields_manually_identified{
  #   group_label: "Page Details"
  #   # hidden: yes
  #   type: sum
  #   drill_fields: [details*, number_of_fields_manually_identified]
  #   sql: ${number_of_fields_manually_identified}*1.0;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_identification_qa {
  #   group_label: "Page Details"
  #   label: "% Identification QA"
  #   type: number
  #   drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified,total_qa_responses_on_system_field_identification]
  #   sql: (${total_qa_responses_on_system_field_identification}::real)
  #     /nullif(${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: percent_identification_automation {
  #   group_label: "Page Details"
  #   label: "% Identification Automation"
  #   type: number
  #   drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified]
  #   sql: (${total_number_fields_machine_identified}::real)
  #     /nullif(${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: total_qa_correct_responses_on_system_field_identification {
  #   group_label: "Page Details"
  #   type: sum
  #   drill_fields: [details*, number_of_qa_correct_responses_on_system_field_identification]
  #   sql: ${number_of_qa_correct_responses_on_system_field_identification}  ;;
  #   # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: percent_identification_accuracy {
  #   group_label: "Page Details"
  #   label: "% Identification Accuracy"
  #   type: number
  #   drill_fields: [details*, total_qa_correct_responses_on_system_field_identification, total_qa_responses_on_system_field_identification]
  #   sql: (${total_qa_correct_responses_on_system_field_identification}::real)
  #     /nullif(${total_qa_responses_on_system_field_identification}::real,0);;
  #   value_format_name: percent_2
  # }

  # measure: fields_id_per_page {
  #   group_label: "Page Details"
  #   label: "Fields IDed Per Page"
  #   type: number
  #   drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified, total_pages_matched_to_flex_layouts_created]
  #   sql: (${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real)
  #     /nullif(${total_pages_matched_to_flex_layouts_created}::real,0);;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }

  # measure: customer_count {
  #   group_label: "Page Details"
  #   type: count_distinct
  #   #drill_fields: [details*, main_version]
  #   sql: (${customer}) ;;
  #   value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  # }


  set: details {
    fields: [
      report_id,
      submissions_created_count,
      submissions_count,
      forms_created_count,
      forms_count,
      submission_page_created_count,
      submission_page_count,
      pages_created_structured_count,
      pages_structured_count,
      pages_created_variable_count,
      pages_variable_count,
      pages_with_fields_created_count,
      pages_with_fields_count,
      fields_created_count,
      fields_completed_count,
      transcription_characters_count,
      login_count,
      submissions_files_created_count,
      machine_transcribed_entries_count,
      human_transcribed_entries_count,
      machine_identified_fields_count,
      human_identified_fields_count,
      pages_count_machine_sum,
      pages_count_manual_sum,
      template_count_match,
      manual_checked_transcriptions_count,
      manual_correct_transcriptions_count,
      system_checked_transcriptions_count,
      system_correct_transcriptions_count,
      machine_checked_transcriptions_count,
      machine_correct_transcriptions_count,
      manual_checked_field_id_count,
      manual_correct_field_id_count,
      system_checked_field_id_count,
      system_correct_field_id_count,
      machine_checked_field_id_count,
      machine_correct_field_id_count,
      fields_inc_machine_transcribed_count,
      organize_docs_tasks_count,
      organize_docs_pages_shown_count,
      organize_docs_pages_processed_count,
      organize_docs_docs_created_count,
      organize_docs_docs_count,
      organize_docs_folders_count,
      live_layouts_count,
      forms_version,
      machine_match_nlc_page_count,
      human_match_nlc_page_count,
      releases_count,
      archived_releases_count,
      layouts_count,
      archived_layouts_count,
      layout_versions_count,
      live_idp_flows_count,
      cells_created_count,
      cells_completed_count,
      machine_identified_cells_count,
      human_identified_cells_count,
      manual_checked_nlc_page_count,
      manual_correct_nlc_page_count,
      system_checked_nlc_page_count,
      system_correct_nlc_page_count,
      machine_checked_nlc_page_count,
      machine_correct_nlc_page_count,
      fleex_transcribed_fields_count,
      fleex_transcribed_table_cells_count,
      custom_supervision_transcribed_fields_count,
      customer_int,
      customer
    ]
  }
}
