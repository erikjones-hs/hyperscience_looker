connection: "looker-snowflake"

include: "/views/zendesk/*.view.lkml"


explore: agg_ticket {
    sql_always_where: ${ticket_status} not in ('deleted') AND ${ticket_resolution_code} not in ('duplicate_ticket');;
}
