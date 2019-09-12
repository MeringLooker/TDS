connection: "mc_panoply"

# include all the views
include: "*.view"

datagroup: tds_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tds_default_datagroup

explore: tdsc_ga_adwords {
  label: "AdWords"
  group_label: "TDS"
}
explore: the_dentists_supply_company_dcm_636297245 {
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "TDS"
}

# - explore: adwords_ad_performance_report

# - explore: adwords_adgroup_performance_report

# - explore: adwords_criteria_performance_report

# - explore: adwords_display_keyword_performance_report

# - explore: adwords_geo_performance_report

# - explore: adwords_search_query_performance_report

# - explore: customers

# - explore: facebook_

# - explore: facebook__action_values
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__action_values.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__cost_per_action_type
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__cost_per_action_type.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_avg_percent_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_avg_percent_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_p100_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_p100_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_p25_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_p25_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_p50_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_p50_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_p75_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_p75_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebook__video_p95_watched_actions
#   joins:
#     - join: facebook_
#       type: left_outer
#       sql_on: ${facebook__video_p95_watched_actions.facebook__id} = ${facebook_.id}
#       relationship: many_to_one


# - explore: facebookads

# - explore: facebookads_action_values
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_action_values.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_cost_per_action_type
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_cost_per_action_type.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_avg_percent_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_avg_percent_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_p100_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_p100_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_p25_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_p25_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_p50_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_p50_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_p75_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_p75_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: facebookads_video_p95_watched_actions
#   joins:
#     - join: facebookads
#       type: left_outer
#       sql_on: ${facebookads_video_p95_watched_actions.facebookads_id} = ${facebookads.id}
#       relationship: many_to_one


# - explore: linkedin_ads_

# - explore: linkedin_ads__pivotvalues
#   joins:
#     - join: linkedin_ads_
#       type: left_outer
#       sql_on: ${linkedin_ads__pivotvalues.linkedin_ads__id} = ${linkedin_ads_.id}
#       relationship: many_to_one


# - explore: mam_us_360_trueview_adgroup_performance_report

# - explore: mam_us_airservice_sem_adgroup_performance_report

# - explore: mam_us_gdn_adgroup_performance_report

# - explore: mam_us_sem_adgroup_performance_report

# - explore: mam_us_trueview_adgroup_performance_report

# - explore: mam_us_winterblitz_gdn_adgroup_performance_report

# - explore: orderitems

# - explore: orders

# - explore: products

# - explore: salesforce_account

# - explore: salesforce_account_attributes
#   joins:
#     - join: salesforce_account
#       type: left_outer
#       sql_on: ${salesforce_account_attributes.salesforce_account_id} = ${salesforce_account.id}
#       relationship: many_to_one


# - explore: salesforce_account_billingaddress
#   joins:
#     - join: salesforce_account
#       type: left_outer
#       sql_on: ${salesforce_account_billingaddress.salesforce_account_id} = ${salesforce_account.id}
#       relationship: many_to_one


# - explore: salesforce_account_shippingaddress
#   joins:
#     - join: salesforce_account
#       type: left_outer
#       sql_on: ${salesforce_account_shippingaddress.salesforce_account_id} = ${salesforce_account.id}
#       relationship: many_to_one


# - explore: salesforce_accountfeed

# - explore: salesforce_accountfeed_attributes
#   joins:
#     - join: salesforce_accountfeed
#       type: left_outer
#       sql_on: ${salesforce_accountfeed_attributes.salesforce_accountfeed_id} = ${salesforce_accountfeed.id}
#       relationship: many_to_one


# - explore: salesforce_acton__accountinfo__c

# - explore: salesforce_acton__accountinfo__c_attributes
#   joins:
#     - join: salesforce_acton__accountinfo__c
#       type: left_outer
#       sql_on: ${salesforce_acton__accountinfo__c_attributes.salesforce_acton__accountinfo__c_id} = ${salesforce_acton__accountinfo__c.id}
#       relationship: many_to_one


# - explore: salesforce_acton__serverinformation__c

# - explore: salesforce_acton__serverinformation__c_attributes
#   joins:
#     - join: salesforce_acton__serverinformation__c
#       type: left_outer
#       sql_on: ${salesforce_acton__serverinformation__c_attributes.salesforce_acton__serverinformation__c_id} = ${salesforce_acton__serverinformation__c.id}
#       relationship: many_to_one


# - explore: salesforce_apexclass

# - explore: salesforce_apexclass_attributes
#   joins:
#     - join: salesforce_apexclass
#       type: left_outer
#       sql_on: ${salesforce_apexclass_attributes.salesforce_apexclass_id} = ${salesforce_apexclass.id}
#       relationship: many_to_one


# - explore: salesforce_apexcomponent

# - explore: salesforce_apexcomponent_attributes
#   joins:
#     - join: salesforce_apexcomponent
#       type: left_outer
#       sql_on: ${salesforce_apexcomponent_attributes.salesforce_apexcomponent_id} = ${salesforce_apexcomponent.id}
#       relationship: many_to_one


# - explore: salesforce_apexpage

# - explore: salesforce_apexpage_attributes
#   joins:
#     - join: salesforce_apexpage
#       type: left_outer
#       sql_on: ${salesforce_apexpage_attributes.salesforce_apexpage_id} = ${salesforce_apexpage.id}
#       relationship: many_to_one


# - explore: salesforce_apextrigger

# - explore: salesforce_apextrigger_attributes
#   joins:
#     - join: salesforce_apextrigger
#       type: left_outer
#       sql_on: ${salesforce_apextrigger_attributes.salesforce_apextrigger_id} = ${salesforce_apextrigger.id}
#       relationship: many_to_one


# - explore: salesforce_attachment

# - explore: salesforce_attachment_attributes
#   joins:
#     - join: salesforce_attachment
#       type: left_outer
#       sql_on: ${salesforce_attachment_attributes.salesforce_attachment_id} = ${salesforce_attachment.id}
#       relationship: many_to_one


# - explore: salesforce_businesshours

# - explore: salesforce_businesshours_attributes
#   joins:
#     - join: salesforce_businesshours
#       type: left_outer
#       sql_on: ${salesforce_businesshours_attributes.salesforce_businesshours_id} = ${salesforce_businesshours.id}
#       relationship: many_to_one


# - explore: salesforce_campaign

# - explore: salesforce_campaign_attributes
#   joins:
#     - join: salesforce_campaign
#       type: left_outer
#       sql_on: ${salesforce_campaign_attributes.salesforce_campaign_id} = ${salesforce_campaign.id}
#       relationship: many_to_one


# - explore: salesforce_campaignmember

# - explore: salesforce_campaignmember_attributes
#   joins:
#     - join: salesforce_campaignmember
#       type: left_outer
#       sql_on: ${salesforce_campaignmember_attributes.salesforce_campaignmember_id} = ${salesforce_campaignmember.id}
#       relationship: many_to_one


# - explore: salesforce_campaignmemberstatus

# - explore: salesforce_campaignmemberstatus_attributes
#   joins:
#     - join: salesforce_campaignmemberstatus
#       type: left_outer
#       sql_on: ${salesforce_campaignmemberstatus_attributes.salesforce_campaignmemberstatus_id} = ${salesforce_campaignmemberstatus.id}
#       relationship: many_to_one


# - explore: salesforce_case

# - explore: salesforce_case_attributes
#   joins:
#     - join: salesforce_case
#       type: left_outer
#       sql_on: ${salesforce_case_attributes.salesforce_case_id} = ${salesforce_case.id}
#       relationship: many_to_one


# - explore: salesforce_casefeed

# - explore: salesforce_casefeed_attributes
#   joins:
#     - join: salesforce_casefeed
#       type: left_outer
#       sql_on: ${salesforce_casefeed_attributes.salesforce_casefeed_id} = ${salesforce_casefeed.id}
#       relationship: many_to_one


# - explore: salesforce_casehistory

# - explore: salesforce_casehistory_attributes
#   joins:
#     - join: salesforce_casehistory
#       type: left_outer
#       sql_on: ${salesforce_casehistory_attributes.salesforce_casehistory_id} = ${salesforce_casehistory.id}
#       relationship: many_to_one


# - explore: salesforce_chatteractivity

# - explore: salesforce_chatteractivity_attributes
#   joins:
#     - join: salesforce_chatteractivity
#       type: left_outer
#       sql_on: ${salesforce_chatteractivity_attributes.salesforce_chatteractivity_id} = ${salesforce_chatteractivity.id}
#       relationship: many_to_one


# - explore: salesforce_contact

# - explore: salesforce_contact_attributes
#   joins:
#     - join: salesforce_contact
#       type: left_outer
#       sql_on: ${salesforce_contact_attributes.salesforce_contact_id} = ${salesforce_contact.id}
#       relationship: many_to_one


# - explore: salesforce_contact_mailingaddress
#   joins:
#     - join: salesforce_contact
#       type: left_outer
#       sql_on: ${salesforce_contact_mailingaddress.salesforce_contact_id} = ${salesforce_contact.id}
#       relationship: many_to_one


# - explore: salesforce_document

# - explore: salesforce_document_attributes
#   joins:
#     - join: salesforce_document
#       type: left_outer
#       sql_on: ${salesforce_document_attributes.salesforce_document_id} = ${salesforce_document.id}
#       relationship: many_to_one


# - explore: salesforce_emailservicesaddress

# - explore: salesforce_emailservicesaddress_attributes
#   joins:
#     - join: salesforce_emailservicesaddress
#       type: left_outer
#       sql_on: ${salesforce_emailservicesaddress_attributes.salesforce_emailservicesaddress_id} = ${salesforce_emailservicesaddress.id}
#       relationship: many_to_one


# - explore: salesforce_emailservicesfunction

# - explore: salesforce_emailservicesfunction_attributes
#   joins:
#     - join: salesforce_emailservicesfunction
#       type: left_outer
#       sql_on: ${salesforce_emailservicesfunction_attributes.salesforce_emailservicesfunction_id} = ${salesforce_emailservicesfunction.id}
#       relationship: many_to_one


# - explore: salesforce_emailtemplate

# - explore: salesforce_emailtemplate_attributes
#   joins:
#     - join: salesforce_emailtemplate
#       type: left_outer
#       sql_on: ${salesforce_emailtemplate_attributes.salesforce_emailtemplate_id} = ${salesforce_emailtemplate.id}
#       relationship: many_to_one


# - explore: salesforce_entitysubscription

# - explore: salesforce_entitysubscription_attributes
#   joins:
#     - join: salesforce_entitysubscription
#       type: left_outer
#       sql_on: ${salesforce_entitysubscription_attributes.salesforce_entitysubscription_id} = ${salesforce_entitysubscription.id}
#       relationship: many_to_one


# - explore: salesforce_event

# - explore: salesforce_event_attributes
#   joins:
#     - join: salesforce_event
#       type: left_outer
#       sql_on: ${salesforce_event_attributes.salesforce_event_id} = ${salesforce_event.id}
#       relationship: many_to_one


# - explore: salesforce_eventfeed

# - explore: salesforce_eventfeed_attributes
#   joins:
#     - join: salesforce_eventfeed
#       type: left_outer
#       sql_on: ${salesforce_eventfeed_attributes.salesforce_eventfeed_id} = ${salesforce_eventfeed.id}
#       relationship: many_to_one


# - explore: salesforce_eventrelation

# - explore: salesforce_eventrelation_attributes
#   joins:
#     - join: salesforce_eventrelation
#       type: left_outer
#       sql_on: ${salesforce_eventrelation_attributes.salesforce_eventrelation_id} = ${salesforce_eventrelation.id}
#       relationship: many_to_one


# - explore: salesforce_feeditem

# - explore: salesforce_feeditem_attributes
#   joins:
#     - join: salesforce_feeditem
#       type: left_outer
#       sql_on: ${salesforce_feeditem_attributes.salesforce_feeditem_id} = ${salesforce_feeditem.id}
#       relationship: many_to_one


# - explore: salesforce_filesearchactivity

# - explore: salesforce_filesearchactivity_attributes
#   joins:
#     - join: salesforce_filesearchactivity
#       type: left_outer
#       sql_on: ${salesforce_filesearchactivity_attributes.salesforce_filesearchactivity_id} = ${salesforce_filesearchactivity.id}
#       relationship: many_to_one


# - explore: salesforce_fiscalyearsettings

# - explore: salesforce_fiscalyearsettings_attributes
#   joins:
#     - join: salesforce_fiscalyearsettings
#       type: left_outer
#       sql_on: ${salesforce_fiscalyearsettings_attributes.salesforce_fiscalyearsettings_id} = ${salesforce_fiscalyearsettings.id}
#       relationship: many_to_one


# - explore: salesforce_folder

# - explore: salesforce_folder_attributes
#   joins:
#     - join: salesforce_folder
#       type: left_outer
#       sql_on: ${salesforce_folder_attributes.salesforce_folder_id} = ${salesforce_folder.id}
#       relationship: many_to_one


# - explore: salesforce_group

# - explore: salesforce_group_attributes
#   joins:
#     - join: salesforce_group
#       type: left_outer
#       sql_on: ${salesforce_group_attributes.salesforce_group_id} = ${salesforce_group.id}
#       relationship: many_to_one


# - explore: salesforce_lacton__serverinformation__c

# - explore: salesforce_lacton__serverinformation__c_attributes
#   joins:
#     - join: salesforce_lacton__serverinformation__c
#       type: left_outer
#       sql_on: ${salesforce_lacton__serverinformation__c_attributes.salesforce_lacton__serverinformation__c_id} = ${salesforce_lacton__serverinformation__c.id}
#       relationship: many_to_one


# - explore: salesforce_lead

# - explore: salesforce_lead_address
#   joins:
#     - join: salesforce_lead
#       type: left_outer
#       sql_on: ${salesforce_lead_address.salesforce_lead_id} = ${salesforce_lead.id}
#       relationship: many_to_one


# - explore: salesforce_lead_attributes
#   joins:
#     - join: salesforce_lead
#       type: left_outer
#       sql_on: ${salesforce_lead_attributes.salesforce_lead_id} = ${salesforce_lead.id}
#       relationship: many_to_one


# - explore: salesforce_leadfeed

# - explore: salesforce_leadfeed_attributes
#   joins:
#     - join: salesforce_leadfeed
#       type: left_outer
#       sql_on: ${salesforce_leadfeed_attributes.salesforce_leadfeed_id} = ${salesforce_leadfeed.id}
#       relationship: many_to_one


# - explore: salesforce_note

# - explore: salesforce_note_attributes
#   joins:
#     - join: salesforce_note
#       type: left_outer
#       sql_on: ${salesforce_note_attributes.salesforce_note_id} = ${salesforce_note.id}
#       relationship: many_to_one


# - explore: salesforce_opportunity

# - explore: salesforce_opportunity_attributes
#   joins:
#     - join: salesforce_opportunity
#       type: left_outer
#       sql_on: ${salesforce_opportunity_attributes.salesforce_opportunity_id} = ${salesforce_opportunity.id}
#       relationship: many_to_one


# - explore: salesforce_opportunitycontactrole

# - explore: salesforce_opportunitycontactrole_attributes
#   joins:
#     - join: salesforce_opportunitycontactrole
#       type: left_outer
#       sql_on: ${salesforce_opportunitycontactrole_attributes.salesforce_opportunitycontactrole_id} = ${salesforce_opportunitycontactrole.id}
#       relationship: many_to_one


# - explore: salesforce_opportunityhistory

# - explore: salesforce_opportunityhistory_attributes
#   joins:
#     - join: salesforce_opportunityhistory
#       type: left_outer
#       sql_on: ${salesforce_opportunityhistory_attributes.salesforce_opportunityhistory_id} = ${salesforce_opportunityhistory.id}
#       relationship: many_to_one


# - explore: salesforce_organization

# - explore: salesforce_organization_address
#   joins:
#     - join: salesforce_organization
#       type: left_outer
#       sql_on: ${salesforce_organization_address.salesforce_organization_id} = ${salesforce_organization.id}
#       relationship: many_to_one


# - explore: salesforce_organization_attributes
#   joins:
#     - join: salesforce_organization
#       type: left_outer
#       sql_on: ${salesforce_organization_attributes.salesforce_organization_id} = ${salesforce_organization.id}
#       relationship: many_to_one


# - explore: salesforce_period

# - explore: salesforce_period_attributes
#   joins:
#     - join: salesforce_period
#       type: left_outer
#       sql_on: ${salesforce_period_attributes.salesforce_period_id} = ${salesforce_period.id}
#       relationship: many_to_one


# - explore: salesforce_pricebook2

# - explore: salesforce_pricebook2_attributes
#   joins:
#     - join: salesforce_pricebook2
#       type: left_outer
#       sql_on: ${salesforce_pricebook2_attributes.salesforce_pricebook2_id} = ${salesforce_pricebook2.id}
#       relationship: many_to_one


# - explore: salesforce_profile

# - explore: salesforce_profile_attributes
#   joins:
#     - join: salesforce_profile
#       type: left_outer
#       sql_on: ${salesforce_profile_attributes.salesforce_profile_id} = ${salesforce_profile.id}
#       relationship: many_to_one


# - explore: salesforce_scontrol

# - explore: salesforce_scontrol_attributes
#   joins:
#     - join: salesforce_scontrol
#       type: left_outer
#       sql_on: ${salesforce_scontrol_attributes.salesforce_scontrol_id} = ${salesforce_scontrol.id}
#       relationship: many_to_one


# - explore: salesforce_socialpersona

# - explore: salesforce_socialpersona_attributes
#   joins:
#     - join: salesforce_socialpersona
#       type: left_outer
#       sql_on: ${salesforce_socialpersona_attributes.salesforce_socialpersona_id} = ${salesforce_socialpersona.id}
#       relationship: many_to_one


# - explore: salesforce_staticresource

# - explore: salesforce_staticresource_attributes
#   joins:
#     - join: salesforce_staticresource
#       type: left_outer
#       sql_on: ${salesforce_staticresource_attributes.salesforce_staticresource_id} = ${salesforce_staticresource.id}
#       relationship: many_to_one


# - explore: salesforce_task

# - explore: salesforce_task_attributes
#   joins:
#     - join: salesforce_task
#       type: left_outer
#       sql_on: ${salesforce_task_attributes.salesforce_task_id} = ${salesforce_task.id}
#       relationship: many_to_one


# - explore: salesforce_taskfeed

# - explore: salesforce_taskfeed_attributes
#   joins:
#     - join: salesforce_taskfeed
#       type: left_outer
#       sql_on: ${salesforce_taskfeed_attributes.salesforce_taskfeed_id} = ${salesforce_taskfeed.id}
#       relationship: many_to_one


# - explore: salesforce_taskrelation

# - explore: salesforce_taskrelation_attributes
#   joins:
#     - join: salesforce_taskrelation
#       type: left_outer
#       sql_on: ${salesforce_taskrelation_attributes.salesforce_taskrelation_id} = ${salesforce_taskrelation.id}
#       relationship: many_to_one


# - explore: salesforce_topic

# - explore: salesforce_topic_attributes
#   joins:
#     - join: salesforce_topic
#       type: left_outer
#       sql_on: ${salesforce_topic_attributes.salesforce_topic_id} = ${salesforce_topic.id}
#       relationship: many_to_one


# - explore: salesforce_user

# - explore: salesforce_user_address
#   joins:
#     - join: salesforce_user
#       type: left_outer
#       sql_on: ${salesforce_user_address.salesforce_user_id} = ${salesforce_user.id}
#       relationship: many_to_one


# - explore: salesforce_user_attributes
#   joins:
#     - join: salesforce_user
#       type: left_outer
#       sql_on: ${salesforce_user_attributes.salesforce_user_id} = ${salesforce_user.id}
#       relationship: many_to_one


# - explore: salesforce_userappinfo

# - explore: salesforce_userappinfo_attributes
#   joins:
#     - join: salesforce_userappinfo
#       type: left_outer
#       sql_on: ${salesforce_userappinfo_attributes.salesforce_userappinfo_id} = ${salesforce_userappinfo.id}
#       relationship: many_to_one


# - explore: salesforce_weblink

# - explore: salesforce_weblink_attributes
#   joins:
#     - join: salesforce_weblink
#       type: left_outer
#       sql_on: ${salesforce_weblink_attributes.salesforce_weblink_id} = ${salesforce_weblink.id}
#       relationship: many_to_one


# - explore: tdsc_523251920

# - explore: tdsc_adwords_gdn_adgroup_performance_report

# - explore: tdsc_adwords_sem_adgroup_performance_report

# - explore: tdsc_ga

# - explore: tdsc_ga_overall

# - explore: tdsc_ga_source
#   joins:
#     - join: tdsc_ga
#       type: left_outer
#       sql_on: ${tdsc_ga_source.tdsc_ga_id} = ${tdsc_ga.id}
#       relationship: many_to_one


# - explore: the_dentists_supply_company_dcm_tdsc_fy1819_636039538

# - explore: the_dentists_supply_company_dcm_tdsc_fy1819_junedecember_636039538

# - explore: ttus_leads

# - explore: ttus_leads_eventaction
#   joins:
#     - join: ttus_leads
#       type: left_outer
#       sql_on: ${ttus_leads_eventaction.ttus_leads_id} = ${ttus_leads.id}
#       relationship: many_to_one


# - explore: vca_air_canada_foundational_gdn_adgroup_performance_report

# - explore: vca_aus_foundational_gdn_adgroup_performance_report

# - explore: vca_aus_foundational_sem_adgroup_performance_report

# - explore: vca_bra_foundational_sem_adgroup_performance_report

# - explore: vca_can_aircanada_gdn_adgroup_performance_report

# - explore: vca_can_crisisrecovery_gdn_adgroup_performance_report

# - explore: vca_can_foundational_gdn_adgroup_performance_report

# - explore: vca_can_foundational_sem_adgroup_performance_report

# - explore: vca_foundational_sem_gdn

# - explore: vca_foundational_sem_gdn_union

# - explore: vca_fra_foundational_sem_adgroup_performance_report

# - explore: vca_ga

# - explore: vca_ga_adwords

# - explore: vca_ger_foudnational_sem_adgroup_performance_report

# - explore: vca_ind_foudnational_sem_adgroup_performance_report

# - explore: vca_jpn_foundational_gdn_adgroup_performance_report

# - explore: vca_jpn_foundational_sem_adgroup_performance_report

# - explore: vca_mex_foundational_gdn_adgroup_performance_report

# - explore: vca_mex_foundational_sem_adgroup_performance_report

# - explore: vca_mex_kidifornia_gdn_adgroup_performance_report

# - explore: vca_skor_foudnational_sem_adgroup_performance_report

# - explore: vca_skor_foundational_gdn_adgroup_performance_report

# - explore: vca_skor_foundational_sem_adgroup_performance_report

# - explore: vca_south_korea_foundational_gdn_adgroup_performance_report

# - explore: vca_uk_foundational_gdn_adgroup_performance_report

# - explore: vca_uk_foundational_sem_adgroup_performance_report

# - explore: vca_us_crisisrecovery_gdn_adgroup_performance_report

# - explore: vca_us_foundational_gdn_adgroup_performance_report

# - explore: vca_us_foundational_sem_adgroup_performance_report

# - explore: vca_us_foundational_sem_adwords_adgroup_performance_report

# - explore: vendors

# - explore: vnv_us_foundational_sem_adgroup_performance_report

# - explore: vnv_us_foundational_trueview_adgroup_performance_report

# - explore: vnv_us_group_sem_adgroup_performance_report
