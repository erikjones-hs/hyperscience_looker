connection: "looker-snowflake"

include: "/views/salesforce/*.view.lkml"

fiscal_month_offset:  2

datagroup: hyperscience_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hyperscience_default_datagroup

explore: account {
  sql_always_where: NOT ${account.is_deleted};;

  fields: [ALL_FIELDS*, -account_owner.opportunity_set*, -creator.opportunity_set*]

  join: contact {
    sql_on: ${account.id} = ${contact.account_id} ;;
    relationship: one_to_many
  }

  join: creator {
    from: user
    sql_on: ${contact.created_by_id} = ${creator.id} ;;
    relationship: many_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }
}

explore: lead {
  sql_always_where: NOT ${lead.is_deleted};;
  fields: [ALL_FIELDS*]

  join: lead_owner {
    from: user
    sql_on: ${lead.owner_id} = ${lead_owner.id} ;;
    relationship: many_to_one
  }

  join: account {
    sql_on: ${lead.converted_account_id} = ${account.id} ;;
    relationship: many_to_one
  }

  join: account_facts {
    from: account_facts
    type: left_outer
    sql_on: ${account.id} = ${account_facts.id};;
    relationship: one_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }

  join: contact {
    sql_on: ${lead.converted_contact_id} = ${contact.id} ;;
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: ${lead.converted_opportunity_id} = ${opportunity.id} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }
}

explore: opportunity {

  join: dates {
    type: full_outer
    sql_on: ${dates.bucket_date} = ${opportunity.start_date_c_date};;
    relationship: many_to_one
  }

  join: opportunity_daily_snapshots {
    type: left_outer
    sql_on: ${dates.bucket_date} >= ${opportunity_daily_snapshots.valid_from}
      and ${dates.bucket_date} < ${opportunity_daily_snapshots.valid_to} ;;
    relationship: many_to_one
  }

  join: account {
    sql_on: ${opportunity.account_id} = ${account.id} ;;
    relationship: many_to_one
  }

  join: account_facts {
    from: account_facts
    type: left_outer
    sql_on: ${account.id} = ${account_facts.id};;
    relationship: one_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }
}

explore: user {
  from: user

  join: user_role {
    sql_on: ${user.user_role_id} = ${user_role.id} ;;
    relationship: one_to_one
  }

  join: account {
    from: account
    sql_on: ${account.owner_id} = ${user.id} ;;
    relationship: many_to_one
  }

  join: opportunity {
    from:  opportunity
    sql_on:  ${opportunity.owner_id} = ${user.id} ;;
    relationship:  many_to_one
  }

}

explore: pipeline_aggregation {}

explore: arr_tracking {}

explore: pipeline_tracking {}

explore: tve {}
