-- Copyright (c) 2006 David Gubler, Arthur van Dorp
-- All rights reserved.
-- 
-- For copying and distribution information, please see the file
-- LICENSE.
--
-- DB creation for mysql. If you make changes, please change 
-- EPCIS_Schema_Template first and other .sql-files accordingly.
--
-- For easy conversion from template, replace:
-- bigint CHECK("id">0) PRIMARY KEY => bigint PRIMARY KEY auto_increment
-- " => `
--
-- Also add or change:
-- SET storage_engine=INNODB;
-- Remove all UNIQUE constraints on varchar attributes which can be
-- longer than 767 bytes because mysql can't handle them.
--
-- CAVEATS: 
-- bigint(20) replaced by bigint, only difference is display length not specified.
-- datetime replaced by timestamp (SQL standard, any caveats?).
-- enum('ADD','OBSERVE','DELETE') replaced with
-- varchar(8) CHECK (action IN ('ADD','OBSERVE','DELETE'))
-- rechecked action type with new standard -> ok.
-- Vocabularies: All uris are now UNIQUE.
-- BizTransactions have now a defined type.
-- All identifiers are double quoted and therefore case sensitive:
-- Use double quotes in queries as well.
--
-- Mysql specific:
-- auto_increment

-- CREATE DB with UTF8

BEGIN;

SET storage_engine=INNODB;

-- Vocabularies --

CREATE TABLE `voc_BizLoc` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_BizStep` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_BizTransType` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_BizTrans` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_Disposition` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_ReadPoint` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);

CREATE TABLE `voc_EPCClass` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`uri` varchar(1023) NOT NULL 
);


-- Business transactions --


CREATE TABLE `BizTransaction` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`bizTrans` bigint NOT NULL REFERENCES `voc_BizTrans` (`id`),
`type` bigint REFERENCES `voc_BizTransType` (`id`)
);

-- Aggregation events --

CREATE TABLE `event_AggregationEvent` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`eventTime` timestamp NOT NULL,
`recordTime` timestamp NOT NULL,
`eventTimeZoneOffset` varchar(8) NOT NULL,
`parentID` varchar(1023) DEFAULT NULL, -- varchar(1023) good choice?
`action` varchar(8) NOT NULL CHECK (`action` IN ('ADD','OBSERVE','DELETE')),
`bizStep` bigint DEFAULT NULL REFERENCES `voc_BizStep` (`id`),
`disposition` bigint DEFAULT NULL REFERENCES `voc_Disposition`(`id`),
`readPoint` bigint DEFAULT NULL REFERENCES `voc_ReadPoint`(`id`),
`bizLocation` bigint DEFAULT NULL REFERENCES `voc_BizLoc`(`id`)
-- `bizTransaction` bigint DEFAULT NULL REFERENCES `voc_BizTrans`(`id`) 
);

CREATE TABLE `event_AggregationEvent_EPCs` (
-- This EPC list is called childEPCs (or childEPCList) in the standard,
-- for uniform access `child` has been ommitted from the table name.
`event_id` bigint NOT NULL REFERENCES `event_AggregationEvent`,
`epc` varchar(1023) NOT NULL
);

CREATE TABLE `event_AggregationEvent_bizTrans` ( 
-- bizTrans 0..* associated with event
`event_id` bigint NOT NULL REFERENCES `event_AggregationEvent` (`id`),
`bizTrans_id` bigint NOT NULL REFERENCES `BizTransaction` (`id`)
);

-- Object events --

CREATE TABLE `event_ObjectEvent` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment -> cross platform sequence???
`eventTime` timestamp NOT NULL,
`recordTime` timestamp NOT NULL,
`eventTimeZoneOffset` varchar(8) NOT NULL,
`action` varchar(8) NOT NULL CHECK (`action` IN ('ADD','OBSERVE','DELETE')),
`bizStep` bigint DEFAULT NULL REFERENCES `voc_BizStep` (`id`),
`disposition` bigint DEFAULT NULL REFERENCES `voc_Disposition` (`id`),
`readPoint` bigint DEFAULT NULL REFERENCES `voc_ReadPoint` (`id`),
`bizLocation` bigint DEFAULT NULL REFERENCES `voc_BizLoc` (`id`)
-- `bizTransaction` bigint DEFAULT NULL REFERENCES `voc_BizTrans` (`id`)
);

CREATE TABLE `event_ObjectEvent_EPCs` (
`event_id` bigint NOT NULL REFERENCES `event_ObjectEvent`,
`epc` varchar(1023) NOT NULL
);

CREATE TABLE `event_ObjectEvent_bizTrans` ( 
-- bizTrans 0..* associated with event
`event_id` bigint NOT NULL REFERENCES `event_ObjectEvent` (`id`),
`bizTrans_id` bigint NOT NULL REFERENCES `BizTransaction` (`id`)
);

CREATE TABLE `event_ObjectEvent_extensions` (
`id` bigint PRIMARY KEY auto_increment,
`event_id` bigint NOT NULL REFERENCES `event_ObjectEvent` (`id`),
`fieldname` varchar(128) NOT NULL,
`prefix` varchar(32) NOT NULL,
`intValue` integer,
`floatValue` float,
`dateValue` timestamp NULL DEFAULT NULL,
`strValue` varchar(1024)
);

-- Quantity events --


CREATE TABLE `event_QuantityEvent` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`eventTime` timestamp NOT NULL,
`recordTime` timestamp NOT NULL,
`eventTimeZoneOffset` varchar(8) NOT NULL,
`epcClass` bigint NOT NULL REFERENCES `voc_EPCClass` (`id`),
`quantity` bigint NOT NULL,
`bizStep` bigint DEFAULT NULL REFERENCES `voc_BizStep` (`id`),
`disposition` bigint DEFAULT NULL REFERENCES `voc_Disposition` (`id`),
`readPoint` bigint DEFAULT NULL REFERENCES `voc_ReadPoint` (`id`),
`bizLocation` bigint DEFAULT NULL REFERENCES `voc_BizLoc` (`id`)
);

CREATE TABLE `event_QuantityEvent_bizTrans` ( 
-- bizTrans 0..* associated with event
`event_id` bigint NOT NULL REFERENCES `event_QuantityEvent` (`id`),
`bizTrans_id` bigint NOT NULL REFERENCES `BizTransaction` (`id`)
);

-- Transactions events --

CREATE TABLE `event_TransactionEvent` (
`id` bigint PRIMARY KEY auto_increment, -- id auto_increment
`eventTime` timestamp NOT NULL,
`recordTime` timestamp NOT NULL,
`eventTimeZoneOffset` varchar(8) NOT NULL,
`parentID` varchar(1023) DEFAULT NULL,
`action` varchar(8) NOT NULL CHECK (`action` IN ('ADD','OBSERVE','DELETE')),
`bizStep` bigint DEFAULT NULL REFERENCES `voc_BizStep` (`id`),
`disposition` bigint DEFAULT NULL REFERENCES `voc_Disposition` (`id`),
`readPoint` bigint DEFAULT NULL REFERENCES `voc_ReadPoint` (`id`),
`bizLocation` bigint DEFAULT NULL REFERENCES `voc_BizLoc` (`id`)
-- `bizTransaction` bigint DEFAULT NULL REFERENCES `voc_BizTrans` (`id`)
);

CREATE TABLE `event_TransactionEvent_EPCs` (
`event_id` bigint NOT NULL REFERENCES `event_TransactionEvent`,
`epc` varchar(1023) NOT NULL
);

CREATE TABLE `event_TransactionEvent_bizTrans` ( 
-- bizTrans 1..* associated with event, at least one not yet enforced in DB
`event_id` bigint NOT NULL REFERENCES `event_TransactionEvent` (`id`),
`bizTrans_id` bigint NOT NULL REFERENCES `BizTransaction` (`id`)
);

-- --- Stored subscriptions -----

CREATE TABLE subscription (
subscriptionid varchar(767) NOT NULL PRIMARY KEY,
params blob,
dest varchar(1023),
sched blob,
trigg varchar(1023),
initialrecordingtime timestamp,
exportifempty boolean,
queryname varchar(1023),
lastexecuted timestamp
);


COMMIT;

