view: account_facts {
  derived_table: {
    sql: select a.id,
            case when sum(case when o.logo_churn_c is true then 1 else 0 end) > 0 then true else false end as is_lost_account
           from account as a
           left join opportunity as o on a.id = o.account_id
           group by a.id;;
  }

  dimension: id {
    type: string
    hidden: yes
    primary_key: yes
  }

  dimension: is_lost_account {
    # label: "Opportunity Logo Churn C (Yes / No)"
    type: yesno
  }

}
