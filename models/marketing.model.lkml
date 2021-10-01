connection: "looker-snowflake"

include: "/views/marketing/*.view.lkml"

explore: Marketo_Audience {}

explore: salesforce_leads_and_contacts {}
