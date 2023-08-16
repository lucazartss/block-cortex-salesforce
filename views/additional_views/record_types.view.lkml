# The name of this view in Looker is "Record Types"
view: record_types {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `vibra-data-hub-dev.CDC_PROCESSED.record_types`
    ;;
  drill_fields: [record_type_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: record_type_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.RecordTypeId ;;
  }

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
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
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
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LastModifiedDatestamp ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: namespace_prefix {
    type: string
    sql: ${TABLE}.NamespacePrefix ;;
  }

  dimension: sobject_type {
    type: string
    sql: ${TABLE}.SobjectType ;;
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

  measure: count {
    type: count
    drill_fields: [record_type_id, name, developer_name]
  }
}
