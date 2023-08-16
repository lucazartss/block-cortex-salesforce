
constant: CONNECTION_NAME {
  value: "prd_salesforce"
  export: override_required
}


constant: GCP_PROJECT {
  value: "vibra-dtan-prd"
  export: override_required
}


constant: SFDC_DATASET {
  value: "td_salesforce"
  export: override_required
}


new_lookml_runtime: yes
