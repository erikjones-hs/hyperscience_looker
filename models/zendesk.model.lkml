connection: "looker-snowflake"

include: "/views/zendesk/*.view.lkml"


explore: agg_ticket {
    sql_always_where: ${ticket_status} not in ('deleted');;
}
