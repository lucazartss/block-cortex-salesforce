include: "/views/additional_views/*.view.lkml"
include: "/models/cortex_salesforce*.lkml"
include: "/views/*view.lkml"




explore: +case_management {


  join: cases {
    type: left_outer
    relationship: many_to_many
    sql_on: ${case_management.case_id} = ${cases.case_id} AND
            ${case_management.case_created_raw} = ${cases.created_datestamp_raw};;
  }
      join: record_types_md {
        view_label: "Cases"
        type: left_outer
        relationship: many_to_one
        sql_on: ${cases.record_type_id} = ${record_types_md.record_type_id} ;;
        fields: [record_types_md.developer_name]
      }
}


view: +leads_capture_conversion {

  dimension: is_converted {
    type: yesno
    sql: CAST(${TABLE}.IsLeadConverted AS STRING) = "true" ;;
  }


}
