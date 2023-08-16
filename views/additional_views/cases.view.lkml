# The name of this view in Looker is "Cases"
view: cases {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `vibra-data-hub-dev.RAW_LANDING.cases`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}.AccountId ;;
  }

  dimension: asset_id {
    type: string
    sql: ${TABLE}.AssetId ;;
  }

  dimension: business_hours_id {
    type: string
    sql: ${TABLE}.BusinessHoursId ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}.CaseNumber ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closed {
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
    sql: ${TABLE}.ClosedDate ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.Comments ;;
  }

  dimension: connection_received_id {
    type: string
    sql: ${TABLE}.ConnectionReceivedId ;;
  }

  dimension: connection_sent_id {
    type: string
    sql: ${TABLE}.ConnectionSentId ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.ContactEmail ;;
  }

  dimension: contact_fax {
    type: string
    sql: ${TABLE}.ContactFax ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.ContactId ;;
  }

  dimension: contact_mobile {
    type: string
    sql: ${TABLE}.ContactMobile ;;
  }

  dimension: contact_phone {
    type: string
    sql: ${TABLE}.ContactPhone ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.CreatedById ;;
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
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: entitlement_id {
    type: string
    sql: ${TABLE}.EntitlementId ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.IsClosed ;;
  }

  dimension: is_closed_on_create {
    type: yesno
    sql: ${TABLE}.IsClosedOnCreate ;;
  }

  dimension: is_escalated {
    type: yesno
    sql: ${TABLE}.IsEscalated ;;
  }

  dimension: is_stopped {
    type: yesno
    sql: ${TABLE}.IsStopped ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.Language ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.LastModifiedById ;;
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
    sql: ${TABLE}.LastModifiedDate ;;
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
    sql: ${TABLE}.LastReferencedDate ;;
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
    sql: ${TABLE}.LastViewedDate ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.MasterRecordId ;;
  }

  dimension: milestone_status {
    type: string
    sql: ${TABLE}.MilestoneStatus ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.Origin ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.OwnerId ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.ParentId ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.ProductId ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.Reason ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.RecordTypeId ;;
  }

  dimension_group: recordstamp {
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
    sql: ${TABLE}.Recordstamp ;;
  }

  dimension: service_contract_id {
    type: string
    sql: ${TABLE}.ServiceContractId ;;
  }

  dimension_group: sla_exit {
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
    sql: ${TABLE}.SlaExitDate ;;
  }

  dimension_group: sla_start {
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
    sql: ${TABLE}.SlaStartDate ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.SourceId ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension_group: stop_start {
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
    sql: ${TABLE}.StopStartDate ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.Subject ;;
  }

  dimension: supplied_company {
    type: string
    sql: ${TABLE}.SuppliedCompany ;;
  }

  dimension: supplied_email {
    type: string
    sql: ${TABLE}.SuppliedEmail ;;
  }

  dimension: supplied_name {
    type: string
    sql: ${TABLE}.SuppliedName ;;
  }

  dimension: supplied_phone {
    type: string
    sql: ${TABLE}.SuppliedPhone ;;
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
    sql: ${TABLE}.SystemModstamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, supplied_name]
  }
}
