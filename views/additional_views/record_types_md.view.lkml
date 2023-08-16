# The name of this view in Looker is "Record Types Md"
view: record_types_md {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `vibra-dtan-prd.td_salesforce.RecordTypesMD` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Business Process ID" in Explore.

  dimension: business_process_id {
    type: string
    sql: ${TABLE}.BusinessProcessId ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.CreatedById ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_datestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreatedDatestamp ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: developer_name {
    type: string
    sql: ${TABLE}.DeveloperName ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.IsActive ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.LastModifiedById ;;
  }

  dimension_group: last_modified_datestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LastModifiedDatestamp ;;
  }

  dimension: namespace_prefix {
    type: string
    sql: ${TABLE}.NamespacePrefix ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.RecordTypeId ;;
  }

  dimension: record_type_name {
    type: string
    sql: ${TABLE}.RecordTypeName ;;
  }

  dimension: sobject_type {
    type: string
    sql: ${TABLE}.SobjectType ;;
  }
  measure: count {
    type: count
    drill_fields: [record_type_name, developer_name]
  }
}
