view: case_management_v2 {
  derived_table: {
    sql: SELECT
          Cases.CaseId AS CaseId,
          Cases.RecordTypeId AS RecordTypeId,
          Cases.Origin AS CaseOrigin,
          Cases.Priority AS CasePriority,
          Cases.Status AS CaseStatus,
          Cases.OwnerId AS CaseOwnerId,
          Cases.ClosedDatestamp AS CaseClosedDatestamp,
          Cases.CaseNumber AS CaseNumber,
          Cases.CreatedDatestamp AS CaseCreatedDatestamp,
          Cases.IsClosed AS IsCaseClosed,
          Cases.Type AS CaseType,
          Cases.Subject AS CaseSubject,
          AccountsMD.AccountId AS AccountId,
          AccountsMD.Name AS AccountName,
          AccountsMD.Type AS AccountType,
          AccountsMD.Phone AS AccountPhone,
          AccountsMD.OwnerId AS AccountOwnerId,
          AccountOwner.Name AS AccountOwnerName,
          AccountsMD.Industry AS AccountIndustry,
          AccountsMD.BillingCountry AS AccountBillingCountry,
          AccountsMD.ShippingCountry AS AccountShippingCountry,
          AccountsMD.CreatedDatestamp AS AccountCreatedDatestamp,
          CaseOwner.Name AS CaseOwnerName,
          -- Agents who have been assigned to Cases
          (Cases.OwnerId NOT LIKE '00G%') AS IsAgentAssigned
        FROM
          `vibra-data-hub-dev.RAW_LANDING.Cases` AS Cases
        LEFT JOIN
          `vibra-data-hub-dev.REPORTING.AccountsMD` AS AccountsMD
          ON
            Cases.AccountId = AccountsMD.AccountId
        LEFT JOIN
          `vibra-data-hub-dev.REPORTING.UsersMD` AS CaseOwner
          ON
            Cases.OwnerId = CaseOwner.UserId
        LEFT JOIN
          `vibra-data-hub-dev.REPORTING.UsersMD` AS AccountOwner
          ON
            AccountsMD.OwnerId = AccountOwner.UserId
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.RecordTypeId ;;
  }

  dimension: case_id {
    type: string
    sql: ${TABLE}.CaseId ;;
  }

  dimension: case_origin {
    type: string
    sql: ${TABLE}.CaseOrigin ;;
  }

  dimension: case_priority {
    type: string
    sql: ${TABLE}.CasePriority ;;
  }

  dimension: case_status {
    type: string
    sql: ${TABLE}.CaseStatus ;;
  }

  dimension: case_owner_id {
    type: string
    sql: ${TABLE}.CaseOwnerId ;;
  }

  dimension_group: case_closed_datestamp {
    type: time
    sql: ${TABLE}.CaseClosedDatestamp ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}.CaseNumber ;;
  }

  dimension_group: case_created_datestamp {
    type: time
    sql: ${TABLE}.CaseCreatedDatestamp ;;
  }

  dimension: is_case_closed {
    type: yesno
    sql: ${TABLE}.IsCaseClosed ;;
  }

  dimension: case_type {
    type: string
    sql: ${TABLE}.CaseType ;;
  }

  dimension: case_subject {
    type: string
    sql: ${TABLE}.CaseSubject ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.AccountId ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.AccountType ;;
  }

  dimension: account_phone {
    type: string
    sql: ${TABLE}.AccountPhone ;;
  }

  dimension: account_owner_id {
    type: string
    sql: ${TABLE}.AccountOwnerId ;;
  }

  dimension: account_owner_name {
    type: string
    sql: ${TABLE}.AccountOwnerName ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}.AccountIndustry ;;
  }

  dimension: account_billing_country {
    type: string
    sql: ${TABLE}.AccountBillingCountry ;;
  }

  dimension: account_shipping_country {
    type: string
    sql: ${TABLE}.AccountShippingCountry ;;
  }

  dimension_group: account_created_datestamp {
    type: time
    sql: ${TABLE}.AccountCreatedDatestamp ;;
  }

  dimension: case_owner_name {
    type: string
    sql: ${TABLE}.CaseOwnerName ;;
  }

  dimension: is_agent_assigned {
    type: yesno
    sql: ${TABLE}.IsAgentAssigned ;;
  }

  set: detail {
    fields: [
      case_id,
      case_origin,
      case_priority,
      case_status,
      case_owner_id,
      case_closed_datestamp_time,
      case_number,
      case_created_datestamp_time,
      is_case_closed,
      case_type,
      case_subject,
      account_id,
      account_name,
      account_type,
      account_phone,
      account_owner_id,
      account_owner_name,
      account_industry,
      account_billing_country,
      account_shipping_country,
      account_created_datestamp_time,
      case_owner_name,
      is_agent_assigned
    ]
  }
}
