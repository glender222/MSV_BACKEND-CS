--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

-- Started on 2025-06-02 16:46:34 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.identity_provider_config DROP CONSTRAINT IF EXISTS fkdc4897cf864c4e43;
ALTER TABLE IF EXISTS ONLY public.policy_config DROP CONSTRAINT IF EXISTS fkdc34197cf864c4e43;
ALTER TABLE IF EXISTS ONLY public.user_group_membership DROP CONSTRAINT IF EXISTS fk_user_group_user;
ALTER TABLE IF EXISTS ONLY public.user_federation_config DROP CONSTRAINT IF EXISTS fk_t13hpu1j94r2ebpekr39x5eu5;
ALTER TABLE IF EXISTS ONLY public.realm_supported_locales DROP CONSTRAINT IF EXISTS fk_supported_locales_realm;
ALTER TABLE IF EXISTS ONLY public.role_attribute DROP CONSTRAINT IF EXISTS fk_role_attribute_id;
ALTER TABLE IF EXISTS ONLY public.resource_uris DROP CONSTRAINT IF EXISTS fk_resource_server_uris;
ALTER TABLE IF EXISTS ONLY public.required_action_provider DROP CONSTRAINT IF EXISTS fk_req_act_realm;
ALTER TABLE IF EXISTS ONLY public.default_client_scope DROP CONSTRAINT IF EXISTS fk_r_def_cli_scope_realm;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper_config DROP CONSTRAINT IF EXISTS fk_pmconfig;
ALTER TABLE IF EXISTS ONLY public.credential DROP CONSTRAINT IF EXISTS fk_pfyr0glasqyl0dei3kl69r6v0;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS fk_pcm_realm;
ALTER TABLE IF EXISTS ONLY public.scope_mapping DROP CONSTRAINT IF EXISTS fk_ouse064plmlr732lxjcn1q5f1;
ALTER TABLE IF EXISTS ONLY public.web_origins DROP CONSTRAINT IF EXISTS fk_lojpho213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.idp_mapper_config DROP CONSTRAINT IF EXISTS fk_idpmconfig;
ALTER TABLE IF EXISTS ONLY public.identity_provider_mapper DROP CONSTRAINT IF EXISTS fk_idpm_realm;
ALTER TABLE IF EXISTS ONLY public.realm_events_listeners DROP CONSTRAINT IF EXISTS fk_h846o4h0w8epx5nxev9f5y69j;
ALTER TABLE IF EXISTS ONLY public.realm_enabled_event_types DROP CONSTRAINT IF EXISTS fk_h846o4h0w8epx5nwedrf5y69j;
ALTER TABLE IF EXISTS ONLY public.group_role_mapping DROP CONSTRAINT IF EXISTS fk_group_role_group;
ALTER TABLE IF EXISTS ONLY public.group_attribute DROP CONSTRAINT IF EXISTS fk_group_attribute_group;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS fk_grntcsnt_user;
ALTER TABLE IF EXISTS ONLY public.user_consent_client_scope DROP CONSTRAINT IF EXISTS fk_grntcsnt_clsc_usc;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS fk_gr7thllb9lu8q4vqa4524jjy8;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS fk_frsrso213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS fk_frsrps213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS fk_frsrpp213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS fk_frsrpos53xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS fk_frsrpos13xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS fk_frsrpo213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrpo2128cx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS fk_frsrpass3xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS fk_frsrpas14xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog84sspmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog83sspmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog82sspmt;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS fk_frsrasp13xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS fk_frsr5s213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS fk_fedmapperpm_realm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS fk_fedmapperpm_fedprv;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper_config DROP CONSTRAINT IF EXISTS fk_fedmapper_cfg;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS fk_def_groups_realm;
ALTER TABLE IF EXISTS ONLY public.component DROP CONSTRAINT IF EXISTS fk_component_realm;
ALTER TABLE IF EXISTS ONLY public.component_config DROP CONSTRAINT IF EXISTS fk_component_config;
ALTER TABLE IF EXISTS ONLY public.client_initial_access DROP CONSTRAINT IF EXISTS fk_client_init_acc_realm;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS fk_cli_scope_mapper;
ALTER TABLE IF EXISTS ONLY public.client_scope_role_mapping DROP CONSTRAINT IF EXISTS fk_cl_scope_rm_scope;
ALTER TABLE IF EXISTS ONLY public.client_scope_attributes DROP CONSTRAINT IF EXISTS fk_cl_scope_attr_scope;
ALTER TABLE IF EXISTS ONLY public.user_role_mapping DROP CONSTRAINT IF EXISTS fk_c4fqv34p1mbylloxang7b1q3l;
ALTER TABLE IF EXISTS ONLY public.authenticator_config DROP CONSTRAINT IF EXISTS fk_auth_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_flow DROP CONSTRAINT IF EXISTS fk_auth_flow_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS fk_auth_exec_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS fk_auth_exec_flow;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS fk_a63wvekftu8jo1pnj81e7mce2;
ALTER TABLE IF EXISTS ONLY public.realm_attribute DROP CONSTRAINT IF EXISTS fk_8shxd6l3e9atqukacxgpffptw;
ALTER TABLE IF EXISTS ONLY public.realm_smtp_config DROP CONSTRAINT IF EXISTS fk_70ej8xdxgxd0b9hh6180irr0o;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
ALTER TABLE IF EXISTS ONLY public.user_required_action DROP CONSTRAINT IF EXISTS fk_6qj3w1jw9cvafhe19bwsiuvmd;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS fk_5hrm2vlf9ql5fu043kqepovbr;
ALTER TABLE IF EXISTS ONLY public.resource_attribute DROP CONSTRAINT IF EXISTS fk_5hrm2vlf9ql5fu022kqepovbr;
ALTER TABLE IF EXISTS ONLY public.realm_required_credential DROP CONSTRAINT IF EXISTS fk_5hg65lybevavkqfki3kponh9v;
ALTER TABLE IF EXISTS ONLY public.user_federation_provider DROP CONSTRAINT IF EXISTS fk_1fj32f6ptolw2qy60cd8n01e8;
ALTER TABLE IF EXISTS ONLY public.redirect_uris DROP CONSTRAINT IF EXISTS fk_1burs8pb4ouj97h5wuppahv9f;
ALTER TABLE IF EXISTS ONLY public.client_node_registrations DROP CONSTRAINT IF EXISTS fk4129723ba992f594;
ALTER TABLE IF EXISTS ONLY public.federated_identity DROP CONSTRAINT IF EXISTS fk404288b92ef007a6;
ALTER TABLE IF EXISTS ONLY public.client_attributes DROP CONSTRAINT IF EXISTS fk3c47c64beacca966;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS fk2b4ebc52ae5c3b34;
DROP INDEX IF EXISTS public.user_attr_long_values_lower_case;
DROP INDEX IF EXISTS public.user_attr_long_values;
DROP INDEX IF EXISTS public.idx_web_orig_client;
DROP INDEX IF EXISTS public.idx_usr_fed_prv_realm;
DROP INDEX IF EXISTS public.idx_usr_fed_map_realm;
DROP INDEX IF EXISTS public.idx_usr_fed_map_fed_prv;
DROP INDEX IF EXISTS public.idx_user_service_account;
DROP INDEX IF EXISTS public.idx_user_role_mapping;
DROP INDEX IF EXISTS public.idx_user_reqactions;
DROP INDEX IF EXISTS public.idx_user_group_mapping;
DROP INDEX IF EXISTS public.idx_user_email;
DROP INDEX IF EXISTS public.idx_user_credential;
DROP INDEX IF EXISTS public.idx_user_consent;
DROP INDEX IF EXISTS public.idx_user_attribute_name;
DROP INDEX IF EXISTS public.idx_user_attribute;
DROP INDEX IF EXISTS public.idx_usconsent_scope_id;
DROP INDEX IF EXISTS public.idx_usconsent_clscope;
DROP INDEX IF EXISTS public.idx_update_time;
DROP INDEX IF EXISTS public.idx_scope_policy_policy;
DROP INDEX IF EXISTS public.idx_scope_mapping_role;
DROP INDEX IF EXISTS public.idx_role_clscope;
DROP INDEX IF EXISTS public.idx_role_attribute;
DROP INDEX IF EXISTS public.idx_rev_token_on_expire;
DROP INDEX IF EXISTS public.idx_res_srv_scope_res_srv;
DROP INDEX IF EXISTS public.idx_res_srv_res_res_srv;
DROP INDEX IF EXISTS public.idx_res_serv_pol_res_serv;
DROP INDEX IF EXISTS public.idx_res_scope_scope;
DROP INDEX IF EXISTS public.idx_res_policy_policy;
DROP INDEX IF EXISTS public.idx_req_act_prov_realm;
DROP INDEX IF EXISTS public.idx_redir_uri_client;
DROP INDEX IF EXISTS public.idx_realm_supp_local_realm;
DROP INDEX IF EXISTS public.idx_realm_master_adm_cli;
DROP INDEX IF EXISTS public.idx_realm_evt_types_realm;
DROP INDEX IF EXISTS public.idx_realm_evt_list_realm;
DROP INDEX IF EXISTS public.idx_realm_def_grp_realm;
DROP INDEX IF EXISTS public.idx_realm_clscope;
DROP INDEX IF EXISTS public.idx_realm_attr_realm;
DROP INDEX IF EXISTS public.idx_protocol_mapper_client;
DROP INDEX IF EXISTS public.idx_perm_ticket_requester;
DROP INDEX IF EXISTS public.idx_perm_ticket_owner;
DROP INDEX IF EXISTS public.idx_org_domain_org_id;
DROP INDEX IF EXISTS public.idx_offline_uss_by_user;
DROP INDEX IF EXISTS public.idx_offline_uss_by_last_session_refresh;
DROP INDEX IF EXISTS public.idx_offline_uss_by_broker_session_id;
DROP INDEX IF EXISTS public.idx_keycloak_role_realm;
DROP INDEX IF EXISTS public.idx_keycloak_role_client;
DROP INDEX IF EXISTS public.idx_idp_realm_org;
DROP INDEX IF EXISTS public.idx_idp_for_login;
DROP INDEX IF EXISTS public.idx_ident_prov_realm;
DROP INDEX IF EXISTS public.idx_id_prov_mapp_realm;
DROP INDEX IF EXISTS public.idx_group_role_mapp_group;
DROP INDEX IF EXISTS public.idx_group_attr_group;
DROP INDEX IF EXISTS public.idx_group_att_by_name_value;
DROP INDEX IF EXISTS public.idx_fu_role_mapping_ru;
DROP INDEX IF EXISTS public.idx_fu_role_mapping;
DROP INDEX IF EXISTS public.idx_fu_required_action_ru;
DROP INDEX IF EXISTS public.idx_fu_required_action;
DROP INDEX IF EXISTS public.idx_fu_group_membership_ru;
DROP INDEX IF EXISTS public.idx_fu_group_membership;
DROP INDEX IF EXISTS public.idx_fu_credential_ru;
DROP INDEX IF EXISTS public.idx_fu_credential;
DROP INDEX IF EXISTS public.idx_fu_consent_ru;
DROP INDEX IF EXISTS public.idx_fu_consent;
DROP INDEX IF EXISTS public.idx_fu_cnsnt_ext;
DROP INDEX IF EXISTS public.idx_fu_attribute;
DROP INDEX IF EXISTS public.idx_fedidentity_user;
DROP INDEX IF EXISTS public.idx_fedidentity_feduser;
DROP INDEX IF EXISTS public.idx_event_time;
DROP INDEX IF EXISTS public.idx_defcls_scope;
DROP INDEX IF EXISTS public.idx_defcls_realm;
DROP INDEX IF EXISTS public.idx_composite_child;
DROP INDEX IF EXISTS public.idx_composite;
DROP INDEX IF EXISTS public.idx_component_realm;
DROP INDEX IF EXISTS public.idx_component_provider_type;
DROP INDEX IF EXISTS public.idx_compo_config_compo;
DROP INDEX IF EXISTS public.idx_clscope_role;
DROP INDEX IF EXISTS public.idx_clscope_protmap;
DROP INDEX IF EXISTS public.idx_clscope_cl;
DROP INDEX IF EXISTS public.idx_clscope_attrs;
DROP INDEX IF EXISTS public.idx_client_init_acc_realm;
DROP INDEX IF EXISTS public.idx_client_id;
DROP INDEX IF EXISTS public.idx_client_att_by_name_value;
DROP INDEX IF EXISTS public.idx_cl_clscope;
DROP INDEX IF EXISTS public.idx_auth_flow_realm;
DROP INDEX IF EXISTS public.idx_auth_exec_realm_flow;
DROP INDEX IF EXISTS public.idx_auth_exec_flow;
DROP INDEX IF EXISTS public.idx_auth_config_realm;
DROP INDEX IF EXISTS public.idx_assoc_pol_assoc_pol_id;
DROP INDEX IF EXISTS public.idx_admin_event_time;
DROP INDEX IF EXISTS public.fed_user_attr_long_values_lower_case;
DROP INDEX IF EXISTS public.fed_user_attr_long_values;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS uk_ru8tt6t700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.realm DROP CONSTRAINT IF EXISTS uk_orvsdmla56612eaefiq6wl5oi;
ALTER TABLE IF EXISTS ONLY public.org DROP CONSTRAINT IF EXISTS uk_org_name;
ALTER TABLE IF EXISTS ONLY public.org DROP CONSTRAINT IF EXISTS uk_org_group;
ALTER TABLE IF EXISTS ONLY public.org DROP CONSTRAINT IF EXISTS uk_org_alias;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS uk_local_consent;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS uk_frsrst700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS uk_frsrpt700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS uk_frsr6t700s9v50bu18ws5pmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS uk_frsr6t700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS uk_external_consent;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS uk_dykn684sl8up1crfei6eckhd7;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS uk_cli_scope;
ALTER TABLE IF EXISTS ONLY public.client DROP CONSTRAINT IF EXISTS uk_b71cjlbenv945rb6gcon438at;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS uk_2daelwnibji49avxsrtuf6xj33;
ALTER TABLE IF EXISTS ONLY public.keycloak_group DROP CONSTRAINT IF EXISTS sibling_names;
ALTER TABLE IF EXISTS ONLY public.resource_attribute DROP CONSTRAINT IF EXISTS res_attr_pk;
ALTER TABLE IF EXISTS ONLY public.realm_localizations DROP CONSTRAINT IF EXISTS realm_localizations_pkey;
ALTER TABLE IF EXISTS ONLY public.default_client_scope DROP CONSTRAINT IF EXISTS r_def_cli_scope_bind;
ALTER TABLE IF EXISTS ONLY public.client_scope_role_mapping DROP CONSTRAINT IF EXISTS pk_template_scope;
ALTER TABLE IF EXISTS ONLY public.resource_server DROP CONSTRAINT IF EXISTS pk_resource_server;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS pk_cli_template;
ALTER TABLE IF EXISTS ONLY public.client_scope_attributes DROP CONSTRAINT IF EXISTS pk_cl_tmpl_attr;
ALTER TABLE IF EXISTS ONLY public.databasechangeloglock DROP CONSTRAINT IF EXISTS databasechangeloglock_pkey;
ALTER TABLE IF EXISTS ONLY public.web_origins DROP CONSTRAINT IF EXISTS constraint_web_origins;
ALTER TABLE IF EXISTS ONLY public.user_group_membership DROP CONSTRAINT IF EXISTS constraint_user_group;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS constraint_user_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.revoked_token DROP CONSTRAINT IF EXISTS constraint_rt;
ALTER TABLE IF EXISTS ONLY public.role_attribute DROP CONSTRAINT IF EXISTS constraint_role_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.resource_uris DROP CONSTRAINT IF EXISTS constraint_resour_uris_pk;
ALTER TABLE IF EXISTS ONLY public.user_required_action DROP CONSTRAINT IF EXISTS constraint_required_action;
ALTER TABLE IF EXISTS ONLY public.required_action_provider DROP CONSTRAINT IF EXISTS constraint_req_act_prv_pk;
ALTER TABLE IF EXISTS ONLY public.required_action_config DROP CONSTRAINT IF EXISTS constraint_req_act_cfg_pk;
ALTER TABLE IF EXISTS ONLY public.redirect_uris DROP CONSTRAINT IF EXISTS constraint_redirect_uris;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper_config DROP CONSTRAINT IF EXISTS constraint_pmconfig;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS constraint_pcm;
ALTER TABLE IF EXISTS ONLY public.offline_user_session DROP CONSTRAINT IF EXISTS constraint_offl_us_ses_pk2;
ALTER TABLE IF EXISTS ONLY public.offline_client_session DROP CONSTRAINT IF EXISTS constraint_offl_cl_ses_pk3;
ALTER TABLE IF EXISTS ONLY public.migration_model DROP CONSTRAINT IF EXISTS constraint_migmod;
ALTER TABLE IF EXISTS ONLY public.jgroups_ping DROP CONSTRAINT IF EXISTS constraint_jgroups_ping;
ALTER TABLE IF EXISTS ONLY public.idp_mapper_config DROP CONSTRAINT IF EXISTS constraint_idpmconfig;
ALTER TABLE IF EXISTS ONLY public.identity_provider_mapper DROP CONSTRAINT IF EXISTS constraint_idpm;
ALTER TABLE IF EXISTS ONLY public.group_role_mapping DROP CONSTRAINT IF EXISTS constraint_group_role;
ALTER TABLE IF EXISTS ONLY public.group_attribute DROP CONSTRAINT IF EXISTS constraint_group_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.keycloak_group DROP CONSTRAINT IF EXISTS constraint_group;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS constraint_grntcsnt_pm;
ALTER TABLE IF EXISTS ONLY public.user_consent_client_scope DROP CONSTRAINT IF EXISTS constraint_grntcsnt_clsc_pm;
ALTER TABLE IF EXISTS ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT IF EXISTS constraint_fgrntcsnt_clsc_pm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS constraint_fedmapperpm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper_config DROP CONSTRAINT IF EXISTS constraint_fedmapper_cfg_pm;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS constraint_fb;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS constraint_farsrsps;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS constraint_farsrsp;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS constraint_farsrs;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS constraint_farsrpp;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS constraint_farsrpap;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS constraint_farsrp;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS constraint_farsr;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS constraint_fapmt;
ALTER TABLE IF EXISTS ONLY public.user_federation_config DROP CONSTRAINT IF EXISTS constraint_f9;
ALTER TABLE IF EXISTS ONLY public.credential DROP CONSTRAINT IF EXISTS constraint_f;
ALTER TABLE IF EXISTS ONLY public.realm_smtp_config DROP CONSTRAINT IF EXISTS constraint_e;
ALTER TABLE IF EXISTS ONLY public.policy_config DROP CONSTRAINT IF EXISTS constraint_dpc;
ALTER TABLE IF EXISTS ONLY public.identity_provider_config DROP CONSTRAINT IF EXISTS constraint_d;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS constraint_composite_role;
ALTER TABLE IF EXISTS ONLY public.user_role_mapping DROP CONSTRAINT IF EXISTS constraint_c;
ALTER TABLE IF EXISTS ONLY public.authenticator_config DROP CONSTRAINT IF EXISTS constraint_auth_pk;
ALTER TABLE IF EXISTS ONLY public.authentication_flow DROP CONSTRAINT IF EXISTS constraint_auth_flow_pk;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS constraint_auth_exec_pk;
ALTER TABLE IF EXISTS ONLY public.authenticator_config_entry DROP CONSTRAINT IF EXISTS constraint_auth_cfg_pk;
ALTER TABLE IF EXISTS ONLY public.admin_event_entity DROP CONSTRAINT IF EXISTS constraint_admin_event_entity;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS constraint_a;
ALTER TABLE IF EXISTS ONLY public.realm_required_credential DROP CONSTRAINT IF EXISTS constraint_92;
ALTER TABLE IF EXISTS ONLY public.realm_attribute DROP CONSTRAINT IF EXISTS constraint_9;
ALTER TABLE IF EXISTS ONLY public.client_node_registrations DROP CONSTRAINT IF EXISTS constraint_84;
ALTER TABLE IF EXISTS ONLY public.scope_mapping DROP CONSTRAINT IF EXISTS constraint_81;
ALTER TABLE IF EXISTS ONLY public.client DROP CONSTRAINT IF EXISTS constraint_7;
ALTER TABLE IF EXISTS ONLY public.user_federation_provider DROP CONSTRAINT IF EXISTS constraint_5c;
ALTER TABLE IF EXISTS ONLY public.realm DROP CONSTRAINT IF EXISTS constraint_4a;
ALTER TABLE IF EXISTS ONLY public.federated_identity DROP CONSTRAINT IF EXISTS constraint_40;
ALTER TABLE IF EXISTS ONLY public.event_entity DROP CONSTRAINT IF EXISTS constraint_4;
ALTER TABLE IF EXISTS ONLY public.client_attributes DROP CONSTRAINT IF EXISTS constraint_3c;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS constraint_2b;
ALTER TABLE IF EXISTS ONLY public.realm_supported_locales DROP CONSTRAINT IF EXISTS constr_realm_supported_locales;
ALTER TABLE IF EXISTS ONLY public.realm_events_listeners DROP CONSTRAINT IF EXISTS constr_realm_events_listeners;
ALTER TABLE IF EXISTS ONLY public.realm_enabled_event_types DROP CONSTRAINT IF EXISTS constr_realm_enabl_event_types;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS constr_realm_default_groups;
ALTER TABLE IF EXISTS ONLY public.federated_user DROP CONSTRAINT IF EXISTS constr_federated_user;
ALTER TABLE IF EXISTS ONLY public.fed_user_role_mapping DROP CONSTRAINT IF EXISTS constr_fed_user_role;
ALTER TABLE IF EXISTS ONLY public.fed_user_group_membership DROP CONSTRAINT IF EXISTS constr_fed_user_group;
ALTER TABLE IF EXISTS ONLY public.fed_user_credential DROP CONSTRAINT IF EXISTS constr_fed_user_cred_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_consent DROP CONSTRAINT IF EXISTS constr_fed_user_consent_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_attribute DROP CONSTRAINT IF EXISTS constr_fed_user_attr_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_required_action DROP CONSTRAINT IF EXISTS constr_fed_required_action;
ALTER TABLE IF EXISTS ONLY public.component DROP CONSTRAINT IF EXISTS constr_component_pk;
ALTER TABLE IF EXISTS ONLY public.component_config DROP CONSTRAINT IF EXISTS constr_component_config_pk;
ALTER TABLE IF EXISTS ONLY public.broker_link DROP CONSTRAINT IF EXISTS constr_broker_link_pk;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS con_group_id_def_groups;
ALTER TABLE IF EXISTS ONLY public.client_initial_access DROP CONSTRAINT IF EXISTS cnstr_client_init_acc_pk;
ALTER TABLE IF EXISTS ONLY public.client_scope_client DROP CONSTRAINT IF EXISTS c_cli_scope_bind;
ALTER TABLE IF EXISTS ONLY public.client_auth_flow_bindings DROP CONSTRAINT IF EXISTS c_cli_flow_bind;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
ALTER TABLE IF EXISTS ONLY public.server_config DROP CONSTRAINT IF EXISTS "SERVER_CONFIG_pkey";
ALTER TABLE IF EXISTS ONLY public.org DROP CONSTRAINT IF EXISTS "ORG_pkey";
ALTER TABLE IF EXISTS ONLY public.org_domain DROP CONSTRAINT IF EXISTS "ORG_DOMAIN_pkey";
DROP TABLE IF EXISTS public.web_origins;
DROP TABLE IF EXISTS public.user_role_mapping;
DROP TABLE IF EXISTS public.user_required_action;
DROP TABLE IF EXISTS public.user_group_membership;
DROP TABLE IF EXISTS public.user_federation_provider;
DROP TABLE IF EXISTS public.user_federation_mapper_config;
DROP TABLE IF EXISTS public.user_federation_mapper;
DROP TABLE IF EXISTS public.user_federation_config;
DROP TABLE IF EXISTS public.user_entity;
DROP TABLE IF EXISTS public.user_consent_client_scope;
DROP TABLE IF EXISTS public.user_consent;
DROP TABLE IF EXISTS public.user_attribute;
DROP TABLE IF EXISTS public.server_config;
DROP TABLE IF EXISTS public.scope_policy;
DROP TABLE IF EXISTS public.scope_mapping;
DROP TABLE IF EXISTS public.role_attribute;
DROP TABLE IF EXISTS public.revoked_token;
DROP TABLE IF EXISTS public.resource_uris;
DROP TABLE IF EXISTS public.resource_server_scope;
DROP TABLE IF EXISTS public.resource_server_resource;
DROP TABLE IF EXISTS public.resource_server_policy;
DROP TABLE IF EXISTS public.resource_server_perm_ticket;
DROP TABLE IF EXISTS public.resource_server;
DROP TABLE IF EXISTS public.resource_scope;
DROP TABLE IF EXISTS public.resource_policy;
DROP TABLE IF EXISTS public.resource_attribute;
DROP TABLE IF EXISTS public.required_action_provider;
DROP TABLE IF EXISTS public.required_action_config;
DROP TABLE IF EXISTS public.redirect_uris;
DROP TABLE IF EXISTS public.realm_supported_locales;
DROP TABLE IF EXISTS public.realm_smtp_config;
DROP TABLE IF EXISTS public.realm_required_credential;
DROP TABLE IF EXISTS public.realm_localizations;
DROP TABLE IF EXISTS public.realm_events_listeners;
DROP TABLE IF EXISTS public.realm_enabled_event_types;
DROP TABLE IF EXISTS public.realm_default_groups;
DROP TABLE IF EXISTS public.realm_attribute;
DROP TABLE IF EXISTS public.realm;
DROP TABLE IF EXISTS public.protocol_mapper_config;
DROP TABLE IF EXISTS public.protocol_mapper;
DROP TABLE IF EXISTS public.policy_config;
DROP TABLE IF EXISTS public.org_domain;
DROP TABLE IF EXISTS public.org;
DROP TABLE IF EXISTS public.offline_user_session;
DROP TABLE IF EXISTS public.offline_client_session;
DROP TABLE IF EXISTS public.migration_model;
DROP TABLE IF EXISTS public.keycloak_role;
DROP TABLE IF EXISTS public.keycloak_group;
DROP TABLE IF EXISTS public.jgroups_ping;
DROP TABLE IF EXISTS public.idp_mapper_config;
DROP TABLE IF EXISTS public.identity_provider_mapper;
DROP TABLE IF EXISTS public.identity_provider_config;
DROP TABLE IF EXISTS public.identity_provider;
DROP TABLE IF EXISTS public.group_role_mapping;
DROP TABLE IF EXISTS public.group_attribute;
DROP TABLE IF EXISTS public.federated_user;
DROP TABLE IF EXISTS public.federated_identity;
DROP TABLE IF EXISTS public.fed_user_role_mapping;
DROP TABLE IF EXISTS public.fed_user_required_action;
DROP TABLE IF EXISTS public.fed_user_group_membership;
DROP TABLE IF EXISTS public.fed_user_credential;
DROP TABLE IF EXISTS public.fed_user_consent_cl_scope;
DROP TABLE IF EXISTS public.fed_user_consent;
DROP TABLE IF EXISTS public.fed_user_attribute;
DROP TABLE IF EXISTS public.event_entity;
DROP TABLE IF EXISTS public.default_client_scope;
DROP TABLE IF EXISTS public.databasechangeloglock;
DROP TABLE IF EXISTS public.databasechangelog;
DROP TABLE IF EXISTS public.credential;
DROP TABLE IF EXISTS public.composite_role;
DROP TABLE IF EXISTS public.component_config;
DROP TABLE IF EXISTS public.component;
DROP TABLE IF EXISTS public.client_scope_role_mapping;
DROP TABLE IF EXISTS public.client_scope_client;
DROP TABLE IF EXISTS public.client_scope_attributes;
DROP TABLE IF EXISTS public.client_scope;
DROP TABLE IF EXISTS public.client_node_registrations;
DROP TABLE IF EXISTS public.client_initial_access;
DROP TABLE IF EXISTS public.client_auth_flow_bindings;
DROP TABLE IF EXISTS public.client_attributes;
DROP TABLE IF EXISTS public.client;
DROP TABLE IF EXISTS public.broker_link;
DROP TABLE IF EXISTS public.authenticator_config_entry;
DROP TABLE IF EXISTS public.authenticator_config;
DROP TABLE IF EXISTS public.authentication_flow;
DROP TABLE IF EXISTS public.authentication_execution;
DROP TABLE IF EXISTS public.associated_policy;
DROP TABLE IF EXISTS public.admin_event_entity;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 251 (class 1259 OID 17087)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO glen;

--
-- TOC entry 278 (class 1259 OID 17530)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO glen;

--
-- TOC entry 254 (class 1259 OID 17102)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO glen;

--
-- TOC entry 253 (class 1259 OID 17097)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO glen;

--
-- TOC entry 252 (class 1259 OID 17092)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO glen;

--
-- TOC entry 255 (class 1259 OID 17107)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO glen;

--
-- TOC entry 279 (class 1259 OID 17545)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO glen;

--
-- TOC entry 219 (class 1259 OID 16468)
-- Name: client; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO glen;

--
-- TOC entry 238 (class 1259 OID 16826)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO glen;

--
-- TOC entry 290 (class 1259 OID 17794)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO glen;

--
-- TOC entry 289 (class 1259 OID 17669)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO glen;

--
-- TOC entry 239 (class 1259 OID 16836)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO glen;

--
-- TOC entry 267 (class 1259 OID 17335)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO glen;

--
-- TOC entry 268 (class 1259 OID 17349)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO glen;

--
-- TOC entry 291 (class 1259 OID 17835)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO glen;

--
-- TOC entry 269 (class 1259 OID 17354)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO glen;

--
-- TOC entry 287 (class 1259 OID 17590)
-- Name: component; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO glen;

--
-- TOC entry 286 (class 1259 OID 17585)
-- Name: component_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO glen;

--
-- TOC entry 220 (class 1259 OID 16487)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO glen;

--
-- TOC entry 221 (class 1259 OID 16490)
-- Name: credential; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO glen;

--
-- TOC entry 218 (class 1259 OID 16460)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO glen;

--
-- TOC entry 217 (class 1259 OID 16455)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO glen;

--
-- TOC entry 292 (class 1259 OID 17851)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO glen;

--
-- TOC entry 222 (class 1259 OID 16495)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO glen;

--
-- TOC entry 280 (class 1259 OID 17550)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO glen;

--
-- TOC entry 281 (class 1259 OID 17555)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO glen;

--
-- TOC entry 294 (class 1259 OID 17877)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO glen;

--
-- TOC entry 282 (class 1259 OID 17564)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO glen;

--
-- TOC entry 283 (class 1259 OID 17573)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO glen;

--
-- TOC entry 284 (class 1259 OID 17576)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO glen;

--
-- TOC entry 285 (class 1259 OID 17582)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO glen;

--
-- TOC entry 242 (class 1259 OID 16872)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO glen;

--
-- TOC entry 288 (class 1259 OID 17647)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO glen;

--
-- TOC entry 264 (class 1259 OID 17274)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO glen;

--
-- TOC entry 263 (class 1259 OID 17271)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO glen;

--
-- TOC entry 243 (class 1259 OID 16877)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO glen;

--
-- TOC entry 244 (class 1259 OID 16886)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO glen;

--
-- TOC entry 248 (class 1259 OID 16990)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO glen;

--
-- TOC entry 249 (class 1259 OID 16995)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO glen;

--
-- TOC entry 303 (class 1259 OID 18076)
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO glen;

--
-- TOC entry 262 (class 1259 OID 17268)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO glen;

--
-- TOC entry 223 (class 1259 OID 16503)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO glen;

--
-- TOC entry 247 (class 1259 OID 16987)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO glen;

--
-- TOC entry 261 (class 1259 OID 17259)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO glen;

--
-- TOC entry 260 (class 1259 OID 17254)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO glen;

--
-- TOC entry 300 (class 1259 OID 18039)
-- Name: org; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO glen;

--
-- TOC entry 301 (class 1259 OID 18050)
-- Name: org_domain; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO glen;

--
-- TOC entry 274 (class 1259 OID 17473)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO glen;

--
-- TOC entry 240 (class 1259 OID 16861)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO glen;

--
-- TOC entry 241 (class 1259 OID 16867)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO glen;

--
-- TOC entry 224 (class 1259 OID 16509)
-- Name: realm; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO glen;

--
-- TOC entry 225 (class 1259 OID 16526)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO glen;

--
-- TOC entry 266 (class 1259 OID 17283)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO glen;

--
-- TOC entry 246 (class 1259 OID 16979)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO glen;

--
-- TOC entry 226 (class 1259 OID 16534)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO glen;

--
-- TOC entry 299 (class 1259 OID 17985)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO glen;

--
-- TOC entry 227 (class 1259 OID 16537)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO glen;

--
-- TOC entry 228 (class 1259 OID 16544)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO glen;

--
-- TOC entry 245 (class 1259 OID 16895)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO glen;

--
-- TOC entry 229 (class 1259 OID 16554)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO glen;

--
-- TOC entry 259 (class 1259 OID 17218)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO glen;

--
-- TOC entry 258 (class 1259 OID 17211)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO glen;

--
-- TOC entry 296 (class 1259 OID 17916)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO glen;

--
-- TOC entry 276 (class 1259 OID 17500)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO glen;

--
-- TOC entry 275 (class 1259 OID 17485)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO glen;

--
-- TOC entry 270 (class 1259 OID 17423)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO glen;

--
-- TOC entry 295 (class 1259 OID 17892)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO glen;

--
-- TOC entry 273 (class 1259 OID 17459)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO glen;

--
-- TOC entry 271 (class 1259 OID 17431)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO glen;

--
-- TOC entry 272 (class 1259 OID 17445)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO glen;

--
-- TOC entry 297 (class 1259 OID 17934)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO glen;

--
-- TOC entry 302 (class 1259 OID 18067)
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO glen;

--
-- TOC entry 298 (class 1259 OID 17944)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO glen;

--
-- TOC entry 230 (class 1259 OID 16557)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO glen;

--
-- TOC entry 277 (class 1259 OID 17515)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO glen;

--
-- TOC entry 304 (class 1259 OID 18083)
-- Name: server_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO glen;

--
-- TOC entry 231 (class 1259 OID 16563)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO glen;

--
-- TOC entry 250 (class 1259 OID 17000)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO glen;

--
-- TOC entry 293 (class 1259 OID 17867)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO glen;

--
-- TOC entry 232 (class 1259 OID 16568)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO glen;

--
-- TOC entry 233 (class 1259 OID 16576)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO glen;

--
-- TOC entry 256 (class 1259 OID 17112)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO glen;

--
-- TOC entry 257 (class 1259 OID 17117)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO glen;

--
-- TOC entry 234 (class 1259 OID 16581)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO glen;

--
-- TOC entry 265 (class 1259 OID 17280)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO glen;

--
-- TOC entry 235 (class 1259 OID 16586)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO glen;

--
-- TOC entry 236 (class 1259 OID 16589)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO glen;

--
-- TOC entry 237 (class 1259 OID 16603)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: glen
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO glen;

--
-- TOC entry 4183 (class 0 OID 17087)
-- Dependencies: 251
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
e9de3c5f-150c-443b-8b5c-72c1aaec9438	1748139240510	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	UPDATE	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	events/config	\N	\N	REALM	\N
88ff2c3e-9832-49bc-8282-ea34f172e754	1748139242667	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	UPDATE	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	events/config	\N	\N	REALM	\N
349f2a35-4ce2-4d6a-b9d0-bc3b4dfd1a90	1748139433070	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	CREATE	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	users/afbb4fcb-bc27-4e00-9464-4bf52b95a90c	\N	\N	USER	\N
13bce0fe-9ace-40eb-a05f-9b01178a2826	1748139448410	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	ACTION	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	users/afbb4fcb-bc27-4e00-9464-4bf52b95a90c/reset-password	\N	\N	USER	\N
aca28820-94e3-46ee-a497-b8cfcf760903	1748161500250	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	CREATE	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	users/028c2e41-72ef-455c-babf-de985b602f26	\N	\N	USER	\N
1a65ce3d-c223-4757-814d-a640e87d6c6a	1748161553790	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	ACTION	c0efcdfc-c15a-41ad-9d15-0924755dd430	6d7aa9b5-d484-4fc4-b852-2180de020dc2	5c5484ff-f91e-475f-b10d-735c37e21672	172.19.0.1	users/028c2e41-72ef-455c-babf-de985b602f26/reset-password	\N	\N	USER	\N
\.


--
-- TOC entry 4210 (class 0 OID 17530)
-- Dependencies: 278
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4186 (class 0 OID 17102)
-- Dependencies: 254
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
8cb55d10-2822-4e12-be6d-2e66981aa288	\N	auth-cookie	c0efcdfc-c15a-41ad-9d15-0924755dd430	18aaad31-af93-47cb-98ec-2c430896a89b	2	10	f	\N	\N
d132c94d-d6de-4d15-acc4-5bb6fc7e5ce6	\N	auth-spnego	c0efcdfc-c15a-41ad-9d15-0924755dd430	18aaad31-af93-47cb-98ec-2c430896a89b	3	20	f	\N	\N
cb8c92dd-a40a-45e7-9e75-0600c0af5e06	\N	identity-provider-redirector	c0efcdfc-c15a-41ad-9d15-0924755dd430	18aaad31-af93-47cb-98ec-2c430896a89b	2	25	f	\N	\N
8afc8df1-ccd0-48f9-a56c-4b860b8ce566	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	18aaad31-af93-47cb-98ec-2c430896a89b	2	30	t	1534b9d4-90cf-492a-b644-407eceaa2dd9	\N
b5ced748-3167-4633-b39d-831d9b5cdf0b	\N	auth-username-password-form	c0efcdfc-c15a-41ad-9d15-0924755dd430	1534b9d4-90cf-492a-b644-407eceaa2dd9	0	10	f	\N	\N
d02d6de8-5aad-490f-80d2-f7cdb2668f05	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	1534b9d4-90cf-492a-b644-407eceaa2dd9	1	20	t	272eb2d3-57b3-498f-ba47-a6e7f4d899c5	\N
8e5acd01-a1b9-4180-9e1e-e21a4af24812	\N	conditional-user-configured	c0efcdfc-c15a-41ad-9d15-0924755dd430	272eb2d3-57b3-498f-ba47-a6e7f4d899c5	0	10	f	\N	\N
bee5913f-adf2-42e3-926e-09ff4b2609a3	\N	auth-otp-form	c0efcdfc-c15a-41ad-9d15-0924755dd430	272eb2d3-57b3-498f-ba47-a6e7f4d899c5	0	20	f	\N	\N
93bd37dc-3f8a-46a4-99b1-e41a1b89f05d	\N	direct-grant-validate-username	c0efcdfc-c15a-41ad-9d15-0924755dd430	4e9739de-4e72-4b4f-a9f4-e4a918c10950	0	10	f	\N	\N
3bb8b1ef-0bb4-45ff-82d1-8d42f72b1be3	\N	direct-grant-validate-password	c0efcdfc-c15a-41ad-9d15-0924755dd430	4e9739de-4e72-4b4f-a9f4-e4a918c10950	0	20	f	\N	\N
4e0df727-ece6-46ef-ab91-45679ca2a7e9	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	4e9739de-4e72-4b4f-a9f4-e4a918c10950	1	30	t	930b4ae8-6b81-489b-8133-8e1b31f9ec8c	\N
82be45f5-9b39-4c8d-a8d2-07cdaf02ca9b	\N	conditional-user-configured	c0efcdfc-c15a-41ad-9d15-0924755dd430	930b4ae8-6b81-489b-8133-8e1b31f9ec8c	0	10	f	\N	\N
0759b102-46e9-4c88-8e1e-0e9843802657	\N	direct-grant-validate-otp	c0efcdfc-c15a-41ad-9d15-0924755dd430	930b4ae8-6b81-489b-8133-8e1b31f9ec8c	0	20	f	\N	\N
151c7a15-221d-432a-ac08-c254890aef08	\N	registration-page-form	c0efcdfc-c15a-41ad-9d15-0924755dd430	251b1ebb-6d53-4266-93ce-ef3bab9f239e	0	10	t	e8eb2c86-f285-46e6-a0b0-228a866eea23	\N
8cf00e24-480b-4ff1-a25e-dfbc7c75d2b5	\N	registration-user-creation	c0efcdfc-c15a-41ad-9d15-0924755dd430	e8eb2c86-f285-46e6-a0b0-228a866eea23	0	20	f	\N	\N
6070acf7-f637-4036-8276-efe10d281ba7	\N	registration-password-action	c0efcdfc-c15a-41ad-9d15-0924755dd430	e8eb2c86-f285-46e6-a0b0-228a866eea23	0	50	f	\N	\N
d9689764-d3c2-4f8d-aeb0-700bd77c6feb	\N	registration-recaptcha-action	c0efcdfc-c15a-41ad-9d15-0924755dd430	e8eb2c86-f285-46e6-a0b0-228a866eea23	3	60	f	\N	\N
d69b1fac-6f25-4c24-946b-e35c92b84246	\N	registration-terms-and-conditions	c0efcdfc-c15a-41ad-9d15-0924755dd430	e8eb2c86-f285-46e6-a0b0-228a866eea23	3	70	f	\N	\N
1aeefbf7-1252-4e4c-8f2a-1dfe4d7667ea	\N	reset-credentials-choose-user	c0efcdfc-c15a-41ad-9d15-0924755dd430	85f584f2-a4e6-41e9-824e-3f28c608f4df	0	10	f	\N	\N
268f8936-f1a4-40f9-ac7f-9ad644d3a228	\N	reset-credential-email	c0efcdfc-c15a-41ad-9d15-0924755dd430	85f584f2-a4e6-41e9-824e-3f28c608f4df	0	20	f	\N	\N
2b20c9d7-d7ae-41ce-b414-8b8aef312959	\N	reset-password	c0efcdfc-c15a-41ad-9d15-0924755dd430	85f584f2-a4e6-41e9-824e-3f28c608f4df	0	30	f	\N	\N
adb53781-5006-40bc-ac74-d6cd2564d2eb	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	85f584f2-a4e6-41e9-824e-3f28c608f4df	1	40	t	bc1b3ed1-47ec-4333-a626-89d3e0b3c626	\N
718da1ea-d371-4d89-a6e8-0a29bb6c13df	\N	conditional-user-configured	c0efcdfc-c15a-41ad-9d15-0924755dd430	bc1b3ed1-47ec-4333-a626-89d3e0b3c626	0	10	f	\N	\N
32a5cb54-4525-484c-8cd1-41ee3ef839a0	\N	reset-otp	c0efcdfc-c15a-41ad-9d15-0924755dd430	bc1b3ed1-47ec-4333-a626-89d3e0b3c626	0	20	f	\N	\N
e8fb8685-e1e9-4b1a-92b5-a380b2a9a771	\N	client-secret	c0efcdfc-c15a-41ad-9d15-0924755dd430	950312c2-8bca-41a3-8a5c-999f5cf452bb	2	10	f	\N	\N
6e201dfe-fa09-4134-942f-d70e65914080	\N	client-jwt	c0efcdfc-c15a-41ad-9d15-0924755dd430	950312c2-8bca-41a3-8a5c-999f5cf452bb	2	20	f	\N	\N
95fc79f6-f881-48d3-8e7e-73363f3c2f1a	\N	client-secret-jwt	c0efcdfc-c15a-41ad-9d15-0924755dd430	950312c2-8bca-41a3-8a5c-999f5cf452bb	2	30	f	\N	\N
7c2ef0f1-78d5-4ccb-ab59-35abd89bbad1	\N	client-x509	c0efcdfc-c15a-41ad-9d15-0924755dd430	950312c2-8bca-41a3-8a5c-999f5cf452bb	2	40	f	\N	\N
9c4356a8-e6a2-4106-8e6d-6cc5835c4f5d	\N	idp-review-profile	c0efcdfc-c15a-41ad-9d15-0924755dd430	33e7d1ad-2193-4fb1-8078-924586654f69	0	10	f	\N	13b70e92-6601-4ae5-9db1-b06d24beb991
bd918166-6382-49fb-9adc-806c1768877e	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	33e7d1ad-2193-4fb1-8078-924586654f69	0	20	t	0a8f9e66-f91f-4ca6-b2c6-b4b9098261fd	\N
2a06999a-2d6b-4585-804a-c5534d1a3a55	\N	idp-create-user-if-unique	c0efcdfc-c15a-41ad-9d15-0924755dd430	0a8f9e66-f91f-4ca6-b2c6-b4b9098261fd	2	10	f	\N	d8f75320-994c-4deb-989e-a0edb943a0bb
05d6ff6d-0c27-4785-a08f-253c8307db8e	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	0a8f9e66-f91f-4ca6-b2c6-b4b9098261fd	2	20	t	27f8677a-9211-48de-98d5-df34b858a41c	\N
5afcf057-90bd-45fe-ab98-dc8bab7c7a72	\N	idp-confirm-link	c0efcdfc-c15a-41ad-9d15-0924755dd430	27f8677a-9211-48de-98d5-df34b858a41c	0	10	f	\N	\N
3389ffeb-8e62-490c-9970-16087875d686	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	27f8677a-9211-48de-98d5-df34b858a41c	0	20	t	d3c46741-e4b8-4a81-a3e3-3f99225a55b7	\N
ae2e1fb1-6628-4fda-826b-743d56350a0e	\N	idp-email-verification	c0efcdfc-c15a-41ad-9d15-0924755dd430	d3c46741-e4b8-4a81-a3e3-3f99225a55b7	2	10	f	\N	\N
883ba212-06f1-4944-9948-182644cbc56c	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	d3c46741-e4b8-4a81-a3e3-3f99225a55b7	2	20	t	ea5b524a-fe23-404a-ae81-733366eee39e	\N
ec613b1d-7501-4418-8a4b-34ef404a8da7	\N	idp-username-password-form	c0efcdfc-c15a-41ad-9d15-0924755dd430	ea5b524a-fe23-404a-ae81-733366eee39e	0	10	f	\N	\N
ab5c112f-332e-4a41-8f87-e72ec781504a	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	ea5b524a-fe23-404a-ae81-733366eee39e	1	20	t	11304763-2372-405b-baa7-802cb1228121	\N
a1849fab-850a-488d-9b7d-60db1f4cb6be	\N	conditional-user-configured	c0efcdfc-c15a-41ad-9d15-0924755dd430	11304763-2372-405b-baa7-802cb1228121	0	10	f	\N	\N
459bc1ef-a305-4078-ae7e-567ce2fda780	\N	auth-otp-form	c0efcdfc-c15a-41ad-9d15-0924755dd430	11304763-2372-405b-baa7-802cb1228121	0	20	f	\N	\N
455d2db9-bfc4-4813-800b-355b77d26b28	\N	http-basic-authenticator	c0efcdfc-c15a-41ad-9d15-0924755dd430	904499b1-3cbf-43b8-b8f2-33c83a1969e3	0	10	f	\N	\N
ba2e16ee-e02f-4ed8-8d98-9cb668cbf63d	\N	docker-http-basic-authenticator	c0efcdfc-c15a-41ad-9d15-0924755dd430	8ab8688e-dd15-45a2-847c-94cf0fd28e1f	0	10	f	\N	\N
9760207c-8a3e-4b56-8c5f-3f011abfca87	\N	auth-cookie	412b6f06-a54b-491c-b77d-502a467beac2	84fc32c1-1289-4a39-a0f7-e5ecefff59de	2	10	f	\N	\N
6615bda4-4bf9-44bf-be6a-c4e7023d3789	\N	auth-spnego	412b6f06-a54b-491c-b77d-502a467beac2	84fc32c1-1289-4a39-a0f7-e5ecefff59de	3	20	f	\N	\N
a2cb0643-7ca9-4cc8-a08c-0469c7977f14	\N	identity-provider-redirector	412b6f06-a54b-491c-b77d-502a467beac2	84fc32c1-1289-4a39-a0f7-e5ecefff59de	2	25	f	\N	\N
2378e811-9112-4d28-99a2-b7b26238e727	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	84fc32c1-1289-4a39-a0f7-e5ecefff59de	2	30	t	50e7d199-3d69-4f01-aa8d-eb0f453657fb	\N
92adf278-6025-4e54-9eb1-d94544e6ac46	\N	auth-username-password-form	412b6f06-a54b-491c-b77d-502a467beac2	50e7d199-3d69-4f01-aa8d-eb0f453657fb	0	10	f	\N	\N
5a1abbf3-6dbf-4313-8f64-2834651d9785	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	50e7d199-3d69-4f01-aa8d-eb0f453657fb	1	20	t	a32ef3bc-2c50-40e5-9080-4d65e896acf5	\N
3cdb4c63-3a62-4323-9093-a892557e07e4	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	a32ef3bc-2c50-40e5-9080-4d65e896acf5	0	10	f	\N	\N
fe6eb150-8157-4a09-80d3-4e5c3e6ef2f2	\N	auth-otp-form	412b6f06-a54b-491c-b77d-502a467beac2	a32ef3bc-2c50-40e5-9080-4d65e896acf5	0	20	f	\N	\N
0d12f410-efa5-4e0c-bbec-1477db8a955a	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	84fc32c1-1289-4a39-a0f7-e5ecefff59de	2	26	t	5fd1e210-8dc1-46e7-b6f8-84855ae8432c	\N
baa3acef-2b31-4c2f-95d6-f39e6d74d0f2	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	5fd1e210-8dc1-46e7-b6f8-84855ae8432c	1	10	t	4b504836-b32d-42f5-a9c0-afc590adc9ae	\N
4904e065-fea9-4715-a597-feb9dbe07c2c	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	4b504836-b32d-42f5-a9c0-afc590adc9ae	0	10	f	\N	\N
f7a7a4a7-5476-46a4-b832-338ddd4cab50	\N	organization	412b6f06-a54b-491c-b77d-502a467beac2	4b504836-b32d-42f5-a9c0-afc590adc9ae	2	20	f	\N	\N
09f5bfc9-af16-4487-a139-6f7e9e0f8440	\N	direct-grant-validate-username	412b6f06-a54b-491c-b77d-502a467beac2	c17bcdb8-ef1e-4267-ba6f-4da81a28f40f	0	10	f	\N	\N
03aef85c-c251-4545-b624-4275df31b423	\N	direct-grant-validate-password	412b6f06-a54b-491c-b77d-502a467beac2	c17bcdb8-ef1e-4267-ba6f-4da81a28f40f	0	20	f	\N	\N
119b20d2-9789-4d68-be94-b5082ffe7235	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	c17bcdb8-ef1e-4267-ba6f-4da81a28f40f	1	30	t	e8f8f1da-f86e-449b-9c46-e5eb2b383915	\N
32e2da61-5b52-48c6-a26f-cfbf8e678a52	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	e8f8f1da-f86e-449b-9c46-e5eb2b383915	0	10	f	\N	\N
dfc9e3a9-5e28-40e7-849a-f597e26ce07d	\N	direct-grant-validate-otp	412b6f06-a54b-491c-b77d-502a467beac2	e8f8f1da-f86e-449b-9c46-e5eb2b383915	0	20	f	\N	\N
1803a89a-0825-431a-b461-7a4801dc8a0c	\N	registration-page-form	412b6f06-a54b-491c-b77d-502a467beac2	7084e6e6-67f0-4db2-9738-8909d4a4be1a	0	10	t	e48bbd77-7737-4872-9546-d2a8e0f93144	\N
0a4e671c-396b-4417-bc9c-f5772d21b175	\N	registration-user-creation	412b6f06-a54b-491c-b77d-502a467beac2	e48bbd77-7737-4872-9546-d2a8e0f93144	0	20	f	\N	\N
48d669b8-6033-45a5-a7f0-6d8bf7d272cf	\N	registration-password-action	412b6f06-a54b-491c-b77d-502a467beac2	e48bbd77-7737-4872-9546-d2a8e0f93144	0	50	f	\N	\N
c6ab3c22-5ca1-4fb6-a3d3-95cf1a482b72	\N	registration-recaptcha-action	412b6f06-a54b-491c-b77d-502a467beac2	e48bbd77-7737-4872-9546-d2a8e0f93144	3	60	f	\N	\N
5bb7ba08-0e19-4c92-bcd0-339b9a41e8d2	\N	registration-terms-and-conditions	412b6f06-a54b-491c-b77d-502a467beac2	e48bbd77-7737-4872-9546-d2a8e0f93144	3	70	f	\N	\N
78fe90f3-4ca7-4b21-bde4-0b8c1b9324c5	\N	reset-credentials-choose-user	412b6f06-a54b-491c-b77d-502a467beac2	81204c25-b804-423c-a57f-4e488b397df6	0	10	f	\N	\N
0d29849b-e5fc-41fe-9274-f7167b768f25	\N	reset-credential-email	412b6f06-a54b-491c-b77d-502a467beac2	81204c25-b804-423c-a57f-4e488b397df6	0	20	f	\N	\N
0a0b841d-5c56-49cb-8b09-e365d67be5e1	\N	reset-password	412b6f06-a54b-491c-b77d-502a467beac2	81204c25-b804-423c-a57f-4e488b397df6	0	30	f	\N	\N
b1378807-497e-4913-a065-0635a0ec78aa	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	81204c25-b804-423c-a57f-4e488b397df6	1	40	t	3d31d7fe-e805-4868-9d6b-0bfc6ca39684	\N
7cf8474f-c63d-44c6-9d68-ccca33e6cd48	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	3d31d7fe-e805-4868-9d6b-0bfc6ca39684	0	10	f	\N	\N
63044681-0f9f-4e83-91db-8ea2b5dab033	\N	reset-otp	412b6f06-a54b-491c-b77d-502a467beac2	3d31d7fe-e805-4868-9d6b-0bfc6ca39684	0	20	f	\N	\N
36308da2-f983-40d0-ae43-754807500ba9	\N	client-secret	412b6f06-a54b-491c-b77d-502a467beac2	eaf0b0e5-d78f-450f-a748-05cee2ac3519	2	10	f	\N	\N
a400cf20-c294-4cfc-90eb-9171345175f1	\N	client-jwt	412b6f06-a54b-491c-b77d-502a467beac2	eaf0b0e5-d78f-450f-a748-05cee2ac3519	2	20	f	\N	\N
f7cc1c8a-2e75-415e-8671-961cab13a01d	\N	client-secret-jwt	412b6f06-a54b-491c-b77d-502a467beac2	eaf0b0e5-d78f-450f-a748-05cee2ac3519	2	30	f	\N	\N
90ef82e2-7f09-4985-b7a0-0e4f5c052045	\N	client-x509	412b6f06-a54b-491c-b77d-502a467beac2	eaf0b0e5-d78f-450f-a748-05cee2ac3519	2	40	f	\N	\N
618d0088-a4ce-4d9c-86e4-c0d000fc8284	\N	idp-review-profile	412b6f06-a54b-491c-b77d-502a467beac2	52f83214-2dd1-4a29-a38a-3568599845d8	0	10	f	\N	67f518b8-3141-45d4-8685-bf28384a9572
65d0cae9-9c45-4937-bc8d-1cdda5752ee0	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	52f83214-2dd1-4a29-a38a-3568599845d8	0	20	t	bf7b6347-cd2c-4a18-9de9-d8f0e2523e6b	\N
f8cbb4c9-4ed2-4334-9a64-d852dc2d6783	\N	idp-create-user-if-unique	412b6f06-a54b-491c-b77d-502a467beac2	bf7b6347-cd2c-4a18-9de9-d8f0e2523e6b	2	10	f	\N	fa91d528-89bb-4975-87bd-498c922b44bb
ef6fd72e-b2cb-44dc-8c48-4a3829a25efc	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	bf7b6347-cd2c-4a18-9de9-d8f0e2523e6b	2	20	t	f5f9e2fd-1263-4572-b65c-4b1a70ebd359	\N
b9c0e92b-e5fb-458a-9ce0-32bf3f8a1a80	\N	idp-confirm-link	412b6f06-a54b-491c-b77d-502a467beac2	f5f9e2fd-1263-4572-b65c-4b1a70ebd359	0	10	f	\N	\N
d3edd609-8b9c-4db3-a8a3-f01a04c8fc20	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	f5f9e2fd-1263-4572-b65c-4b1a70ebd359	0	20	t	96a93f1a-a2f7-4f3a-8c13-ca414c2efb22	\N
ece58ccc-ef4c-466c-996d-53ad4e39b37b	\N	idp-email-verification	412b6f06-a54b-491c-b77d-502a467beac2	96a93f1a-a2f7-4f3a-8c13-ca414c2efb22	2	10	f	\N	\N
be4327a8-38bb-4917-b17c-32f4b394b0f7	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	96a93f1a-a2f7-4f3a-8c13-ca414c2efb22	2	20	t	f684b2bb-f722-47e5-9a0d-3a86120fad0b	\N
de70fc42-c2be-42df-9692-97eef38d72fa	\N	idp-username-password-form	412b6f06-a54b-491c-b77d-502a467beac2	f684b2bb-f722-47e5-9a0d-3a86120fad0b	0	10	f	\N	\N
b63765ed-da2c-49e6-b849-ea65d378a5d4	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	f684b2bb-f722-47e5-9a0d-3a86120fad0b	1	20	t	c36f0c17-042f-43d5-9d4a-1d503bc6a89b	\N
0eccaf6c-e276-4058-b616-d76ed7a06541	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	c36f0c17-042f-43d5-9d4a-1d503bc6a89b	0	10	f	\N	\N
ef38c7e9-bf41-4463-9ab4-7546144bf54d	\N	auth-otp-form	412b6f06-a54b-491c-b77d-502a467beac2	c36f0c17-042f-43d5-9d4a-1d503bc6a89b	0	20	f	\N	\N
0f26b4e0-05f4-453d-a644-c8aee0467c4c	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	52f83214-2dd1-4a29-a38a-3568599845d8	1	50	t	07ef36d2-81e6-4460-839c-208022e9670c	\N
8b9e7f8d-e484-4990-aa4d-b3ab451a2d72	\N	conditional-user-configured	412b6f06-a54b-491c-b77d-502a467beac2	07ef36d2-81e6-4460-839c-208022e9670c	0	10	f	\N	\N
dcad1b74-cced-4648-8b81-aaff6efea361	\N	idp-add-organization-member	412b6f06-a54b-491c-b77d-502a467beac2	07ef36d2-81e6-4460-839c-208022e9670c	0	20	f	\N	\N
4c328449-31f9-4e3d-9d34-681dc49ca9b3	\N	http-basic-authenticator	412b6f06-a54b-491c-b77d-502a467beac2	35b7b2a7-3634-4a21-91dc-bf8e78ac7e58	0	10	f	\N	\N
a2ff85b3-2f0d-4491-b7cb-e04ddce7f9ad	\N	docker-http-basic-authenticator	412b6f06-a54b-491c-b77d-502a467beac2	cb3d7131-adfb-418d-9798-c703480b0973	0	10	f	\N	\N
\.


--
-- TOC entry 4185 (class 0 OID 17097)
-- Dependencies: 253
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
18aaad31-af93-47cb-98ec-2c430896a89b	browser	Browser based authentication	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
1534b9d4-90cf-492a-b644-407eceaa2dd9	forms	Username, password, otp and other auth forms.	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
272eb2d3-57b3-498f-ba47-a6e7f4d899c5	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
4e9739de-4e72-4b4f-a9f4-e4a918c10950	direct grant	OpenID Connect Resource Owner Grant	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
930b4ae8-6b81-489b-8133-8e1b31f9ec8c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
251b1ebb-6d53-4266-93ce-ef3bab9f239e	registration	Registration flow	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
e8eb2c86-f285-46e6-a0b0-228a866eea23	registration form	Registration form	c0efcdfc-c15a-41ad-9d15-0924755dd430	form-flow	f	t
85f584f2-a4e6-41e9-824e-3f28c608f4df	reset credentials	Reset credentials for a user if they forgot their password or something	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
bc1b3ed1-47ec-4333-a626-89d3e0b3c626	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
950312c2-8bca-41a3-8a5c-999f5cf452bb	clients	Base authentication for clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	client-flow	t	t
33e7d1ad-2193-4fb1-8078-924586654f69	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
0a8f9e66-f91f-4ca6-b2c6-b4b9098261fd	User creation or linking	Flow for the existing/non-existing user alternatives	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
27f8677a-9211-48de-98d5-df34b858a41c	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
d3c46741-e4b8-4a81-a3e3-3f99225a55b7	Account verification options	Method with which to verity the existing account	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
ea5b524a-fe23-404a-ae81-733366eee39e	Verify Existing Account by Re-authentication	Reauthentication of existing account	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
11304763-2372-405b-baa7-802cb1228121	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	f	t
904499b1-3cbf-43b8-b8f2-33c83a1969e3	saml ecp	SAML ECP Profile Authentication Flow	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
8ab8688e-dd15-45a2-847c-94cf0fd28e1f	docker auth	Used by Docker clients to authenticate against the IDP	c0efcdfc-c15a-41ad-9d15-0924755dd430	basic-flow	t	t
84fc32c1-1289-4a39-a0f7-e5ecefff59de	browser	Browser based authentication	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
50e7d199-3d69-4f01-aa8d-eb0f453657fb	forms	Username, password, otp and other auth forms.	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
a32ef3bc-2c50-40e5-9080-4d65e896acf5	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
5fd1e210-8dc1-46e7-b6f8-84855ae8432c	Organization	\N	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
4b504836-b32d-42f5-a9c0-afc590adc9ae	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
c17bcdb8-ef1e-4267-ba6f-4da81a28f40f	direct grant	OpenID Connect Resource Owner Grant	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
e8f8f1da-f86e-449b-9c46-e5eb2b383915	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
7084e6e6-67f0-4db2-9738-8909d4a4be1a	registration	Registration flow	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
e48bbd77-7737-4872-9546-d2a8e0f93144	registration form	Registration form	412b6f06-a54b-491c-b77d-502a467beac2	form-flow	f	t
81204c25-b804-423c-a57f-4e488b397df6	reset credentials	Reset credentials for a user if they forgot their password or something	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
3d31d7fe-e805-4868-9d6b-0bfc6ca39684	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
eaf0b0e5-d78f-450f-a748-05cee2ac3519	clients	Base authentication for clients	412b6f06-a54b-491c-b77d-502a467beac2	client-flow	t	t
52f83214-2dd1-4a29-a38a-3568599845d8	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
bf7b6347-cd2c-4a18-9de9-d8f0e2523e6b	User creation or linking	Flow for the existing/non-existing user alternatives	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
f5f9e2fd-1263-4572-b65c-4b1a70ebd359	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
96a93f1a-a2f7-4f3a-8c13-ca414c2efb22	Account verification options	Method with which to verity the existing account	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
f684b2bb-f722-47e5-9a0d-3a86120fad0b	Verify Existing Account by Re-authentication	Reauthentication of existing account	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
c36f0c17-042f-43d5-9d4a-1d503bc6a89b	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
07ef36d2-81e6-4460-839c-208022e9670c	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	f	t
35b7b2a7-3634-4a21-91dc-bf8e78ac7e58	saml ecp	SAML ECP Profile Authentication Flow	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
cb3d7131-adfb-418d-9798-c703480b0973	docker auth	Used by Docker clients to authenticate against the IDP	412b6f06-a54b-491c-b77d-502a467beac2	basic-flow	t	t
\.


--
-- TOC entry 4184 (class 0 OID 17092)
-- Dependencies: 252
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
13b70e92-6601-4ae5-9db1-b06d24beb991	review profile config	c0efcdfc-c15a-41ad-9d15-0924755dd430
d8f75320-994c-4deb-989e-a0edb943a0bb	create unique user config	c0efcdfc-c15a-41ad-9d15-0924755dd430
67f518b8-3141-45d4-8685-bf28384a9572	review profile config	412b6f06-a54b-491c-b77d-502a467beac2
fa91d528-89bb-4975-87bd-498c922b44bb	create unique user config	412b6f06-a54b-491c-b77d-502a467beac2
\.


--
-- TOC entry 4187 (class 0 OID 17107)
-- Dependencies: 255
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
13b70e92-6601-4ae5-9db1-b06d24beb991	missing	update.profile.on.first.login
d8f75320-994c-4deb-989e-a0edb943a0bb	false	require.password.update.after.registration
67f518b8-3141-45d4-8685-bf28384a9572	missing	update.profile.on.first.login
fa91d528-89bb-4975-87bd-498c922b44bb	false	require.password.update.after.registration
\.


--
-- TOC entry 4211 (class 0 OID 17545)
-- Dependencies: 279
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 16468)
-- Dependencies: 219
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	f	master-realm	0	f	\N	\N	t	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
c9254a01-60f0-4754-a80f-780dfca4e118	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a645e24f-94f5-4bba-b863-c011a239e0fd	t	f	broker	0	f	\N	\N	t	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
aebfe588-c098-465c-8ddc-0a323d5c9202	t	t	admin-cli	0	t	\N	\N	f	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
af3e53c8-62b6-4564-946f-a7051beb1705	t	t	users-service-client	0	f	DRfJ84iZax3f77WL9op5TWp5kew0aN0V	http://localhost:8090	f	http://localhost:8090	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	-1	t	f	users-service-client	t	client-secret	http://localhost:8090	users-service-client	\N	t	f	t	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	t	t	users-service-client	0	f	dYErtBnyibuo1cz4yl4dQsW5KkPbWJFs	http://localhost:5173	f	http://localhost:5173	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	openid-connect	-1	t	f	users-service-client	t	client-secret	http://localhost:5173	users-service-client	\N	t	f	t	f
cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	f	sharecoding-realm	0	f	\N	\N	t	\N	f	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	0	f	f	sharecoding Realm	f	client-secret	\N	\N	\N	t	f	f	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	t	f	realm-management	0	f	\N	\N	t	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	f	account	0	t	\N	/realms/sharecoding/account/	f	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
c8257463-994a-4d46-917d-c8fdeca16e68	t	f	account-console	0	t	\N	/realms/sharecoding/account/	f	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	t	f	broker	0	f	\N	\N	t	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
a16c2479-61b1-42a1-9cae-24275c38c104	t	t	security-admin-console	0	t	\N	/admin/sharecoding/console/	f	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	t	t	admin-cli	0	t	\N	\N	f	\N	f	412b6f06-a54b-491c-b77d-502a467beac2	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- TOC entry 4170 (class 0 OID 16826)
-- Dependencies: 238
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
c9254a01-60f0-4754-a80f-780dfca4e118	post.logout.redirect.uris	+
d25319bf-cc27-4e00-a2d6-95bf46420b77	post.logout.redirect.uris	+
d25319bf-cc27-4e00-a2d6-95bf46420b77	pkce.code.challenge.method	S256
6d7aa9b5-d484-4fc4-b852-2180de020dc2	post.logout.redirect.uris	+
6d7aa9b5-d484-4fc4-b852-2180de020dc2	pkce.code.challenge.method	S256
6d7aa9b5-d484-4fc4-b852-2180de020dc2	client.use.lightweight.access.token.enabled	true
aebfe588-c098-465c-8ddc-0a323d5c9202	client.use.lightweight.access.token.enabled	true
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	post.logout.redirect.uris	+
c8257463-994a-4d46-917d-c8fdeca16e68	post.logout.redirect.uris	+
c8257463-994a-4d46-917d-c8fdeca16e68	pkce.code.challenge.method	S256
a16c2479-61b1-42a1-9cae-24275c38c104	post.logout.redirect.uris	+
a16c2479-61b1-42a1-9cae-24275c38c104	pkce.code.challenge.method	S256
a16c2479-61b1-42a1-9cae-24275c38c104	client.use.lightweight.access.token.enabled	true
d3df97d3-a52d-4cce-96df-4582bf8b6681	client.use.lightweight.access.token.enabled	true
af3e53c8-62b6-4564-946f-a7051beb1705	client.secret.creation.time	1748190754
af3e53c8-62b6-4564-946f-a7051beb1705	standard.token.exchange.enabled	false
af3e53c8-62b6-4564-946f-a7051beb1705	oauth2.device.authorization.grant.enabled	false
af3e53c8-62b6-4564-946f-a7051beb1705	oidc.ciba.grant.enabled	false
af3e53c8-62b6-4564-946f-a7051beb1705	backchannel.logout.session.required	true
af3e53c8-62b6-4564-946f-a7051beb1705	backchannel.logout.revoke.offline.tokens	false
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	client.secret.creation.time	1748201565
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	standard.token.exchange.enabled	false
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	oauth2.device.authorization.grant.enabled	false
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	oidc.ciba.grant.enabled	false
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	backchannel.logout.session.required	true
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	backchannel.logout.revoke.offline.tokens	false
\.


--
-- TOC entry 4222 (class 0 OID 17794)
-- Dependencies: 290
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4221 (class 0 OID 17669)
-- Dependencies: 289
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4171 (class 0 OID 16836)
-- Dependencies: 239
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4199 (class 0 OID 17335)
-- Dependencies: 267
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
81bd8af9-7561-40b0-83e9-6b4804a8aee2	offline_access	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect built-in scope: offline_access	openid-connect
171e1c41-1a0b-468a-a291-bd37514fa8bf	role_list	c0efcdfc-c15a-41ad-9d15-0924755dd430	SAML role list	saml
c1dab47a-cc18-401c-8255-c6a968082eb0	saml_organization	c0efcdfc-c15a-41ad-9d15-0924755dd430	Organization Membership	saml
371384d4-852d-4464-8682-a32857d3b727	profile	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect built-in scope: profile	openid-connect
328567a2-592c-48cd-ba80-ad072b383c66	email	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect built-in scope: email	openid-connect
60cfe998-b2f9-4dd9-a883-d31445c9404a	address	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect built-in scope: address	openid-connect
3446d078-d5d8-4dd3-afb0-967415938526	phone	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect built-in scope: phone	openid-connect
46554d78-12f4-4d92-bd47-c33c979fc244	roles	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect scope for add user roles to the access token	openid-connect
dcaa6806-251f-4b62-a505-92c78c3a51d6	web-origins	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect scope for add allowed web origins to the access token	openid-connect
bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	microprofile-jwt	c0efcdfc-c15a-41ad-9d15-0924755dd430	Microprofile - JWT built-in scope	openid-connect
9a27a6c9-25d7-4a56-8ea3-32434df12d8c	acr	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
1cf97373-e041-4227-9c60-a04d6ad51336	basic	c0efcdfc-c15a-41ad-9d15-0924755dd430	OpenID Connect scope for add all basic claims to the token	openid-connect
5ab8cb13-13cb-44d8-80a5-72297556cddf	service_account	c0efcdfc-c15a-41ad-9d15-0924755dd430	Specific scope for a client enabled for service accounts	openid-connect
259cf9a7-7387-4998-881a-553a0f2612b6	organization	c0efcdfc-c15a-41ad-9d15-0924755dd430	Additional claims about the organization a subject belongs to	openid-connect
5c5a3e63-832d-42f5-8497-0fe839ab237a	role_list	412b6f06-a54b-491c-b77d-502a467beac2	SAML role list	saml
00e461ed-e697-4f31-8928-caa9ccee6935	saml_organization	412b6f06-a54b-491c-b77d-502a467beac2	Organization Membership	saml
020831f6-773a-444e-9359-874ac4c224b5	profile	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect built-in scope: profile	openid-connect
2b773cdb-8237-400a-bb56-5f8ede643204	email	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect built-in scope: email	openid-connect
6ef90676-1a21-451e-b7c9-55abeaf31bdd	address	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect built-in scope: address	openid-connect
26792bcd-7e3d-4540-bd16-4a9d17d780d9	phone	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect built-in scope: phone	openid-connect
c9e966c6-b7b5-49fc-8cb2-59fb3212b472	roles	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect scope for add user roles to the access token	openid-connect
afd3b3a3-acec-439d-9873-7d1bbe22a781	offline_access	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect built-in scope: offline_access	openid-connect
47b72aff-a054-438a-98aa-c53fd7ec268f	web-origins	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect scope for add allowed web origins to the access token	openid-connect
8c8af517-9cc8-4314-93f9-d6f1e00984c0	microprofile-jwt	412b6f06-a54b-491c-b77d-502a467beac2	Microprofile - JWT built-in scope	openid-connect
890f0f9a-7baa-4210-9550-6b414770325b	acr	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
e24f3648-4cf6-488a-b9b9-15190729f9e8	basic	412b6f06-a54b-491c-b77d-502a467beac2	OpenID Connect scope for add all basic claims to the token	openid-connect
67cdc822-9b64-472a-9741-ee46205f20f4	service_account	412b6f06-a54b-491c-b77d-502a467beac2	Specific scope for a client enabled for service accounts	openid-connect
4c939064-1c95-47e6-8ae5-a166d88b1450	organization	412b6f06-a54b-491c-b77d-502a467beac2	Additional claims about the organization a subject belongs to	openid-connect
76bc7c54-6e7f-4334-ad82-9d51b5859ba5	user-attributes	c0efcdfc-c15a-41ad-9d15-0924755dd430	user-attributes	openid-connect
f34dde60-d64c-4682-84a4-bf19c52cbf15	user-attributes	412b6f06-a54b-491c-b77d-502a467beac2		openid-connect
\.


--
-- TOC entry 4200 (class 0 OID 17349)
-- Dependencies: 268
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
81bd8af9-7561-40b0-83e9-6b4804a8aee2	true	display.on.consent.screen
81bd8af9-7561-40b0-83e9-6b4804a8aee2	${offlineAccessScopeConsentText}	consent.screen.text
171e1c41-1a0b-468a-a291-bd37514fa8bf	true	display.on.consent.screen
171e1c41-1a0b-468a-a291-bd37514fa8bf	${samlRoleListScopeConsentText}	consent.screen.text
c1dab47a-cc18-401c-8255-c6a968082eb0	false	display.on.consent.screen
371384d4-852d-4464-8682-a32857d3b727	true	display.on.consent.screen
371384d4-852d-4464-8682-a32857d3b727	${profileScopeConsentText}	consent.screen.text
371384d4-852d-4464-8682-a32857d3b727	true	include.in.token.scope
328567a2-592c-48cd-ba80-ad072b383c66	true	display.on.consent.screen
328567a2-592c-48cd-ba80-ad072b383c66	${emailScopeConsentText}	consent.screen.text
328567a2-592c-48cd-ba80-ad072b383c66	true	include.in.token.scope
60cfe998-b2f9-4dd9-a883-d31445c9404a	true	display.on.consent.screen
60cfe998-b2f9-4dd9-a883-d31445c9404a	${addressScopeConsentText}	consent.screen.text
60cfe998-b2f9-4dd9-a883-d31445c9404a	true	include.in.token.scope
3446d078-d5d8-4dd3-afb0-967415938526	true	display.on.consent.screen
3446d078-d5d8-4dd3-afb0-967415938526	${phoneScopeConsentText}	consent.screen.text
3446d078-d5d8-4dd3-afb0-967415938526	true	include.in.token.scope
46554d78-12f4-4d92-bd47-c33c979fc244	true	display.on.consent.screen
46554d78-12f4-4d92-bd47-c33c979fc244	${rolesScopeConsentText}	consent.screen.text
46554d78-12f4-4d92-bd47-c33c979fc244	false	include.in.token.scope
dcaa6806-251f-4b62-a505-92c78c3a51d6	false	display.on.consent.screen
dcaa6806-251f-4b62-a505-92c78c3a51d6		consent.screen.text
dcaa6806-251f-4b62-a505-92c78c3a51d6	false	include.in.token.scope
bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	false	display.on.consent.screen
bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	true	include.in.token.scope
9a27a6c9-25d7-4a56-8ea3-32434df12d8c	false	display.on.consent.screen
9a27a6c9-25d7-4a56-8ea3-32434df12d8c	false	include.in.token.scope
1cf97373-e041-4227-9c60-a04d6ad51336	false	display.on.consent.screen
1cf97373-e041-4227-9c60-a04d6ad51336	false	include.in.token.scope
5ab8cb13-13cb-44d8-80a5-72297556cddf	false	display.on.consent.screen
5ab8cb13-13cb-44d8-80a5-72297556cddf	false	include.in.token.scope
259cf9a7-7387-4998-881a-553a0f2612b6	true	display.on.consent.screen
259cf9a7-7387-4998-881a-553a0f2612b6	${organizationScopeConsentText}	consent.screen.text
259cf9a7-7387-4998-881a-553a0f2612b6	true	include.in.token.scope
afd3b3a3-acec-439d-9873-7d1bbe22a781	true	display.on.consent.screen
afd3b3a3-acec-439d-9873-7d1bbe22a781	${offlineAccessScopeConsentText}	consent.screen.text
5c5a3e63-832d-42f5-8497-0fe839ab237a	true	display.on.consent.screen
5c5a3e63-832d-42f5-8497-0fe839ab237a	${samlRoleListScopeConsentText}	consent.screen.text
00e461ed-e697-4f31-8928-caa9ccee6935	false	display.on.consent.screen
020831f6-773a-444e-9359-874ac4c224b5	true	display.on.consent.screen
020831f6-773a-444e-9359-874ac4c224b5	${profileScopeConsentText}	consent.screen.text
020831f6-773a-444e-9359-874ac4c224b5	true	include.in.token.scope
2b773cdb-8237-400a-bb56-5f8ede643204	true	display.on.consent.screen
2b773cdb-8237-400a-bb56-5f8ede643204	${emailScopeConsentText}	consent.screen.text
2b773cdb-8237-400a-bb56-5f8ede643204	true	include.in.token.scope
6ef90676-1a21-451e-b7c9-55abeaf31bdd	true	display.on.consent.screen
6ef90676-1a21-451e-b7c9-55abeaf31bdd	${addressScopeConsentText}	consent.screen.text
6ef90676-1a21-451e-b7c9-55abeaf31bdd	true	include.in.token.scope
26792bcd-7e3d-4540-bd16-4a9d17d780d9	true	display.on.consent.screen
26792bcd-7e3d-4540-bd16-4a9d17d780d9	${phoneScopeConsentText}	consent.screen.text
26792bcd-7e3d-4540-bd16-4a9d17d780d9	true	include.in.token.scope
c9e966c6-b7b5-49fc-8cb2-59fb3212b472	true	display.on.consent.screen
c9e966c6-b7b5-49fc-8cb2-59fb3212b472	${rolesScopeConsentText}	consent.screen.text
c9e966c6-b7b5-49fc-8cb2-59fb3212b472	false	include.in.token.scope
47b72aff-a054-438a-98aa-c53fd7ec268f	false	display.on.consent.screen
47b72aff-a054-438a-98aa-c53fd7ec268f		consent.screen.text
47b72aff-a054-438a-98aa-c53fd7ec268f	false	include.in.token.scope
8c8af517-9cc8-4314-93f9-d6f1e00984c0	false	display.on.consent.screen
8c8af517-9cc8-4314-93f9-d6f1e00984c0	true	include.in.token.scope
890f0f9a-7baa-4210-9550-6b414770325b	false	display.on.consent.screen
890f0f9a-7baa-4210-9550-6b414770325b	false	include.in.token.scope
e24f3648-4cf6-488a-b9b9-15190729f9e8	false	display.on.consent.screen
e24f3648-4cf6-488a-b9b9-15190729f9e8	false	include.in.token.scope
67cdc822-9b64-472a-9741-ee46205f20f4	false	display.on.consent.screen
67cdc822-9b64-472a-9741-ee46205f20f4	false	include.in.token.scope
4c939064-1c95-47e6-8ae5-a166d88b1450	true	display.on.consent.screen
4c939064-1c95-47e6-8ae5-a166d88b1450	${organizationScopeConsentText}	consent.screen.text
4c939064-1c95-47e6-8ae5-a166d88b1450	true	include.in.token.scope
76bc7c54-6e7f-4334-ad82-9d51b5859ba5	false	display.on.consent.screen
76bc7c54-6e7f-4334-ad82-9d51b5859ba5		consent.screen.text
76bc7c54-6e7f-4334-ad82-9d51b5859ba5	false	include.in.token.scope
76bc7c54-6e7f-4334-ad82-9d51b5859ba5		gui.order
f34dde60-d64c-4682-84a4-bf19c52cbf15	true	display.on.consent.screen
f34dde60-d64c-4682-84a4-bf19c52cbf15		consent.screen.text
f34dde60-d64c-4682-84a4-bf19c52cbf15	false	include.in.token.scope
f34dde60-d64c-4682-84a4-bf19c52cbf15		gui.order
\.


--
-- TOC entry 4223 (class 0 OID 17835)
-- Dependencies: 291
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
c9254a01-60f0-4754-a80f-780dfca4e118	328567a2-592c-48cd-ba80-ad072b383c66	t
c9254a01-60f0-4754-a80f-780dfca4e118	1cf97373-e041-4227-9c60-a04d6ad51336	t
c9254a01-60f0-4754-a80f-780dfca4e118	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
c9254a01-60f0-4754-a80f-780dfca4e118	371384d4-852d-4464-8682-a32857d3b727	t
c9254a01-60f0-4754-a80f-780dfca4e118	46554d78-12f4-4d92-bd47-c33c979fc244	t
c9254a01-60f0-4754-a80f-780dfca4e118	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
c9254a01-60f0-4754-a80f-780dfca4e118	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
c9254a01-60f0-4754-a80f-780dfca4e118	3446d078-d5d8-4dd3-afb0-967415938526	f
c9254a01-60f0-4754-a80f-780dfca4e118	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
c9254a01-60f0-4754-a80f-780dfca4e118	259cf9a7-7387-4998-881a-553a0f2612b6	f
c9254a01-60f0-4754-a80f-780dfca4e118	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	328567a2-592c-48cd-ba80-ad072b383c66	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	1cf97373-e041-4227-9c60-a04d6ad51336	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	371384d4-852d-4464-8682-a32857d3b727	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	46554d78-12f4-4d92-bd47-c33c979fc244	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
d25319bf-cc27-4e00-a2d6-95bf46420b77	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	3446d078-d5d8-4dd3-afb0-967415938526	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	259cf9a7-7387-4998-881a-553a0f2612b6	f
d25319bf-cc27-4e00-a2d6-95bf46420b77	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
aebfe588-c098-465c-8ddc-0a323d5c9202	328567a2-592c-48cd-ba80-ad072b383c66	t
aebfe588-c098-465c-8ddc-0a323d5c9202	1cf97373-e041-4227-9c60-a04d6ad51336	t
aebfe588-c098-465c-8ddc-0a323d5c9202	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
aebfe588-c098-465c-8ddc-0a323d5c9202	371384d4-852d-4464-8682-a32857d3b727	t
aebfe588-c098-465c-8ddc-0a323d5c9202	46554d78-12f4-4d92-bd47-c33c979fc244	t
aebfe588-c098-465c-8ddc-0a323d5c9202	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
aebfe588-c098-465c-8ddc-0a323d5c9202	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
aebfe588-c098-465c-8ddc-0a323d5c9202	3446d078-d5d8-4dd3-afb0-967415938526	f
aebfe588-c098-465c-8ddc-0a323d5c9202	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
aebfe588-c098-465c-8ddc-0a323d5c9202	259cf9a7-7387-4998-881a-553a0f2612b6	f
aebfe588-c098-465c-8ddc-0a323d5c9202	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
a645e24f-94f5-4bba-b863-c011a239e0fd	328567a2-592c-48cd-ba80-ad072b383c66	t
a645e24f-94f5-4bba-b863-c011a239e0fd	1cf97373-e041-4227-9c60-a04d6ad51336	t
a645e24f-94f5-4bba-b863-c011a239e0fd	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
a645e24f-94f5-4bba-b863-c011a239e0fd	371384d4-852d-4464-8682-a32857d3b727	t
a645e24f-94f5-4bba-b863-c011a239e0fd	46554d78-12f4-4d92-bd47-c33c979fc244	t
a645e24f-94f5-4bba-b863-c011a239e0fd	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
a645e24f-94f5-4bba-b863-c011a239e0fd	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
a645e24f-94f5-4bba-b863-c011a239e0fd	3446d078-d5d8-4dd3-afb0-967415938526	f
a645e24f-94f5-4bba-b863-c011a239e0fd	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
a645e24f-94f5-4bba-b863-c011a239e0fd	259cf9a7-7387-4998-881a-553a0f2612b6	f
a645e24f-94f5-4bba-b863-c011a239e0fd	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
3dfb234f-78ad-435a-bd32-ac18ffb041e0	328567a2-592c-48cd-ba80-ad072b383c66	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	1cf97373-e041-4227-9c60-a04d6ad51336	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	371384d4-852d-4464-8682-a32857d3b727	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	46554d78-12f4-4d92-bd47-c33c979fc244	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
3dfb234f-78ad-435a-bd32-ac18ffb041e0	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
3dfb234f-78ad-435a-bd32-ac18ffb041e0	3446d078-d5d8-4dd3-afb0-967415938526	f
3dfb234f-78ad-435a-bd32-ac18ffb041e0	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
3dfb234f-78ad-435a-bd32-ac18ffb041e0	259cf9a7-7387-4998-881a-553a0f2612b6	f
3dfb234f-78ad-435a-bd32-ac18ffb041e0	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	328567a2-592c-48cd-ba80-ad072b383c66	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	1cf97373-e041-4227-9c60-a04d6ad51336	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	371384d4-852d-4464-8682-a32857d3b727	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	46554d78-12f4-4d92-bd47-c33c979fc244	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
6d7aa9b5-d484-4fc4-b852-2180de020dc2	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	3446d078-d5d8-4dd3-afb0-967415938526	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	259cf9a7-7387-4998-881a-553a0f2612b6	f
6d7aa9b5-d484-4fc4-b852-2180de020dc2	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	47b72aff-a054-438a-98aa-c53fd7ec268f	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	2b773cdb-8237-400a-bb56-5f8ede643204	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	020831f6-773a-444e-9359-874ac4c224b5	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	890f0f9a-7baa-4210-9550-6b414770325b	t
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	4c939064-1c95-47e6-8ae5-a166d88b1450	f
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
c8257463-994a-4d46-917d-c8fdeca16e68	47b72aff-a054-438a-98aa-c53fd7ec268f	t
c8257463-994a-4d46-917d-c8fdeca16e68	2b773cdb-8237-400a-bb56-5f8ede643204	t
c8257463-994a-4d46-917d-c8fdeca16e68	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
c8257463-994a-4d46-917d-c8fdeca16e68	020831f6-773a-444e-9359-874ac4c224b5	t
c8257463-994a-4d46-917d-c8fdeca16e68	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
c8257463-994a-4d46-917d-c8fdeca16e68	890f0f9a-7baa-4210-9550-6b414770325b	t
c8257463-994a-4d46-917d-c8fdeca16e68	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
c8257463-994a-4d46-917d-c8fdeca16e68	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
c8257463-994a-4d46-917d-c8fdeca16e68	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
c8257463-994a-4d46-917d-c8fdeca16e68	4c939064-1c95-47e6-8ae5-a166d88b1450	f
c8257463-994a-4d46-917d-c8fdeca16e68	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	47b72aff-a054-438a-98aa-c53fd7ec268f	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	2b773cdb-8237-400a-bb56-5f8ede643204	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	020831f6-773a-444e-9359-874ac4c224b5	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	890f0f9a-7baa-4210-9550-6b414770325b	t
d3df97d3-a52d-4cce-96df-4582bf8b6681	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	4c939064-1c95-47e6-8ae5-a166d88b1450	f
d3df97d3-a52d-4cce-96df-4582bf8b6681	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	47b72aff-a054-438a-98aa-c53fd7ec268f	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	2b773cdb-8237-400a-bb56-5f8ede643204	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	020831f6-773a-444e-9359-874ac4c224b5	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	890f0f9a-7baa-4210-9550-6b414770325b	t
32d978af-beaa-4961-9c4b-c3e65e3d6ace	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	4c939064-1c95-47e6-8ae5-a166d88b1450	f
32d978af-beaa-4961-9c4b-c3e65e3d6ace	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	47b72aff-a054-438a-98aa-c53fd7ec268f	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	2b773cdb-8237-400a-bb56-5f8ede643204	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	020831f6-773a-444e-9359-874ac4c224b5	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	890f0f9a-7baa-4210-9550-6b414770325b	t
6036ad12-5715-491f-a8a3-7bffd75a7c21	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	4c939064-1c95-47e6-8ae5-a166d88b1450	f
6036ad12-5715-491f-a8a3-7bffd75a7c21	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
a16c2479-61b1-42a1-9cae-24275c38c104	47b72aff-a054-438a-98aa-c53fd7ec268f	t
a16c2479-61b1-42a1-9cae-24275c38c104	2b773cdb-8237-400a-bb56-5f8ede643204	t
a16c2479-61b1-42a1-9cae-24275c38c104	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
a16c2479-61b1-42a1-9cae-24275c38c104	020831f6-773a-444e-9359-874ac4c224b5	t
a16c2479-61b1-42a1-9cae-24275c38c104	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
a16c2479-61b1-42a1-9cae-24275c38c104	890f0f9a-7baa-4210-9550-6b414770325b	t
a16c2479-61b1-42a1-9cae-24275c38c104	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
a16c2479-61b1-42a1-9cae-24275c38c104	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
a16c2479-61b1-42a1-9cae-24275c38c104	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
a16c2479-61b1-42a1-9cae-24275c38c104	4c939064-1c95-47e6-8ae5-a166d88b1450	f
a16c2479-61b1-42a1-9cae-24275c38c104	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
af3e53c8-62b6-4564-946f-a7051beb1705	47b72aff-a054-438a-98aa-c53fd7ec268f	t
af3e53c8-62b6-4564-946f-a7051beb1705	2b773cdb-8237-400a-bb56-5f8ede643204	t
af3e53c8-62b6-4564-946f-a7051beb1705	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
af3e53c8-62b6-4564-946f-a7051beb1705	020831f6-773a-444e-9359-874ac4c224b5	t
af3e53c8-62b6-4564-946f-a7051beb1705	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
af3e53c8-62b6-4564-946f-a7051beb1705	890f0f9a-7baa-4210-9550-6b414770325b	t
af3e53c8-62b6-4564-946f-a7051beb1705	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
af3e53c8-62b6-4564-946f-a7051beb1705	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
af3e53c8-62b6-4564-946f-a7051beb1705	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
af3e53c8-62b6-4564-946f-a7051beb1705	4c939064-1c95-47e6-8ae5-a166d88b1450	f
af3e53c8-62b6-4564-946f-a7051beb1705	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
af3e53c8-62b6-4564-946f-a7051beb1705	67cdc822-9b64-472a-9741-ee46205f20f4	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	328567a2-592c-48cd-ba80-ad072b383c66	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	1cf97373-e041-4227-9c60-a04d6ad51336	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	371384d4-852d-4464-8682-a32857d3b727	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	46554d78-12f4-4d92-bd47-c33c979fc244	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	3446d078-d5d8-4dd3-afb0-967415938526	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	259cf9a7-7387-4998-881a-553a0f2612b6	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	5ab8cb13-13cb-44d8-80a5-72297556cddf	t
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	76bc7c54-6e7f-4334-ad82-9d51b5859ba5	t
af3e53c8-62b6-4564-946f-a7051beb1705	f34dde60-d64c-4682-84a4-bf19c52cbf15	t
\.


--
-- TOC entry 4201 (class 0 OID 17354)
-- Dependencies: 269
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
81bd8af9-7561-40b0-83e9-6b4804a8aee2	871818ba-8ec2-43e6-bc3a-d4dc9c77c782
afd3b3a3-acec-439d-9873-7d1bbe22a781	f33db88d-6148-4642-a836-fd8e81ac6779
\.


--
-- TOC entry 4219 (class 0 OID 17590)
-- Dependencies: 287
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
53254dc6-4f0a-4c20-bead-c52bbf54027e	Trusted Hosts	c0efcdfc-c15a-41ad-9d15-0924755dd430	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
89a48b4a-3665-451f-8258-91fbe7de661b	Consent Required	c0efcdfc-c15a-41ad-9d15-0924755dd430	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
af653854-ba07-45e3-8556-47cd69ed2c7c	Full Scope Disabled	c0efcdfc-c15a-41ad-9d15-0924755dd430	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
f2ae50fc-bc70-4c83-88f1-542f5b75e273	Max Clients Limit	c0efcdfc-c15a-41ad-9d15-0924755dd430	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	Allowed Protocol Mapper Types	c0efcdfc-c15a-41ad-9d15-0924755dd430	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
55aa5a12-a6a5-4c75-a691-d3ac14eaf3ca	Allowed Client Scopes	c0efcdfc-c15a-41ad-9d15-0924755dd430	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	anonymous
37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	Allowed Protocol Mapper Types	c0efcdfc-c15a-41ad-9d15-0924755dd430	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	authenticated
9a7b02f4-0c99-4718-859b-ea3a28ed03a3	Allowed Client Scopes	c0efcdfc-c15a-41ad-9d15-0924755dd430	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	authenticated
9c2956ed-b8a7-43e0-8189-5ff94e3c500b	rsa-generated	c0efcdfc-c15a-41ad-9d15-0924755dd430	rsa-generated	org.keycloak.keys.KeyProvider	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N
c83f217e-fa48-43b9-9af5-d66d862326f8	rsa-enc-generated	c0efcdfc-c15a-41ad-9d15-0924755dd430	rsa-enc-generated	org.keycloak.keys.KeyProvider	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N
fb7560a2-20a6-4e68-a891-53927f7e4110	hmac-generated-hs512	c0efcdfc-c15a-41ad-9d15-0924755dd430	hmac-generated	org.keycloak.keys.KeyProvider	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N
0107f464-8afb-4bca-9d06-19bcb20ac026	aes-generated	c0efcdfc-c15a-41ad-9d15-0924755dd430	aes-generated	org.keycloak.keys.KeyProvider	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N
adeb9fb7-efe3-41e6-9ec0-391b6248effa	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N
db0f02fa-ab87-47a6-a721-2bcd136515f9	rsa-generated	412b6f06-a54b-491c-b77d-502a467beac2	rsa-generated	org.keycloak.keys.KeyProvider	412b6f06-a54b-491c-b77d-502a467beac2	\N
7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	rsa-enc-generated	412b6f06-a54b-491c-b77d-502a467beac2	rsa-enc-generated	org.keycloak.keys.KeyProvider	412b6f06-a54b-491c-b77d-502a467beac2	\N
6e232e88-421e-4c0f-a07a-489334a4736b	hmac-generated-hs512	412b6f06-a54b-491c-b77d-502a467beac2	hmac-generated	org.keycloak.keys.KeyProvider	412b6f06-a54b-491c-b77d-502a467beac2	\N
53997f9a-e26b-443f-966a-3cfbfb35cc6e	aes-generated	412b6f06-a54b-491c-b77d-502a467beac2	aes-generated	org.keycloak.keys.KeyProvider	412b6f06-a54b-491c-b77d-502a467beac2	\N
66033749-403e-4197-9906-f8c7fd920610	Trusted Hosts	412b6f06-a54b-491c-b77d-502a467beac2	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
2f0ebc08-700e-4e56-a9b7-4942c19fccb5	Consent Required	412b6f06-a54b-491c-b77d-502a467beac2	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
16cfab1f-7138-4130-9336-ca1861ecedb1	Full Scope Disabled	412b6f06-a54b-491c-b77d-502a467beac2	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
fe820486-be6c-4fc8-9c3c-eb14cf055f38	Max Clients Limit	412b6f06-a54b-491c-b77d-502a467beac2	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
226e375e-7f6b-4d1e-bba1-8455b6d8ae33	Allowed Protocol Mapper Types	412b6f06-a54b-491c-b77d-502a467beac2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
0fdff8ce-aaba-467e-8148-928ba9c451b0	Allowed Client Scopes	412b6f06-a54b-491c-b77d-502a467beac2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	anonymous
e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	Allowed Protocol Mapper Types	412b6f06-a54b-491c-b77d-502a467beac2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	authenticated
f5951d30-d3e4-4368-b57f-af74c2199d3e	Allowed Client Scopes	412b6f06-a54b-491c-b77d-502a467beac2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	412b6f06-a54b-491c-b77d-502a467beac2	authenticated
8f978121-6131-4b21-8114-7217f8c2e0f8	\N	412b6f06-a54b-491c-b77d-502a467beac2	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	412b6f06-a54b-491c-b77d-502a467beac2	\N
\.


--
-- TOC entry 4218 (class 0 OID 17585)
-- Dependencies: 286
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
cab421b6-f9f4-4eb8-9e37-9e27b23a3236	9a7b02f4-0c99-4718-859b-ea3a28ed03a3	allow-default-scopes	true
788d75ea-908c-4b20-831a-0705306f5162	53254dc6-4f0a-4c20-bead-c52bbf54027e	host-sending-registration-request-must-match	true
1ffc47eb-ebfc-473a-b4d8-fb4311dfbbc8	53254dc6-4f0a-4c20-bead-c52bbf54027e	client-uris-must-match	true
0ba186c2-a719-4f39-a723-cd10347ecf91	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	oidc-address-mapper
8184d4c6-79e5-4614-8a7a-baec9a996be0	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	saml-user-property-mapper
fa2a45d7-b413-418a-aa91-547fef68b8b2	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	saml-role-list-mapper
54a95b0e-76c2-4df5-870e-1a87b6a0bfb8	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	saml-user-attribute-mapper
1bcade7d-1fd7-45ed-a77a-5a6d335c6aaf	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
cbee36bb-0c3f-47c3-90b0-1da4e5f353c9	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f3089570-d4b8-40d5-9111-99b1f8b58144	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b7f664cc-ad83-4159-bf89-e5a44ccf239b	37058ba3-a34a-4f2b-a94c-69a0d96ffa2e	allowed-protocol-mapper-types	oidc-full-name-mapper
9e88acb0-fd44-4c3e-8f40-f842ae08902f	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	saml-role-list-mapper
75b27c72-0e6b-4f98-9f86-082b783e7cf5	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	saml-user-property-mapper
3845d2ae-adf9-4d01-93d5-b471c1a7b3f5	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f4b7a0b2-bdbf-4e94-9b3b-338fb4c5d415	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9872dc33-54ef-40d0-ac50-50c2c66e72f2	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	saml-user-attribute-mapper
aac6057a-5e69-4635-9347-20778f145ae9	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	oidc-full-name-mapper
9e4cc95f-d28d-4ed7-87a1-194b9a3d3a17	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	oidc-address-mapper
9a53e7fe-513a-44c4-b44e-c6d4b877a345	6b0771b5-d8c8-4dc4-8bc7-31dfa483cd36	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
491fb501-3cf6-4bd2-a7bf-8d25407dd849	f2ae50fc-bc70-4c83-88f1-542f5b75e273	max-clients	200
be65948f-702b-47d4-9e43-397eada7312c	55aa5a12-a6a5-4c75-a691-d3ac14eaf3ca	allow-default-scopes	true
972a1d77-1e7e-4457-bb82-b48c480fcd63	fb7560a2-20a6-4e68-a891-53927f7e4110	algorithm	HS512
0c2b20cd-274e-4f27-aa48-1eca40d0d651	fb7560a2-20a6-4e68-a891-53927f7e4110	kid	a0fdffce-74a9-4121-a277-a50f3a6750d0
591c2995-38de-442c-99c0-5bacfc4f7290	fb7560a2-20a6-4e68-a891-53927f7e4110	secret	sPHjthR-YpwewODsHQARD12d1siQItV8bccJCnAFD7dzh3beD3JSBpr9Ojdw6uwkxNuATfw3rSJajAuDlrzr2-yf6rrpCdz8TRwfbA5EDoN3-QA3sU6n_Cad_1Jxwzk2qrcFqVcurKI9DPvP_n3oILHmEl8Uh_ccWPjn6PxwRpE
8c7f8c7a-23ff-4ad1-8409-526fe09d1dd1	fb7560a2-20a6-4e68-a891-53927f7e4110	priority	100
d5c013f2-ce4e-42d1-a709-23872eb1f55b	c83f217e-fa48-43b9-9af5-d66d862326f8	certificate	MIICmzCCAYMCBgGW+uQZazANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTIzMDIwNDM0WhcNMzUwNTIzMDIwNjE0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDruKSamvOI1Fket2VXPWTQkR7BQUuEuSU8XikCxjzg1Z76p6/LQ/iKedmjAnJvr4DHRcSYmRxkm8YSACGaPnAMp3Ksy4EyZ8T5IQvOvm0b5McRPbSXsgLWbZuMMw1p6eXA3vMkjZlIfK2PwBBAN+jrBnTt5B/2+yCD8JA+0D0PuzA4AkXxUtU8lqFjbanzrgI4hnP+liVFbhcHjJMhv3vzfWOVTu0A4Vo3XrGxZH92AL4HA69w6XdGLcaLnTbvGYWFxDfMqG30V4B1EGwcoMUTFtubfS3Y+WBAeejU8VVv6L/GyYpjcNh3j0uP3eUwQ6oURRJuyz3CvzsPOjao5EgHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABzw5s4uM4KFgsmm7/6GAYrprZPV0XH47FfNP/pUKNf7EJHaj+Tpof/ay+w4KH7eNlYZu8mtr01t4Ig4YA0fm4S620XkuOWchajWUbME2kUco01TjnpnS6bYYVX65lPxYsBQ+dOxQyIIbuKaF/EsywIwvvu1BhlPHBrUepsmVT+d8DY4HvktR0+CJ9cDcqhvR9/zG5GVClOMMxRsMmVn1qTr78CJ+Y/n3JHQ1T/9GsG96qegwpZHYukhDo5lS+qJ8cCXdRo+GP1KJ3l21bgVaxky2/IgB2Nf0YuHiQtRO5O6Pf4DWuP5KC60Bx6BsQT8FSIj6lwkv9BqJcRBcFS15cQ=
d2f58db4-b1ff-47b6-b509-92aed925697b	c83f217e-fa48-43b9-9af5-d66d862326f8	priority	100
a73eeced-3cac-4e02-83d6-4944e621a109	c83f217e-fa48-43b9-9af5-d66d862326f8	keyUse	ENC
8494c3f0-fd49-4490-8730-e984cfcba481	c83f217e-fa48-43b9-9af5-d66d862326f8	privateKey	MIIEpAIBAAKCAQEA67ikmprziNRZHrdlVz1k0JEewUFLhLklPF4pAsY84NWe+qevy0P4innZowJyb6+Ax0XEmJkcZJvGEgAhmj5wDKdyrMuBMmfE+SELzr5tG+THET20l7IC1m2bjDMNaenlwN7zJI2ZSHytj8AQQDfo6wZ07eQf9vsgg/CQPtA9D7swOAJF8VLVPJahY22p864COIZz/pYlRW4XB4yTIb97831jlU7tAOFaN16xsWR/dgC+BwOvcOl3Ri3Gi5027xmFhcQ3zKht9FeAdRBsHKDFExbbm30t2PlgQHno1PFVb+i/xsmKY3DYd49Lj93lMEOqFEUSbss9wr87Dzo2qORIBwIDAQABAoIBAAEHzRxp6f+iogMa3SQM/ihVQhOpM+nQH2QMq1Q6RqDa/jdtTTzvvqHoV3W5eIOZelAks2/RV4jvD2YbvwncFQRRJRSxTQ7J2lgWd2U/et2g2efu45+4JQAH+aKaxIe+gIUf1GNIBTAGb4HN3qRROkDwxckWcrdTMLiy8AZ+RY4QiscRnJVgL4KiLVUGfZLBNCbLkjkTsmlnJUleTPou1jaBWor5z1r7O5WMRsP2diYDM2PYBafMzJBK+5rl7Wh69mWHWFceQACIXBDlsjuKbsRHm3QZCHXtUxAmVJG7r5SDbEwG/9GO0XP79xSiRbsZPisxtM4zZSbDArF4GGImE8ECgYEA94LMJ9sa6YF8wwWg3JPALvZyejt1MJpEQf53Cbc+WlRAkbw8Y7rCrjEikWtPkcIrFCeVmX2s1bR/p5DF57+Q4Tvj8fcJfHoNBn5EE2HpP2emSATEdHMDaLbAxCarEjt96iN9hRJURcBA2urtvI65S7F2X4Fa80uiAb1szrvY2EcCgYEA885UXKVkQMdxd22YcR7mUFrl8SQmU73gZG/DeAGt5soRcJqn6J9lNAnvAFbbMhTrMhkkXnxvr1Y30VkUsKoQkfqU4q8eKmlv6sSGiMTYTvlKZH6bocFLTyDTwP53IKAWHg8moTBgBps7niBg3bBOtZALA23t9znDBCwECznsskECgYEAyaO+TK38k8UQ7hSUw35/MANIqfnsdAcJmrYDJmAppQ9EdzXiAOFyntSas9u3vChyTf4dqykud/+Pi+SuxilTj5rqDgLSsJ0CJYsSTLQUgLohRkTUA4Z7fYB9NI/ICJd88hWtuY6AJz8D1xVTTqz7mgXeSNoqTVENj9tRXG6+rxsCgYAw99ET5pgzNpvAm/+RQN6LZyZl/5e/HBT0t0nwUY4HG7DTCA0PeOxPvmsFi2xtK6xtnIUkgSPBeLSvVJAGR7IaT9UVjoylghXbdmt7DuZPPlzFwHQr0fH5S6OcUL/GisDGes6Mc3Xl/cnEocYy4JV+fBbqMmsoS66yqNCLHLBAwQKBgQCKfRZmKHGrh2IdnE4pt1EZUtMShLoYf0RPkP7kVoTowrarXUSBVWEU9nNZ5zdvC+lVOgEoSncK4kka++/jdc1CGGHjPoJxsl1ZR8AKLnr6PLevoTCPWgtyhHOiuRplPMD52A3G555ew4B0si9CWzhkOIwGUPj207IsMB1sEradhQ==
611e20ff-3eaa-4b76-81c8-3cf5474b3a15	c83f217e-fa48-43b9-9af5-d66d862326f8	algorithm	RSA-OAEP
80a1cd9e-25ae-40e9-afbb-944661fc6910	0107f464-8afb-4bca-9d06-19bcb20ac026	secret	Y-sttBpnmlPbgkFYtB1aIw
99ae2c15-1fa7-4647-9431-deef3b3d1ad9	0107f464-8afb-4bca-9d06-19bcb20ac026	kid	b4b0b1ab-8e3c-464d-8d64-470e721ca891
f33f36a1-5ecb-470f-bdf6-a9816c8f02fc	0107f464-8afb-4bca-9d06-19bcb20ac026	priority	100
2a8fc7ab-5ba6-4368-9549-af5e3491e6d4	f5951d30-d3e4-4368-b57f-af74c2199d3e	allow-default-scopes	true
0935e19d-e083-4c00-bb2e-fa7c25161f25	9c2956ed-b8a7-43e0-8189-5ff94e3c500b	privateKey	MIIEpAIBAAKCAQEAsMp4MmgRmN6cw9EnwTelEKHMV3aL/G67GuTAXi0+cad/nu+OcG9U/JbSmZhBWDgFDHMSeCAAo0bbpqBLljlZIxA8r8S4rE/X9B5pN/8r/X2A64j1BE02s4GxdEfXKrEqa63Fooev3b0ijnRz6o/UXo7XNk9sd3VCI4ysfX7SUIArOtqCmHV/CfWWmJo+l8z/zHl6FhwIkz2wPDv7tW/zgUoXOxuUXXXjdKLQFN3cDsk++GQEFX5C3nEFyCZaEinACvdX8jHuUQsd7I0bs7rWyc9dehJ4h61eowK3qAxZqaSvOx2fpeReBO/sWZcSueiKU+f4kxj74joGJml9ucCa0QIDAQABAoIBAAENdh+1InNCLefMWHGWk7U/e12aBHaHUFHD+bhN0x8Mk052dkcE/T6jHC0Q5emzUYrOITsuiuHbswTX+KhhnjUn3HfHy93lxZYL4DwbK1iKnU4naZ1UNbe4NWfkmPa8VvrM0svSxauEG+Ov62r5jIA8H/KnEHDr/puC08eVSWpPqsv9NEwjiGI5t8nkB3vWZ7R6Xi0X4rj8hIwtj7kdCuA+ugsyWxI3wHXkMAHnq4gt4a2E1Kq0GqrOaongSJVlZcpyGHTYrGXOCl14OZqgb2NgEdkyKQ+QBbSI6LOiAGVUDtNQgvtMWqcu0DyfP3MbKB0BDfjDT/K0XW6vKGnopIECgYEA1RYyDmvLf4BQdNIXcP6lWzcjpXHne5DoTqAjOtP/7y7XOMZqQOSyO6vCVzzwCLyK8JrFbaagDI8+XRGUEI/W7KaGwnrP9lpljv/cFU/KZrtyeHWH3txnSQKdUnD0wV7Jvq4JwmZwM+fHq9I2DpEi+L9Zp2A9aTAYz712Beag7UECgYEA1GUF/dTiXAQf7UC+SLxc+uY+N1AswHRqbIF9NdRLRYrQ37N5CzU14j7xwrJ8fnIztxZk4hIW2UNqbxFMJfCCqtF1cJaXFG9n7Xa2t6QUmydbTornMmOr4eA9+BpQXLZjkqO/uhW5h6+7JkT2ATiBqTv3/zz1L4viKZiKJl5W+ZECgYEAlhxEtxQJD5D9HM7D5L3/DvsRCYPsZof2ny0ApHikW4LL6xsbzwtM4+xjw8ER95Wa61ScsFopda+TZ0zy2Zf6+Et3s5mA1zNnSA3GpNzI4QY75dAmH0F1IWHOIj2grnhv9vvztBcmA+rMJqa3nhtwX3utVNPfbzKKyA3YDuAhjgECgYBPKsis8GjfO3pbCMLkgbF2o9OU8oF7yujQQQPWyKa16SQp/c+kadUH28Zpd/YHe7HjEKnRykRR/1rww1XK3ncWDLTlnnv51fy6+oDounQj0OurvwKmOZibvOXcUJKbvDApPHf+eJKLDOmJPjMkCVfrKLsrnCEX89/8+SqlWoy4wQKBgQCNbNkmoft1IlT7eNywpL8MByJpztwmpN9FyMHN1uPzj+44vQnStameuQ5i8fFNkxU3sF6flDhGYErDqs8UYQ6ur7XAJi34kRlDOwifOf2rXR/c+jHUrO9/gVzMPy2ppdIqYenOQbeBuQYGn5TbErnWJA/gv6jXisZCX6x3ucrCgQ==
8cb9b372-17ad-4dde-8f7e-54bc94fbadd7	9c2956ed-b8a7-43e0-8189-5ff94e3c500b	certificate	MIICmzCCAYMCBgGW+uQXyjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTIzMDIwNDM0WhcNMzUwNTIzMDIwNjE0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCwyngyaBGY3pzD0SfBN6UQocxXdov8brsa5MBeLT5xp3+e745wb1T8ltKZmEFYOAUMcxJ4IACjRtumoEuWOVkjEDyvxLisT9f0Hmk3/yv9fYDriPUETTazgbF0R9cqsSprrcWih6/dvSKOdHPqj9Rejtc2T2x3dUIjjKx9ftJQgCs62oKYdX8J9ZaYmj6XzP/MeXoWHAiTPbA8O/u1b/OBShc7G5RddeN0otAU3dwOyT74ZAQVfkLecQXIJloSKcAK91fyMe5RCx3sjRuzutbJz116EniHrV6jAreoDFmppK87HZ+l5F4E7+xZlxK56IpT5/iTGPviOgYmaX25wJrRAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADp277sE1uipTC9RfJhOkVyrFfVBlpu3ewgedF7VgIAuDITwuwrd9s1ZkPVtnwn48DIiWj1A/IkBic2imYKXJlhDdNW/GmXeCD9fhj/Sdsm53XuGGZTXAnmnH1GSbtXsh1ZN/Xc+aX1J9u8lO4NF4F+FW1aXmaC9Mp8pp7G7HR560oY7HOfPH4incaAHjytmdUzV22zT+UO6m4yV8z5oEBB878eBJAG1OIFKh/+hPkums4dP7F/jUc+fV+sd0Cl6k6DFhIxdDLh/SqE/u6WQWxYmXClxurp6nUidut5tINDeRZZDrFOnMQLjVcLM475f0qFy1aDM7Tgzu9xar8fTV1w=
54fa1221-5284-4d7c-bd94-5907d960171e	9c2956ed-b8a7-43e0-8189-5ff94e3c500b	keyUse	SIG
5fefb550-b912-4404-aa19-aea86bfa3e4c	9c2956ed-b8a7-43e0-8189-5ff94e3c500b	priority	100
6ef45190-f3b9-4bcb-bd2d-0c056fd72026	66033749-403e-4197-9906-f8c7fd920610	host-sending-registration-request-must-match	true
8d85c41f-ae61-462c-ac68-f51a918fe885	db0f02fa-ab87-47a6-a721-2bcd136515f9	privateKey	MIIEowIBAAKCAQEAtl27WoYQ8Ep+Xr93BT7vDl7ResABHj9XB0FvkRtbjsvA28ekBbFUIJOWhBzLVRuTC1WnnQEHmSgofunq1ghGBMlBW3CKnE//XKehJ3Nfw7fLt1wWN18BDaVbodlz0DWNwOtGgcioCRCJsd3gGgwkp0fbRnLQpXTmDb+JWqJtl8N+7v0OD4Jb2f4PTxx9LOGwIaTHOImnxxQyvcSZUsCeKuUuUyJi5da4JrX6gxJ7zlQFvw2ms8s4EuAjM/CvU+7vItBsMILWRlbV9+9MFLk7Ltc2voAIjFPO84TcjobQo/kyQK9R/ycF3kpdEOhDJ/DMzFxmWaJ2b4SgLomMY4AlGwIDAQABAoIBAFYdTtJBSpBdbO0K1oYooLQVfC/NqPmCiXMIqElKNOLqPijKTh7ODN7RMpsyCaYnvjj0+pA+IztkZjL//H+TKpUp/+3Q5/NGJ1y2X3gEmC0QhmcQWgFNoG60Ld/wkiq4jzaRIxs4CHk3UP4nuqIyJ8DCQr4yi2oGGHhXgOHGn5+wyGWvGiTj8DI2xTzajVTf1zFwOGZXAd9zbyCq9VKYZJO9PYVQY3d/bFmHN/F5ZGJ3GlILmMxgqppmEnqWb/2Du9GXFknmmH8ZBkzJQCWwDo3LQQdMhpQ8cOfzskqiK4u0NjOH8DzEqrQQSPQEnQzz4zidb6bz+1dEVsJpLFF69OkCgYEA9dMnf/iUqiXtbHr3NyGzcFKfoknI+bkhZeawBc/D3G2HJYxgsWuJJ58N6aGNOiMQhe603Ji4HwoEQOwgSz7Kk6OyDhYJ64b7s1nrIKXutnR8haor3Sgy/c8WN29VGWE9jWnM41Kd2lqKeb4kOmhUv+CL4A9m2Sg9iCzKei953sUCgYEAveolrlnqiJB+qTOPGTJOiP2W1fHoxgYHhoiovWOnkXQo6HPJgQlhR0vktKG/T+G/qJpWmUAUovcAfUvVw1qfYQDPojvAm+H+5ZYi97cnmGikmvi0C56asLIKBRXCk8g/mDwTxyfqpVEdj/QYC9ASX+uaMMTHxrY8SCL31lT0Ml8CgYEA5wraqTBdqb2T9M1t5OdL21oMp19qASu69CdpcUzg7SAUUXoqtxY3BoI7dUZdkjK6qOa+Hkd7ZdDoRoynnZEanMDR7ONR14g6sUrl7v2F6v54urhCGc5afqpQWzHMbdozG+JAq7dOnZdTZzEKo8rDPMQzMxfGtntXudE/TK+qf3ECgYA5XkK1sTm0uRlZ2VZPwS+SGDB5PlMXhni9fgii9TiIKrO0zE1Bamj1VYqnufiFk+cGcmDYeFADjmOadc8D7RsZ/Vm7Yxtiu1j5V2oGtFAErQ+UNK6GmAmYeJ+oO5OEesgjH3rF/VvXRnKMqqqc3uS+DviL5NWIREJfdBizqQP/NwKBgHN0Z3+02297OJgVsi66z2RbMTZb8tVCvSRgKhJnGepwnLqt4laK9Xu85HvJRiqDARXZ6ddswNCMRgZnuTCHAObNPD+54nEf7TFkYvW7vjdIsIMdIH+IGkukr7+xCHpZ2r4VjNnIOaR3U0y2WYt0HnlpD+u31Xy02CseKgX0wX5P
4fbbffee-c239-4b39-b3ca-661761b8ab78	db0f02fa-ab87-47a6-a721-2bcd136515f9	priority	100
5860d9ac-5471-4e77-9b68-fba5defd9f25	db0f02fa-ab87-47a6-a721-2bcd136515f9	keyUse	SIG
c5858f8d-67e7-4be7-8b43-48c3794684d5	db0f02fa-ab87-47a6-a721-2bcd136515f9	certificate	MIICpTCCAY0CBgGXCAuekDANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtzaGFyZWNvZGluZzAeFw0yNTA1MjUxNTIyNDhaFw0zNTA1MjUxNTI0MjhaMBYxFDASBgNVBAMMC3NoYXJlY29kaW5nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtl27WoYQ8Ep+Xr93BT7vDl7ResABHj9XB0FvkRtbjsvA28ekBbFUIJOWhBzLVRuTC1WnnQEHmSgofunq1ghGBMlBW3CKnE//XKehJ3Nfw7fLt1wWN18BDaVbodlz0DWNwOtGgcioCRCJsd3gGgwkp0fbRnLQpXTmDb+JWqJtl8N+7v0OD4Jb2f4PTxx9LOGwIaTHOImnxxQyvcSZUsCeKuUuUyJi5da4JrX6gxJ7zlQFvw2ms8s4EuAjM/CvU+7vItBsMILWRlbV9+9MFLk7Ltc2voAIjFPO84TcjobQo/kyQK9R/ycF3kpdEOhDJ/DMzFxmWaJ2b4SgLomMY4AlGwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBTIS9KsgMhPqrKlq6nW2MfDgjcZ52WQi/QMmlvDBswNmvu/X921lxKHgHgn1dAFLicgG3yHqBrOxegRrTwzK2SkLowyOvjVqPN7VSvKsyatksmePP3ERLhjEFe+qxIZ0WIbH+H9Nhc4IhzVlEkonLhaJsyNlT5f6F31eBRhN2euJzvTQo7UBimQSEVrpbuLHFnr4KDq+DShtbBnUL9q2bqqlrDQw0OSPS++/mjFkmjHgtWhfI3F63/qYEIPSUk5SQqv4Jq91oSBxbPoenuD+davgzOs98WZ4NcxEF0j9Trl92Yq+/BGBEHopCLGQA5/A/C1vank3+XBMgxp2peGcH7
81371170-c7e5-4940-af12-65fc22759658	7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	priority	100
2e8b6d19-f3c0-4dc6-8398-5ef6ed5b010a	7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	algorithm	RSA-OAEP
9a5f7f85-8404-459d-8678-04349d77d537	7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	certificate	MIICpTCCAY0CBgGXCAugKzANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtzaGFyZWNvZGluZzAeFw0yNTA1MjUxNTIyNDlaFw0zNTA1MjUxNTI0MjlaMBYxFDASBgNVBAMMC3NoYXJlY29kaW5nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxj4KbMpYJD4Q/qdw0GYTbL9GYZnYvKMJa0zOWqLxY1xoaN4YySHyT7aHChttuEi8uDNcJRkUq3wctWEf0yrntcUwAETLA3tmfMUhO1ju5H05nnjz6/mgN1CgEcvDtciRAQgKUfvMKmUWDo22O7P5ejC7jerjtJKzTfkq8l//3OAxFhVZOeOMU5si+NcBO4vXOO5OpOPbyp2XFYn9UzvlKzDvUux1QGQIhe8IO2ckwKXIbzNj9oyYMe3SAHPntVSg0eVXlDUdZINnaR2MJnXEk1DJhhkaYRk7H4cbdJCNBTtzjD0kHmy8fzXn07xKJmv9p8tjJd7xCXwiQ9wKuEaoeQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBm3r3jaaZlA38/pEi0ALhs4z4XJXv8iR3ynEcfMmogKWFathJfNCoi8iRJLKYxvNC2hOj9k6NDhdwKl3HECnFlwL67yeEk4kjv/s+hVDlO/9jlojvYpxwBB7tR03FjMLZE9LaH24c5jon74QLMiBfTRg9tv8z0OwLFI4MoVdlVh7hXMedPxBuDCyTCJJsDsMxNYVKlW6NIWEmyGXGw9aPe1RQnSY3G5kqAyXohqv+lhOxj+NmsBLYa8yyYojUKHPiTD/fUiT6kngZXt0gjO3Sat8FYLimGmSykIwE+kp0UTTQa6mS6WvxZHXnlFVUOZRHKEw/FQD7aRGKRBhpzVxof
2ed99cee-36b8-4843-b568-4ff1eddfa7e1	7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	keyUse	ENC
9846ebe1-efa6-46e6-a92b-c9eb92fa62f4	7b8ed3d3-f0bf-4b39-8699-e4e93c61aa24	privateKey	MIIEpAIBAAKCAQEAxj4KbMpYJD4Q/qdw0GYTbL9GYZnYvKMJa0zOWqLxY1xoaN4YySHyT7aHChttuEi8uDNcJRkUq3wctWEf0yrntcUwAETLA3tmfMUhO1ju5H05nnjz6/mgN1CgEcvDtciRAQgKUfvMKmUWDo22O7P5ejC7jerjtJKzTfkq8l//3OAxFhVZOeOMU5si+NcBO4vXOO5OpOPbyp2XFYn9UzvlKzDvUux1QGQIhe8IO2ckwKXIbzNj9oyYMe3SAHPntVSg0eVXlDUdZINnaR2MJnXEk1DJhhkaYRk7H4cbdJCNBTtzjD0kHmy8fzXn07xKJmv9p8tjJd7xCXwiQ9wKuEaoeQIDAQABAoIBACOll0lNr0DBGlw4LpyCpl6JHHZDbEorRO/S7U41+5Li1HF68lkEbiZwS2MBYJ7hEXJL5fdTxbg6Ro1E7CyUC/tO/F0oAZtcLqcj6WBbEwXqEJjS5gWaKvmXWVkp20TOTmixke2BCgrbh3ZRfCHLMIKMzcTspkpbkLtmIRdZNNB5/LwgLQuM0f0eykLrfs2k9ZEKHagZJ5SO3EnTkQhrUjvu3hq8/VYRj5HdQQd4+QGk/Fp5cdV3LtpTEk8eLN0HZHof0pQU+7iDWujrazHFt14EaiS2OLFfHEnKZAv4YUpaY58GmHxeJFUwUR5Zj1bC5Kicc/+ExdbvlB66/ltUs1sCgYEA6AEISzYWDwqsxn8Ajf4ZrVYGHTobfMtVH579N6KaitINNU1YacaucCIRTYWO14FWIddTbPXhA15tXXCi1gu+yHlFgApBE46Zzq3N7mVuVMXDuLY+wl7FJWUs12tlq36oNwWkOaoEyRGMAXdkKInqJOvtSDRyTh0ZALiJCalfJ08CgYEA2r8STuBMc4WAOdVUz4SpG8bpkXZzyXWOxF7zVOm5AaVVFN3xG0GZlHLsn4H1W3k/bGLaMMn4YLCSdg58iFgVkWhr83oxCsqgISuzdGj/KDVOleXcmB+z7N5HgA+LgE7k36u1BpZeLo1ri/+XlNYfpcJ63sJEibsC+JEtHdWxwbcCgYEA3EwOqgwjigji4mC6EBpWG2dxytLgQvF4VNxNKUT3ZhXqgNB+wYHtJYDT2T6W0j93oA6souwey2oggvdvR7xDXmz494nFHWLs3Xnf7xzVVR2sqXozwbDnloipuau7EMrlw8lRlYfBn4NP5ByQOIYslP6Jg2R5nX63vR180nXHarUCgYEA0YfkyZkgoidmw/8M1hqEwg6u/J8yGe95abBp9RRMGr972BkgMrOLoR7UeZXKqGxjzDaEOee8+yEnqd4Ge7OkNTyI6xhIkcW1zRBHPWK1xpYJSJx9yVnUxzfD1W8OeUEZCwc2x7CRVpYwRlH1qKPSfLzlZStA640vM1oclU90jdECgYBQHWXYf8DVsKGwSaiqp60XQBMTW3jWc0SWDe0ASdLr5Yn3SQStmY/Uaqp4WEYKsTDxaJhW9Kdt6aaOd5obLRIzsGtPQJPR5quIRz6cPnrHpE3m6QcUUrfA+NunLxfNrk60B7Fxn/c4nPI2bL8VDWA0LB3plZhx3Yn6ZpfQOlrtPQ==
0d45ca5b-5b96-4c44-b696-2857bed264d8	53997f9a-e26b-443f-966a-3cfbfb35cc6e	secret	O4lwEzfPkyBUD6YVU3-4IA
60d2786e-b46d-4f27-9d75-d55722b57127	53997f9a-e26b-443f-966a-3cfbfb35cc6e	priority	100
0c62117e-6ecd-491b-93ae-00223d08aa19	53997f9a-e26b-443f-966a-3cfbfb35cc6e	kid	8e8cfe1d-15b9-4b2f-a574-a9ec47eaa55c
e5b69666-1177-41cf-8a96-71df3b164700	6e232e88-421e-4c0f-a07a-489334a4736b	algorithm	HS512
b67bbf29-716f-4c88-ba74-44d3c72b546a	6e232e88-421e-4c0f-a07a-489334a4736b	secret	BYbs73ceKSUZn02dfY3b8S9JhBzmU0II_zjqGpcGo2xHRNQQtxuN0wMhU5KgyzbcwUe1Kz-IrF770-w2T-AMsE9UXHL7TpZUN51evRvrOV6oi-6xD-eqy46uEsI7DqaUWquyim91gvkbgWMabmzZEhgu8jwyC2kdOr8LfNtEUg0
21a3c43b-addf-49b6-a40d-bf998057c799	6e232e88-421e-4c0f-a07a-489334a4736b	kid	fe0853d7-f037-4851-b173-b36db8be16de
8f7fa205-98a6-4b80-964a-24f9f93355fb	6e232e88-421e-4c0f-a07a-489334a4736b	priority	100
64a23b60-9ac4-40c6-bc08-0c8d44e11563	fe820486-be6c-4fc8-9c3c-eb14cf055f38	max-clients	200
c36d26c5-c0ae-4c8e-b2bd-69207768fcbf	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	saml-role-list-mapper
29174a1f-504f-4889-b726-0beb78be3975	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	oidc-address-mapper
51e86b76-4359-4379-ba4e-a6913abf8912	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	saml-user-attribute-mapper
85d1e5de-066b-4f69-9e77-b23f7407827a	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
5d29dbe8-a107-4331-8674-5bb1b2c19f35	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	oidc-full-name-mapper
ba0475ba-7813-4550-9b40-52702683624b	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e41690c7-1112-4c8b-9604-767c3b5c1c36	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
cfe2723a-6da2-4847-ad1e-1dbcbba6dd17	226e375e-7f6b-4d1e-bba1-8455b6d8ae33	allowed-protocol-mapper-types	saml-user-property-mapper
5a00965c-c745-432b-bd3f-f01cd1c8d348	0fdff8ce-aaba-467e-8148-928ba9c451b0	allow-default-scopes	true
f6d1d641-02bb-42d5-a3cd-524777a04e1c	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b28e2352-915f-41bf-93b2-21335304b1d4	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	oidc-full-name-mapper
9252c26f-e5a4-4796-aa7c-3113a5417fca	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
738ea31e-c29c-4d97-b8ae-07877f3799d1	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	oidc-address-mapper
6b49b331-14ff-4700-8b07-db021d6377e8	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
cdec10f0-6414-41b9-bb4c-30e3f5cb41f3	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	saml-user-attribute-mapper
203115a8-7f81-4d91-9657-6caffb315cb7	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	saml-role-list-mapper
2565fa9b-8797-4ced-8872-2ab5f3912ab8	e5cefe8c-6131-4a2a-aa1b-f4c7f9e8c86e	allowed-protocol-mapper-types	saml-user-property-mapper
db554b97-2bbe-435a-b859-f297221ca398	66033749-403e-4197-9906-f8c7fd920610	client-uris-must-match	true
c13bdc08-9e6d-4c1c-a0ea-074f4535acc3	8f978121-6131-4b21-8114-7217f8c2e0f8	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"nombre","displayName":"Nombre","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"apellido","displayName":"Apellido","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"fechaNacimiento","displayName":"Fecha de Nacimiento","validations":{},"annotations":{},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"pais","displayName":"País","validations":{},"annotations":{},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
8031fea8-e6d4-4437-93dd-1f06af40e011	adeb9fb7-efe3-41e6-9ec0-391b6248effa	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"nombre","displayName":"Nombre","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"apellido","displayName":"Apellido","validations":{},"annotations":{},"required":{"roles":["admin","user"]},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"pais","displayName":"País","validations":{},"annotations":{},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false},{"name":"fechaNacimiento","displayName":"Fecha de Nacimiento","validations":{},"annotations":{},"permissions":{"view":[],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
\.


--
-- TOC entry 4152 (class 0 OID 16487)
-- Dependencies: 220
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.composite_role (composite, child_role) FROM stdin;
3897b219-e4f7-4191-82d3-3b530e7af1eb	e7d3b4e0-d799-499b-8dd3-9b272c45bc56
3897b219-e4f7-4191-82d3-3b530e7af1eb	abe47fad-b753-4855-9864-220fa169ad19
3897b219-e4f7-4191-82d3-3b530e7af1eb	cbe8e7f4-78e7-4842-8f0c-561a2425349e
3897b219-e4f7-4191-82d3-3b530e7af1eb	e5ec9803-c9bc-448a-a81c-7388dec15d19
3897b219-e4f7-4191-82d3-3b530e7af1eb	842e2c26-cd42-4ad8-9be2-3c0e85302af8
3897b219-e4f7-4191-82d3-3b530e7af1eb	e84dac9d-4635-420c-94b9-66b121c20163
3897b219-e4f7-4191-82d3-3b530e7af1eb	aff4eafd-6c52-4711-a663-97a6f1e24388
3897b219-e4f7-4191-82d3-3b530e7af1eb	a281a3ff-f8c4-4103-a3e3-17121c4ea7a9
3897b219-e4f7-4191-82d3-3b530e7af1eb	11b511fd-7518-41d9-9d30-37ce3603b22c
3897b219-e4f7-4191-82d3-3b530e7af1eb	9204304c-ad3f-4785-8d33-372258e06ab9
3897b219-e4f7-4191-82d3-3b530e7af1eb	06f68c5d-2382-4818-91bc-37fe6ccad3c4
3897b219-e4f7-4191-82d3-3b530e7af1eb	f6566c69-0a29-4dd2-a07a-c14f435ee313
3897b219-e4f7-4191-82d3-3b530e7af1eb	99645c93-e4bf-4d0a-8ad8-123f04d989db
3897b219-e4f7-4191-82d3-3b530e7af1eb	ed965fcd-ad0d-45e6-91ac-fb61d7808ea7
3897b219-e4f7-4191-82d3-3b530e7af1eb	9938ae49-9272-490f-8148-9ce74d2bb5cd
3897b219-e4f7-4191-82d3-3b530e7af1eb	7ac71a4a-d25a-4d65-b6bf-06119e274ebb
3897b219-e4f7-4191-82d3-3b530e7af1eb	794049a1-8a7c-4cd8-b344-0a589c3f83cd
3897b219-e4f7-4191-82d3-3b530e7af1eb	985019da-b2d0-44de-ad03-65a19c339edf
842e2c26-cd42-4ad8-9be2-3c0e85302af8	7ac71a4a-d25a-4d65-b6bf-06119e274ebb
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	4125bb3f-9282-4b53-b450-53ee2a49477c
e5ec9803-c9bc-448a-a81c-7388dec15d19	985019da-b2d0-44de-ad03-65a19c339edf
e5ec9803-c9bc-448a-a81c-7388dec15d19	9938ae49-9272-490f-8148-9ce74d2bb5cd
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	248df3f9-de96-4d1e-a01f-bbf8effaf4d3
248df3f9-de96-4d1e-a01f-bbf8effaf4d3	58934632-1955-4d9d-8231-4c8bce942003
b62acb12-e471-4b30-a744-f41abd007b91	3686549d-dff1-4623-afb7-88657f87147b
3897b219-e4f7-4191-82d3-3b530e7af1eb	92b9addd-e339-4c8d-9330-585ce04767a6
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	871818ba-8ec2-43e6-bc3a-d4dc9c77c782
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	a366fdf3-719a-4ec8-8f77-8d054e2611c4
3897b219-e4f7-4191-82d3-3b530e7af1eb	e6ffc33f-d690-44ad-a893-4ee1053455ae
3897b219-e4f7-4191-82d3-3b530e7af1eb	15c3e716-573c-4d9e-8240-a438b48c8fdf
3897b219-e4f7-4191-82d3-3b530e7af1eb	48259ac0-5ffe-41cb-b586-72cd0f244b8e
3897b219-e4f7-4191-82d3-3b530e7af1eb	35daf219-5a2d-4647-9d79-e71bafe85077
3897b219-e4f7-4191-82d3-3b530e7af1eb	62035a02-ecff-4636-9beb-b7b023cf684f
3897b219-e4f7-4191-82d3-3b530e7af1eb	0347503a-55e8-4aa2-b0fd-f2540af995d6
3897b219-e4f7-4191-82d3-3b530e7af1eb	cd48e114-6f32-48f1-a2bb-ef1ffa2c82ed
3897b219-e4f7-4191-82d3-3b530e7af1eb	bc342efe-2ecb-4afc-be6d-ae0c836babf0
3897b219-e4f7-4191-82d3-3b530e7af1eb	64a6b6e5-9d67-4059-8450-1b9ac646ad2f
3897b219-e4f7-4191-82d3-3b530e7af1eb	eb95e0ea-6bb9-4dab-9e2e-ecd416c29b45
3897b219-e4f7-4191-82d3-3b530e7af1eb	3c39f7b2-478a-4cca-870b-010f9420432c
3897b219-e4f7-4191-82d3-3b530e7af1eb	03b108df-6947-4f91-acc4-bfc9767115ba
3897b219-e4f7-4191-82d3-3b530e7af1eb	e6b60613-6304-463d-86a0-c690f5f607b5
3897b219-e4f7-4191-82d3-3b530e7af1eb	edae4682-a640-4183-8dd2-3ac4dfc13bba
3897b219-e4f7-4191-82d3-3b530e7af1eb	025e42c0-5108-4f8d-9d7b-40018ee21bbb
3897b219-e4f7-4191-82d3-3b530e7af1eb	cc2ea1c5-53d3-4c12-8f6d-186c13482b7b
3897b219-e4f7-4191-82d3-3b530e7af1eb	bbe5f49b-80a3-4a48-9bd2-4bc9a65adeaf
35daf219-5a2d-4647-9d79-e71bafe85077	025e42c0-5108-4f8d-9d7b-40018ee21bbb
48259ac0-5ffe-41cb-b586-72cd0f244b8e	bbe5f49b-80a3-4a48-9bd2-4bc9a65adeaf
48259ac0-5ffe-41cb-b586-72cd0f244b8e	edae4682-a640-4183-8dd2-3ac4dfc13bba
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	c5651199-45c2-4619-9cef-df5bdb68eaba
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	67b08109-cefc-43cf-896f-acfba13502d8
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	b1507f36-7130-446d-a2ac-6d26b75f89f1
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	708892b0-1783-4bd7-af21-37c6c1af1840
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	92135e99-fea2-4770-b214-1c20697f408a
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	d67599af-d518-4194-98f0-4da3cc861c99
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	b2521cb1-1d34-40f0-ae6e-60dd24e1dc88
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	b6318e64-1527-4c43-a29c-b46e4e98f1c4
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	29932be9-77bb-494f-9024-1209ba835668
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	19204a9c-4c4c-4458-98ba-3aa1a489d616
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	6724f452-8ae4-4392-833c-72a32cd12042
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	24c07258-821c-407f-8283-5d4762092de1
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	d813670f-0100-4bb4-b654-920238689334
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	ef1327dc-b6bc-43bd-a72f-754a832da7f9
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	0a72d9b0-08d7-4fc5-9e6f-1f8399e79c57
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	93f9eef5-d8a8-45d0-b525-97fb9c4ee49d
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	320b34a3-b67a-4856-9f49-f894002d6c4b
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	1ecc3e9c-5a96-481e-80ec-4eee7f804a80
708892b0-1783-4bd7-af21-37c6c1af1840	0a72d9b0-08d7-4fc5-9e6f-1f8399e79c57
b1507f36-7130-446d-a2ac-6d26b75f89f1	320b34a3-b67a-4856-9f49-f894002d6c4b
b1507f36-7130-446d-a2ac-6d26b75f89f1	ef1327dc-b6bc-43bd-a72f-754a832da7f9
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	d383ffb0-f92a-4194-b97f-1e9c4265606b
d383ffb0-f92a-4194-b97f-1e9c4265606b	517404a0-b3fe-4328-9f22-a9d92462e740
2956642f-8737-47bf-bfd4-fd234ca6f4c0	fb977cc0-8864-4eaa-99cc-eae47b1ed17a
3897b219-e4f7-4191-82d3-3b530e7af1eb	318a3c8d-fd7e-4e37-a977-c5f148f0cc4c
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	e2957305-8238-4365-9756-39ec473e61fc
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	f33db88d-6148-4642-a836-fd8e81ac6779
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	7813ee03-b438-48c4-bb8c-613d64e7dfe5
\.


--
-- TOC entry 4153 (class 0 OID 16490)
-- Dependencies: 221
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
6efabfa1-35a3-4f97-b67d-71954816e049	\N	password	5c5484ff-f91e-475f-b10d-735c37e21672	1747965975352	\N	{"value":"QC/4idplxEfXySvp53KMZcIAxSUtsekqrg88yNK08Cg=","salt":"yy7uhZKv57TAxGscM4losA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
955bc302-2471-4c08-9134-fbbfe39cf45a	\N	password	9729194e-098f-4d1a-8afa-2fbf4d4d0930	1748200784214	\N	{"value":"no3pKAT8o3qlRMr+vfXHTwnmU7fYUejym5ral5OIc5Y=","salt":"EhWmykLfXbixMsrmPYrdvQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d325baaf-d412-4c50-9a05-4fd82d310531	\N	password	c0804e0d-a5e0-4a32-93de-45f68eae24bd	1748204724246	\N	{"value":"S1Bgt8no8Ovq3thAZattKsqVfAY7M2BxbjpL9tDpjhM=","salt":"DamvhYRqndVO4rMBtKVR5A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ae03e240-82dc-466a-aef3-3f1dc0a09f1a	\N	password	f31c35a8-c001-4515-9af7-812942287d12	1748207904936	\N	{"value":"O0IypHa6LcCqNm07QIblpCVS5xgE2qThzsvIsoqdGNc=","salt":"wDRNdlj+bUNH56oJ2k6ZLQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
31c29384-d969-445c-860d-24f098ba7e12	\N	password	172cc073-0d17-4f14-8d08-70c28bd43468	1748208101065	\N	{"value":"i8gEXJcjaGqmVkKEz6TJuwSW8x9Lrf4xmnxPgRt/muU=","salt":"3W+4+0xRJvDrorNaRYbY7w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
39608413-1a2e-4e3d-ab56-1a5b42c67c30	\N	password	246137a9-3486-4f1e-bafe-6e9cae4409b2	1748208198764	\N	{"value":"JKkfnHnDOPUcwsTVd8cD7jOaaTRAiNW4GlLHqRz1QUs=","salt":"yhe+HQIDNeNQjky1AOwZeA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
2002f4f2-6c2d-4c94-b159-128aab39c3aa	\N	password	5f03162b-c458-4746-97e7-8e2d3241cf69	1748278099594	\N	{"value":"mLbRsB2hOPEAwSXHlUstRZXIlgLtJmUrMYkIv6pRx+0=","salt":"r/+NOs3a2o20JhdThgZ2+w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b98bacd4-ff85-402f-b140-34d4d4d1fb1d	\N	password	e2cc9354-11a4-4e31-ad7c-16c69e821566	1748278168257	\N	{"value":"XmTnxrJ6I/ezeRYo9VJ2mUO39lLxJynAlDcUZQsL+vQ=","salt":"nlWTPMRsZ4dnFQgEItFbkg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b6995032-2f6b-49bf-a68e-7648516ad326	\N	password	1b28757a-d00c-47fd-856c-e5c4aedeb882	1748291444705	\N	{"value":"kboZ+uYPhCigG1NZeqYQZbkoXG0vmFpeDmgaJlBNRYE=","salt":"YNAicbkb1Yf3PgtIWGMiVg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
cfe26798-032d-44f7-b5dd-76d8f0d699cf	\N	password	7f6f4483-a8a9-44ab-9dba-c752d0fb2282	1748291471534	\N	{"value":"mvBEXmQ3wydxUZNe9Rxly9LMOcfbOwdG8/K7dZ9DgZ0=","salt":"k7xH1vrWfJUfEreqRG5Qyw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
66b48c7d-d876-4abf-9bf4-43237b52ff5d	\N	password	9bcefdd1-7cb1-4a07-8dd9-d911c911de96	1748291531670	\N	{"value":"Xp5iFeX48CBsc46cHyu5edTmMlDFEcfsZXaw9u2lIbc=","salt":"5+VLyJO0KP8T1nApu+2xvA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8c1c4fd3-d3d9-494c-ae8a-4a891440e49c	\N	password	3153b757-2824-41ce-ae82-18a13890ac3c	1748291572718	\N	{"value":"vFzGybc6AIWkXuAZOv6+uKzgjRDoOT77bk1bzn1fdgA=","salt":"PvuC4Un9xnVesDPtH/alqA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d2aaaea2-0f58-429c-87da-c7faed056faf	\N	password	608387e5-2f91-45e0-8055-dcd396abca2e	1748294033740	\N	{"value":"GDHVuGoTXNV3MdGyIb2Gadz/Q/ai/bff28wvr+II+H0=","salt":"3fcOK7Fgt9FRjgVyXs0+QQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
55b2eff5-b5a5-40b4-b14c-9a756602b252	\N	password	957db94b-62cc-4704-9171-f1c2816ce871	1748296190746	\N	{"value":"bnz3gXL7vDeXViNgXIiYW/A2aoLErx5s8RmhCB1qI/E=","salt":"UtRi0vUqp6y5oQ3EPv4D1Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
7abd3572-e3b2-4f88-a667-0d29008a2476	\N	password	6ce9a058-ae7b-4993-9fa2-5bc0d322b163	1748425139563	\N	{"value":"IyucHvhppRjcqC2OirnJE3meRfw5B5WpwkHE0/n1o7o=","salt":"+sYRftGtXxtE+tJwgybKlg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
30f3bfeb-5a05-4354-a63e-633db0a12d68	\N	password	c1cb10aa-1548-47ee-b851-8ca460025d0e	1748599256585	\N	{"value":"BX5yB61u38OEdDP2IXWXKhXjBX7fxXnqKkrBPw7BGw8=","salt":"ZRE2NcWmbkwYbCRL0DCbtQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
86703a1a-d94b-40c8-8da0-7dbf1569dbfd	\N	password	a46ab7a6-bb38-43fe-8bca-db408232651e	1748784294284	\N	{"value":"R1VZ7d40tJkUkypzV4G3/knI4UbIb9sJqt1ft120Vdw=","salt":"r2PTvpJpkTAEGaMkGkqJWQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
\.


--
-- TOC entry 4150 (class 0 OID 16460)
-- Dependencies: 218
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-05-23 02:05:51.519216	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	7965951118
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-05-23 02:05:51.553398	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	7965951118
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-05-23 02:05:51.659193	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	7965951118
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-05-23 02:05:51.675553	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	7965951118
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-05-23 02:05:51.914955	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	7965951118
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-05-23 02:05:51.92557	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	7965951118
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-05-23 02:05:52.041595	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	7965951118
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-05-23 02:05:52.047363	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	7965951118
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-05-23 02:05:52.059599	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	7965951118
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-05-23 02:05:52.132609	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	7965951118
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-05-23 02:05:52.175383	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	7965951118
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-05-23 02:05:52.18043	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	7965951118
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-05-23 02:05:52.202581	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	7965951118
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-23 02:05:52.217423	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	7965951118
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-23 02:05:52.219892	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-23 02:05:52.223298	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	7965951118
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-05-23 02:05:52.228542	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	7965951118
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-05-23 02:05:52.269408	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	7965951118
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-05-23 02:05:52.309175	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	7965951118
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-05-23 02:05:52.314555	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	7965951118
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-23 02:05:52.317716	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	7965951118
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-05-23 02:05:52.322852	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	7965951118
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-05-23 02:05:52.425095	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	7965951118
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-05-23 02:05:52.43432	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	7965951118
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-05-23 02:05:52.436874	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	7965951118
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-05-23 02:05:52.932725	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	7965951118
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-05-23 02:05:52.978853	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	7965951118
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-05-23 02:05:52.98241	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	7965951118
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-05-23 02:05:53.011787	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	7965951118
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-05-23 02:05:53.021327	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	7965951118
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-05-23 02:05:53.035667	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	7965951118
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-05-23 02:05:53.040644	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	7965951118
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-23 02:05:53.046125	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-23 02:05:53.048298	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	7965951118
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-23 02:05:53.065147	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	7965951118
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-05-23 02:05:53.070373	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	7965951118
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-05-23 02:05:53.074707	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	7965951118
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-05-23 02:05:53.079859	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	7965951118
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-05-23 02:05:53.084591	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	7965951118
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-23 02:05:53.086521	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	7965951118
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-23 02:05:53.089683	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	7965951118
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-05-23 02:05:53.095727	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	7965951118
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-05-23 02:05:57.718503	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	7965951118
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-05-23 02:05:57.727396	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	7965951118
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-23 02:05:57.736095	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	7965951118
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-23 02:05:57.742359	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	7965951118
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-23 02:05:57.744669	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	7965951118
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-23 02:05:58.229488	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	7965951118
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-05-23 02:05:58.240367	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	7965951118
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-05-23 02:05:58.292091	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	7965951118
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-05-23 02:05:59.942692	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	7965951118
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-05-23 02:05:59.949866	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-05-23 02:05:59.953554	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	7965951118
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-05-23 02:05:59.960291	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	7965951118
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-23 02:05:59.966708	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	7965951118
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-23 02:05:59.973685	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	7965951118
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-23 02:06:00.053335	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	7965951118
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-05-23 02:06:01.823833	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	7965951118
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-05-23 02:06:01.884451	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	7965951118
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-05-23 02:06:01.899027	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	7965951118
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-23 02:06:01.91761	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	7965951118
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-05-23 02:06:01.927599	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	7965951118
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-05-23 02:06:01.937632	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	7965951118
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-05-23 02:06:01.947788	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	7965951118
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-23 02:06:01.955611	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	7965951118
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-05-23 02:06:02.246717	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	7965951118
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-05-23 02:06:02.413819	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	7965951118
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-05-23 02:06:02.424206	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	7965951118
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-05-23 02:06:02.623935	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	7965951118
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-05-23 02:06:02.634419	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	7965951118
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-05-23 02:06:02.641979	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	7965951118
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-23 02:06:02.681214	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	7965951118
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-23 02:06:02.708269	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	7965951118
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-23 02:06:02.730114	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	7965951118
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-23 02:06:02.77909	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	7965951118
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-05-23 02:06:02.968763	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	7965951118
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-23 02:06:02.975694	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	7965951118
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-23 02:06:02.983286	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	7965951118
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-23 02:06:03.037441	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	7965951118
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-05-23 02:06:03.041308	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	7965951118
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-23 02:06:03.210523	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	7965951118
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-23 02:06:03.214964	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	7965951118
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-23 02:06:03.23396	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	7965951118
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-23 02:06:03.236617	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	7965951118
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-05-23 02:06:03.356911	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	7965951118
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-05-23 02:06:03.361942	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	7965951118
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-23 02:06:03.386205	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	7965951118
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-05-23 02:06:03.406674	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	7965951118
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.426775	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	7965951118
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.43596	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	7965951118
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.616847	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.627016	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	7965951118
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.631355	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	7965951118
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.656189	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	7965951118
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.662973	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	7965951118
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-05-23 02:06:03.684411	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	7965951118
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.19808	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.201653	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.22513	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.396697	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.401378	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.563422	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	7965951118
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-05-23 02:06:04.574262	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	7965951118
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-05-23 02:06:04.601832	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	7965951118
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-05-23 02:06:04.757716	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	7965951118
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-05-23 02:06:04.947098	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	7965951118
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-05-23 02:06:05.102587	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	7965951118
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-05-23 02:06:05.108943	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	7965951118
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-23 02:06:05.250295	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	7965951118
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-23 02:06:05.25309	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	7965951118
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-05-23 02:06:05.264854	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-05-23 02:06:05.269599	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	7965951118
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-23 02:06:05.281555	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	7965951118
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-05-23 02:06:05.285869	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	7965951118
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-23 02:06:05.293275	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	7965951118
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-05-23 02:06:05.295081	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	7965951118
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-23 02:06:05.305639	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	7965951118
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-05-23 02:06:05.310092	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	7965951118
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-23 02:06:05.971159	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	7965951118
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-23 02:06:05.985994	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	7965951118
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-23 02:06:06.000173	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-05-23 02:06:06.198458	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-23 02:06:06.205575	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	7965951118
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-23 02:06:06.210352	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-05-23 02:06:06.22949	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:06.2654	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:06.485805	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:07.235028	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:07.48667	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:07.797877	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.037611	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.040986	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.086787	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	7965951118
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.098594	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	7965951118
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.108134	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	7965951118
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.110094	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	7965951118
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-05-23 02:06:08.289167	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	7965951118
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.299507	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	7965951118
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.308732	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	7965951118
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.525855	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	7965951118
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.538219	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	7965951118
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.56475	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	7965951118
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:08.953888	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	7965951118
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:09.606712	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	7965951118
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:10.189339	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	7965951118
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:10.207036	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	7965951118
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-05-23 02:06:10.211599	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	7965951118
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-23 02:06:10.218505	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	7965951118
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-23 02:06:10.22932	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	7965951118
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-05-23 02:06:10.233841	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	7965951118
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-05-23 02:06:10.238655	151	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.29.1	\N	\N	7965951118
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-05-23 02:06:10.242315	152	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.29.1	\N	\N	7965951118
\.


--
-- TOC entry 4149 (class 0 OID 16455)
-- Dependencies: 217
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- TOC entry 4224 (class 0 OID 17851)
-- Dependencies: 292
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
c0efcdfc-c15a-41ad-9d15-0924755dd430	81bd8af9-7561-40b0-83e9-6b4804a8aee2	f
c0efcdfc-c15a-41ad-9d15-0924755dd430	171e1c41-1a0b-468a-a291-bd37514fa8bf	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	c1dab47a-cc18-401c-8255-c6a968082eb0	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	371384d4-852d-4464-8682-a32857d3b727	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	328567a2-592c-48cd-ba80-ad072b383c66	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	60cfe998-b2f9-4dd9-a883-d31445c9404a	f
c0efcdfc-c15a-41ad-9d15-0924755dd430	3446d078-d5d8-4dd3-afb0-967415938526	f
c0efcdfc-c15a-41ad-9d15-0924755dd430	46554d78-12f4-4d92-bd47-c33c979fc244	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	dcaa6806-251f-4b62-a505-92c78c3a51d6	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9	f
c0efcdfc-c15a-41ad-9d15-0924755dd430	9a27a6c9-25d7-4a56-8ea3-32434df12d8c	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	1cf97373-e041-4227-9c60-a04d6ad51336	t
c0efcdfc-c15a-41ad-9d15-0924755dd430	259cf9a7-7387-4998-881a-553a0f2612b6	f
412b6f06-a54b-491c-b77d-502a467beac2	afd3b3a3-acec-439d-9873-7d1bbe22a781	f
412b6f06-a54b-491c-b77d-502a467beac2	5c5a3e63-832d-42f5-8497-0fe839ab237a	t
412b6f06-a54b-491c-b77d-502a467beac2	00e461ed-e697-4f31-8928-caa9ccee6935	t
412b6f06-a54b-491c-b77d-502a467beac2	020831f6-773a-444e-9359-874ac4c224b5	t
412b6f06-a54b-491c-b77d-502a467beac2	2b773cdb-8237-400a-bb56-5f8ede643204	t
412b6f06-a54b-491c-b77d-502a467beac2	6ef90676-1a21-451e-b7c9-55abeaf31bdd	f
412b6f06-a54b-491c-b77d-502a467beac2	26792bcd-7e3d-4540-bd16-4a9d17d780d9	f
412b6f06-a54b-491c-b77d-502a467beac2	c9e966c6-b7b5-49fc-8cb2-59fb3212b472	t
412b6f06-a54b-491c-b77d-502a467beac2	47b72aff-a054-438a-98aa-c53fd7ec268f	t
412b6f06-a54b-491c-b77d-502a467beac2	8c8af517-9cc8-4314-93f9-d6f1e00984c0	f
412b6f06-a54b-491c-b77d-502a467beac2	890f0f9a-7baa-4210-9550-6b414770325b	t
412b6f06-a54b-491c-b77d-502a467beac2	e24f3648-4cf6-488a-b9b9-15190729f9e8	t
412b6f06-a54b-491c-b77d-502a467beac2	4c939064-1c95-47e6-8ae5-a166d88b1450	f
\.


--
-- TOC entry 4154 (class 0 OID 16495)
-- Dependencies: 222
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
84adf734-b18e-4ace-a0cb-12e3decb62e2	account-console	\N	\N	172.19.0.1	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	f3b4d833-b433-4cfc-bb0d-fd515a3f7c37	1748177736556	LOGIN	51cd9c99-e025-4582-9334-ad967e38d296	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:8080/realms/codeacademy/account","consent":"no_consent_required","code_id":"f3b4d833-b433-4cfc-bb0d-fd515a3f7c37","username":"testuser1@gmail.com"}
6e25638e-8044-448d-be33-ddff59ab0724	account-console	\N	\N	172.19.0.1	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	f3b4d833-b433-4cfc-bb0d-fd515a3f7c37	1748177737090	LOGIN	51cd9c99-e025-4582-9334-ad967e38d296	{"auth_method":"openid-connect","auth_type":"code","response_type":"code","redirect_uri":"http://localhost:8080/realms/codeacademy/account?session_state=f3b4d833-b433-4cfc-bb0d-fd515a3f7c37&iss=http%3A%2F%2Flocalhost%3A8080%2Frealms%2Fcodeacademy&code=709e4741-2e59-484e-b903-5b4b1e21aa18.f3b4d833-b433-4cfc-bb0d-fd515a3f7c37.7d9ce41f-fe83-4e91-a20b-57d521698ba7","consent":"no_consent_required","code_id":"f3b4d833-b433-4cfc-bb0d-fd515a3f7c37","response_mode":"query","username":"testuser1"}
263f08f9-256e-42a0-935b-e6e3467f4245	account-console	\N	\N	172.19.0.1	0ae5f5ee-234d-4b16-af4c-c4d3df72a3bb	f3b4d833-b433-4cfc-bb0d-fd515a3f7c37	1748177737806	CODE_TO_TOKEN	51cd9c99-e025-4582-9334-ad967e38d296	{"token_id":"onrtac:cfd4c7b5-7a1e-4751-8d75-9b2424126431","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"fcc96972-e7ca-408e-95c3-2b1a0efd871e","code_id":"f3b4d833-b433-4cfc-bb0d-fd515a3f7c37","client_auth_method":"client-secret"}
\.


--
-- TOC entry 4212 (class 0 OID 17550)
-- Dependencies: 280
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 17555)
-- Dependencies: 281
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4226 (class 0 OID 17877)
-- Dependencies: 294
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4214 (class 0 OID 17564)
-- Dependencies: 282
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4215 (class 0 OID 17573)
-- Dependencies: 283
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4216 (class 0 OID 17576)
-- Dependencies: 284
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 17582)
-- Dependencies: 285
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 16872)
-- Dependencies: 242
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4220 (class 0 OID 17647)
-- Dependencies: 288
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4196 (class 0 OID 17274)
-- Dependencies: 264
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4195 (class 0 OID 17271)
-- Dependencies: 263
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4175 (class 0 OID 16877)
-- Dependencies: 243
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 16886)
-- Dependencies: 244
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 16990)
-- Dependencies: 248
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4181 (class 0 OID 16995)
-- Dependencies: 249
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4235 (class 0 OID 18076)
-- Dependencies: 303
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- TOC entry 4194 (class 0 OID 17268)
-- Dependencies: 262
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- TOC entry 4155 (class 0 OID 16503)
-- Dependencies: 223
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	${role_default-roles}	default-roles-master	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
3897b219-e4f7-4191-82d3-3b530e7af1eb	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	${role_admin}	admin	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
e7d3b4e0-d799-499b-8dd3-9b272c45bc56	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	${role_create-realm}	create-realm	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
abe47fad-b753-4855-9864-220fa169ad19	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_create-client}	create-client	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
cbe8e7f4-78e7-4842-8f0c-561a2425349e	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-realm}	view-realm	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
e5ec9803-c9bc-448a-a81c-7388dec15d19	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-users}	view-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
842e2c26-cd42-4ad8-9be2-3c0e85302af8	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-clients}	view-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
e84dac9d-4635-420c-94b9-66b121c20163	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-events}	view-events	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
aff4eafd-6c52-4711-a663-97a6f1e24388	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-identity-providers}	view-identity-providers	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
a281a3ff-f8c4-4103-a3e3-17121c4ea7a9	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_view-authorization}	view-authorization	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
11b511fd-7518-41d9-9d30-37ce3603b22c	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-realm}	manage-realm	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
9204304c-ad3f-4785-8d33-372258e06ab9	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-users}	manage-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
06f68c5d-2382-4818-91bc-37fe6ccad3c4	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-clients}	manage-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
f6566c69-0a29-4dd2-a07a-c14f435ee313	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-events}	manage-events	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
99645c93-e4bf-4d0a-8ad8-123f04d989db	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-identity-providers}	manage-identity-providers	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
ed965fcd-ad0d-45e6-91ac-fb61d7808ea7	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_manage-authorization}	manage-authorization	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
9938ae49-9272-490f-8148-9ce74d2bb5cd	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_query-users}	query-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
7ac71a4a-d25a-4d65-b6bf-06119e274ebb	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_query-clients}	query-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
794049a1-8a7c-4cd8-b344-0a589c3f83cd	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_query-realms}	query-realms	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
8a07c316-73a3-4014-9ecd-0d61e033e78a	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	Usuario regular de la plataforma	USUARIO	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
7fc3f475-4ccb-4686-bde8-557aa22a137a	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	Moderador de la comunidad	MODERADOR	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
2a6cf82e-3a60-4edb-b326-c1af40f8dd77	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	Administrador de la plataforma	ADMIN	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
985019da-b2d0-44de-ad03-65a19c339edf	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_query-groups}	query-groups	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
4125bb3f-9282-4b53-b450-53ee2a49477c	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_view-profile}	view-profile	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
248df3f9-de96-4d1e-a01f-bbf8effaf4d3	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_manage-account}	manage-account	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
58934632-1955-4d9d-8231-4c8bce942003	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_manage-account-links}	manage-account-links	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
e5ca12bb-1fa5-42a8-bb5e-1f73b076e92a	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_view-applications}	view-applications	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
3686549d-dff1-4623-afb7-88657f87147b	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_view-consent}	view-consent	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
b62acb12-e471-4b30-a744-f41abd007b91	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_manage-consent}	manage-consent	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
b6086bdd-84e3-46c3-b4e4-2f2c16a28964	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_view-groups}	view-groups	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
15986b4b-e9b4-431d-849d-d4e75186c3c3	c9254a01-60f0-4754-a80f-780dfca4e118	t	${role_delete-account}	delete-account	c0efcdfc-c15a-41ad-9d15-0924755dd430	c9254a01-60f0-4754-a80f-780dfca4e118	\N
d1145c8a-a9a9-4898-b1f3-3a5332f0051c	a645e24f-94f5-4bba-b863-c011a239e0fd	t	${role_read-token}	read-token	c0efcdfc-c15a-41ad-9d15-0924755dd430	a645e24f-94f5-4bba-b863-c011a239e0fd	\N
92b9addd-e339-4c8d-9330-585ce04767a6	3dfb234f-78ad-435a-bd32-ac18ffb041e0	t	${role_impersonation}	impersonation	c0efcdfc-c15a-41ad-9d15-0924755dd430	3dfb234f-78ad-435a-bd32-ac18ffb041e0	\N
871818ba-8ec2-43e6-bc3a-d4dc9c77c782	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	${role_offline-access}	offline_access	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
a366fdf3-719a-4ec8-8f77-8d054e2611c4	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	${role_uma_authorization}	uma_authorization	c0efcdfc-c15a-41ad-9d15-0924755dd430	\N	\N
cd48e114-6f32-48f1-a2bb-ef1ffa2c82ed	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-authorization}	view-authorization	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
bc342efe-2ecb-4afc-be6d-ae0c836babf0	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-realm}	manage-realm	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
64a6b6e5-9d67-4059-8450-1b9ac646ad2f	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-users}	manage-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
eb95e0ea-6bb9-4dab-9e2e-ecd416c29b45	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-clients}	manage-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
3c39f7b2-478a-4cca-870b-010f9420432c	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-events}	manage-events	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
03b108df-6947-4f91-acc4-bfc9767115ba	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-identity-providers}	manage-identity-providers	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
e6b60613-6304-463d-86a0-c690f5f607b5	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_manage-authorization}	manage-authorization	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
edae4682-a640-4183-8dd2-3ac4dfc13bba	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_query-users}	query-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
025e42c0-5108-4f8d-9d7b-40018ee21bbb	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_query-clients}	query-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	412b6f06-a54b-491c-b77d-502a467beac2	f	${role_default-roles}	default-roles-sharecoding	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
e6ffc33f-d690-44ad-a893-4ee1053455ae	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_create-client}	create-client	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
15c3e716-573c-4d9e-8240-a438b48c8fdf	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-realm}	view-realm	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
48259ac0-5ffe-41cb-b586-72cd0f244b8e	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-users}	view-users	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
35daf219-5a2d-4647-9d79-e71bafe85077	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-clients}	view-clients	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
62035a02-ecff-4636-9beb-b7b023cf684f	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-events}	view-events	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
0347503a-55e8-4aa2-b0fd-f2540af995d6	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_view-identity-providers}	view-identity-providers	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
cc2ea1c5-53d3-4c12-8f6d-186c13482b7b	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_query-realms}	query-realms	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
bbe5f49b-80a3-4a48-9bd2-4bc9a65adeaf	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_query-groups}	query-groups	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
e3d7b983-d631-4b1c-b95e-d8c53ee8b931	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_realm-admin}	realm-admin	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
c5651199-45c2-4619-9cef-df5bdb68eaba	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_create-client}	create-client	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
67b08109-cefc-43cf-896f-acfba13502d8	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-realm}	view-realm	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
b1507f36-7130-446d-a2ac-6d26b75f89f1	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-users}	view-users	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
708892b0-1783-4bd7-af21-37c6c1af1840	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-clients}	view-clients	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
92135e99-fea2-4770-b214-1c20697f408a	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-events}	view-events	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
d67599af-d518-4194-98f0-4da3cc861c99	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-identity-providers}	view-identity-providers	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
b2521cb1-1d34-40f0-ae6e-60dd24e1dc88	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_view-authorization}	view-authorization	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
b6318e64-1527-4c43-a29c-b46e4e98f1c4	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-realm}	manage-realm	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
29932be9-77bb-494f-9024-1209ba835668	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-users}	manage-users	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
19204a9c-4c4c-4458-98ba-3aa1a489d616	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-clients}	manage-clients	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
6724f452-8ae4-4392-833c-72a32cd12042	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-events}	manage-events	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
24c07258-821c-407f-8283-5d4762092de1	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-identity-providers}	manage-identity-providers	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
d813670f-0100-4bb4-b654-920238689334	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_manage-authorization}	manage-authorization	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
ef1327dc-b6bc-43bd-a72f-754a832da7f9	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_query-users}	query-users	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
0a72d9b0-08d7-4fc5-9e6f-1f8399e79c57	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_query-clients}	query-clients	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
93f9eef5-d8a8-45d0-b525-97fb9c4ee49d	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_query-realms}	query-realms	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
320b34a3-b67a-4856-9f49-f894002d6c4b	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_query-groups}	query-groups	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
1ecc3e9c-5a96-481e-80ec-4eee7f804a80	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_view-profile}	view-profile	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
d383ffb0-f92a-4194-b97f-1e9c4265606b	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_manage-account}	manage-account	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
517404a0-b3fe-4328-9f22-a9d92462e740	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_manage-account-links}	manage-account-links	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
67a8ac33-2a06-40cb-8e01-bde0ca527dca	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_view-applications}	view-applications	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
fb977cc0-8864-4eaa-99cc-eae47b1ed17a	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_view-consent}	view-consent	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
2956642f-8737-47bf-bfd4-fd234ca6f4c0	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_manage-consent}	manage-consent	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
d157c37e-6940-4682-934b-70f891860c99	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_view-groups}	view-groups	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
0d9d99d5-5e4f-4fe6-8c41-6a1ccda977c8	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	t	${role_delete-account}	delete-account	412b6f06-a54b-491c-b77d-502a467beac2	fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	\N
318a3c8d-fd7e-4e37-a977-c5f148f0cc4c	cd215e66-0414-4c2d-9e9e-f304cfe878b7	t	${role_impersonation}	impersonation	c0efcdfc-c15a-41ad-9d15-0924755dd430	cd215e66-0414-4c2d-9e9e-f304cfe878b7	\N
e2957305-8238-4365-9756-39ec473e61fc	6036ad12-5715-491f-a8a3-7bffd75a7c21	t	${role_impersonation}	impersonation	412b6f06-a54b-491c-b77d-502a467beac2	6036ad12-5715-491f-a8a3-7bffd75a7c21	\N
9891bf8b-d41d-4cbe-9c7b-a934ea384dec	32d978af-beaa-4961-9c4b-c3e65e3d6ace	t	${role_read-token}	read-token	412b6f06-a54b-491c-b77d-502a467beac2	32d978af-beaa-4961-9c4b-c3e65e3d6ace	\N
f33db88d-6148-4642-a836-fd8e81ac6779	412b6f06-a54b-491c-b77d-502a467beac2	f	${role_offline-access}	offline_access	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
7813ee03-b438-48c4-bb8c-613d64e7dfe5	412b6f06-a54b-491c-b77d-502a467beac2	f	${role_uma_authorization}	uma_authorization	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
991e75a4-b898-4e07-b157-73dbbb7f8ca3	412b6f06-a54b-491c-b77d-502a467beac2	f	Usuario regular de la plataforma	USUARIO	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
3c9a2887-1db7-4c4a-8cbc-17321a755965	412b6f06-a54b-491c-b77d-502a467beac2	f	Moderador de la comunidad	MODERADOR	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
0d6f8d61-6df5-4d58-bf59-cb405f7616a1	412b6f06-a54b-491c-b77d-502a467beac2	f	Administrador de la plataforma	ADMIN	412b6f06-a54b-491c-b77d-502a467beac2	\N	\N
\.


--
-- TOC entry 4179 (class 0 OID 16987)
-- Dependencies: 247
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.migration_model (id, version, update_time) FROM stdin;
t71o6	26.2.4	1747965972
\.


--
-- TOC entry 4193 (class 0 OID 17259)
-- Dependencies: 261
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.


--
-- TOC entry 4192 (class 0 OID 17254)
-- Dependencies: 260
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.


--
-- TOC entry 4232 (class 0 OID 18039)
-- Dependencies: 300
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- TOC entry 4233 (class 0 OID 18050)
-- Dependencies: 301
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- TOC entry 4206 (class 0 OID 17473)
-- Dependencies: 274
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 16861)
-- Dependencies: 240
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
e2fc74b0-b9c1-449f-aca6-e605853c87c1	audience resolve	openid-connect	oidc-audience-resolve-mapper	d25319bf-cc27-4e00-a2d6-95bf46420b77	\N
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	locale	openid-connect	oidc-usermodel-attribute-mapper	6d7aa9b5-d484-4fc4-b852-2180de020dc2	\N
63afde3e-48d8-498d-b57f-890e2208cda6	role list	saml	saml-role-list-mapper	\N	171e1c41-1a0b-468a-a291-bd37514fa8bf
e636fd15-8aaa-419b-b005-1da25a532f0f	organization	saml	saml-organization-membership-mapper	\N	c1dab47a-cc18-401c-8255-c6a968082eb0
fcca6993-e60f-41be-b7d4-ebe94924d133	full name	openid-connect	oidc-full-name-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
67d41a66-f44a-4523-96d8-ac2ce69f44e8	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
0129194f-45f8-4024-ab92-f47b168d76ef	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
2d437086-d707-4e90-b31e-471e93a6c705	username	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
435326b8-0d13-4a99-b6b1-59c9d795e042	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
b19dfded-c848-42a5-9d48-bb78fde1448a	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
d9716b5e-6ebd-4166-897c-2acdc3115d2d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
549ee9d1-f5b0-46c0-a453-290725f8cf32	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
928a4fc2-dae5-4db5-9593-4280dd257d65	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
0a876924-8276-445c-a3a8-6c03c5fa0753	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	371384d4-852d-4464-8682-a32857d3b727
9846d17f-e566-46d6-9f3b-d68af28a02ce	email	openid-connect	oidc-usermodel-attribute-mapper	\N	328567a2-592c-48cd-ba80-ad072b383c66
a941571b-1193-4cfc-9359-56d2d49d330b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	328567a2-592c-48cd-ba80-ad072b383c66
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	address	openid-connect	oidc-address-mapper	\N	60cfe998-b2f9-4dd9-a883-d31445c9404a
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	3446d078-d5d8-4dd3-afb0-967415938526
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	3446d078-d5d8-4dd3-afb0-967415938526
28bfd756-7476-4b17-bdd9-5bec64abdeb0	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	46554d78-12f4-4d92-bd47-c33c979fc244
2942c961-719e-44d4-ad35-a9436e5f3e6f	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	46554d78-12f4-4d92-bd47-c33c979fc244
10f30ddf-a0b6-4ccf-b036-32b43b7cf7a3	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	46554d78-12f4-4d92-bd47-c33c979fc244
302d239e-e63e-4c5d-a0d7-48d4fee74d03	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	dcaa6806-251f-4b62-a505-92c78c3a51d6
0798b5fa-8ed1-47db-ad41-a48981d35212	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9
2255d995-611b-43de-921c-23c7d706a657	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	bc73c0dc-bbb4-49fa-a59c-50a3ff846de9
c85ad2b0-ce6b-43f3-b5f7-6c14566499ae	acr loa level	openid-connect	oidc-acr-mapper	\N	9a27a6c9-25d7-4a56-8ea3-32434df12d8c
0f594732-57a6-481a-adb8-0df1ba4e4660	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	1cf97373-e041-4227-9c60-a04d6ad51336
92795cc2-5768-4298-8766-bcc5738c83a9	sub	openid-connect	oidc-sub-mapper	\N	1cf97373-e041-4227-9c60-a04d6ad51336
435ab357-ea2f-4135-bde3-6f6543b2d6d3	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	5ab8cb13-13cb-44d8-80a5-72297556cddf
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	5ab8cb13-13cb-44d8-80a5-72297556cddf
1fa43f47-296e-436e-9f92-28cb785ed353	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	5ab8cb13-13cb-44d8-80a5-72297556cddf
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	organization	openid-connect	oidc-organization-membership-mapper	\N	259cf9a7-7387-4998-881a-553a0f2612b6
e8f9b2ba-5d2a-4874-9879-a9baee2ff2cf	audience resolve	openid-connect	oidc-audience-resolve-mapper	c8257463-994a-4d46-917d-c8fdeca16e68	\N
0fce9226-8ed0-4bc9-a7a2-b3d3cbafce51	role list	saml	saml-role-list-mapper	\N	5c5a3e63-832d-42f5-8497-0fe839ab237a
a2c1d046-685f-4dc5-86cd-9385898bc1dd	organization	saml	saml-organization-membership-mapper	\N	00e461ed-e697-4f31-8928-caa9ccee6935
8d1074f8-850a-487d-9a35-52f9efb55ca1	full name	openid-connect	oidc-full-name-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
7905753e-02cc-494a-99a0-6c7ef080531a	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
1374d107-ce71-4c77-8c76-ce5b1e1306c3	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
78119d3a-4347-4138-839f-edb76e9ff258	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
062531a7-af93-432d-a944-0ec48b697452	username	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
2e77d803-2a86-4a69-87b6-7890d18944b4	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
f705f1df-c0cd-4081-b57e-422db5003e29	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
96210972-b7c3-4a4b-a853-4181fd64ef79	website	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
d9bf98ea-3b23-4837-a855-d37d2d557a59	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
d8210517-e30c-4be8-92b3-e6c0b1096354	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
27b9490d-11d1-42f7-a131-7d9afc879168	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
9276645c-906f-4622-ac7b-fc2c69345967	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	020831f6-773a-444e-9359-874ac4c224b5
be302849-d855-4171-81aa-1f1557d4b484	email	openid-connect	oidc-usermodel-attribute-mapper	\N	2b773cdb-8237-400a-bb56-5f8ede643204
9571d525-2cb3-43d8-9979-55152f7cb593	email verified	openid-connect	oidc-usermodel-property-mapper	\N	2b773cdb-8237-400a-bb56-5f8ede643204
3a6bbfd2-d5f0-4db2-abea-05e571586434	address	openid-connect	oidc-address-mapper	\N	6ef90676-1a21-451e-b7c9-55abeaf31bdd
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	26792bcd-7e3d-4540-bd16-4a9d17d780d9
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	26792bcd-7e3d-4540-bd16-4a9d17d780d9
e8631b68-8be7-419c-b7e2-9abcabd9de5c	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	c9e966c6-b7b5-49fc-8cb2-59fb3212b472
7d299a55-19ba-41e7-9bc1-536f633119d5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	c9e966c6-b7b5-49fc-8cb2-59fb3212b472
e2e2610b-ba2d-4893-96c1-183a68b5233c	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	c9e966c6-b7b5-49fc-8cb2-59fb3212b472
c3a8b8ca-e6d1-4711-988d-56109badb949	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	47b72aff-a054-438a-98aa-c53fd7ec268f
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	8c8af517-9cc8-4314-93f9-d6f1e00984c0
4a0ee4e2-ae10-4836-841f-0a4be3546b07	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8c8af517-9cc8-4314-93f9-d6f1e00984c0
de74a0c0-4987-4c56-b55a-cdf44cd84c71	acr loa level	openid-connect	oidc-acr-mapper	\N	890f0f9a-7baa-4210-9550-6b414770325b
df559c58-3960-48a5-9d94-3a4c4658143e	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	e24f3648-4cf6-488a-b9b9-15190729f9e8
d0a4bf5e-73b2-4d8b-95fb-b83e5f19a5d1	sub	openid-connect	oidc-sub-mapper	\N	e24f3648-4cf6-488a-b9b9-15190729f9e8
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	67cdc822-9b64-472a-9741-ee46205f20f4
cd2de3ab-81f4-4813-ae1d-73da60deedbc	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	67cdc822-9b64-472a-9741-ee46205f20f4
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	67cdc822-9b64-472a-9741-ee46205f20f4
e8410234-fad2-4429-a84a-474d138b96b1	organization	openid-connect	oidc-organization-membership-mapper	\N	4c939064-1c95-47e6-8ae5-a166d88b1450
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	locale	openid-connect	oidc-usermodel-attribute-mapper	a16c2479-61b1-42a1-9cae-24275c38c104	\N
9b2e8007-eedb-409d-a8a5-3d9e47355136	nombre-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	76bc7c54-6e7f-4334-ad82-9d51b5859ba5
3eaba45e-bb8a-476a-b73b-ce7257bde378	apellido-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	76bc7c54-6e7f-4334-ad82-9d51b5859ba5
3cc82b3d-965d-4a18-8a52-5b54b8485889	pais-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	76bc7c54-6e7f-4334-ad82-9d51b5859ba5
c64b6a82-b44d-47cd-bde0-430d2b353f5a	fechaNacimiento-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	76bc7c54-6e7f-4334-ad82-9d51b5859ba5
22003b0b-4420-439a-b424-31f5c0c9b1d5	nombre-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	f34dde60-d64c-4682-84a4-bf19c52cbf15
aaffbde0-ee42-426a-92d1-ea8fd63740f7	apellido-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	f34dde60-d64c-4682-84a4-bf19c52cbf15
81712263-b2bf-45ae-93a1-6564481a441c	pais-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	f34dde60-d64c-4682-84a4-bf19c52cbf15
96f1e508-ef3a-4f86-b0b4-e793583a785f	fechaNacimiento-mapper	openid-connect	oidc-usermodel-attribute-mapper	\N	f34dde60-d64c-4682-84a4-bf19c52cbf15
\.


--
-- TOC entry 4173 (class 0 OID 16867)
-- Dependencies: 241
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	true	introspection.token.claim
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	true	userinfo.token.claim
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	locale	user.attribute
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	true	id.token.claim
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	true	access.token.claim
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	locale	claim.name
f33f3399-5434-4bf8-9bc7-0c3f75f5a335	String	jsonType.label
63afde3e-48d8-498d-b57f-890e2208cda6	false	single
63afde3e-48d8-498d-b57f-890e2208cda6	Basic	attribute.nameformat
63afde3e-48d8-498d-b57f-890e2208cda6	Role	attribute.name
0129194f-45f8-4024-ab92-f47b168d76ef	true	introspection.token.claim
0129194f-45f8-4024-ab92-f47b168d76ef	true	userinfo.token.claim
0129194f-45f8-4024-ab92-f47b168d76ef	firstName	user.attribute
0129194f-45f8-4024-ab92-f47b168d76ef	true	id.token.claim
0129194f-45f8-4024-ab92-f47b168d76ef	true	access.token.claim
0129194f-45f8-4024-ab92-f47b168d76ef	given_name	claim.name
0129194f-45f8-4024-ab92-f47b168d76ef	String	jsonType.label
0a876924-8276-445c-a3a8-6c03c5fa0753	true	introspection.token.claim
0a876924-8276-445c-a3a8-6c03c5fa0753	true	userinfo.token.claim
0a876924-8276-445c-a3a8-6c03c5fa0753	updatedAt	user.attribute
0a876924-8276-445c-a3a8-6c03c5fa0753	true	id.token.claim
0a876924-8276-445c-a3a8-6c03c5fa0753	true	access.token.claim
0a876924-8276-445c-a3a8-6c03c5fa0753	updated_at	claim.name
0a876924-8276-445c-a3a8-6c03c5fa0753	long	jsonType.label
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	true	introspection.token.claim
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	true	userinfo.token.claim
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	gender	user.attribute
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	true	id.token.claim
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	true	access.token.claim
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	gender	claim.name
15813aa4-e146-486f-8dcc-2c5da9aaf4a6	String	jsonType.label
2d437086-d707-4e90-b31e-471e93a6c705	true	introspection.token.claim
2d437086-d707-4e90-b31e-471e93a6c705	true	userinfo.token.claim
2d437086-d707-4e90-b31e-471e93a6c705	username	user.attribute
2d437086-d707-4e90-b31e-471e93a6c705	true	id.token.claim
2d437086-d707-4e90-b31e-471e93a6c705	true	access.token.claim
2d437086-d707-4e90-b31e-471e93a6c705	preferred_username	claim.name
2d437086-d707-4e90-b31e-471e93a6c705	String	jsonType.label
435326b8-0d13-4a99-b6b1-59c9d795e042	true	introspection.token.claim
435326b8-0d13-4a99-b6b1-59c9d795e042	true	userinfo.token.claim
435326b8-0d13-4a99-b6b1-59c9d795e042	profile	user.attribute
435326b8-0d13-4a99-b6b1-59c9d795e042	true	id.token.claim
435326b8-0d13-4a99-b6b1-59c9d795e042	true	access.token.claim
435326b8-0d13-4a99-b6b1-59c9d795e042	profile	claim.name
435326b8-0d13-4a99-b6b1-59c9d795e042	String	jsonType.label
549ee9d1-f5b0-46c0-a453-290725f8cf32	true	introspection.token.claim
549ee9d1-f5b0-46c0-a453-290725f8cf32	true	userinfo.token.claim
549ee9d1-f5b0-46c0-a453-290725f8cf32	birthdate	user.attribute
549ee9d1-f5b0-46c0-a453-290725f8cf32	true	id.token.claim
549ee9d1-f5b0-46c0-a453-290725f8cf32	true	access.token.claim
549ee9d1-f5b0-46c0-a453-290725f8cf32	birthdate	claim.name
549ee9d1-f5b0-46c0-a453-290725f8cf32	String	jsonType.label
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	true	introspection.token.claim
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	true	userinfo.token.claim
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	nickname	user.attribute
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	true	id.token.claim
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	true	access.token.claim
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	nickname	claim.name
5bd7e7b6-d1ff-4767-97de-bd46f38ac96c	String	jsonType.label
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	true	introspection.token.claim
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	true	userinfo.token.claim
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	zoneinfo	user.attribute
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	true	id.token.claim
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	true	access.token.claim
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	zoneinfo	claim.name
5f1b0050-a9e6-4887-9ffd-c282f3939c0f	String	jsonType.label
67d41a66-f44a-4523-96d8-ac2ce69f44e8	true	introspection.token.claim
67d41a66-f44a-4523-96d8-ac2ce69f44e8	true	userinfo.token.claim
67d41a66-f44a-4523-96d8-ac2ce69f44e8	lastName	user.attribute
67d41a66-f44a-4523-96d8-ac2ce69f44e8	true	id.token.claim
67d41a66-f44a-4523-96d8-ac2ce69f44e8	true	access.token.claim
67d41a66-f44a-4523-96d8-ac2ce69f44e8	family_name	claim.name
67d41a66-f44a-4523-96d8-ac2ce69f44e8	String	jsonType.label
928a4fc2-dae5-4db5-9593-4280dd257d65	true	introspection.token.claim
928a4fc2-dae5-4db5-9593-4280dd257d65	true	userinfo.token.claim
928a4fc2-dae5-4db5-9593-4280dd257d65	locale	user.attribute
928a4fc2-dae5-4db5-9593-4280dd257d65	true	id.token.claim
928a4fc2-dae5-4db5-9593-4280dd257d65	true	access.token.claim
928a4fc2-dae5-4db5-9593-4280dd257d65	locale	claim.name
928a4fc2-dae5-4db5-9593-4280dd257d65	String	jsonType.label
b19dfded-c848-42a5-9d48-bb78fde1448a	true	introspection.token.claim
b19dfded-c848-42a5-9d48-bb78fde1448a	true	userinfo.token.claim
b19dfded-c848-42a5-9d48-bb78fde1448a	picture	user.attribute
b19dfded-c848-42a5-9d48-bb78fde1448a	true	id.token.claim
b19dfded-c848-42a5-9d48-bb78fde1448a	true	access.token.claim
b19dfded-c848-42a5-9d48-bb78fde1448a	picture	claim.name
b19dfded-c848-42a5-9d48-bb78fde1448a	String	jsonType.label
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	true	introspection.token.claim
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	true	userinfo.token.claim
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	middleName	user.attribute
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	true	id.token.claim
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	true	access.token.claim
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	middle_name	claim.name
b91e4b30-9c7c-4197-a7c7-94ddcc5125c9	String	jsonType.label
d9716b5e-6ebd-4166-897c-2acdc3115d2d	true	introspection.token.claim
d9716b5e-6ebd-4166-897c-2acdc3115d2d	true	userinfo.token.claim
d9716b5e-6ebd-4166-897c-2acdc3115d2d	website	user.attribute
d9716b5e-6ebd-4166-897c-2acdc3115d2d	true	id.token.claim
d9716b5e-6ebd-4166-897c-2acdc3115d2d	true	access.token.claim
d9716b5e-6ebd-4166-897c-2acdc3115d2d	website	claim.name
d9716b5e-6ebd-4166-897c-2acdc3115d2d	String	jsonType.label
fcca6993-e60f-41be-b7d4-ebe94924d133	true	introspection.token.claim
fcca6993-e60f-41be-b7d4-ebe94924d133	true	userinfo.token.claim
fcca6993-e60f-41be-b7d4-ebe94924d133	true	id.token.claim
fcca6993-e60f-41be-b7d4-ebe94924d133	true	access.token.claim
9846d17f-e566-46d6-9f3b-d68af28a02ce	true	introspection.token.claim
9846d17f-e566-46d6-9f3b-d68af28a02ce	true	userinfo.token.claim
9846d17f-e566-46d6-9f3b-d68af28a02ce	email	user.attribute
9846d17f-e566-46d6-9f3b-d68af28a02ce	true	id.token.claim
9846d17f-e566-46d6-9f3b-d68af28a02ce	true	access.token.claim
9846d17f-e566-46d6-9f3b-d68af28a02ce	email	claim.name
9846d17f-e566-46d6-9f3b-d68af28a02ce	String	jsonType.label
a941571b-1193-4cfc-9359-56d2d49d330b	true	introspection.token.claim
a941571b-1193-4cfc-9359-56d2d49d330b	true	userinfo.token.claim
a941571b-1193-4cfc-9359-56d2d49d330b	emailVerified	user.attribute
a941571b-1193-4cfc-9359-56d2d49d330b	true	id.token.claim
a941571b-1193-4cfc-9359-56d2d49d330b	true	access.token.claim
a941571b-1193-4cfc-9359-56d2d49d330b	email_verified	claim.name
a941571b-1193-4cfc-9359-56d2d49d330b	boolean	jsonType.label
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	formatted	user.attribute.formatted
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	country	user.attribute.country
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	true	introspection.token.claim
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	postal_code	user.attribute.postal_code
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	true	userinfo.token.claim
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	street	user.attribute.street
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	true	id.token.claim
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	region	user.attribute.region
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	true	access.token.claim
cc4ebb23-8d4e-4303-afb3-68d8411e88ed	locality	user.attribute.locality
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	true	introspection.token.claim
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	true	userinfo.token.claim
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	phoneNumber	user.attribute
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	true	id.token.claim
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	true	access.token.claim
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	phone_number	claim.name
3b2154f2-073f-4b9d-8b6a-d63bbac1695d	String	jsonType.label
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	true	introspection.token.claim
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	true	userinfo.token.claim
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	phoneNumberVerified	user.attribute
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	true	id.token.claim
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	true	access.token.claim
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	phone_number_verified	claim.name
df9ff3fb-eead-44dd-8c55-8a91c2dc69cf	boolean	jsonType.label
10f30ddf-a0b6-4ccf-b036-32b43b7cf7a3	true	introspection.token.claim
10f30ddf-a0b6-4ccf-b036-32b43b7cf7a3	true	access.token.claim
28bfd756-7476-4b17-bdd9-5bec64abdeb0	true	introspection.token.claim
28bfd756-7476-4b17-bdd9-5bec64abdeb0	true	multivalued
28bfd756-7476-4b17-bdd9-5bec64abdeb0	foo	user.attribute
28bfd756-7476-4b17-bdd9-5bec64abdeb0	true	access.token.claim
28bfd756-7476-4b17-bdd9-5bec64abdeb0	realm_access.roles	claim.name
28bfd756-7476-4b17-bdd9-5bec64abdeb0	String	jsonType.label
2942c961-719e-44d4-ad35-a9436e5f3e6f	true	introspection.token.claim
2942c961-719e-44d4-ad35-a9436e5f3e6f	true	multivalued
2942c961-719e-44d4-ad35-a9436e5f3e6f	foo	user.attribute
2942c961-719e-44d4-ad35-a9436e5f3e6f	true	access.token.claim
2942c961-719e-44d4-ad35-a9436e5f3e6f	resource_access.${client_id}.roles	claim.name
2942c961-719e-44d4-ad35-a9436e5f3e6f	String	jsonType.label
302d239e-e63e-4c5d-a0d7-48d4fee74d03	true	introspection.token.claim
302d239e-e63e-4c5d-a0d7-48d4fee74d03	true	access.token.claim
0798b5fa-8ed1-47db-ad41-a48981d35212	true	introspection.token.claim
0798b5fa-8ed1-47db-ad41-a48981d35212	true	userinfo.token.claim
0798b5fa-8ed1-47db-ad41-a48981d35212	username	user.attribute
0798b5fa-8ed1-47db-ad41-a48981d35212	true	id.token.claim
0798b5fa-8ed1-47db-ad41-a48981d35212	true	access.token.claim
0798b5fa-8ed1-47db-ad41-a48981d35212	upn	claim.name
0798b5fa-8ed1-47db-ad41-a48981d35212	String	jsonType.label
2255d995-611b-43de-921c-23c7d706a657	true	introspection.token.claim
2255d995-611b-43de-921c-23c7d706a657	true	multivalued
2255d995-611b-43de-921c-23c7d706a657	foo	user.attribute
2255d995-611b-43de-921c-23c7d706a657	true	id.token.claim
2255d995-611b-43de-921c-23c7d706a657	true	access.token.claim
2255d995-611b-43de-921c-23c7d706a657	groups	claim.name
2255d995-611b-43de-921c-23c7d706a657	String	jsonType.label
c85ad2b0-ce6b-43f3-b5f7-6c14566499ae	true	introspection.token.claim
c85ad2b0-ce6b-43f3-b5f7-6c14566499ae	true	id.token.claim
c85ad2b0-ce6b-43f3-b5f7-6c14566499ae	true	access.token.claim
0f594732-57a6-481a-adb8-0df1ba4e4660	AUTH_TIME	user.session.note
0f594732-57a6-481a-adb8-0df1ba4e4660	true	introspection.token.claim
0f594732-57a6-481a-adb8-0df1ba4e4660	true	id.token.claim
0f594732-57a6-481a-adb8-0df1ba4e4660	true	access.token.claim
0f594732-57a6-481a-adb8-0df1ba4e4660	auth_time	claim.name
0f594732-57a6-481a-adb8-0df1ba4e4660	long	jsonType.label
92795cc2-5768-4298-8766-bcc5738c83a9	true	introspection.token.claim
92795cc2-5768-4298-8766-bcc5738c83a9	true	access.token.claim
1fa43f47-296e-436e-9f92-28cb785ed353	clientAddress	user.session.note
1fa43f47-296e-436e-9f92-28cb785ed353	true	introspection.token.claim
1fa43f47-296e-436e-9f92-28cb785ed353	true	id.token.claim
1fa43f47-296e-436e-9f92-28cb785ed353	true	access.token.claim
1fa43f47-296e-436e-9f92-28cb785ed353	clientAddress	claim.name
1fa43f47-296e-436e-9f92-28cb785ed353	String	jsonType.label
435ab357-ea2f-4135-bde3-6f6543b2d6d3	client_id	user.session.note
435ab357-ea2f-4135-bde3-6f6543b2d6d3	true	introspection.token.claim
435ab357-ea2f-4135-bde3-6f6543b2d6d3	true	id.token.claim
435ab357-ea2f-4135-bde3-6f6543b2d6d3	true	access.token.claim
435ab357-ea2f-4135-bde3-6f6543b2d6d3	client_id	claim.name
435ab357-ea2f-4135-bde3-6f6543b2d6d3	String	jsonType.label
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	clientHost	user.session.note
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	true	introspection.token.claim
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	true	id.token.claim
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	true	access.token.claim
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	clientHost	claim.name
a50bde72-a727-4ad0-b92a-7d2e1337e6f5	String	jsonType.label
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	true	introspection.token.claim
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	true	multivalued
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	true	id.token.claim
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	true	access.token.claim
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	organization	claim.name
7e5f8f5d-fc3f-4aec-8d96-740ad5286365	String	jsonType.label
9b2e8007-eedb-409d-a8a5-3d9e47355136	true	introspection.token.claim
9b2e8007-eedb-409d-a8a5-3d9e47355136	true	userinfo.token.claim
9b2e8007-eedb-409d-a8a5-3d9e47355136	nombre	user.attribute
9b2e8007-eedb-409d-a8a5-3d9e47355136	true	id.token.claim
9b2e8007-eedb-409d-a8a5-3d9e47355136	false	lightweight.claim
9b2e8007-eedb-409d-a8a5-3d9e47355136	true	access.token.claim
9b2e8007-eedb-409d-a8a5-3d9e47355136	nombre	claim.name
9b2e8007-eedb-409d-a8a5-3d9e47355136	String	jsonType.label
3eaba45e-bb8a-476a-b73b-ce7257bde378	true	introspection.token.claim
3eaba45e-bb8a-476a-b73b-ce7257bde378	true	userinfo.token.claim
3eaba45e-bb8a-476a-b73b-ce7257bde378	apellido	user.attribute
3eaba45e-bb8a-476a-b73b-ce7257bde378	true	id.token.claim
3eaba45e-bb8a-476a-b73b-ce7257bde378	false	lightweight.claim
3eaba45e-bb8a-476a-b73b-ce7257bde378	true	access.token.claim
3eaba45e-bb8a-476a-b73b-ce7257bde378	apellido	claim.name
3eaba45e-bb8a-476a-b73b-ce7257bde378	String	jsonType.label
3cc82b3d-965d-4a18-8a52-5b54b8485889	true	introspection.token.claim
3cc82b3d-965d-4a18-8a52-5b54b8485889	true	userinfo.token.claim
3cc82b3d-965d-4a18-8a52-5b54b8485889	pais	user.attribute
3cc82b3d-965d-4a18-8a52-5b54b8485889	true	id.token.claim
3cc82b3d-965d-4a18-8a52-5b54b8485889	false	lightweight.claim
3cc82b3d-965d-4a18-8a52-5b54b8485889	true	access.token.claim
3cc82b3d-965d-4a18-8a52-5b54b8485889	pais	claim.name
3cc82b3d-965d-4a18-8a52-5b54b8485889	String	jsonType.label
c64b6a82-b44d-47cd-bde0-430d2b353f5a	true	introspection.token.claim
c64b6a82-b44d-47cd-bde0-430d2b353f5a	true	userinfo.token.claim
c64b6a82-b44d-47cd-bde0-430d2b353f5a	fechaNacimiento	user.attribute
c64b6a82-b44d-47cd-bde0-430d2b353f5a	true	id.token.claim
c64b6a82-b44d-47cd-bde0-430d2b353f5a	false	lightweight.claim
c64b6a82-b44d-47cd-bde0-430d2b353f5a	true	access.token.claim
c64b6a82-b44d-47cd-bde0-430d2b353f5a	fechaNacimiento	claim.name
c64b6a82-b44d-47cd-bde0-430d2b353f5a	String	jsonType.label
22003b0b-4420-439a-b424-31f5c0c9b1d5	true	introspection.token.claim
22003b0b-4420-439a-b424-31f5c0c9b1d5	true	userinfo.token.claim
22003b0b-4420-439a-b424-31f5c0c9b1d5	nombre	user.attribute
22003b0b-4420-439a-b424-31f5c0c9b1d5	true	id.token.claim
22003b0b-4420-439a-b424-31f5c0c9b1d5	false	lightweight.claim
22003b0b-4420-439a-b424-31f5c0c9b1d5	true	access.token.claim
22003b0b-4420-439a-b424-31f5c0c9b1d5	nombre	claim.name
22003b0b-4420-439a-b424-31f5c0c9b1d5	String	jsonType.label
aaffbde0-ee42-426a-92d1-ea8fd63740f7	true	introspection.token.claim
aaffbde0-ee42-426a-92d1-ea8fd63740f7	true	userinfo.token.claim
aaffbde0-ee42-426a-92d1-ea8fd63740f7	apellido	user.attribute
aaffbde0-ee42-426a-92d1-ea8fd63740f7	true	id.token.claim
aaffbde0-ee42-426a-92d1-ea8fd63740f7	false	lightweight.claim
aaffbde0-ee42-426a-92d1-ea8fd63740f7	true	access.token.claim
aaffbde0-ee42-426a-92d1-ea8fd63740f7	apellido	claim.name
aaffbde0-ee42-426a-92d1-ea8fd63740f7	String	jsonType.label
81712263-b2bf-45ae-93a1-6564481a441c	true	introspection.token.claim
81712263-b2bf-45ae-93a1-6564481a441c	true	userinfo.token.claim
81712263-b2bf-45ae-93a1-6564481a441c	pais	user.attribute
81712263-b2bf-45ae-93a1-6564481a441c	true	id.token.claim
81712263-b2bf-45ae-93a1-6564481a441c	false	lightweight.claim
81712263-b2bf-45ae-93a1-6564481a441c	true	access.token.claim
81712263-b2bf-45ae-93a1-6564481a441c	pais	claim.name
81712263-b2bf-45ae-93a1-6564481a441c	String	jsonType.label
96f1e508-ef3a-4f86-b0b4-e793583a785f	true	introspection.token.claim
96f1e508-ef3a-4f86-b0b4-e793583a785f	true	userinfo.token.claim
96f1e508-ef3a-4f86-b0b4-e793583a785f	fechaNacimiento	user.attribute
96f1e508-ef3a-4f86-b0b4-e793583a785f	true	id.token.claim
96f1e508-ef3a-4f86-b0b4-e793583a785f	false	lightweight.claim
96f1e508-ef3a-4f86-b0b4-e793583a785f	true	access.token.claim
96f1e508-ef3a-4f86-b0b4-e793583a785f	fechaNacimiento	claim.name
96f1e508-ef3a-4f86-b0b4-e793583a785f	String	jsonType.label
0fce9226-8ed0-4bc9-a7a2-b3d3cbafce51	false	single
0fce9226-8ed0-4bc9-a7a2-b3d3cbafce51	Basic	attribute.nameformat
0fce9226-8ed0-4bc9-a7a2-b3d3cbafce51	Role	attribute.name
062531a7-af93-432d-a944-0ec48b697452	true	introspection.token.claim
062531a7-af93-432d-a944-0ec48b697452	true	userinfo.token.claim
062531a7-af93-432d-a944-0ec48b697452	username	user.attribute
062531a7-af93-432d-a944-0ec48b697452	true	id.token.claim
062531a7-af93-432d-a944-0ec48b697452	true	access.token.claim
062531a7-af93-432d-a944-0ec48b697452	preferred_username	claim.name
062531a7-af93-432d-a944-0ec48b697452	String	jsonType.label
1374d107-ce71-4c77-8c76-ce5b1e1306c3	true	introspection.token.claim
1374d107-ce71-4c77-8c76-ce5b1e1306c3	true	userinfo.token.claim
1374d107-ce71-4c77-8c76-ce5b1e1306c3	firstName	user.attribute
1374d107-ce71-4c77-8c76-ce5b1e1306c3	true	id.token.claim
1374d107-ce71-4c77-8c76-ce5b1e1306c3	true	access.token.claim
1374d107-ce71-4c77-8c76-ce5b1e1306c3	given_name	claim.name
1374d107-ce71-4c77-8c76-ce5b1e1306c3	String	jsonType.label
27b9490d-11d1-42f7-a131-7d9afc879168	true	introspection.token.claim
27b9490d-11d1-42f7-a131-7d9afc879168	true	userinfo.token.claim
27b9490d-11d1-42f7-a131-7d9afc879168	locale	user.attribute
27b9490d-11d1-42f7-a131-7d9afc879168	true	id.token.claim
27b9490d-11d1-42f7-a131-7d9afc879168	true	access.token.claim
27b9490d-11d1-42f7-a131-7d9afc879168	locale	claim.name
27b9490d-11d1-42f7-a131-7d9afc879168	String	jsonType.label
2e77d803-2a86-4a69-87b6-7890d18944b4	true	introspection.token.claim
2e77d803-2a86-4a69-87b6-7890d18944b4	true	userinfo.token.claim
2e77d803-2a86-4a69-87b6-7890d18944b4	profile	user.attribute
2e77d803-2a86-4a69-87b6-7890d18944b4	true	id.token.claim
2e77d803-2a86-4a69-87b6-7890d18944b4	true	access.token.claim
2e77d803-2a86-4a69-87b6-7890d18944b4	profile	claim.name
2e77d803-2a86-4a69-87b6-7890d18944b4	String	jsonType.label
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	true	introspection.token.claim
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	true	userinfo.token.claim
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	middleName	user.attribute
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	true	id.token.claim
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	true	access.token.claim
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	middle_name	claim.name
4c41ad59-c28c-424a-81c4-76ec5e4d6b08	String	jsonType.label
78119d3a-4347-4138-839f-edb76e9ff258	true	introspection.token.claim
78119d3a-4347-4138-839f-edb76e9ff258	true	userinfo.token.claim
78119d3a-4347-4138-839f-edb76e9ff258	nickname	user.attribute
78119d3a-4347-4138-839f-edb76e9ff258	true	id.token.claim
78119d3a-4347-4138-839f-edb76e9ff258	true	access.token.claim
78119d3a-4347-4138-839f-edb76e9ff258	nickname	claim.name
78119d3a-4347-4138-839f-edb76e9ff258	String	jsonType.label
7905753e-02cc-494a-99a0-6c7ef080531a	true	introspection.token.claim
7905753e-02cc-494a-99a0-6c7ef080531a	true	userinfo.token.claim
7905753e-02cc-494a-99a0-6c7ef080531a	lastName	user.attribute
7905753e-02cc-494a-99a0-6c7ef080531a	true	id.token.claim
7905753e-02cc-494a-99a0-6c7ef080531a	true	access.token.claim
7905753e-02cc-494a-99a0-6c7ef080531a	family_name	claim.name
7905753e-02cc-494a-99a0-6c7ef080531a	String	jsonType.label
8d1074f8-850a-487d-9a35-52f9efb55ca1	true	introspection.token.claim
8d1074f8-850a-487d-9a35-52f9efb55ca1	true	userinfo.token.claim
8d1074f8-850a-487d-9a35-52f9efb55ca1	true	id.token.claim
8d1074f8-850a-487d-9a35-52f9efb55ca1	true	access.token.claim
9276645c-906f-4622-ac7b-fc2c69345967	true	introspection.token.claim
9276645c-906f-4622-ac7b-fc2c69345967	true	userinfo.token.claim
9276645c-906f-4622-ac7b-fc2c69345967	updatedAt	user.attribute
9276645c-906f-4622-ac7b-fc2c69345967	true	id.token.claim
9276645c-906f-4622-ac7b-fc2c69345967	true	access.token.claim
9276645c-906f-4622-ac7b-fc2c69345967	updated_at	claim.name
9276645c-906f-4622-ac7b-fc2c69345967	long	jsonType.label
96210972-b7c3-4a4b-a853-4181fd64ef79	true	introspection.token.claim
96210972-b7c3-4a4b-a853-4181fd64ef79	true	userinfo.token.claim
96210972-b7c3-4a4b-a853-4181fd64ef79	website	user.attribute
96210972-b7c3-4a4b-a853-4181fd64ef79	true	id.token.claim
96210972-b7c3-4a4b-a853-4181fd64ef79	true	access.token.claim
96210972-b7c3-4a4b-a853-4181fd64ef79	website	claim.name
96210972-b7c3-4a4b-a853-4181fd64ef79	String	jsonType.label
d8210517-e30c-4be8-92b3-e6c0b1096354	true	introspection.token.claim
d8210517-e30c-4be8-92b3-e6c0b1096354	true	userinfo.token.claim
d8210517-e30c-4be8-92b3-e6c0b1096354	zoneinfo	user.attribute
d8210517-e30c-4be8-92b3-e6c0b1096354	true	id.token.claim
d8210517-e30c-4be8-92b3-e6c0b1096354	true	access.token.claim
d8210517-e30c-4be8-92b3-e6c0b1096354	zoneinfo	claim.name
d8210517-e30c-4be8-92b3-e6c0b1096354	String	jsonType.label
d9bf98ea-3b23-4837-a855-d37d2d557a59	true	introspection.token.claim
d9bf98ea-3b23-4837-a855-d37d2d557a59	true	userinfo.token.claim
d9bf98ea-3b23-4837-a855-d37d2d557a59	birthdate	user.attribute
d9bf98ea-3b23-4837-a855-d37d2d557a59	true	id.token.claim
d9bf98ea-3b23-4837-a855-d37d2d557a59	true	access.token.claim
d9bf98ea-3b23-4837-a855-d37d2d557a59	birthdate	claim.name
d9bf98ea-3b23-4837-a855-d37d2d557a59	String	jsonType.label
f705f1df-c0cd-4081-b57e-422db5003e29	true	introspection.token.claim
f705f1df-c0cd-4081-b57e-422db5003e29	true	userinfo.token.claim
f705f1df-c0cd-4081-b57e-422db5003e29	picture	user.attribute
f705f1df-c0cd-4081-b57e-422db5003e29	true	id.token.claim
f705f1df-c0cd-4081-b57e-422db5003e29	true	access.token.claim
f705f1df-c0cd-4081-b57e-422db5003e29	picture	claim.name
f705f1df-c0cd-4081-b57e-422db5003e29	String	jsonType.label
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	true	introspection.token.claim
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	true	userinfo.token.claim
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	gender	user.attribute
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	true	id.token.claim
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	true	access.token.claim
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	gender	claim.name
f75be394-7d5b-431e-8ad0-d62aa09dfb6d	String	jsonType.label
9571d525-2cb3-43d8-9979-55152f7cb593	true	introspection.token.claim
9571d525-2cb3-43d8-9979-55152f7cb593	true	userinfo.token.claim
9571d525-2cb3-43d8-9979-55152f7cb593	emailVerified	user.attribute
9571d525-2cb3-43d8-9979-55152f7cb593	true	id.token.claim
9571d525-2cb3-43d8-9979-55152f7cb593	true	access.token.claim
9571d525-2cb3-43d8-9979-55152f7cb593	email_verified	claim.name
9571d525-2cb3-43d8-9979-55152f7cb593	boolean	jsonType.label
be302849-d855-4171-81aa-1f1557d4b484	true	introspection.token.claim
be302849-d855-4171-81aa-1f1557d4b484	true	userinfo.token.claim
be302849-d855-4171-81aa-1f1557d4b484	email	user.attribute
be302849-d855-4171-81aa-1f1557d4b484	true	id.token.claim
be302849-d855-4171-81aa-1f1557d4b484	true	access.token.claim
be302849-d855-4171-81aa-1f1557d4b484	email	claim.name
be302849-d855-4171-81aa-1f1557d4b484	String	jsonType.label
3a6bbfd2-d5f0-4db2-abea-05e571586434	formatted	user.attribute.formatted
3a6bbfd2-d5f0-4db2-abea-05e571586434	country	user.attribute.country
3a6bbfd2-d5f0-4db2-abea-05e571586434	true	introspection.token.claim
3a6bbfd2-d5f0-4db2-abea-05e571586434	postal_code	user.attribute.postal_code
3a6bbfd2-d5f0-4db2-abea-05e571586434	true	userinfo.token.claim
3a6bbfd2-d5f0-4db2-abea-05e571586434	street	user.attribute.street
3a6bbfd2-d5f0-4db2-abea-05e571586434	true	id.token.claim
3a6bbfd2-d5f0-4db2-abea-05e571586434	region	user.attribute.region
3a6bbfd2-d5f0-4db2-abea-05e571586434	true	access.token.claim
3a6bbfd2-d5f0-4db2-abea-05e571586434	locality	user.attribute.locality
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	true	introspection.token.claim
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	true	userinfo.token.claim
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	phoneNumber	user.attribute
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	true	id.token.claim
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	true	access.token.claim
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	phone_number	claim.name
1afd9490-71bf-4fde-97f4-b8ffa0e4f9d4	String	jsonType.label
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	true	introspection.token.claim
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	true	userinfo.token.claim
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	phoneNumberVerified	user.attribute
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	true	id.token.claim
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	true	access.token.claim
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	phone_number_verified	claim.name
9bebf300-25fb-4f63-a5d3-7504f6c2b3eb	boolean	jsonType.label
7d299a55-19ba-41e7-9bc1-536f633119d5	true	introspection.token.claim
7d299a55-19ba-41e7-9bc1-536f633119d5	true	multivalued
7d299a55-19ba-41e7-9bc1-536f633119d5	foo	user.attribute
7d299a55-19ba-41e7-9bc1-536f633119d5	true	access.token.claim
7d299a55-19ba-41e7-9bc1-536f633119d5	resource_access.${client_id}.roles	claim.name
7d299a55-19ba-41e7-9bc1-536f633119d5	String	jsonType.label
e2e2610b-ba2d-4893-96c1-183a68b5233c	true	introspection.token.claim
e2e2610b-ba2d-4893-96c1-183a68b5233c	true	access.token.claim
e8631b68-8be7-419c-b7e2-9abcabd9de5c	true	introspection.token.claim
e8631b68-8be7-419c-b7e2-9abcabd9de5c	true	multivalued
e8631b68-8be7-419c-b7e2-9abcabd9de5c	foo	user.attribute
e8631b68-8be7-419c-b7e2-9abcabd9de5c	true	access.token.claim
e8631b68-8be7-419c-b7e2-9abcabd9de5c	realm_access.roles	claim.name
e8631b68-8be7-419c-b7e2-9abcabd9de5c	String	jsonType.label
c3a8b8ca-e6d1-4711-988d-56109badb949	true	introspection.token.claim
c3a8b8ca-e6d1-4711-988d-56109badb949	true	access.token.claim
4a0ee4e2-ae10-4836-841f-0a4be3546b07	true	introspection.token.claim
4a0ee4e2-ae10-4836-841f-0a4be3546b07	true	multivalued
4a0ee4e2-ae10-4836-841f-0a4be3546b07	foo	user.attribute
4a0ee4e2-ae10-4836-841f-0a4be3546b07	true	id.token.claim
4a0ee4e2-ae10-4836-841f-0a4be3546b07	true	access.token.claim
4a0ee4e2-ae10-4836-841f-0a4be3546b07	groups	claim.name
4a0ee4e2-ae10-4836-841f-0a4be3546b07	String	jsonType.label
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	true	introspection.token.claim
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	true	userinfo.token.claim
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	username	user.attribute
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	true	id.token.claim
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	true	access.token.claim
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	upn	claim.name
c8be1440-4c80-42ff-8cf5-f69f21e3b43e	String	jsonType.label
de74a0c0-4987-4c56-b55a-cdf44cd84c71	true	introspection.token.claim
de74a0c0-4987-4c56-b55a-cdf44cd84c71	true	id.token.claim
de74a0c0-4987-4c56-b55a-cdf44cd84c71	true	access.token.claim
d0a4bf5e-73b2-4d8b-95fb-b83e5f19a5d1	true	introspection.token.claim
d0a4bf5e-73b2-4d8b-95fb-b83e5f19a5d1	true	access.token.claim
df559c58-3960-48a5-9d94-3a4c4658143e	AUTH_TIME	user.session.note
df559c58-3960-48a5-9d94-3a4c4658143e	true	introspection.token.claim
df559c58-3960-48a5-9d94-3a4c4658143e	true	id.token.claim
df559c58-3960-48a5-9d94-3a4c4658143e	true	access.token.claim
df559c58-3960-48a5-9d94-3a4c4658143e	auth_time	claim.name
df559c58-3960-48a5-9d94-3a4c4658143e	long	jsonType.label
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	client_id	user.session.note
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	true	introspection.token.claim
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	true	id.token.claim
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	true	access.token.claim
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	client_id	claim.name
1a4e9b6b-01ee-4ccb-9ebb-b7218839efbd	String	jsonType.label
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	clientAddress	user.session.note
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	true	introspection.token.claim
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	true	id.token.claim
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	true	access.token.claim
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	clientAddress	claim.name
50177f2a-8cc1-4b06-9f0d-1bcea48da75b	String	jsonType.label
cd2de3ab-81f4-4813-ae1d-73da60deedbc	clientHost	user.session.note
cd2de3ab-81f4-4813-ae1d-73da60deedbc	true	introspection.token.claim
cd2de3ab-81f4-4813-ae1d-73da60deedbc	true	id.token.claim
cd2de3ab-81f4-4813-ae1d-73da60deedbc	true	access.token.claim
cd2de3ab-81f4-4813-ae1d-73da60deedbc	clientHost	claim.name
cd2de3ab-81f4-4813-ae1d-73da60deedbc	String	jsonType.label
e8410234-fad2-4429-a84a-474d138b96b1	true	introspection.token.claim
e8410234-fad2-4429-a84a-474d138b96b1	true	multivalued
e8410234-fad2-4429-a84a-474d138b96b1	true	id.token.claim
e8410234-fad2-4429-a84a-474d138b96b1	true	access.token.claim
e8410234-fad2-4429-a84a-474d138b96b1	organization	claim.name
e8410234-fad2-4429-a84a-474d138b96b1	String	jsonType.label
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	true	introspection.token.claim
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	true	userinfo.token.claim
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	locale	user.attribute
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	true	id.token.claim
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	true	access.token.claim
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	locale	claim.name
e50dc5e9-ed13-4cf4-9f97-dc49ca834fd5	String	jsonType.label
\.


--
-- TOC entry 4156 (class 0 OID 16509)
-- Dependencies: 224
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
c0efcdfc-c15a-41ad-9d15-0924755dd430	60	300	60	\N	\N	\N	t	t	60	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	3dfb234f-78ad-435a-bd32-ac18ffb041e0	1800	f	\N	f	t	f	f	0	1	30	6	HmacSHA1	totp	18aaad31-af93-47cb-98ec-2c430896a89b	251b1ebb-6d53-4266-93ce-ef3bab9f239e	4e9739de-4e72-4b4f-a9f4-e4a918c10950	85f584f2-a4e6-41e9-824e-3f28c608f4df	950312c2-8bca-41a3-8a5c-999f5cf452bb	2592000	f	900	t	f	8ab8688e-dd15-45a2-847c-94cf0fd28e1f	0	f	0	0	99cd80b2-ffc3-4fb3-8c0d-06f1856de575
412b6f06-a54b-491c-b77d-502a467beac2	60	300	300	\N	\N	\N	t	f	0	\N	sharecoding	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	f	cd215e66-0414-4c2d-9e9e-f304cfe878b7	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	84fc32c1-1289-4a39-a0f7-e5ecefff59de	7084e6e6-67f0-4db2-9738-8909d4a4be1a	c17bcdb8-ef1e-4267-ba6f-4da81a28f40f	81204c25-b804-423c-a57f-4e488b397df6	eaf0b0e5-d78f-450f-a748-05cee2ac3519	2592000	f	900	t	f	cb3d7131-adfb-418d-9798-c703480b0973	0	f	0	0	66b590c2-5fe7-4897-b725-08e2e4ac7eaf
\.


--
-- TOC entry 4157 (class 0 OID 16526)
-- Dependencies: 225
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	c0efcdfc-c15a-41ad-9d15-0924755dd430	
_browser_header.xContentTypeOptions	c0efcdfc-c15a-41ad-9d15-0924755dd430	nosniff
_browser_header.referrerPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	no-referrer
_browser_header.xRobotsTag	c0efcdfc-c15a-41ad-9d15-0924755dd430	none
_browser_header.xFrameOptions	c0efcdfc-c15a-41ad-9d15-0924755dd430	SAMEORIGIN
_browser_header.contentSecurityPolicy	c0efcdfc-c15a-41ad-9d15-0924755dd430	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	c0efcdfc-c15a-41ad-9d15-0924755dd430	max-age=31536000; includeSubDomains
bruteForceProtected	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
permanentLockout	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
maxTemporaryLockouts	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
bruteForceStrategy	c0efcdfc-c15a-41ad-9d15-0924755dd430	MULTIPLE
maxFailureWaitSeconds	c0efcdfc-c15a-41ad-9d15-0924755dd430	900
minimumQuickLoginWaitSeconds	c0efcdfc-c15a-41ad-9d15-0924755dd430	60
waitIncrementSeconds	c0efcdfc-c15a-41ad-9d15-0924755dd430	60
quickLoginCheckMilliSeconds	c0efcdfc-c15a-41ad-9d15-0924755dd430	1000
maxDeltaTimeSeconds	c0efcdfc-c15a-41ad-9d15-0924755dd430	43200
failureFactor	c0efcdfc-c15a-41ad-9d15-0924755dd430	30
realmReusableOtpCode	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
firstBrokerLoginFlowId	c0efcdfc-c15a-41ad-9d15-0924755dd430	33e7d1ad-2193-4fb1-8078-924586654f69
displayName	c0efcdfc-c15a-41ad-9d15-0924755dd430	Keycloak
displayNameHtml	c0efcdfc-c15a-41ad-9d15-0924755dd430	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	c0efcdfc-c15a-41ad-9d15-0924755dd430	RS256
offlineSessionMaxLifespanEnabled	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
offlineSessionMaxLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	5184000
cibaBackchannelTokenDeliveryMode	c0efcdfc-c15a-41ad-9d15-0924755dd430	poll
cibaExpiresIn	c0efcdfc-c15a-41ad-9d15-0924755dd430	120
cibaAuthRequestedUserHint	c0efcdfc-c15a-41ad-9d15-0924755dd430	login_hint
parRequestUriLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	60
cibaInterval	c0efcdfc-c15a-41ad-9d15-0924755dd430	5
adminEventsExpiration	c0efcdfc-c15a-41ad-9d15-0924755dd430	3600
organizationsEnabled	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
adminPermissionsEnabled	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
verifiableCredentialsEnabled	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
actionTokenGeneratedByAdminLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	43200
actionTokenGeneratedByUserLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	300
oauth2DeviceCodeLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	600
oauth2DevicePollingInterval	c0efcdfc-c15a-41ad-9d15-0924755dd430	5
clientSessionIdleTimeout	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
clientSessionMaxLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
clientOfflineSessionIdleTimeout	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
clientOfflineSessionMaxLifespan	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
webAuthnPolicyRpEntityName	c0efcdfc-c15a-41ad-9d15-0924755dd430	keycloak
webAuthnPolicySignatureAlgorithms	c0efcdfc-c15a-41ad-9d15-0924755dd430	ES256,RS256
webAuthnPolicyRpId	c0efcdfc-c15a-41ad-9d15-0924755dd430	
webAuthnPolicyAttestationConveyancePreference	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyAuthenticatorAttachment	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyRequireResidentKey	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyUserVerificationRequirement	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyCreateTimeout	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
webAuthnPolicyAvoidSameAuthenticatorRegister	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
webAuthnPolicyRpEntityNamePasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	ES256,RS256
webAuthnPolicyRpIdPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	
webAuthnPolicyAttestationConveyancePreferencePasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyRequireResidentKeyPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	not specified
webAuthnPolicyCreateTimeoutPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	false
client-policies.profiles	c0efcdfc-c15a-41ad-9d15-0924755dd430	{"profiles":[]}
client-policies.policies	c0efcdfc-c15a-41ad-9d15-0924755dd430	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	412b6f06-a54b-491c-b77d-502a467beac2	
_browser_header.xContentTypeOptions	412b6f06-a54b-491c-b77d-502a467beac2	nosniff
_browser_header.referrerPolicy	412b6f06-a54b-491c-b77d-502a467beac2	no-referrer
_browser_header.xRobotsTag	412b6f06-a54b-491c-b77d-502a467beac2	none
_browser_header.xFrameOptions	412b6f06-a54b-491c-b77d-502a467beac2	SAMEORIGIN
_browser_header.contentSecurityPolicy	412b6f06-a54b-491c-b77d-502a467beac2	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	412b6f06-a54b-491c-b77d-502a467beac2	max-age=31536000; includeSubDomains
bruteForceProtected	412b6f06-a54b-491c-b77d-502a467beac2	false
permanentLockout	412b6f06-a54b-491c-b77d-502a467beac2	false
maxTemporaryLockouts	412b6f06-a54b-491c-b77d-502a467beac2	0
bruteForceStrategy	412b6f06-a54b-491c-b77d-502a467beac2	MULTIPLE
maxFailureWaitSeconds	412b6f06-a54b-491c-b77d-502a467beac2	900
minimumQuickLoginWaitSeconds	412b6f06-a54b-491c-b77d-502a467beac2	60
waitIncrementSeconds	412b6f06-a54b-491c-b77d-502a467beac2	60
quickLoginCheckMilliSeconds	412b6f06-a54b-491c-b77d-502a467beac2	1000
maxDeltaTimeSeconds	412b6f06-a54b-491c-b77d-502a467beac2	43200
failureFactor	412b6f06-a54b-491c-b77d-502a467beac2	30
realmReusableOtpCode	412b6f06-a54b-491c-b77d-502a467beac2	false
defaultSignatureAlgorithm	412b6f06-a54b-491c-b77d-502a467beac2	RS256
offlineSessionMaxLifespanEnabled	412b6f06-a54b-491c-b77d-502a467beac2	false
offlineSessionMaxLifespan	412b6f06-a54b-491c-b77d-502a467beac2	5184000
actionTokenGeneratedByAdminLifespan	412b6f06-a54b-491c-b77d-502a467beac2	43200
actionTokenGeneratedByUserLifespan	412b6f06-a54b-491c-b77d-502a467beac2	300
oauth2DeviceCodeLifespan	412b6f06-a54b-491c-b77d-502a467beac2	600
oauth2DevicePollingInterval	412b6f06-a54b-491c-b77d-502a467beac2	5
webAuthnPolicyRpEntityName	412b6f06-a54b-491c-b77d-502a467beac2	keycloak
webAuthnPolicySignatureAlgorithms	412b6f06-a54b-491c-b77d-502a467beac2	ES256,RS256
webAuthnPolicyRpId	412b6f06-a54b-491c-b77d-502a467beac2	
webAuthnPolicyAttestationConveyancePreference	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyAuthenticatorAttachment	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyRequireResidentKey	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyUserVerificationRequirement	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyCreateTimeout	412b6f06-a54b-491c-b77d-502a467beac2	0
webAuthnPolicyAvoidSameAuthenticatorRegister	412b6f06-a54b-491c-b77d-502a467beac2	false
webAuthnPolicyRpEntityNamePasswordless	412b6f06-a54b-491c-b77d-502a467beac2	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	ES256,RS256
webAuthnPolicyRpIdPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	
webAuthnPolicyAttestationConveyancePreferencePasswordless	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyRequireResidentKeyPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	not specified
webAuthnPolicyCreateTimeoutPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	412b6f06-a54b-491c-b77d-502a467beac2	false
cibaBackchannelTokenDeliveryMode	412b6f06-a54b-491c-b77d-502a467beac2	poll
cibaExpiresIn	412b6f06-a54b-491c-b77d-502a467beac2	120
cibaInterval	412b6f06-a54b-491c-b77d-502a467beac2	5
cibaAuthRequestedUserHint	412b6f06-a54b-491c-b77d-502a467beac2	login_hint
parRequestUriLifespan	412b6f06-a54b-491c-b77d-502a467beac2	60
firstBrokerLoginFlowId	412b6f06-a54b-491c-b77d-502a467beac2	52f83214-2dd1-4a29-a38a-3568599845d8
organizationsEnabled	412b6f06-a54b-491c-b77d-502a467beac2	false
adminPermissionsEnabled	412b6f06-a54b-491c-b77d-502a467beac2	false
verifiableCredentialsEnabled	412b6f06-a54b-491c-b77d-502a467beac2	false
clientSessionIdleTimeout	412b6f06-a54b-491c-b77d-502a467beac2	0
clientSessionMaxLifespan	412b6f06-a54b-491c-b77d-502a467beac2	0
clientOfflineSessionIdleTimeout	412b6f06-a54b-491c-b77d-502a467beac2	0
clientOfflineSessionMaxLifespan	412b6f06-a54b-491c-b77d-502a467beac2	0
client-policies.profiles	412b6f06-a54b-491c-b77d-502a467beac2	{"profiles":[]}
client-policies.policies	412b6f06-a54b-491c-b77d-502a467beac2	{"policies":[]}
\.


--
-- TOC entry 4198 (class 0 OID 17283)
-- Dependencies: 266
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 16979)
-- Dependencies: 246
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_CONSENT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_RESET_PASSWORD
c0efcdfc-c15a-41ad-9d15-0924755dd430	GRANT_CONSENT
c0efcdfc-c15a-41ad-9d15-0924755dd430	VERIFY_PROFILE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_TOTP
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_TOTP
c0efcdfc-c15a-41ad-9d15-0924755dd430	REVOKE_GRANT
c0efcdfc-c15a-41ad-9d15-0924755dd430	LOGIN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_LOGIN
c0efcdfc-c15a-41ad-9d15-0924755dd430	RESET_PASSWORD_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_CREDENTIAL
c0efcdfc-c15a-41ad-9d15-0924755dd430	IMPERSONATE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CODE_TO_TOKEN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CUSTOM_REQUIRED_ACTION
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	RESTART_AUTHENTICATION
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_PROFILE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	IMPERSONATE
c0efcdfc-c15a-41ad-9d15-0924755dd430	LOGIN
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_PASSWORD_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_VERIFY_USER_CODE
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_INITIATED_ACCOUNT_LINKING
c0efcdfc-c15a-41ad-9d15-0924755dd430	USER_DISABLED_BY_PERMANENT_LOCKOUT
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_EXTENSION_GRANT
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_CREDENTIAL_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	TOKEN_EXCHANGE
c0efcdfc-c15a-41ad-9d15-0924755dd430	REGISTER
c0efcdfc-c15a-41ad-9d15-0924755dd430	LOGOUT
c0efcdfc-c15a-41ad-9d15-0924755dd430	AUTHREQID_TO_TOKEN
c0efcdfc-c15a-41ad-9d15-0924755dd430	DELETE_ACCOUNT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_REGISTER
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_LINK_ACCOUNT
c0efcdfc-c15a-41ad-9d15-0924755dd430	USER_DISABLED_BY_TEMPORARY_LOCKOUT
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_PASSWORD
c0efcdfc-c15a-41ad-9d15-0924755dd430	DELETE_ACCOUNT
c0efcdfc-c15a-41ad-9d15-0924755dd430	FEDERATED_IDENTITY_LINK_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_DELETE
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_FIRST_LOGIN
c0efcdfc-c15a-41ad-9d15-0924755dd430	VERIFY_EMAIL
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_DELETE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_LOGIN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	RESTART_AUTHENTICATION_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_FEDERATED_IDENTITY_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	EXECUTE_ACTIONS
c0efcdfc-c15a-41ad-9d15-0924755dd430	TOKEN_EXCHANGE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	PERMISSION_TOKEN
c0efcdfc-c15a-41ad-9d15-0924755dd430	FEDERATED_IDENTITY_OVERRIDE_LINK
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_IDENTITY_PROVIDER_LINK_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_CREDENTIAL_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	EXECUTE_ACTION_TOKEN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_VERIFY_EMAIL
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_EXTENSION_GRANT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_AUTH
c0efcdfc-c15a-41ad-9d15-0924755dd430	EXECUTE_ACTIONS_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_FEDERATED_IDENTITY
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_CODE_TO_TOKEN
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_POST_LOGIN
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	FEDERATED_IDENTITY_OVERRIDE_LINK_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_EMAIL
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	REGISTER_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	REVOKE_GRANT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	LOGOUT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_EMAIL_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	EXECUTE_ACTION_TOKEN
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_UPDATE_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_PROFILE
c0efcdfc-c15a-41ad-9d15-0924755dd430	AUTHREQID_TO_TOKEN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	INVITE_ORG_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	FEDERATED_IDENTITY_LINK
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_REGISTER_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	INVITE_ORG
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_VERIFY_EMAIL_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_IDENTITY_PROVIDER_LINK
c0efcdfc-c15a-41ad-9d15-0924755dd430	RESET_PASSWORD
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_INITIATED_ACCOUNT_LINKING_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	OAUTH2_DEVICE_AUTH_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_CREDENTIAL
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_CONSENT
c0efcdfc-c15a-41ad-9d15-0924755dd430	REMOVE_TOTP_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	VERIFY_EMAIL_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	SEND_RESET_PASSWORD_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CLIENT_UPDATE
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_POST_LOGIN_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CUSTOM_REQUIRED_ACTION_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	UPDATE_TOTP_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	CODE_TO_TOKEN
c0efcdfc-c15a-41ad-9d15-0924755dd430	VERIFY_PROFILE
c0efcdfc-c15a-41ad-9d15-0924755dd430	GRANT_CONSENT_ERROR
c0efcdfc-c15a-41ad-9d15-0924755dd430	IDENTITY_PROVIDER_FIRST_LOGIN_ERROR
\.


--
-- TOC entry 4158 (class 0 OID 16534)
-- Dependencies: 226
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
c0efcdfc-c15a-41ad-9d15-0924755dd430	jboss-logging
412b6f06-a54b-491c-b77d-502a467beac2	jboss-logging
\.


--
-- TOC entry 4231 (class 0 OID 17985)
-- Dependencies: 299
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4159 (class 0 OID 16537)
-- Dependencies: 227
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	c0efcdfc-c15a-41ad-9d15-0924755dd430
password	password	t	t	412b6f06-a54b-491c-b77d-502a467beac2
\.


--
-- TOC entry 4160 (class 0 OID 16544)
-- Dependencies: 228
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 16895)
-- Dependencies: 245
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 16554)
-- Dependencies: 229
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.redirect_uris (client_id, value) FROM stdin;
c9254a01-60f0-4754-a80f-780dfca4e118	/realms/master/account/*
d25319bf-cc27-4e00-a2d6-95bf46420b77	/realms/master/account/*
6d7aa9b5-d484-4fc4-b852-2180de020dc2	/admin/master/console/*
fc3f79f9-1fee-4069-a4b4-b47b5a8edd1c	/realms/sharecoding/account/*
c8257463-994a-4d46-917d-c8fdeca16e68	/realms/sharecoding/account/*
a16c2479-61b1-42a1-9cae-24275c38c104	/admin/sharecoding/console/*
af3e53c8-62b6-4564-946f-a7051beb1705	http://localhost:8080/*
af3e53c8-62b6-4564-946f-a7051beb1705	http://localhost:8090/*
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	http://localhost:8080/*
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	http://localhost:8090/*
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	http://localhost:5173/*
\.


--
-- TOC entry 4191 (class 0 OID 17218)
-- Dependencies: 259
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 17211)
-- Dependencies: 258
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
0c5b49ad-f681-425e-81d8-4268d0aab96d	VERIFY_EMAIL	Verify Email	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	VERIFY_EMAIL	50
09e0c741-0d40-4829-b8c7-efcdf0bb0c57	UPDATE_PROFILE	Update Profile	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	UPDATE_PROFILE	40
4d19a450-617a-4856-8237-b9aacfe930db	CONFIGURE_TOTP	Configure OTP	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	CONFIGURE_TOTP	10
296e1d85-568c-448f-b65a-f42a28d1ee39	UPDATE_PASSWORD	Update Password	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	UPDATE_PASSWORD	30
f663e4d0-c7a3-4d68-9d6c-368ed4ef36f9	TERMS_AND_CONDITIONS	Terms and Conditions	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	f	TERMS_AND_CONDITIONS	20
f5a2aa38-77bd-4cd9-ac91-9ba1f6b843f8	delete_account	Delete Account	c0efcdfc-c15a-41ad-9d15-0924755dd430	f	f	delete_account	60
e44be896-f259-4c26-a45a-1330ba928ef5	delete_credential	Delete Credential	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	delete_credential	100
d46d0fa2-c579-4439-8654-bc43bfd17b97	update_user_locale	Update User Locale	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	update_user_locale	1000
34880775-9bc5-459a-a5b4-d986191b3463	webauthn-register	Webauthn Register	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	webauthn-register	70
3b74a895-8f08-4f33-a304-b89cfd7018de	webauthn-register-passwordless	Webauthn Register Passwordless	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	webauthn-register-passwordless	80
db4b0ace-37b4-45db-a703-ebd495a48ed2	VERIFY_PROFILE	Verify Profile	c0efcdfc-c15a-41ad-9d15-0924755dd430	t	f	VERIFY_PROFILE	90
d175cf22-2c94-4556-b7e5-fa41998ba65c	CONFIGURE_TOTP	Configure OTP	412b6f06-a54b-491c-b77d-502a467beac2	t	f	CONFIGURE_TOTP	10
aacdd1d9-df86-48dc-a86b-ed036c132b4e	UPDATE_PASSWORD	Update Password	412b6f06-a54b-491c-b77d-502a467beac2	t	f	UPDATE_PASSWORD	30
ff29fc93-e284-4090-b8d0-2913663b18a3	TERMS_AND_CONDITIONS	Terms and Conditions	412b6f06-a54b-491c-b77d-502a467beac2	f	f	TERMS_AND_CONDITIONS	20
da221324-521f-4845-85fe-30e971b5f655	delete_account	Delete Account	412b6f06-a54b-491c-b77d-502a467beac2	f	f	delete_account	60
f54ff518-6bde-4132-b5ee-9157f2d1240a	delete_credential	Delete Credential	412b6f06-a54b-491c-b77d-502a467beac2	t	f	delete_credential	100
6438e5b0-c59a-4709-abba-65243ac2cb5a	update_user_locale	Update User Locale	412b6f06-a54b-491c-b77d-502a467beac2	t	f	update_user_locale	1000
defb5490-7592-4abf-9649-15e341a2736c	webauthn-register	Webauthn Register	412b6f06-a54b-491c-b77d-502a467beac2	t	f	webauthn-register	70
ca065c7d-984c-4f00-9dba-2fa160a5ec0a	webauthn-register-passwordless	Webauthn Register Passwordless	412b6f06-a54b-491c-b77d-502a467beac2	t	f	webauthn-register-passwordless	80
fa8d1801-e9a9-48ae-a460-ede7a91c570d	UPDATE_PROFILE	Update Profile	412b6f06-a54b-491c-b77d-502a467beac2	f	f	UPDATE_PROFILE	40
e8ce47ab-bcc8-4a19-a074-cc95259fdd11	VERIFY_EMAIL	Verify Email	412b6f06-a54b-491c-b77d-502a467beac2	f	f	VERIFY_EMAIL	50
1a335f85-a5da-4269-aa98-b219ae758aa8	VERIFY_PROFILE	Verify Profile	412b6f06-a54b-491c-b77d-502a467beac2	f	f	VERIFY_PROFILE	90
\.


--
-- TOC entry 4228 (class 0 OID 17916)
-- Dependencies: 296
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 17500)
-- Dependencies: 276
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 17485)
-- Dependencies: 275
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 17423)
-- Dependencies: 270
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 4227 (class 0 OID 17892)
-- Dependencies: 295
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 17459)
-- Dependencies: 273
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 17431)
-- Dependencies: 271
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4204 (class 0 OID 17445)
-- Dependencies: 272
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4229 (class 0 OID 17934)
-- Dependencies: 297
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4234 (class 0 OID 18067)
-- Dependencies: 302
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 17944)
-- Dependencies: 298
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 16557)
-- Dependencies: 230
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
d25319bf-cc27-4e00-a2d6-95bf46420b77	248df3f9-de96-4d1e-a01f-bbf8effaf4d3
d25319bf-cc27-4e00-a2d6-95bf46420b77	b6086bdd-84e3-46c3-b4e4-2f2c16a28964
c8257463-994a-4d46-917d-c8fdeca16e68	d383ffb0-f92a-4194-b97f-1e9c4265606b
c8257463-994a-4d46-917d-c8fdeca16e68	d157c37e-6940-4682-934b-70f891860c99
\.


--
-- TOC entry 4209 (class 0 OID 17515)
-- Dependencies: 277
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4236 (class 0 OID 18083)
-- Dependencies: 304
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
crt_jgroups	{"prvKey":"MIIEpAIBAAKCAQEAwPe4zLwYBgZ5XcEEIRfiMu1lmv63YE0Lc/XG39eGBEVAVg5OblSGv4iAPdoGvXGIxMYf4R8DnKC305TdmxtO+srHQKlro3vdqbcDoSiJZGjiQKiLDasJPbXXJFCathbrHuUrJFc3FqBUzDzKyZJkVlttJpD8gzrlaLTk/06fK7OP6lYHI8SeX3rkkpxeDr60+BKh2Hd1D6FXyGiRdbUb21R/0zECO2iDGK0SQt8DuwoTFPcuSm0tx45gl99XeFIxzzXE6cPeKcwWdY1tXt90M4lDne67KkLNBaN2RIfNkMirKyUujDBLect4GVMRzZT4ehls3vTgLMmWfIo/iUA1PwIDAQABAoIBACAlpM3G0CHA1ls+GpgAyJg/YFvv71DFxRCuc1E7MIJpnww3Ge3bew9RiDvFpLXOwkA12X3BkvJ2++jttfVvGTtCqOsmzl3P9t+dM6eXfzwRFRA8g93lDocPUiYkn4GSU90zxHorZWwJjdbwkb/++WRBmu9/2/Fo0GsfJ784s9+toh6oG0PvZXiTPEYoQ8KwYJxoiW+amSKsVh5QtO5/8SA7QauCjlvwUsDcZBPIdDQF2mSfhkUfydvhd34aBHAneR5zLb9gknvHJ0dPO3O3yyh90nl+hEIQzswT7e3x1Hityj+DvyEj/d5xAK7/Ra8wZUug+6GfoguAnoQ/VjLtQnECgYEA7uMAYttvfTL1bEjxdm7ihlgGktwlLWR5LfCduSnlVo25I5bBCKy55auE7N3mcVxJath4o52RKLz72eP3XPUNHP3eUgDYBNlz+0X3Y44ddmi41ppUP+LtMIkcEGp4wkmiPySLOIJ0mzq2tzdMTDzK+uJepTjSyIrOowro1HsMACMCgYEAzsqZpDASgXM49tMmtaisUZcoMv9qad9FCEA1UHW3HNokb9H6+Yu2MhpQOCX6fqm8hUnQfkecmDSnLLincDcdSNN95e4qgQCVj5GJr+U4wYaDEsHVVzPlFwCdfDlC5nQRxDRrAQmc8tPDyUbyEzaDov2sQn/uU/XEIVVzN1L2+jUCgYBwFuWUfUBX77RGxgc+uhLiVKVo/ZEYNn/BtZhcTLNGpKNNdqxGxL1JbeymNAyv/kyYrNAWfZWiFuLZv2TPIlCv3NMXiTvTMrGAIrlM5l8es06fq7SCcZk33+3iKgNVrrVJiX0l29iZCbi4SWMslo3roJImVn5ZCQCicjkDkmT0HwKBgQDMmtFiDt6AjszyCwHmA7pcED+KFgXoMy1OeJlHvvEq7vvWV+EHQCFJeZedtpYe9Tq+dsZ/68MZJh+ytBGXijDDed67veb4NOfGYa3mB9scQEc4K+k2mvY0yDsKSm3TL0zU4ThukmBkMvspD7U9JVch0fS653GcSTOB99ZECyarcQKBgQC5iC5FZklqe8EsaVMR4rjYCRGrF+HhO6XBK/dycZkhTDI3+D2utjKIVTZL3432L0UE637jWS8A9qcRepGnjVl82KoUusk3fV9qEzJH4gwXvlxND4eT4H2iJz8GyiNEZeLaIf1tsWMVLifU2pxEcJPq8yPJgdVZEjTwHREQvzz0NQ==","pubKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwPe4zLwYBgZ5XcEEIRfiMu1lmv63YE0Lc/XG39eGBEVAVg5OblSGv4iAPdoGvXGIxMYf4R8DnKC305TdmxtO+srHQKlro3vdqbcDoSiJZGjiQKiLDasJPbXXJFCathbrHuUrJFc3FqBUzDzKyZJkVlttJpD8gzrlaLTk/06fK7OP6lYHI8SeX3rkkpxeDr60+BKh2Hd1D6FXyGiRdbUb21R/0zECO2iDGK0SQt8DuwoTFPcuSm0tx45gl99XeFIxzzXE6cPeKcwWdY1tXt90M4lDne67KkLNBaN2RIfNkMirKyUujDBLect4GVMRzZT4ehls3vTgLMmWfIo/iUA1PwIDAQAB","crt":"MIICnTCCAYUCBgGXI0KAAjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdqZ3JvdXBzMB4XDTI1MDUzMDIyMTIzMFoXDTI1MDcyOTIyMTQwOVowEjEQMA4GA1UEAwwHamdyb3VwczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMD3uMy8GAYGeV3BBCEX4jLtZZr+t2BNC3P1xt/XhgRFQFYOTm5Uhr+IgD3aBr1xiMTGH+EfA5ygt9OU3ZsbTvrKx0Cpa6N73am3A6EoiWRo4kCoiw2rCT211yRQmrYW6x7lKyRXNxagVMw8ysmSZFZbbSaQ/IM65Wi05P9Onyuzj+pWByPEnl965JKcXg6+tPgSodh3dQ+hV8hokXW1G9tUf9MxAjtogxitEkLfA7sKExT3LkptLceOYJffV3hSMc81xOnD3inMFnWNbV7fdDOJQ53uuypCzQWjdkSHzZDIqyslLowwS3nLeBlTEc2U+HoZbN704CzJlnyKP4lANT8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAcwhTjwHloEA6l6r4YnVsV6bmo+iRbouaMW1++vGGH6v6f+Ao1NhTr8bOZ2g9luBlYSh1T55GfUKJPeQsp7G7renHbitGPJWzkQLmbFXiiC3NLRrcnKlnnQFNV9rnEM/yG+hkE81LHhcS0n1OyB9R7FYpiFJ8/E5RBEGIsDxcJC7UtWEheEzcUDS7KGObWVUgzlgytNfRTecw07ZLg8G/1MuBj0XcJ1ZnPfKoG815BxQZuqbD6EHKcK+7v/GcP63zOHliGzgEGXDuxWPWSa40tOnz2Y2QnPOzl/1W2ayQAyKxFcGt+9pxMAW8bGSDvylZa40bKCycZ+mCATxCmLO+OA==","alias":"81fcf0c4-b628-4c5b-b6f8-fd6ae8ebf249","generatedMillis":1748643250274}	0
\.


--
-- TOC entry 4163 (class 0 OID 16563)
-- Dependencies: 231
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	5c5484ff-f91e-475f-b10d-735c37e21672	1e200be3-0ddc-4632-9778-9cdf30052853	\N	\N	\N
apellido	Pérez	9729194e-098f-4d1a-8afa-2fbf4d4d0930	35282dbe-3704-461a-b6b6-a203a8b2f3ff	\N	\N	\N
fechaNacimiento	1995-05-25	9729194e-098f-4d1a-8afa-2fbf4d4d0930	31299b83-2f6f-4072-a8f5-0966408d7a65	\N	\N	\N
nombre	Glender	9729194e-098f-4d1a-8afa-2fbf4d4d0930	67c043c7-c6c5-4627-8f98-48d82df94151	\N	\N	\N
pais	Peru	9729194e-098f-4d1a-8afa-2fbf4d4d0930	62fc6f63-8121-4421-a885-cbd0d49015d3	\N	\N	\N
apellido	sda	c0804e0d-a5e0-4a32-93de-45f68eae24bd	400c039d-c11c-4a76-bfd0-745700fe0233	\N	\N	\N
fechaNacimiento	1995-05-25	c0804e0d-a5e0-4a32-93de-45f68eae24bd	5033a3ba-7c45-4b3c-866c-783052b65fe9	\N	\N	\N
nombre	prueba	c0804e0d-a5e0-4a32-93de-45f68eae24bd	4359f2b3-eaa4-4db5-9c47-d168d126559d	\N	\N	\N
pais	Peru	c0804e0d-a5e0-4a32-93de-45f68eae24bd	5e3ec4b9-cf82-45a7-8c91-94ba1d00ec48	\N	\N	\N
apellido	silva	f31c35a8-c001-4515-9af7-812942287d12	fb1b2120-ce1e-4402-a615-ce2e194e9fa3	\N	\N	\N
fechaNacimiento	2004-05-25	f31c35a8-c001-4515-9af7-812942287d12	b8781494-73c7-403b-aa9c-2756c2fd682d	\N	\N	\N
nombre	leroy	f31c35a8-c001-4515-9af7-812942287d12	e7cd7839-2f04-48ba-979a-07a9ec26c9f1	\N	\N	\N
pais	Peru	f31c35a8-c001-4515-9af7-812942287d12	db124c61-179c-404f-bdf8-babd07651648	\N	\N	\N
apellido	cusqui	172cc073-0d17-4f14-8d08-70c28bd43468	e1522835-f777-4d4e-9dca-1323bfea3012	\N	\N	\N
fechaNacimiento	2004-05-25	172cc073-0d17-4f14-8d08-70c28bd43468	85bdc47e-1a67-4315-ba0f-57f990b19610	\N	\N	\N
nombre	josue	172cc073-0d17-4f14-8d08-70c28bd43468	72db606b-ab91-4b52-a5dc-9587a55455db	\N	\N	\N
pais	Peru	172cc073-0d17-4f14-8d08-70c28bd43468	76db9381-4c01-44cc-815b-dd183f92131f	\N	\N	\N
apellido	sanchez	246137a9-3486-4f1e-bafe-6e9cae4409b2	8e5c833e-1e7a-47e9-9225-5ddc49c0cca4	\N	\N	\N
fechaNacimiento	2004-05-25	246137a9-3486-4f1e-bafe-6e9cae4409b2	a1283ffa-3bc7-45fb-bfbf-d6bd28bef8d2	\N	\N	\N
nombre	juan	246137a9-3486-4f1e-bafe-6e9cae4409b2	bed70bf1-7ec2-40d4-8fa2-a534e3e9a51e	\N	\N	\N
pais	Peru	246137a9-3486-4f1e-bafe-6e9cae4409b2	50480797-9e85-43f7-8aac-45a404e32e64	\N	\N	\N
fechaNacimiento	10/85/2	5c5484ff-f91e-475f-b10d-735c37e21672	bec1de80-9558-41b0-ae3f-db941e819e9c	\N	\N	\N
pais	peru	5c5484ff-f91e-475f-b10d-735c37e21672	7bda56b0-814c-4505-b185-85a5bdd4faf7	\N	\N	\N
apellido	vargas	5c5484ff-f91e-475f-b10d-735c37e21672	51cb14c6-0db5-49a0-948d-05334084366f	\N	\N	\N
nombre	glender	5c5484ff-f91e-475f-b10d-735c37e21672	bff5ad15-4d03-4ed3-b5f9-a4518eae870b	\N	\N	\N
apellido	apaza	5f03162b-c458-4746-97e7-8e2d3241cf69	eed68ee4-0bf9-4e24-b45b-f10f80726acc	\N	\N	\N
fechaNacimiento	2004-05-25	5f03162b-c458-4746-97e7-8e2d3241cf69	d5aa7801-91c3-415d-a48a-3959f196e545	\N	\N	\N
nombre	ale	5f03162b-c458-4746-97e7-8e2d3241cf69	d947abca-1534-4885-8f91-3ce7ba1c529b	\N	\N	\N
pais	Peru	5f03162b-c458-4746-97e7-8e2d3241cf69	a3e5cc15-0c16-44b7-8aa1-87a88ba97926	\N	\N	\N
apellido	apazas	e2cc9354-11a4-4e31-ad7c-16c69e821566	509d17ce-b8df-463f-9e43-c71567db4d8e	\N	\N	\N
fechaNacimiento	2004-05-25	e2cc9354-11a4-4e31-ad7c-16c69e821566	7b05597c-16cd-4aa9-b1b6-71bcfa6db5d1	\N	\N	\N
nombre	alegey	e2cc9354-11a4-4e31-ad7c-16c69e821566	ba63826c-bd6a-4105-8a7c-ea943b27b678	\N	\N	\N
pais	Peru	e2cc9354-11a4-4e31-ad7c-16c69e821566	744e898a-bf61-4dba-8296-25cff154c04a	\N	\N	\N
apellido	castro	1b28757a-d00c-47fd-856c-e5c4aedeb882	385e6474-7346-40a0-bbb6-2a745a55c837	\N	\N	\N
fechaNacimiento	2004-05-25	1b28757a-d00c-47fd-856c-e5c4aedeb882	8cc808c8-1c24-4b9c-a050-a1ea3c576016	\N	\N	\N
nombre	magdiel	1b28757a-d00c-47fd-856c-e5c4aedeb882	39c03242-7015-4b5a-a370-6365bf9a48e6	\N	\N	\N
pais	Peru	1b28757a-d00c-47fd-856c-e5c4aedeb882	170c4433-f7ed-47ad-b767-95e6638e3910	\N	\N	\N
apellido	cahuana	7f6f4483-a8a9-44ab-9dba-c752d0fb2282	b5c05a33-aa10-46df-af13-59d66d52eebd	\N	\N	\N
fechaNacimiento	2004-05-25	7f6f4483-a8a9-44ab-9dba-c752d0fb2282	e1d405f1-9343-4a46-a2f1-bb4a007c495e	\N	\N	\N
nombre	magdie	7f6f4483-a8a9-44ab-9dba-c752d0fb2282	a8931178-c04b-46ba-a785-e630f82ce057	\N	\N	\N
pais	Peru	7f6f4483-a8a9-44ab-9dba-c752d0fb2282	92cd3095-0ae8-4caf-86ad-86e8b9d1f7f3	\N	\N	\N
apellido	cahuan	9bcefdd1-7cb1-4a07-8dd9-d911c911de96	f477d1dd-bf99-486b-b934-a020970be38a	\N	\N	\N
fechaNacimiento	2004-05-25	9bcefdd1-7cb1-4a07-8dd9-d911c911de96	e6b23f16-02d3-4607-a0a5-e7a6a9b23f93	\N	\N	\N
nombre	magdi	9bcefdd1-7cb1-4a07-8dd9-d911c911de96	da09d117-f91b-4638-82ec-253d94f7a0be	\N	\N	\N
pais	Peru	9bcefdd1-7cb1-4a07-8dd9-d911c911de96	b4c795f5-35c4-4097-8eb6-bcb0977786f2	\N	\N	\N
apellido	cahua	3153b757-2824-41ce-ae82-18a13890ac3c	b53f3acd-f0aa-4d0c-b001-97535c5fec72	\N	\N	\N
fechaNacimiento	2004-05-25	3153b757-2824-41ce-ae82-18a13890ac3c	13d695e3-1db4-44be-a729-9c59c7dcd8a6	\N	\N	\N
nombre	magd	3153b757-2824-41ce-ae82-18a13890ac3c	6a7b5097-90d0-46de-b257-8be4f422155e	\N	\N	\N
pais	Peru	3153b757-2824-41ce-ae82-18a13890ac3c	038e8bf9-f84c-4276-8ea2-2ff612ccfd40	\N	\N	\N
apellido	cchau	608387e5-2f91-45e0-8055-dcd396abca2e	0b2c3292-c1de-40b1-8a76-9b9109ff61d5	\N	\N	\N
fechaNacimiento	2004-05-25	608387e5-2f91-45e0-8055-dcd396abca2e	b4b48646-a3fc-4986-8ea1-6de19d97312b	\N	\N	\N
nombre	mamm	608387e5-2f91-45e0-8055-dcd396abca2e	ffb8cd97-254b-476f-9897-554439648659	\N	\N	\N
pais	Peru	608387e5-2f91-45e0-8055-dcd396abca2e	4cd62eaf-5398-45d9-a9ee-a322dc97ac90	\N	\N	\N
apellido	cchaud	957db94b-62cc-4704-9171-f1c2816ce871	cd96cd15-331a-44cd-a9b8-e464e5b08669	\N	\N	\N
fechaNacimiento	2004-05-25	957db94b-62cc-4704-9171-f1c2816ce871	bbc16f7a-f702-476a-aeb9-36ac8c3436a2	\N	\N	\N
nombre	mamms	957db94b-62cc-4704-9171-f1c2816ce871	b45911ce-5d27-4178-b849-1fafee792088	\N	\N	\N
pais	Peru	957db94b-62cc-4704-9171-f1c2816ce871	15424b11-40f2-4bce-b9f6-2e74ea9c7075	\N	\N	\N
apellido	mcnd	6ce9a058-ae7b-4993-9fa2-5bc0d322b163	c12f168c-e529-4ce2-a6b8-b9da3e5f2e1d	\N	\N	\N
fechaNacimiento	2004-05-25	6ce9a058-ae7b-4993-9fa2-5bc0d322b163	246e61e1-de22-4072-b3a8-ba35765d3bd0	\N	\N	\N
nombre	ptrw	6ce9a058-ae7b-4993-9fa2-5bc0d322b163	cc5edfe2-9d8e-4364-aa42-513e19451da4	\N	\N	\N
pais	Peru	6ce9a058-ae7b-4993-9fa2-5bc0d322b163	98a3957a-3f91-4d29-9e65-234c73c84808	\N	\N	\N
apellido	guerrero	c1cb10aa-1548-47ee-b851-8ca460025d0e	cf2ba308-8a30-4507-b33d-a9861877353e	\N	\N	\N
fechaNacimiento	2004-05-25	c1cb10aa-1548-47ee-b851-8ca460025d0e	6a97738a-d397-4d0c-a4f4-9ba96283525d	\N	\N	\N
nombre	paolito	c1cb10aa-1548-47ee-b851-8ca460025d0e	bc598318-c91f-447b-b76b-60cd713e557b	\N	\N	\N
pais	Peru	c1cb10aa-1548-47ee-b851-8ca460025d0e	4f26943b-8fd8-445a-bc28-2c38ecf62128	\N	\N	\N
apellido	dsf	a46ab7a6-bb38-43fe-8bca-db408232651e	60fac376-0d51-4945-80e4-fcf0b1601ea7	\N	\N	\N
fechaNacimiento	2004-05-25	a46ab7a6-bb38-43fe-8bca-db408232651e	e8200dbf-7e93-4539-a4e3-4ef55e8bbe56	\N	\N	\N
nombre	glender	a46ab7a6-bb38-43fe-8bca-db408232651e	b16b14b4-7f72-4ae3-b2a9-287c0fc26269	\N	\N	\N
pais	Peru	a46ab7a6-bb38-43fe-8bca-db408232651e	38af384d-9717-462f-877d-4d393b845a25	\N	\N	\N
\.


--
-- TOC entry 4182 (class 0 OID 17000)
-- Dependencies: 250
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 17867)
-- Dependencies: 293
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 16568)
-- Dependencies: 232
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
75b82590-00a1-46b5-96e0-6791f105e100	\N	53ac9c9d-7991-4772-b158-5a369f4ea510	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	service-account-users-service-client	1748190754046	af3e53c8-62b6-4564-946f-a7051beb1705	0
93e1eebe-5ff8-4f28-a3a9-7c3001828a34	\N	f2e3a6c1-9662-45c7-9114-ec65b27b8c57	f	t	\N	\N	\N	c0efcdfc-c15a-41ad-9d15-0924755dd430	service-account-users-service-client	1748201565228	74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	0
3153b757-2824-41ce-ae82-18a13890ac3c	ma@shsodin.com	ma@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	mag	1748291572635	\N	0
9729194e-098f-4d1a-8afa-2fbf4d4d0930	glender@sharecoding.com	glender@sharecoding.com	t	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	glender222	1748200783978	\N	0
c0804e0d-a5e0-4a32-93de-45f68eae24bd	glender@sharecodin.com	glender@sharecodin.com	t	t	\N	jeoraba	vargas	412b6f06-a54b-491c-b77d-502a467beac2	glender333	1748204724099	\N	0
f31c35a8-c001-4515-9af7-812942287d12	glendedf@sharecodin.com	glendedf@sharecodin.com	t	t	\N	pupup	sdfs	412b6f06-a54b-491c-b77d-502a467beac2	leroychip	1748207904808	\N	0
172cc073-0d17-4f14-8d08-70c28bd43468	glensedf@sharecodin.com	glensedf@sharecodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	josuechip	1748208100979	\N	0
246137a9-3486-4f1e-bafe-6e9cae4409b2	glenssd@sharecodin.com	glenssd@sharecodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	juanchipi	1748208198682	\N	0
5c5484ff-f91e-475f-b10d-735c37e21672	glender.vargasv@upeu.edu.pe	glender.vargasv@upeu.edu.pe	f	t	\N	glender	vargas	c0efcdfc-c15a-41ad-9d15-0924755dd430	admin	1747965975097	\N	0
5f03162b-c458-4746-97e7-8e2d3241cf69	glenssd@shsdecodin.com	glenssd@shsdecodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	alejandro	1748278096882	\N	0
e2cc9354-11a4-4e31-ad7c-16c69e821566	alejandrogey@shsodin.com	alejandrogey@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	alejandrogey	1748278167988	\N	0
1b28757a-d00c-47fd-856c-e5c4aedeb882	magdiel@shsodin.com	magdiel@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	magdiel	1748291444511	\N	0
7f6f4483-a8a9-44ab-9dba-c752d0fb2282	magd@shsodin.com	magd@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	magdi	1748291471428	\N	0
9bcefdd1-7cb1-4a07-8dd9-d911c911de96	mag@shsodin.com	mag@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	magd	1748291531555	\N	0
608387e5-2f91-45e0-8055-dcd396abca2e	m@shsodin.com	m@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	seguebueno	1748294033265	\N	0
957db94b-62cc-4704-9171-f1c2816ce871	dd@shsodin.com	dd@shsodin.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	seguebued	1748296190253	\N	0
6ce9a058-ae7b-4993-9fa2-5bc0d322b163	dd@gmail.com	dd@gmail.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	paola	1748425138882	\N	0
c1cb10aa-1548-47ee-b851-8ca460025d0e	ddj@gmail.com	ddj@gmail.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	paolo	1748599256322	\N	0
a46ab7a6-bb38-43fe-8bca-db408232651e	dddj@gmail.com	dddj@gmail.com	f	t	\N	\N	\N	412b6f06-a54b-491c-b77d-502a467beac2	joel	1748784293383	\N	0
\.


--
-- TOC entry 4165 (class 0 OID 16576)
-- Dependencies: 233
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 17112)
-- Dependencies: 256
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4189 (class 0 OID 17117)
-- Dependencies: 257
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 16581)
-- Dependencies: 234
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4197 (class 0 OID 17280)
-- Dependencies: 265
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- TOC entry 4167 (class 0 OID 16586)
-- Dependencies: 235
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 4168 (class 0 OID 16589)
-- Dependencies: 236
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	5c5484ff-f91e-475f-b10d-735c37e21672
3897b219-e4f7-4191-82d3-3b530e7af1eb	5c5484ff-f91e-475f-b10d-735c37e21672
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	75b82590-00a1-46b5-96e0-6791f105e100
b1507f36-7130-446d-a2ac-6d26b75f89f1	75b82590-00a1-46b5-96e0-6791f105e100
29932be9-77bb-494f-9024-1209ba835668	75b82590-00a1-46b5-96e0-6791f105e100
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	9729194e-098f-4d1a-8afa-2fbf4d4d0930
99cd80b2-ffc3-4fb3-8c0d-06f1856de575	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
eb95e0ea-6bb9-4dab-9e2e-ecd416c29b45	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
edae4682-a640-4183-8dd2-3ac4dfc13bba	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
48259ac0-5ffe-41cb-b586-72cd0f244b8e	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
bc342efe-2ecb-4afc-be6d-ae0c836babf0	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
64a6b6e5-9d67-4059-8450-1b9ac646ad2f	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
15c3e716-573c-4d9e-8240-a438b48c8fdf	93e1eebe-5ff8-4f28-a3a9-7c3001828a34
b6318e64-1527-4c43-a29c-b46e4e98f1c4	75b82590-00a1-46b5-96e0-6791f105e100
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	c0804e0d-a5e0-4a32-93de-45f68eae24bd
991e75a4-b898-4e07-b157-73dbbb7f8ca3	c0804e0d-a5e0-4a32-93de-45f68eae24bd
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	f31c35a8-c001-4515-9af7-812942287d12
991e75a4-b898-4e07-b157-73dbbb7f8ca3	f31c35a8-c001-4515-9af7-812942287d12
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	172cc073-0d17-4f14-8d08-70c28bd43468
991e75a4-b898-4e07-b157-73dbbb7f8ca3	172cc073-0d17-4f14-8d08-70c28bd43468
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	246137a9-3486-4f1e-bafe-6e9cae4409b2
991e75a4-b898-4e07-b157-73dbbb7f8ca3	246137a9-3486-4f1e-bafe-6e9cae4409b2
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	5f03162b-c458-4746-97e7-8e2d3241cf69
991e75a4-b898-4e07-b157-73dbbb7f8ca3	5f03162b-c458-4746-97e7-8e2d3241cf69
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	e2cc9354-11a4-4e31-ad7c-16c69e821566
991e75a4-b898-4e07-b157-73dbbb7f8ca3	e2cc9354-11a4-4e31-ad7c-16c69e821566
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	1b28757a-d00c-47fd-856c-e5c4aedeb882
991e75a4-b898-4e07-b157-73dbbb7f8ca3	1b28757a-d00c-47fd-856c-e5c4aedeb882
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	7f6f4483-a8a9-44ab-9dba-c752d0fb2282
991e75a4-b898-4e07-b157-73dbbb7f8ca3	7f6f4483-a8a9-44ab-9dba-c752d0fb2282
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	9bcefdd1-7cb1-4a07-8dd9-d911c911de96
991e75a4-b898-4e07-b157-73dbbb7f8ca3	9bcefdd1-7cb1-4a07-8dd9-d911c911de96
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	3153b757-2824-41ce-ae82-18a13890ac3c
991e75a4-b898-4e07-b157-73dbbb7f8ca3	3153b757-2824-41ce-ae82-18a13890ac3c
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	608387e5-2f91-45e0-8055-dcd396abca2e
991e75a4-b898-4e07-b157-73dbbb7f8ca3	608387e5-2f91-45e0-8055-dcd396abca2e
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	957db94b-62cc-4704-9171-f1c2816ce871
991e75a4-b898-4e07-b157-73dbbb7f8ca3	957db94b-62cc-4704-9171-f1c2816ce871
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	6ce9a058-ae7b-4993-9fa2-5bc0d322b163
991e75a4-b898-4e07-b157-73dbbb7f8ca3	6ce9a058-ae7b-4993-9fa2-5bc0d322b163
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	c1cb10aa-1548-47ee-b851-8ca460025d0e
991e75a4-b898-4e07-b157-73dbbb7f8ca3	c1cb10aa-1548-47ee-b851-8ca460025d0e
66b590c2-5fe7-4897-b725-08e2e4ac7eaf	a46ab7a6-bb38-43fe-8bca-db408232651e
991e75a4-b898-4e07-b157-73dbbb7f8ca3	a46ab7a6-bb38-43fe-8bca-db408232651e
\.


--
-- TOC entry 4169 (class 0 OID 16603)
-- Dependencies: 237
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: glen
--

COPY public.web_origins (client_id, value) FROM stdin;
6d7aa9b5-d484-4fc4-b852-2180de020dc2	+
a16c2479-61b1-42a1-9cae-24275c38c104	+
af3e53c8-62b6-4564-946f-a7051beb1705	*
74de0b4e-2cc9-4ad5-ae74-5b6fd0dc62e7	*
\.


--
-- TOC entry 3928 (class 2606 OID 18056)
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- TOC entry 3920 (class 2606 OID 18045)
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- TOC entry 3936 (class 2606 OID 18090)
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- TOC entry 3654 (class 2606 OID 17968)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3889 (class 2606 OID 17798)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3891 (class 2606 OID 17997)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3886 (class 2606 OID 17673)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3801 (class 2606 OID 17321)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3849 (class 2606 OID 17596)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3877 (class 2606 OID 17616)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3880 (class 2606 OID 17614)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 17612)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3851 (class 2606 OID 17598)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3856 (class 2606 OID 17600)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3861 (class 2606 OID 17606)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 17608)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3873 (class 2606 OID 17610)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3884 (class 2606 OID 17653)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 17757)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3736 (class 2606 OID 17774)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3668 (class 2606 OID 17776)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3733 (class 2606 OID 17778)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3724 (class 2606 OID 16907)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3709 (class 2606 OID 16841)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3651 (class 2606 OID 16615)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 16909)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3660 (class 2606 OID 16617)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 16623)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 16627)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3678 (class 2606 OID 16631)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3712 (class 2606 OID 16845)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3665 (class 2606 OID 16633)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3671 (class 2606 OID 16635)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3656 (class 2606 OID 16637)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 17761)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 17138)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3763 (class 2606 OID 17136)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 17134)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3757 (class 2606 OID 17132)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3703 (class 2606 OID 16639)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3644 (class 2606 OID 17755)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3731 (class 2606 OID 16911)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3835 (class 2606 OID 17479)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3673 (class 2606 OID 16641)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3648 (class 2606 OID 16643)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3695 (class 2606 OID 16645)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3905 (class 2606 OID 17896)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 17437)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 17465)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 17534)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3840 (class 2606 OID 17504)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3825 (class 2606 OID 17451)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 17489)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3843 (class 2606 OID 17519)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3687 (class 2606 OID 16647)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3773 (class 2606 OID 17146)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3769 (class 2606 OID 17144)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3903 (class 2606 OID 17881)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3899 (class 2606 OID 17871)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3747 (class 2606 OID 17019)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 17288)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 17295)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 17309)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3742 (class 2606 OID 17015)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3745 (class 2606 OID 17195)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3934 (class 2606 OID 18082)
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- TOC entry 3739 (class 2606 OID 17013)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3785 (class 2606 OID 17974)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3780 (class 2606 OID 17265)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3714 (class 2606 OID 16905)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3718 (class 2606 OID 17188)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3675 (class 2606 OID 17780)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3778 (class 2606 OID 17228)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3775 (class 2606 OID 17226)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 17140)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3913 (class 2606 OID 17943)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3915 (class 2606 OID 17950)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3931 (class 2606 OID 18071)
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- TOC entry 3681 (class 2606 OID 17224)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 17302)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3706 (class 2606 OID 17782)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3637 (class 2606 OID 16459)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 17405)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3807 (class 2606 OID 17364)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 17735)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 17393)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3897 (class 2606 OID 17856)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3918 (class 2606 OID 17991)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3911 (class 2606 OID 17923)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 17665)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3729 (class 2606 OID 16962)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3642 (class 2606 OID 16651)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3809 (class 2606 OID 17809)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3691 (class 2606 OID 16655)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3750 (class 2606 OID 18060)
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3823 (class 2606 OID 17982)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3909 (class 2606 OID 17978)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3833 (class 2606 OID 17726)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3828 (class 2606 OID 17730)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3752 (class 2606 OID 18058)
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- TOC entry 3922 (class 2606 OID 18064)
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- TOC entry 3924 (class 2606 OID 18049)
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- TOC entry 3926 (class 2606 OID 18047)
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- TOC entry 3663 (class 2606 OID 16663)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3693 (class 2606 OID 17655)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3852 (class 1259 OID 18031)
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3853 (class 1259 OID 18033)
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3755 (class 1259 OID 18007)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3847 (class 1259 OID 17679)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3758 (class 1259 OID 17683)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3764 (class 1259 OID 17681)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3765 (class 1259 OID 17680)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3761 (class 1259 OID 17682)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3892 (class 1259 OID 17998)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3710 (class 1259 OID 18034)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- TOC entry 3640 (class 1259 OID 17983)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3887 (class 1259 OID 17723)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3810 (class 1259 OID 17886)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3893 (class 1259 OID 17995)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3715 (class 1259 OID 17883)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3813 (class 1259 OID 17884)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3878 (class 1259 OID 17689)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3881 (class 1259 OID 17957)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3882 (class 1259 OID 17688)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3645 (class 1259 OID 17690)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3646 (class 1259 OID 17691)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3894 (class 1259 OID 17889)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3895 (class 1259 OID 17890)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3652 (class 1259 OID 17984)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3721 (class 1259 OID 17422)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3722 (class 1259 OID 17421)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3854 (class 1259 OID 17783)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3857 (class 1259 OID 17803)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3858 (class 1259 OID 17966)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3859 (class 1259 OID 17785)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3862 (class 1259 OID 17786)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3863 (class 1259 OID 17787)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3866 (class 1259 OID 17788)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3867 (class 1259 OID 17789)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3870 (class 1259 OID 17790)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3871 (class 1259 OID 17791)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3874 (class 1259 OID 17792)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3875 (class 1259 OID 17793)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3795 (class 1259 OID 18009)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3796 (class 1259 OID 17694)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3792 (class 1259 OID 17695)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3743 (class 1259 OID 17697)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3725 (class 1259 OID 17696)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3726 (class 1259 OID 18075)
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- TOC entry 3727 (class 1259 OID 18074)
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- TOC entry 3657 (class 1259 OID 17698)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3658 (class 1259 OID 17699)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3781 (class 1259 OID 18038)
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- TOC entry 3782 (class 1259 OID 18037)
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- TOC entry 3783 (class 1259 OID 18002)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3929 (class 1259 OID 18066)
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- TOC entry 3906 (class 1259 OID 18062)
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- TOC entry 3907 (class 1259 OID 18061)
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- TOC entry 3716 (class 1259 OID 17700)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3666 (class 1259 OID 17703)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3805 (class 1259 OID 17882)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3804 (class 1259 OID 17704)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3669 (class 1259 OID 17707)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3737 (class 1259 OID 17706)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3661 (class 1259 OID 17702)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3734 (class 1259 OID 17708)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3676 (class 1259 OID 17709)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3776 (class 1259 OID 17710)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3841 (class 1259 OID 17711)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3838 (class 1259 OID 17712)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3831 (class 1259 OID 17731)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3821 (class 1259 OID 17732)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3826 (class 1259 OID 17733)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3932 (class 1259 OID 18072)
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- TOC entry 3916 (class 1259 OID 17956)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3814 (class 1259 OID 17885)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3679 (class 1259 OID 17716)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3844 (class 1259 OID 17717)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3740 (class 1259 OID 17964)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3900 (class 1259 OID 17891)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3901 (class 1259 OID 18008)
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- TOC entry 3682 (class 1259 OID 17418)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3683 (class 1259 OID 18005)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3748 (class 1259 OID 17415)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3649 (class 1259 OID 17419)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3688 (class 1259 OID 17412)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3799 (class 1259 OID 17414)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3701 (class 1259 OID 17420)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3704 (class 1259 OID 17413)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3689 (class 1259 OID 18006)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3770 (class 1259 OID 17719)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3771 (class 1259 OID 17720)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3698 (class 1259 OID 17721)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3707 (class 1259 OID 17722)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3684 (class 1259 OID 18030)
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3685 (class 1259 OID 18032)
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: glen
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3959 (class 2606 OID 16916)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3953 (class 2606 OID 16846)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3958 (class 2606 OID 16926)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3954 (class 2606 OID 17073)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3945 (class 2606 OID 16671)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3949 (class 2606 OID 16676)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3943 (class 2606 OID 16686)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4001 (class 2606 OID 17924)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3947 (class 2606 OID 16691)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3950 (class 2606 OID 16701)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3940 (class 2606 OID 16706)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3944 (class 2606 OID 16711)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3941 (class 2606 OID 16726)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3937 (class 2606 OID 16731)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3968 (class 2606 OID 17167)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3969 (class 2606 OID 17162)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3967 (class 2606 OID 17157)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3966 (class 2606 OID 17152)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3951 (class 2606 OID 16741)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3978 (class 2606 OID 17830)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3979 (class 2606 OID 17820)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3955 (class 2606 OID 17815)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3994 (class 2606 OID 17674)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3992 (class 2606 OID 17622)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 3993 (class 2606 OID 17617)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3977 (class 2606 OID 17322)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3972 (class 2606 OID 17182)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3970 (class 2606 OID 17177)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3971 (class 2606 OID 17172)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3990 (class 2606 OID 17540)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3988 (class 2606 OID 17525)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3997 (class 2606 OID 17897)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3980 (class 2606 OID 17741)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3998 (class 2606 OID 17902)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3999 (class 2606 OID 17907)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3991 (class 2606 OID 17535)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3989 (class 2606 OID 17520)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4000 (class 2606 OID 17929)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3982 (class 2606 OID 17736)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3984 (class 2606 OID 17490)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3986 (class 2606 OID 17505)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3987 (class 2606 OID 17510)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3985 (class 2606 OID 17495)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3981 (class 2606 OID 17746)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3938 (class 2606 OID 16756)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3996 (class 2606 OID 17872)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3965 (class 2606 OID 17036)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3975 (class 2606 OID 17296)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3974 (class 2606 OID 17310)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3962 (class 2606 OID 16982)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3942 (class 2606 OID 16766)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3963 (class 2606 OID 17026)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3964 (class 2606 OID 17196)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3952 (class 2606 OID 16776)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3946 (class 2606 OID 16786)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3956 (class 2606 OID 16921)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3939 (class 2606 OID 16801)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3957 (class 2606 OID 17189)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 3995 (class 2606 OID 17857)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3973 (class 2606 OID 17231)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4002 (class 2606 OID 17937)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4003 (class 2606 OID 17951)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3961 (class 2606 OID 16951)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3948 (class 2606 OID 16821)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3976 (class 2606 OID 17303)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3983 (class 2606 OID 17480)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3960 (class 2606 OID 16931)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: glen
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2025-06-02 16:46:34 UTC

--
-- PostgreSQL database dump complete
--

