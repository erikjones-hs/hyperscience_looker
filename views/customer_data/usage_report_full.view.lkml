view: usage_report_full {
  sql_table_name: (select * from prod.customer_usage.usage_report_full);;

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_year
    ]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: date_dte {
    type: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: number_of_archived_layouts {
    type: number
    sql: ${TABLE}."NUMBER_OF_ARCHIVED_LAYOUTS" ;;
  }

  dimension: number_of_archived_releases {
    type: number
    sql: ${TABLE}."NUMBER_OF_ARCHIVED_RELEASES" ;;
  }

  dimension: number_of_characters_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_CHARACTERS_COMPLETED" ;;
  }

  dimension: number_of_correct_machine_predicted_non_structured_pages {
    type: number
    sql: ${TABLE}."NUMBER_OF_CORRECT_MACHINE_PREDICTED_NON_STRUCTURED_PAGES" ;;
  }

  dimension: number_of_documents_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_DOCUMENTS_COMPLETED" ;;
  }

  dimension: number_of_documents_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_DOCUMENTS_CREATED" ;;
  }

  dimension: number_of_fields_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_COMPLETED" ;;
  }

  dimension: number_of_fields_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_CREATED" ;;
  }

  dimension: number_of_fields_extracted_in_custom_supervision {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_EXTRACTED_IN_CUSTOM_SUPERVISION" ;;
  }

  dimension: number_of_fields_extracted_in_flexible_extraction {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_EXTRACTED_IN_FLEXIBLE_EXTRACTION" ;;
  }

  dimension: number_of_fields_machine_identified {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_MACHINE_IDENTIFIED" ;;
  }

  dimension: number_of_fields_machine_transcribed {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_MACHINE_TRANSCRIBED" ;;
  }

  dimension: number_of_fields_manually_identified {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_MANUALLY_IDENTIFIED" ;;
  }

  dimension: number_of_fields_manually_transcribed {
    type: number
    sql: ${TABLE}."NUMBER_OF_FIELDS_MANUALLY_TRANSCRIBED" ;;
  }

  dimension: number_of_files_submitted {
    type: number
    sql: ${TABLE}."NUMBER_OF_FILES_SUBMITTED" ;;
  }

  dimension: number_of_incorrect_machine_predicted_non_structured_pages {
    type: number
    sql: ${TABLE}."NUMBER_OF_INCORRECT_MACHINE_PREDICTED_NON_STRUCTURED_PAGES" ;;
  }

  dimension: number_of_incremental_fields_machine_transcribed {
    type: number
    sql: ${TABLE}."NUMBER_OF_INCREMENTAL_FIELDS_MACHINE_TRANSCRIBED" ;;
  }

  dimension: number_of_layout_versions {
    type: number
    sql: ${TABLE}."NUMBER_OF_LAYOUT_VERSIONS" ;;
  }

  dimension: number_of_layouts {
    type: number
    sql: ${TABLE}."NUMBER_OF_LAYOUTS" ;;
  }

  dimension: number_of_live_layouts {
    type: number
    sql: ${TABLE}."NUMBER_OF_LIVE_LAYOUTS" ;;
  }

  dimension: number_of_pages_classified_automatically {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_CLASSIFIED_AUTOMATICALLY" ;;
  }

  dimension: number_of_pages_classified_manually {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_CLASSIFIED_MANUALLY" ;;
  }

  dimension: number_of_pages_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_COMPLETED" ;;
  }

  dimension: number_of_pages_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_CREATED" ;;
  }

  dimension: number_of_pages_matched_to_flex_layouts_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_MATCHED_TO_FLEX_LAYOUTS_COMPLETED" ;;
  }

  dimension: number_of_pages_matched_to_flex_layouts_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_MATCHED_TO_FLEX_LAYOUTS_CREATED" ;;
  }

  dimension: number_of_pages_matched_to_form_layouts_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_MATCHED_TO_FORM_LAYOUTS_COMPLETED" ;;
  }

  dimension: number_of_pages_matched_to_form_layouts_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_MATCHED_TO_FORM_LAYOUTS_CREATED" ;;
  }

  dimension: number_of_pages_with_fields_on_them_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_WITH_FIELDS_ON_THEM_COMPLETED" ;;
  }

  dimension: number_of_pages_with_fields_on_them_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_PAGES_WITH_FIELDS_ON_THEM_CREATED" ;;
  }

  dimension: number_of_qa_correct_responses_on_machine_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_MACHINE_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_correct_responses_on_machine_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_MACHINE_TRANSCRIPTION" ;;
  }

  dimension: number_of_qa_correct_responses_on_manual_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_MANUAL_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_correct_responses_on_manual_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_MANUAL_TRANSCRIPTION" ;;
  }

  dimension: number_of_qa_correct_responses_on_system_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_SYSTEM_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_correct_responses_on_system_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_CORRECT_RESPONSES_ON_SYSTEM_TRANSCRIPTION" ;;
  }

  dimension: number_of_qa_responses_on_machine_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_MACHINE_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_responses_on_machine_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_MACHINE_TRANSCRIPTION" ;;
  }

  dimension: number_of_qa_responses_on_manual_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_MANUAL_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_responses_on_manual_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_MANUAL_TRANSCRIPTION" ;;
  }

  dimension: number_of_qa_responses_on_system_field_identification {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_SYSTEM_FIELD_IDENTIFICATION" ;;
  }

  dimension: number_of_qa_responses_on_system_transcription {
    type: number
    sql: ${TABLE}."NUMBER_OF_QA_RESPONSES_ON_SYSTEM_TRANSCRIPTION" ;;
  }

  dimension: number_of_release_deploys {
    type: number
    sql: ${TABLE}."NUMBER_OF_RELEASE_DEPLOYS" ;;
  }

  dimension: number_of_releases {
    type: number
    sql: ${TABLE}."NUMBER_OF_RELEASES" ;;
  }

  dimension: number_of_submissions_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_SUBMISSIONS_COMPLETED" ;;
  }

  dimension: number_of_submissions_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_SUBMISSIONS_CREATED" ;;
  }

  dimension: number_of_table_cells_completed {
    type: number
    sql: ${TABLE}."NUMBER_OF_TABLE_CELLS_COMPLETED" ;;
  }

  dimension: number_of_table_cells_created {
    type: number
    sql: ${TABLE}."NUMBER_OF_TABLE_CELLS_CREATED" ;;
  }

  dimension: number_of_table_cells_extracted_in_flexible_extraction {
    type: number
    sql: ${TABLE}."NUMBER_OF_TABLE_CELLS_EXTRACTED_IN_FLEXIBLE_EXTRACTION" ;;
  }

  dimension: number_of_table_cells_machine_identified {
    type: number
    sql: ${TABLE}."NUMBER_OF_TABLE_CELLS_MACHINE_IDENTIFIED" ;;
  }

  dimension: number_of_table_cells_manually_identified {
    type: number
    sql: ${TABLE}."NUMBER_OF_TABLE_CELLS_MANUALLY_IDENTIFIED" ;;
  }

  dimension: number_of_unique_layouts_matched {
    type: number
    sql: ${TABLE}."NUMBER_OF_UNIQUE_LAYOUTS_MATCHED" ;;
  }

  dimension: organize_documents_number_of_documents_created_in_step_1 {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_DOCUMENTS_CREATED_IN_STEP_1" ;;
  }

  dimension: organize_documents_number_of_documents_outputted_in_step_1 {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_DOCUMENTS_OUTPUTTED_IN_STEP_1" ;;
  }

  dimension: organize_documents_number_of_folders_created_in_step_2 {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_FOLDERS_CREATED_IN_STEP_2" ;;
  }

  dimension: organize_documents_number_of_pages_categorized_in_step_1 {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_PAGES_CATEGORIZED_IN_STEP_1" ;;
  }

  dimension: organize_documents_number_of_pages_shown_in_step_1 {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_PAGES_SHOWN_IN_STEP_1" ;;
  }

  dimension: organize_documents_number_of_tasks_performed {
    type: number
    sql: ${TABLE}."ORGANIZE_DOCUMENTS_NUMBER_OF_TASKS_PERFORMED" ;;
  }

  dimension: qa_correct_responses_on_machine_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_CORRECT_RESPONSES_ON_MACHINE_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: qa_correct_responses_on_manual_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_CORRECT_RESPONSES_ON_MANUAL_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: qa_correct_responses_on_system_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_CORRECT_RESPONSES_ON_SYSTEM_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: qa_responses_on_machine_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_RESPONSES_ON_MACHINE_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: qa_responses_on_manual_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_RESPONSES_ON_MANUAL_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: qa_responses_on_system_non_structured_classification {
    type: number
    sql: ${TABLE}."QA_RESPONSES_ON_SYSTEM_NON_STRUCTURED_CLASSIFICATION" ;;
  }

  dimension: seats {
    type: number
    sql: ${TABLE}."SEATS" ;;
  }

  dimension: software_version {
    type: string
    sql: ${TABLE}."SOFTWARE_VERSION" ;;
  }

  dimension: is_last_day_of_month {
    type: yesno
    sql: extract(day from dateadd(day,1,${date_raw})) = 1;;
  }

  dimension: is_previous_month {
    type: yesno
    sql: ${date_raw} >= date_trunc('month', add_months(current_date,-1))
      and ${date_raw} < date_trunc('month', current_date);;
  }

  dimension: is_last_6_months {
    type: yesno
    sql: ${date_raw} between current_date - interval '6 month' and current_date ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    type: yesno
    sql:  EXTRACT(DOY FROM ${date_raw}) <= EXTRACT(DOY FROM current_date) ;;
  }

  dimension: is_current_day_of_year {
    type: yesno
    sql: ${date_day_of_year} = extract(doy from current_date) ;;
  }

  measure: total_pages_created {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_pages_created]
    sql: ${number_of_pages_created}  ;;
    # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    link: {
      label: "Detailed View of pages Created"
      url: "{{drill_pages_created._link}}&sorts=user_defied_usage_data.usage_date+asc"
    }
  }

  measure: drill_pages_created {
    hidden: yes
    type: number
    drill_fields: [details*, number_of_pages_created]
    sql: 1 ;;
  }

  measure: total_pages_created_in_previous_month{
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_pages_created]
    sql: case when ${is_previous_month} = 'yes' then ${number_of_pages_created} end  ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }


  measure: total_pages_matched_to_form_layouts_created {
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_pages_matched_to_form_layouts_created]
    sql: ${number_of_pages_matched_to_form_layouts_created}*1.0 ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_pages_matched_to_flex_layouts_created {
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_pages_matched_to_flex_layouts_created]
    sql: ${number_of_pages_matched_to_flex_layouts_created}*1.0 ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_pages_matched_to_layout {
    group_label: "Page Details"
    label: "% Pages Matched to Layout"
    type: number
    drill_fields: [details*, total_pages_matched_to_flex_layouts_created, total_pages_matched_to_form_layouts_created]
    sql: (${total_pages_matched_to_form_layouts_created} + ${total_pages_matched_to_flex_layouts_created})
      /nullif(${total_pages_created}::real,0);;
    value_format_name: percent_2
  }

  measure: total_pages_completed {
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_pages_completed]
    sql: ${number_of_pages_completed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_documents_completed {
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_documents_completed]
    sql: ${number_of_documents_completed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_submissions_completed {
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_submissions_completed]
    sql: ${number_of_submissions_completed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: average_pages_processed_per_document {
    group_label: "Page Details"
    type: number
    drill_fields: [details*, total_pages_completed, total_documents_completed]
    sql: ${total_pages_completed}::real/nullif(${total_documents_completed}::real,0) ;;
    value_format_name: decimal_2
  }

  measure: average_pages_processed_per_submission {
    group_label: "Page Details"
    type: number
    drill_fields: [details*, total_pages_completed, total_submissions_completed]
    sql: ${total_pages_completed}::real/nullif(${total_submissions_completed}::real,0) ;;
    value_format_name: decimal_2
  }

  measure: total_qa_correct_responses_system_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_correct_responses_on_system_transcription]
    sql: ${number_of_qa_correct_responses_on_system_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_qa_responses_system_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_responses_on_system_transcription]
    sql: ${number_of_qa_responses_on_system_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_fields_machine_transcribed {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_fields_machine_transcribed]
    sql: ${number_of_fields_machine_transcribed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_fields_manually_transcribed {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_fields_manually_transcribed]
    sql: ${number_of_fields_manually_transcribed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_of_fields_auto_transcribed {
    group_label: "Page Details"
    type: number
    drill_fields: [details*, total_fields_machine_transcribed, total_fields_manually_transcribed]
    sql: (${total_fields_machine_transcribed}::real)
      /nullif((${total_fields_machine_transcribed}::real + ${total_fields_manually_transcribed}::real),0) ;;
    value_format_name: percent_2
  }

  measure: percent_correct_of_system_transcription {
    group_label: "Page Details"
    label: "System Transcription Output Accuracy %"
    type: number
    drill_fields: [details*, total_qa_correct_responses_system_transcription, total_qa_responses_system_transcription]
    sql: ${total_qa_correct_responses_system_transcription}::real/nullif(${total_qa_responses_system_transcription}::real,0) ;;
    value_format_name: percent_2
  }

  measure: total_qa_correct_responses_manual_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_correct_responses_on_manual_transcription]
    sql: ${number_of_qa_correct_responses_on_manual_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_qa_responses_manual_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_responses_on_manual_transcription]
    sql: ${number_of_qa_responses_on_manual_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_correct_of_manual_transcription {
    group_label: "Page Details"
    label: "Manual Transcription Output Accuracy %"
    type: number
    drill_fields: [details*, total_qa_correct_responses_manual_transcription, total_qa_responses_manual_transcription]
    sql: ${total_qa_correct_responses_manual_transcription}::real/nullif(${total_qa_responses_manual_transcription}::real,0) ;;
    value_format_name: percent_2
  }

  measure: total_qa_correct_responses_machine_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_correct_responses_on_machine_transcription]
    sql: ${number_of_qa_correct_responses_on_machine_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_qa_responses_machine_transcription {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_responses_on_machine_transcription]
    sql: ${number_of_qa_responses_on_machine_transcription} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_correct_of_machine_transcription {
    group_label: "Page Details"
    label: "Machine Transcription Output Accuracy %"
    type: number
    drill_fields: [details*, total_qa_correct_responses_machine_transcription, total_qa_responses_machine_transcription]
    sql: ${total_qa_correct_responses_machine_transcription}::real/nullif(${total_qa_responses_machine_transcription}::real,0) ;;
    value_format_name: percent_2
  }

  measure: percent_field_qa {
    group_label: "Page Details"
    label: "Field QA %"
    type: number
    drill_fields: [details*, total_qa_responses_system_transcription, total_fields_machine_transcribed, total_fields_manually_transcribed]
    sql: ${total_qa_responses_system_transcription}::real
      /nullif((${total_fields_machine_transcribed}::real + ${total_fields_manually_transcribed}::real),0);;
    value_format_name: percent_2
  }

  measure: total_fields_created {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_fields_completed]
    sql: ${number_of_fields_created} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_fields_completed {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_fields_completed]
    sql: ${number_of_fields_completed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_characters_completed {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_characters_completed]
    sql: ${number_of_characters_completed} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: fields_per_page {
    group_label: "Page Details"
    label: "Number of Fields per Page"
    type: number
    drill_fields: [details*, total_fields_completed, total_pages_matched_to_form_layouts_created, total_pages_matched_to_flex_layouts_created]
    sql: ${total_fields_completed}::real/nullif((${total_pages_matched_to_form_layouts_created}::real + ${total_pages_matched_to_flex_layouts_created}::real),0);;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: characters_per_page {
    group_label: "Page Details"
    label: "Number of Characters per Page"
    type: number
    drill_fields: [details*, total_characters_completed, total_pages_matched_to_form_layouts_created, total_pages_matched_to_flex_layouts_created]
    sql: ${total_characters_completed}::real/nullif((${total_pages_matched_to_form_layouts_created}::real + ${total_pages_matched_to_flex_layouts_created}::real),0);;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_table_cells_created {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_table_cells_created]
    sql: ${number_of_table_cells_created} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_table_cells_machine_identified {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_table_cells_machine_identified]
    sql: ${number_of_table_cells_machine_identified} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_table_cells_manually_identified {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_table_cells_manually_identified]
    sql: ${number_of_table_cells_manually_identified} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_table_automation {
    group_label: "Page Details"
    type: number
    drill_fields: [details*, total_table_cells_machine_identified, total_table_cells_manually_identified]
    sql: ${total_table_cells_machine_identified}::real
      /nullif(${total_table_cells_machine_identified}::real + ${total_table_cells_manually_identified}::real,0) ;;
    value_format_name: percent_2
  }

  measure: machine_qa_sampling_rate {
    group_label: "Page Details"
    type: number
    drill_fields: [details*, total_qa_responses_machine_transcription, total_fields_machine_transcribed]
    sql: ${total_qa_responses_machine_transcription}::real/isnull(${total_fields_machine_transcribed}::real,0) ;;
    value_format_name: percent_2
  }

  measure: total_live_layouts {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_live_layouts]
    sql: ${number_of_live_layouts} ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }


  ########### ERIK ADDITIONS 7/7/2021
  measure: total_qa_responses_on_system_non_structured_classification {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, qa_responses_on_system_non_structured_classification]
    sql: ${qa_responses_on_system_non_structured_classification}  ;;
    # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_pages_classified_manually{
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_pages_classified_manually]
    sql: ${number_of_pages_classified_manually}*1.0;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_pages_classified_automatically{
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_pages_classified_automatically]
    sql: ${number_of_pages_classified_automatically}*1.0;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }


  measure: percent_classification_qa {
    group_label: "Page Details"
    label: "% Classification QA"
    type: number
    drill_fields: [details*, total_pages_classified_manually, total_pages_classified_automatically, total_qa_responses_on_system_non_structured_classification]
    sql: (${total_qa_responses_on_system_non_structured_classification}::real)
      /nullif(${total_pages_classified_manually}::real + ${total_pages_classified_automatically}::real,0);;
    value_format_name: percent_2
  }

  measure: percent_classification_automation {
    group_label: "Page Details"
    label: "% Classification Automation"
    type: number
    drill_fields: [details*, total_pages_classified_manually, total_pages_classified_automatically]
    sql: (${total_pages_classified_automatically}::real)
      /nullif(${total_pages_classified_manually}::real + ${total_pages_classified_automatically}::real,0);;
    value_format_name: percent_2
  }

  measure: total_qa_correct_responses_on_system_non_structured_classification {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, qa_correct_responses_on_system_non_structured_classification]
    sql: ${qa_correct_responses_on_system_non_structured_classification}  ;;
    # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_classification_accuracy {
    group_label: "Page Details"
    label: "% Classification Accuracy"
    type: number
    drill_fields: [details*, total_qa_correct_responses_on_system_non_structured_classification, total_qa_responses_on_system_non_structured_classification]
    sql: (${total_qa_correct_responses_on_system_non_structured_classification}::real)
      /nullif(${total_qa_responses_on_system_non_structured_classification}::real,0);;
    value_format_name: percent_2
  }

  measure: total_qa_responses_on_system_field_identification {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_responses_on_system_field_identification]
    sql: ${number_of_qa_responses_on_system_field_identification}  ;;
    # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_number_fields_machine_identified{
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_fields_machine_identified]
    sql: ${number_of_fields_machine_identified}*1.0;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: total_number_fields_manually_identified{
    group_label: "Page Details"
    # hidden: yes
    type: sum
    drill_fields: [details*, number_of_fields_manually_identified]
    sql: ${number_of_fields_manually_identified}*1.0;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_identification_qa {
    group_label: "Page Details"
    label: "% Identification QA"
    type: number
    drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified,total_qa_responses_on_system_field_identification]
    sql: (${total_qa_responses_on_system_field_identification}::real)
      /nullif(${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real,0);;
    value_format_name: percent_2
  }

  measure: percent_identification_automation {
    group_label: "Page Details"
    label: "% Identification Automation"
    type: number
    drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified]
    sql: (${total_number_fields_machine_identified}::real)
      /nullif(${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real,0);;
    value_format_name: percent_2
  }

  measure: total_qa_correct_responses_on_system_field_identification {
    group_label: "Page Details"
    type: sum
    drill_fields: [details*, number_of_qa_correct_responses_on_system_field_identification]
    sql: ${number_of_qa_correct_responses_on_system_field_identification}  ;;
    # value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: percent_identification_accuracy {
    group_label: "Page Details"
    label: "% Identification Accuracy"
    type: number
    drill_fields: [details*, total_qa_correct_responses_on_system_field_identification, total_qa_responses_on_system_field_identification]
    sql: (${total_qa_correct_responses_on_system_field_identification}::real)
      /nullif(${total_qa_responses_on_system_field_identification}::real,0);;
    value_format_name: percent_2
  }

  measure: fields_id_per_page {
    group_label: "Page Details"
    label: "Fields IDed Per Page"
    type: number
    drill_fields: [details*, total_number_fields_machine_identified, total_number_fields_manually_identified, total_pages_matched_to_flex_layouts_created]
    sql: (${total_number_fields_machine_identified}::real + ${total_number_fields_manually_identified}::real)
      /nullif(${total_pages_matched_to_flex_layouts_created}::real,0);;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: customer_count {
    group_label: "Page Details"
    type: count_distinct
    #drill_fields: [details*, main_version]
    sql: (${customer}) ;;
    value_format: "[>=1000000000]#.00,,,\"B\";[>=1000000]#.00,,\"M\";[>=1000]#.00,\"K\";0"
  }

  measure: structured {
    type: yesno
    sql: ${total_fields_machine_transcribed} > 0;;
  }

  measure: semi_structured {
    type: yesno
    sql: ${total_number_fields_machine_identified} > 0;;
  }

  measure: unstructured {
    type: yesno
    sql: ${total_pages_classified_automatically} > 0;;
  }

  measure: avg_pages_processed_per_month {
    type: average
    sql: ${number_of_pages_created};;
    label: "AVG Pages / Month"
  }

  set: details {
    fields: [customer, software_version]
  }


}
