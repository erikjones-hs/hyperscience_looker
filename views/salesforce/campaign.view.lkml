view: campaign {
  sql_table_name: fivetran_database.salesforce.campaign ;;
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

  dimension: actual_cost {
    type: number
    sql: ${TABLE}.actual_cost ;;
  }

  dimension: advertising_online_ppc_search_c {
    type: number
    sql: ${TABLE}.advertising_online_ppc_search_c ;;
  }

  dimension: advertising_online_retargeting_c {
    type: number
    sql: ${TABLE}.advertising_online_retargeting_c ;;
  }

  dimension: airfare_c {
    type: number
    sql: ${TABLE}.airfare_c ;;
  }

  dimension: amount_all_opportunities {
    type: number
    sql: ${TABLE}.amount_all_opportunities ;;
  }

  dimension: amount_won_opportunities {
    type: number
    sql: ${TABLE}.amount_won_opportunities ;;
  }

  dimension: bizible_2_bizible_attribution_sync_type_c {
    type: string
    sql: ${TABLE}.bizible_2_bizible_attribution_sync_type_c ;;
  }

  dimension_group: bizible_2_touchpoint_end_date_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_end_date_c ;;
  }

  dimension_group: bizible_2_touchpoint_start_date_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_start_date_c ;;
  }

  dimension: bizible_2_unique_id_c {
    type: string
    sql: ${TABLE}.bizible_2_unique_id_c ;;
  }

  dimension: budgeted_cost {
    type: number
    sql: ${TABLE}.budgeted_cost ;;
  }

  dimension: campaign_member_record_type_id {
    type: string
    sql: ${TABLE}.campaign_member_record_type_id ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: division_c {
    type: string
    sql: ${TABLE}.division_c ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: engagement_type_c {
    type: string
    sql: ${TABLE}.engagement_type_c ;;
  }

  dimension: estimated_attendee_size_c {
    type: number
    sql: ${TABLE}.estimated_attendee_size_c ;;
  }

  dimension: event_location_c {
    type: string
    sql: ${TABLE}.event_location_c ;;
  }

  dimension: expected_response {
    type: number
    sql: ${TABLE}.expected_response ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: extras_c {
    type: number
    sql: ${TABLE}.extras_c ;;
  }

  dimension: hierarchy_actual_cost {
    type: number
    sql: ${TABLE}.hierarchy_actual_cost ;;
  }

  dimension: hierarchy_amount_all_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_amount_all_opportunities ;;
  }

  dimension: hierarchy_amount_won_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_amount_won_opportunities ;;
  }

  dimension: hierarchy_budgeted_cost {
    type: number
    sql: ${TABLE}.hierarchy_budgeted_cost ;;
  }

  dimension: hierarchy_expected_revenue {
    type: number
    sql: ${TABLE}.hierarchy_expected_revenue ;;
  }

  dimension: hierarchy_number_of_contacts {
    type: number
    sql: ${TABLE}.hierarchy_number_of_contacts ;;
  }

  dimension: hierarchy_number_of_converted_leads {
    type: number
    sql: ${TABLE}.hierarchy_number_of_converted_leads ;;
  }

  dimension: hierarchy_number_of_leads {
    type: number
    sql: ${TABLE}.hierarchy_number_of_leads ;;
  }

  dimension: hierarchy_number_of_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_number_of_opportunities ;;
  }

  dimension: hierarchy_number_of_responses {
    type: number
    sql: ${TABLE}.hierarchy_number_of_responses ;;
  }

  dimension: hierarchy_number_of_won_opportunities {
    type: number
    sql: ${TABLE}.hierarchy_number_of_won_opportunities ;;
  }

  dimension: hierarchy_number_sent {
    type: number
    sql: ${TABLE}.hierarchy_number_sent ;;
  }

  dimension: hs_allocated_passes_c {
    type: number
    sql: ${TABLE}.hs_allocated_passes_c ;;
  }

  dimension: hyper_science_attendees_c {
    type: string
    sql: ${TABLE}.hyper_science_attendees_c ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
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

  dimension: lean_data_back_dated_c {
    type: yesno
    sql: ${TABLE}.lean_data_back_dated_c ;;
  }

  dimension: lean_data_rep_lt_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_lt_attribution_c ;;
  }

  dimension: lean_data_rep_lt_bookings_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_lt_bookings_attribution_c ;;
  }

  dimension: lean_data_rep_lt_generated_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_lt_generated_attribution_c ;;
  }

  dimension: lean_data_rep_lt_generated_bookings_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_lt_generated_bookings_attribution_c ;;
  }

  dimension: lean_data_rep_mt_accelerated_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_mt_accelerated_attribution_c ;;
  }

  dimension: lean_data_rep_mt_accelerated_bookings_attr_c {
    type: number
    sql: ${TABLE}.lean_data_rep_mt_accelerated_bookings_attr_c ;;
  }

  dimension: lean_data_rep_mt_generated_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_mt_generated_attribution_c ;;
  }

  dimension: lean_data_rep_mt_generated_bookings_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_rep_mt_generated_bookings_attribution_c ;;
  }

  dimension: lean_data_reporting_average_days_to_close_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_average_days_to_close_c ;;
  }

  dimension: lean_data_reporting_bookings_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_bookings_attribution_c ;;
  }

  dimension: lean_data_reporting_campaign_member_totals_c {
    type: string
    sql: ${TABLE}.lean_data_reporting_campaign_member_totals_c ;;
  }

  dimension: lean_data_reporting_cost_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_cost_c ;;
  }

  dimension: lean_data_reporting_ft_attribution_amount_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_ft_attribution_amount_c ;;
  }

  dimension: lean_data_reporting_ft_bookings_attribution_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_ft_bookings_attribution_c ;;
  }

  dimension: lean_data_reporting_lift_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_lift_c ;;
  }

  dimension: lean_data_reporting_mt_attribution_amount_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_mt_attribution_amount_c ;;
  }

  dimension: lean_data_reporting_num_target_campaign_members_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_num_target_campaign_members_c ;;
  }

  dimension: lean_data_reporting_number_of_campaign_members_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_number_of_campaign_members_c ;;
  }

  dimension: lean_data_reporting_number_of_opportunities_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_number_of_opportunities_c ;;
  }

  dimension: lean_data_reporting_number_of_touches_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_number_of_touches_c ;;
  }

  dimension: lean_data_reporting_on_target_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_on_target_c ;;
  }

  dimension: lean_data_reporting_opportunity_close_rate_c {
    type: number
    sql: ${TABLE}.lean_data_reporting_opportunity_close_rate_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_step_c {
    type: string
    sql: ${TABLE}.next_step_c ;;
  }

  dimension_group: next_step_due_date_c {
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
    sql: ${TABLE}.next_step_due_date_c ;;
  }

  dimension: number_of_contacts {
    type: number
    sql: ${TABLE}.number_of_contacts ;;
  }

  dimension: number_of_converted_leads {
    type: number
    sql: ${TABLE}.number_of_converted_leads ;;
  }

  dimension: number_of_leads {
    type: number
    sql: ${TABLE}.number_of_leads ;;
  }

  dimension: number_of_opportunities {
    type: number
    sql: ${TABLE}.number_of_opportunities ;;
  }

  dimension: number_of_responses {
    type: number
    sql: ${TABLE}.number_of_responses ;;
  }

  dimension: number_of_won_opportunities {
    type: number
    sql: ${TABLE}.number_of_won_opportunities ;;
  }

  dimension: number_sent {
    type: number
    sql: ${TABLE}.number_sent ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: social_paid_c {
    type: number
    sql: ${TABLE}.social_paid_c ;;
  }

  dimension: sponsorship_amount_c {
    type: number
    sql: ${TABLE}.sponsorship_amount_c ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, opportunity.count]
  }
}
