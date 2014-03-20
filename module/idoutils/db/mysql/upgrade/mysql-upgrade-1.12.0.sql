-- -----------------------------------------
-- upgrade path for Icinga IDOUtils 1.12.0
--
-- -----------------------------------------
-- Copyright (c) 2014 Icinga Development Team (http://www.icinga.org)
--
-- Please check http://docs.icinga.org for upgrading information!
-- -----------------------------------------

ALTER TABLE icinga_servicestatus ADD COLUMN check_source_object_id bigint default NULL;
ALTER TABLE icinga_hoststatus ADD COLUMN check_source_object_id bigint default NULL;
ALTER TABLE icinga_statehistory ADD COLUMN check_source_object_id bigint default NULL;

-- -----------------------------------------
-- update dbversion
-- -----------------------------------------

INSERT INTO icinga_dbversion (name, version, create_time, modify_time) VALUES ('idoutils', '1.12.0', NOW(), NOW()) ON DUPLICATE KEY UPDATE version='1.12.0', modify_time=NOW();

