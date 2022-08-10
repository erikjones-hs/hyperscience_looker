connection: "looker-snowflake"

include: "/views/hr/bamboo_dim_employee.view.lkml"
include: "/views/hr/interview_feedback_promo.view.lkml"


explore: bamboo_dim_employee {}
explore: interview_feedback_promo {}
