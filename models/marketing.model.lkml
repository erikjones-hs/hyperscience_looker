connection: "looker-snowflake"

include: "/views/marketing/*.view.lkml"

explore: Marketo_Audience {}

explore: salesforce_leads_and_contacts {}

explore: lead_contact_life_cycle_status_changes {

  join: salesforce_leads_and_contacts {
    sql_on: ${lead_contact_life_cycle_status_changes.person_id} = ${salesforce_leads_and_contacts.person_id} ;;
    relationship: many_to_one
  }

}

explore: digital_ad_stats {}
