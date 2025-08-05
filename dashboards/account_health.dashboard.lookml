---
- dashboard: account_health
  title: Account Health
  layout: newspaper
  description: ''
  preferred_slug: sgBcPUVYXE6ByFTkSyfHMr
  filters:
  - name: Account Name
    title: Account Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: product_usage
    explore: dim_accounts
    listens_to_filters: []
    field: dim_accounts.account_name
  - name: Usage Date
    title: Usage Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: product_usage
    explore: dim_accounts
    listens_to_filters: []
    field: usage_report_full.date_date
  elements:
  - title: System Version
    name: System Version
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [dim_accounts.current_prod_version_number]
    filters: {}
    sorts: [dim_accounts.current_prod_version_number]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 2
    col: 0
    width: 4
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"System"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 16
    height: 2
  - title: Live Layouts
    name: Live Layouts
    model: product_usage
    explore: dim_accounts
    type: looker_line
    fields: [usage_report_full.number_of_live_layouts, usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: Usage Date
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 2
    col: 8
    width: 8
    height: 6
  - title: Last Statistics Received
    name: Last Statistics Received
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [usage_report_full.last_statistics_received]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
    row: 2
    col: 4
    width: 4
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"System Performance"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 8
    col: 0
    width: 16
    height: 2
  - title: Classification Accuracy
    name: Classification Accuracy
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [usage_report_full.percent_classification_accuracy]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 10
    col: 0
    width: 4
    height: 6
  - title: Classification Accuracy & Automation
    name: Classification Accuracy & Automation
    model: product_usage
    explore: dim_accounts
    type: looker_line
    fields: [usage_report_full.total_qa_responses_on_system_non_structured_classification,
      usage_report_full.percent_classification_accuracy, usage_report_full.date_date]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: usage_report_full.total_qa_responses_on_system_non_structured_classification,
            id: usage_report_full.total_qa_responses_on_system_non_structured_classification,
            name: Total Qa Responses on System Non Structured Classification}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: usage_report_full.percent_classification_accuracy,
            id: usage_report_full.percent_classification_accuracy, name: "% Classification\
              \ Accuracy"}], showLabels: false, showValues: true, valueFormat: 0.00%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: 0.0%
    series_types:
      usage_report_full.total_qa_responses_on_system_non_structured_classification: column
    label_rotation: 300
    x_axis_datetime_label: ''
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 10
    col: 4
    width: 12
    height: 6
  - title: Field Identification Accuracy
    name: Field Identification Accuracy
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [usage_report_full.percent_identification_accuracy]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 16
    col: 0
    width: 4
    height: 6
  - title: Field Identification Accuracy & Automation
    name: Field Identification Accuracy & Automation
    model: product_usage
    explore: dim_accounts
    type: looker_column
    fields: [usage_report_full.date_date, usage_report_full.total_number_fields_machine_identified,
      usage_report_full.total_number_fields_manually_identified, usage_report_full.percent_identification_automation]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: usage_report_full.total_number_fields_machine_identified,
            id: usage_report_full.total_number_fields_machine_identified, name: Total
              Number Fields Machine Identified}, {axisId: usage_report_full.total_number_fields_manually_identified,
            id: usage_report_full.total_number_fields_manually_identified, name: Total
              Number Fields Manually Identified}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: usage_report_full.percent_identification_automation,
            id: usage_report_full.percent_identification_automation, name: "% Identification\
              \ Automation"}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      usage_report_full.percent_identification_automation: line
    x_axis_datetime_label: ''
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 16
    col: 4
    width: 12
    height: 6
  - title: Table Automation
    name: Table Automation
    model: product_usage
    explore: dim_accounts
    type: looker_column
    fields: [usage_report_full.date_date, usage_report_full.total_table_cells_machine_identified,
      usage_report_full.total_table_cells_manually_identified, usage_report_full.percent_table_automation]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: usage_report_full.total_table_cells_machine_identified,
            id: usage_report_full.total_table_cells_machine_identified, name: Total
              Table Cells Machine Identified}, {axisId: usage_report_full.total_table_cells_manually_identified,
            id: usage_report_full.total_table_cells_manually_identified, name: Total
              Table Cells Manually Identified}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: usage_report_full.percent_table_automation,
            id: usage_report_full.percent_table_automation, name: Percent Table Automation}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      usage_report_full.percent_table_automation: line
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 22
    col: 0
    width: 16
    height: 6
  - title: Transcription Accuracy
    name: Transcription Accuracy
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [usage_report_full.percent_correct_of_machine_transcription]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 28
    col: 0
    width: 4
    height: 6
  - title: Transcription Accuracy & Automation
    name: Transcription Accuracy & Automation
    model: product_usage
    explore: dim_accounts
    type: looker_column
    fields: [usage_report_full.date_date, usage_report_full.total_fields_machine_transcribed,
      usage_report_full.total_fields_manually_transcribed, usage_report_full.percent_of_fields_auto_transcribed]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: usage_report_full.total_fields_machine_transcribed,
            id: usage_report_full.total_fields_machine_transcribed, name: Total Fields
              Machine Transcribed}, {axisId: usage_report_full.total_fields_manually_transcribed,
            id: usage_report_full.total_fields_manually_transcribed, name: Total Fields
              Manually Transcribed}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: usage_report_full.percent_of_fields_auto_transcribed,
            id: usage_report_full.percent_of_fields_auto_transcribed, name: Percent
              of Fields Auto Transcribed}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: 0.0%
    series_types:
      usage_report_full.percent_of_fields_auto_transcribed: line
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 28
    col: 4
    width: 12
    height: 6
  - title: Automation and Accuracy %
    name: Automation and Accuracy %
    model: product_usage
    explore: dim_accounts
    type: looker_line
    fields: [usage_report_full.date_date, usage_report_full.percent_of_fields_auto_transcribed,
      usage_report_full.percent_correct_of_system_transcription]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: usage_report_full.percent_of_fields_auto_transcribed,
            id: usage_report_full.percent_of_fields_auto_transcribed, name: Automation
              %}, {axisId: usage_report_full.percent_correct_of_system_transcription,
            id: usage_report_full.percent_correct_of_system_transcription, name: Accuracy
              %}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: 0.0%
    series_labels:
      usage_report_full.percent_of_fields_auto_transcribed: Automation %
      usage_report_full.percent_correct_of_system_transcription: Accuracy %
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 34
    col: 0
    width: 16
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"System Utilization"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 40
    col: 0
    width: 16
    height: 2
  - title: Total Pages Created
    name: Total Pages Created
    model: product_usage
    explore: dim_accounts
    type: looker_line
    fields: [usage_report_full.date_date, usage_report_full.total_pages_created]
    fill_fields: [usage_report_full.date_date]
    sorts: [usage_report_full.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
      Usage Date: usage_report_full.date_date
    row: 42
    col: 0
    width: 16
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"System Health"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 48
    col: 0
    width: 16
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Account Health"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 53
    col: 0
    width: 16
    height: 2
  - title: Open P1 Tickets
    name: Open P1 Tickets
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [fct_jira_tickets.open_p1_tickets]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
    row: 50
    col: 0
    width: 5
    height: 3
  - title: Open P2 Tickets
    name: Open P2 Tickets
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [fct_jira_tickets.open_p2_tickets]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
    row: 50
    col: 5
    width: 5
    height: 3
  - title: Open P3 Tickets
    name: Open P3 Tickets
    model: product_usage
    explore: dim_accounts
    type: single_value
    fields: [fct_jira_tickets.open_p3_tickets]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
    row: 50
    col: 10
    width: 6
    height: 3
  - title: NPS History
    name: NPS History
    model: product_usage
    explore: dim_accounts
    type: looker_line
    fields: [fct_nps_results.nps_score, fct_nps_results.cohort_group]
    sorts: [fct_nps_results.cohort_group]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Account Name: dim_accounts.account_name
    row: 55
    col: 5
    width: 11
    height: 6
