-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: 10.192.138.2
-- Generation Time: Jan 23, 2019 at 04:16 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1-log
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shas_elections_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `action_type` int(11) NOT NULL,
  `action_topic_id` int(11) NOT NULL,
  `conversation_direction` int(11) DEFAULT NULL,
  `conversation_with_other` varchar(100) DEFAULT NULL,
  `action_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `action_status_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_history`
--

CREATE TABLE `action_history` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `user_create_id` int(11) DEFAULT NULL,
  `csv_file_id` int(11) DEFAULT NULL,
  `action_history_topic_id` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) DEFAULT NULL,
  `referenced_model` varchar(100) NOT NULL,
  `referenced_model_action_type` tinyint(4) NOT NULL DEFAULT '0',
  `referenced_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_history_details`
--

CREATE TABLE `action_history_details` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `action_history_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `display_field_name` varchar(50) NOT NULL,
  `old_value` varchar(3000) DEFAULT NULL,
  `new_value` varchar(3000) DEFAULT NULL,
  `old_numeric_value` int(11) DEFAULT NULL,
  `new_numeric_value` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_history_topics`
--

CREATE TABLE `action_history_topics` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `operation_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_status`
--

CREATE TABLE `action_status` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_topics`
--

CREATE TABLE `action_topics` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `action_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ballot_boxes`
--

CREATE TABLE `ballot_boxes` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `mi_id` int(11) NOT NULL,
  `crippled` tinyint(4) NOT NULL DEFAULT '0',
  `ballot_box_role_id` int(11) DEFAULT NULL,
  `special_access` tinyint(4) NOT NULL DEFAULT '0',
  `special_markings` tinyint(4) NOT NULL DEFAULT '0',
  `reporting` tinyint(4) NOT NULL DEFAULT '0',
  `strictly_orthodox` tinyint(4) NOT NULL DEFAULT '0',
  `voter_count` int(11) NOT NULL,
  `votes_count` int(11) DEFAULT NULL,
  `invalid_votes_count` int(11) DEFAULT NULL,
  `household_count` int(11) DEFAULT NULL,
  `voter_support_count` int(11) DEFAULT NULL,
  `reported_votes_count` int(11) DEFAULT NULL,
  `reported_supporters_votes_count` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ballot_boxes_files`
--

CREATE TABLE `ballot_boxes_files` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_name` varchar(10) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `row_count` int(11) NOT NULL DEFAULT '0',
  `current_row` int(11) NOT NULL DEFAULT '0',
  `ballot_boxes_count` int(11) NOT NULL DEFAULT '0',
  `new_clusters_count` int(11) NOT NULL DEFAULT '0',
  `clusters_update_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `execution_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ballot_box_roles`
--

CREATE TABLE `ballot_box_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `budget_files`
--

CREATE TABLE `budget_files` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_name` varchar(10) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `execution_date` datetime DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voter_id` int(11) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `questionnaire_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `portion_id` int(11) NOT NULL,
  `call_end_status` tinyint(4) DEFAULT NULL,
  `call_end_date` datetime DEFAULT NULL,
  `call_action_end_date` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_log`
--

CREATE TABLE `calls_log` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `sip_number` int(11) DEFAULT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `result` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `call_notes`
--

CREATE TABLE `call_notes` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `call_id` int(11) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `support_status_id` int(11) DEFAULT NULL,
  `need_a_ride` tinyint(4) DEFAULT NULL,
  `need_a_ride_time` datetime DEFAULT NULL,
  `call_me_later` tinyint(4) DEFAULT NULL,
  `call_me_later_time` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `home_phone_number` varchar(10) DEFAULT NULL,
  `cell_phone_number` varchar(10) DEFAULT NULL,
  `another_phone_number` varchar(20) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `house_entry` varchar(50) DEFAULT NULL,
  `flat` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `distribution_area` varchar(50) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `scheduled_start_date` date DEFAULT NULL,
  `scheduled_end_date` date DEFAULT NULL,
  `activation_start_date` date DEFAULT NULL,
  `activation_end_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `general_election` tinyint(4) NOT NULL DEFAULT '1',
  `outbound_campaign` tinyint(4) NOT NULL DEFAULT '1',
  `election_campaigns_id` int(11) NOT NULL,
  `telephone_predictive_mode` tinyint(4) NOT NULL DEFAULT '1',
  `team_id` int(11) DEFAULT NULL,
  `team_department_id` int(11) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `action_call_no_answer` tinyint(4) NOT NULL,
  `scheduled_time_no_answer` tinyint(4) NOT NULL,
  `return_call_after` int(11) DEFAULT NULL,
  `max_return_call` int(11) DEFAULT NULL,
  `current_portion_id` int(11) DEFAULT NULL,
  `last_voter_id` int(11) DEFAULT NULL,
  `finished_portions` tinyint(4) NOT NULL DEFAULT '0',
  `user_create_id` int(11) NOT NULL,
  `user_update_id` int(11) NOT NULL,
  `transportation_coordination_phone` varchar(10) DEFAULT NULL,
  `sms_message` varchar(1000) DEFAULT NULL,
  `email_topic` varchar(1000) DEFAULT NULL,
  `email_body` text,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_active_times`
--

CREATE TABLE `campaign_active_times` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_break_times`
--

CREATE TABLE `campaign_break_times` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_messages`
--

CREATE TABLE `campaign_messages` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(10) DEFAULT NULL,
  `file_type` varchar(5) DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  `shareable` tinyint(4) NOT NULL,
  `share_key` varchar(20) DEFAULT NULL,
  `campaign_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_portion_progress`
--

CREATE TABLE `campaign_portion_progress` (
  `id` int(11) NOT NULL,
  `portion_id` int(11) NOT NULL,
  `processing_count` int(11) NOT NULL DEFAULT '0',
  `processed_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_waiting_times`
--

CREATE TABLE `campaign_waiting_times` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mi_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `sub_area_id` int(11) DEFAULT NULL,
  `district` tinyint(4) NOT NULL DEFAULT '0',
  `team_id` int(11) DEFAULT NULL,
  `headquarters_phone_number` varchar(10) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_budget`
--

CREATE TABLE `city_budget` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `budget_type` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_budget_activist_expected_expenses`
--

CREATE TABLE `city_budget_activist_expected_expenses` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_budget_id` int(11) NOT NULL,
  `activist_count` int(11) NOT NULL,
  `activist_salary` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_budget_ongoing_activity_expenses`
--

CREATE TABLE `city_budget_ongoing_activity_expenses` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_budget_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_number` int(11) DEFAULT NULL,
  `provider_name` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_council_members`
--

CREATE TABLE `city_council_members` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `city_department_id` int(11) DEFAULT NULL,
  `municipal_election_party_id` int(11) DEFAULT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `council_number` int(11) NOT NULL,
  `term_of_office` int(11) NOT NULL,
  `role_start` date NOT NULL,
  `role_end` date DEFAULT NULL,
  `order` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_departments`
--

CREATE TABLE `city_departments` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_roles_by_voters`
--

CREATE TABLE `city_roles_by_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_id` int(11) NOT NULL,
  `role_type` tinyint(4) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `city_department_id` int(11) DEFAULT NULL,
  `municipal_election_party_id` int(11) DEFAULT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `council_number` int(11) NOT NULL,
  `term_of_office` int(11) NOT NULL,
  `role_start` date NOT NULL,
  `role_end` date DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_shas_roles`
--

CREATE TABLE `city_shas_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city_shas_roles_by_voters`
--

CREATE TABLE `city_shas_roles_by_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `city_shas_role_id` int(11) NOT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `council_number` int(11) NOT NULL,
  `role_start` date NOT NULL,
  `role_end` date DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE `clusters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `prefix` varchar(30) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `street` varchar(100) NOT NULL,
  `street_id` int(11) NOT NULL DEFAULT '0',
  `house` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `neighborhood_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `mi_id` int(11) NOT NULL,
  `voter_count` int(11) DEFAULT NULL,
  `household_count` int(11) DEFAULT NULL,
  `voter_support_count` int(11) DEFAULT NULL,
  `reporting_ballot_voter_count` int(11) DEFAULT NULL,
  `reporting_ballot_household_count` int(11) DEFAULT NULL,
  `reporting_ballot_voter_support_count` int(11) DEFAULT NULL,
  `reported_votes_count` int(11) DEFAULT NULL,
  `reported_supporters_votes_count` int(11) DEFAULT NULL,
  `reporting_ballot_reported_votes_count` int(11) DEFAULT NULL,
  `reporting_ballot_reported_supporters_votes_count` int(11) DEFAULT NULL,
  `old_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csv_files`
--

CREATE TABLE `csv_files` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `file_name` varchar(10) NOT NULL,
  `file_size` int(11) NOT NULL,
  `row_count` int(11) NOT NULL,
  `current_row` int(11) NOT NULL,
  `header` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `csv_source_id` int(11) NOT NULL,
  `captain_id` int(11) DEFAULT NULL,
  `delete_duplicate_phones` tinyint(4) DEFAULT NULL,
  `update_household_address` tinyint(4) DEFAULT NULL,
  `support_status_id` int(11) DEFAULT NULL,
  `support_status_update_type` tinyint(4) DEFAULT NULL,
  `previous_support_status_id` int(11) DEFAULT NULL,
  `update_household_support_status` tinyint(4) DEFAULT NULL,
  `institute_id` int(11) DEFAULT NULL,
  `institute_role_id` int(11) DEFAULT NULL,
  `institute_categorization_id` int(11) DEFAULT NULL,
  `voter_group_id` int(11) DEFAULT NULL,
  `ethnic_group_id` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `strictly_orthodox` tinyint(4) DEFAULT NULL,
  `error_type` tinyint(4) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csv_file_fields`
--

CREATE TABLE `csv_file_fields` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `csv_file_id` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `field_name` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csv_file_rows`
--

CREATE TABLE `csv_file_rows` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `csv_file_id` int(11) NOT NULL,
  `row_number` int(11) NOT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `error_type` varchar(4) DEFAULT NULL,
  `update_count` smallint(6) DEFAULT '0',
  `added_phone_count` smallint(6) DEFAULT NULL,
  `non_added_phone_count` smallint(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `csv_sources`
--

CREATE TABLE `csv_sources` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(30) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cti_permissions`
--

CREATE TABLE `cti_permissions` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cti_permissions_in_campaigns`
--

CREATE TABLE `cti_permissions_in_campaigns` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `cti_permission_id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `file_name` varchar(10) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_in_entities`
--

CREATE TABLE `documents_in_entities` (
  `id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` int(11) NOT NULL,
  `name` varchar(5) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_campaigns`
--

CREATE TABLE `election_campaigns` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `election_date` date DEFAULT NULL,
  `vote_start_time` time DEFAULT NULL,
  `vote_end_time` time DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `loaded_voters` tinyint(4) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_campaign_party_lists`
--

CREATE TABLE `election_campaign_party_lists` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `letters` varchar(10) NOT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_campaign_party_list_votes`
--

CREATE TABLE `election_campaign_party_list_votes` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `ballot_box_id` int(11) NOT NULL,
  `election_campaign_party_list_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_day_reporting_wrong_messages`
--

CREATE TABLE `election_day_reporting_wrong_messages` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `election_role_by_voter_id` int(11) DEFAULT NULL,
  `message` varchar(70) NOT NULL,
  `ballot_box_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_roles`
--

CREATE TABLE `election_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `system_name` varchar(50) DEFAULT NULL,
  `budget` int(11) NOT NULL DEFAULT '100',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_roles_base_budget`
--

CREATE TABLE `election_roles_base_budget` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_role_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `budget` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_roles_by_voters`
--

CREATE TABLE `election_roles_by_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `election_role_id` int(11) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comment` text,
  `sum` int(11) NOT NULL DEFAULT '100',
  `day_sending_message` tinyint(4) DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  `vote_reporting_key` varchar(20) DEFAULT NULL,
  `instructed` tinyint(4) NOT NULL DEFAULT '0',
  `appointment_letter` tinyint(4) NOT NULL DEFAULT '0',
  `user_create_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `user_lock_id` int(11) DEFAULT NULL,
  `lock_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_role_by_voter_geographic_areas`
--

CREATE TABLE `election_role_by_voter_geographic_areas` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_role_by_voter_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `election_role_shift_id` int(11) DEFAULT NULL,
  `appointment_letter` tinyint(4) DEFAULT NULL,
  `arrival_date` datetime DEFAULT NULL,
  `current_reporting` tinyint(4) NOT NULL DEFAULT '0',
  `correct_reporting` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_role_by_voter_messages`
--

CREATE TABLE `election_role_by_voter_messages` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_role_by_voter_id` int(11) NOT NULL,
  `incoming_sms_id` int(11) DEFAULT NULL,
  `incoming_ivr_id` int(11) DEFAULT NULL,
  `direction` tinyint(4) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `election_role_shifts`
--

CREATE TABLE `election_role_shifts` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ethnic_groups`
--

CREATE TABLE `ethnic_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sephardi` tinyint(4) DEFAULT NULL,
  `old_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `external_users`
--

CREATE TABLE `external_users` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `token` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_group_id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `size` bigint(20) NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_groups`
--

CREATE TABLE `file_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `finished_voters_in_campaign`
--

CREATE TABLE `finished_voters_in_campaign` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_report_system_reserved`
--

CREATE TABLE `general_report_system_reserved` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `voter_filter_column_set_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geographic_filters`
--

CREATE TABLE `geographic_filters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role_by_user_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `inherited_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geographic_filter_templates`
--

CREATE TABLE `geographic_filter_templates` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `team_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geographic_voter_filters`
--

CREATE TABLE `geographic_voter_filters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `voter_filter_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `headquarters`
--

CREATE TABLE `headquarters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `team_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `headquarter_geographic_areas`
--

CREATE TABLE `headquarter_geographic_areas` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `headquarter_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `entity_type` tinyint(4) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `history_topic_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `history_topics`
--

CREATE TABLE `history_topics` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `operation_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `households_with_captains_of_fifty`
--

CREATE TABLE `households_with_captains_of_fifty` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `household_id` int(11) NOT NULL,
  `captain_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `household_support_status_changes`
--

CREATE TABLE `household_support_status_changes` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `geographic_entity_type` tinyint(4) NOT NULL,
  `geographic_entity_id` int(11) NOT NULL,
  `household_voters_inclusion_type` tinyint(4) NOT NULL,
  `household_voters_inclusion_limit` int(11) NOT NULL,
  `household_voters_inclusion_support_status_ids` varchar(40) NOT NULL,
  `household_voters_inclusion_support_status_type` tinyint(4) NOT NULL,
  `voters_inclusion_support_status_ids` varchar(40) NOT NULL,
  `selected_support_status_id` int(11) NOT NULL,
  `change_status` tinyint(4) NOT NULL DEFAULT '0',
  `geographic_households_count` int(11) NOT NULL,
  `geographic_voters_count` int(11) NOT NULL,
  `selected_households_count` int(11) NOT NULL,
  `selected_voters_count` int(11) NOT NULL,
  `updated_voters_count` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `household_updates`
--

CREATE TABLE `household_updates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `parts` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `household_update_parts`
--

CREATE TABLE `household_update_parts` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `household_update_id` int(11) NOT NULL,
  `start_voter_id` int(11) NOT NULL,
  `current_voter_id` int(11) DEFAULT NULL,
  `end_voter_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `execution_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_ivr`
--

CREATE TABLE `incoming_ivr` (
  `id` int(11) NOT NULL,
  `key` varchar(6) NOT NULL,
  `source` varchar(15) NOT NULL,
  `destination` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_sms`
--

CREATE TABLE `incoming_sms` (
  `id` int(11) NOT NULL,
  `key` varchar(6) NOT NULL,
  `source` varchar(15) NOT NULL,
  `destination` varchar(15) NOT NULL,
  `reference` varchar(10) NOT NULL,
  `mobile_operator` varchar(1) NOT NULL,
  `message` varchar(70) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institutes`
--

CREATE TABLE `institutes` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `institute_type_id` int(11) NOT NULL,
  `institute_network_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institute_groups`
--

CREATE TABLE `institute_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institute_networks`
--

CREATE TABLE `institute_networks` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institute_roles`
--

CREATE TABLE `institute_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `institute_type_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institute_roles_by_voters`
--

CREATE TABLE `institute_roles_by_voters` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `institute_role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institute_types`
--

CREATE TABLE `institute_types` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `institute_group_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `main` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages_by_users`
--

CREATE TABLE `languages_by_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `main` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `last_viewed_voters`
--

CREATE TABLE `last_viewed_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manual_voter_updates`
--

CREATE TABLE `manual_voter_updates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `csv_source_id` int(11) NOT NULL,
  `data_bring_voter_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `base_url_segment` varchar(20) NOT NULL,
  `order` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direction` tinyint(4) NOT NULL,
  `subject` varchar(1024) DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules_in_file_groups`
--

CREATE TABLE `modules_in_file_groups` (
  `id` int(11) NOT NULL,
  `file_group_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipal_election_cities`
--

CREATE TABLE `municipal_election_cities` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `municipal_election_party_id` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `election_threshold` int(11) DEFAULT NULL,
  `questionnaire_initial_message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipal_election_council_candidates`
--

CREATE TABLE `municipal_election_council_candidates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `municipal_election_party_id` int(11) NOT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipal_election_mayor_candidates`
--

CREATE TABLE `municipal_election_mayor_candidates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `municipal_election_party_id` int(11) NOT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `favorite` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipal_election_parties`
--

CREATE TABLE `municipal_election_parties` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `letters` varchar(10) NOT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `neighborhoods`
--

CREATE TABLE `neighborhoods` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `number_test`
--

CREATE TABLE `number_test` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `old_ballot_boxes`
--

CREATE TABLE `old_ballot_boxes` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `mi_id` int(11) NOT NULL,
  `crippled` tinyint(4) NOT NULL DEFAULT '0',
  `ballot_box_role_id` int(11) DEFAULT NULL,
  `special_access` tinyint(4) NOT NULL DEFAULT '0',
  `special_markings` tinyint(4) NOT NULL DEFAULT '0',
  `reporting` tinyint(4) NOT NULL DEFAULT '0',
  `strictly_orthodox` tinyint(4) NOT NULL DEFAULT '0',
  `voter_count` int(11) NOT NULL,
  `votes_count` int(11) DEFAULT NULL,
  `invalid_votes_count` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `old_ballot_boxes_reference_duplicate_clusters`
--

CREATE TABLE `old_ballot_boxes_reference_duplicate_clusters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `mi_id` int(11) NOT NULL,
  `crippled` tinyint(4) NOT NULL DEFAULT '0',
  `ballot_box_role_id` int(11) DEFAULT NULL,
  `special_access` tinyint(4) NOT NULL DEFAULT '0',
  `special_markings` tinyint(4) NOT NULL DEFAULT '0',
  `reporting` tinyint(4) NOT NULL DEFAULT '0',
  `strictly_orthodox` tinyint(4) NOT NULL DEFAULT '0',
  `voter_count` int(11) NOT NULL,
  `votes_count` int(11) DEFAULT NULL,
  `invalid_votes_count` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `old_clusters`
--

CREATE TABLE `old_clusters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `prefix` varchar(30) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `street` varchar(100) NOT NULL,
  `street_id` int(11) NOT NULL DEFAULT '0',
  `house` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `neighborhood_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `mi_id` int(11) NOT NULL,
  `old_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `old_clusters_with_duplicates`
--

CREATE TABLE `old_clusters_with_duplicates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `prefix` varchar(30) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `street` varchar(100) NOT NULL,
  `street_id` int(11) NOT NULL DEFAULT '0',
  `house` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `neighborhood_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `mi_id` int(11) NOT NULL,
  `old_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `operation_name` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_in_group`
--

CREATE TABLE `permissions_in_group` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_types`
--

CREATE TABLE `phone_types` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `possible_answers`
--

CREATE TABLE `possible_answers` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `text_general` varchar(100) DEFAULT NULL,
  `text_male` varchar(100) DEFAULT NULL,
  `text_female` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `jump_to_question_id` int(11) DEFAULT NULL,
  `support_status_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `predicted_votes_percentages`
--

CREATE TABLE `predicted_votes_percentages` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `percentage` float NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questionnaires`
--

CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `first_question_id` int(11) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `questionnaire_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `text_general` varchar(200) DEFAULT NULL,
  `text_male` varchar(200) DEFAULT NULL,
  `text_female` varchar(200) DEFAULT NULL,
  `information_to_update` varchar(50) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `next_question_id` int(11) DEFAULT NULL,
  `admin_order` int(11) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `redial_voter_phones`
--

CREATE TABLE `redial_voter_phones` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `voter_data` text NOT NULL,
  `redial_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `religious_council_members`
--

CREATE TABLE `religious_council_members` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `city_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `religious_council_role_id` int(11) NOT NULL,
  `voter_phone_id` int(11) DEFAULT NULL,
  `shas` tinyint(4) NOT NULL DEFAULT '0',
  `role_start` date NOT NULL,
  `role_end` date DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `religious_council_roles`
--

CREATE TABLE `religious_council_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reported_hourly_votes`
--

CREATE TABLE `reported_hourly_votes` (
  `id` int(11) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `hour` tinyint(4) NOT NULL DEFAULT '0',
  `reported_votes_count` int(11) NOT NULL,
  `reported_supporters_votes_count` int(11) NOT NULL,
  `reporting_ballot_reported_votes_count` int(11) DEFAULT NULL,
  `reporting_ballot_reported_supporters_votes_count` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `unknown_voter_id` int(11) DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `sub_topic_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `target_close_date` datetime DEFAULT NULL COMMENT 'תאריך יעד לסגירה',
  `request_priority_id` int(11) NOT NULL,
  `user_handler_id` int(11) NOT NULL,
  `team_handler_id` int(11) NOT NULL,
  `opened` tinyint(4) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL,
  `request_source_id` int(11) DEFAULT NULL,
  `request_source_fax` varchar(10) DEFAULT NULL,
  `request_source_email` varchar(254) DEFAULT NULL,
  `request_source_first_name` varchar(50) DEFAULT NULL,
  `request_source_last_name` varchar(50) DEFAULT NULL,
  `request_source_phone` varchar(10) DEFAULT NULL,
  `voter_satisfaction` tinyint(4) DEFAULT NULL,
  `request_closure_reason_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `user_update_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_callbiz`
--

CREATE TABLE `request_callbiz` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `request_id` int(11) NOT NULL,
  `callbiz_id` varchar(30) NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(3000) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_closure_reason`
--

CREATE TABLE `request_closure_reason` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_details`
--

CREATE TABLE `request_details` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `details` varchar(400) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_priority`
--

CREATE TABLE `request_priority` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_source`
--

CREATE TABLE `request_source` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_status_type`
--

CREATE TABLE `request_status_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_topics`
--

CREATE TABLE `request_topics` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `topic_order` int(11) NOT NULL,
  `target_close_days` int(11) DEFAULT NULL,
  `default_request_status_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_by_users`
--

CREATE TABLE `roles_by_users` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `team_department_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `main` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filters`
--

CREATE TABLE `sectorial_filters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `role_by_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_definitions`
--

CREATE TABLE `sectorial_filter_definitions` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `sectorial_filter_definitions_group_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `multiselect` tinyint(4) NOT NULL DEFAULT '0',
  `model_list_function` varchar(30) NOT NULL,
  `model_list_dependency_id` int(11) DEFAULT NULL,
  `join` varchar(1024) NOT NULL,
  `constrains` varchar(200) NOT NULL,
  `where_type` tinyint(4) NOT NULL,
  `field` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_definition_groups`
--

CREATE TABLE `sectorial_filter_definition_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_definition_values`
--

CREATE TABLE `sectorial_filter_definition_values` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `sectorial_filter_definition_id` int(11) NOT NULL,
  `inner_id` int(11) NOT NULL,
  `value` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_items`
--

CREATE TABLE `sectorial_filter_items` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `sectorial_filter_definition_id` int(11) NOT NULL,
  `numeric_value` int(11) DEFAULT NULL,
  `string_value` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_item_values`
--

CREATE TABLE `sectorial_filter_item_values` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `sectorial_filter_item_id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sectorial_filter_templates`
--

CREATE TABLE `sectorial_filter_templates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `minimum_days_between_requests` int(11) NOT NULL,
  `show_system_errors` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shas_representatives`
--

CREATE TABLE `shas_representatives` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `shas_representative_role_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shas_representative_roles`
--

CREATE TABLE `shas_representative_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `side_menus`
--

CREATE TABLE `side_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `action_name` varchar(30) DEFAULT NULL,
  `menu_order` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `external_link` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  `mi_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_areas`
--

CREATE TABLE `sub_areas` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `area_id` int(11) NOT NULL,
  `old_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_menus`
--

CREATE TABLE `sub_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `side_menu_order` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `display_in_menu` tinyint(4) NOT NULL DEFAULT '0',
  `icon_class` varchar(40) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `support_status`
--

CREATE TABLE `support_status` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `likes` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `support_status_updates`
--

CREATE TABLE `support_status_updates` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `total_voters_processed` int(11) NOT NULL DEFAULT '0',
  `current_update_voter_id` int(11) DEFAULT NULL,
  `updated_voters_count` int(11) NOT NULL DEFAULT '0',
  `total_voters_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `execution_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `user_execute_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `viewable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team_departments`
--

CREATE TABLE `team_departments` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team_leader_history`
--

CREATE TABLE `team_leader_history` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team_users`
--

CREATE TABLE `team_users` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_voters`
--

CREATE TABLE `temp_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `personal_identity` varchar(9) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `house` int(11) DEFAULT NULL,
  `house_entry` varchar(10) DEFAULT NULL,
  `flat` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transportation_cars`
--

CREATE TABLE `transportation_cars` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_role_by_voter_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `number` varchar(8) NOT NULL,
  `passenger_count` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unknown_voters`
--

CREATE TABLE `unknown_voters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `personal_identity` varchar(9) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_date_type` tinyint(4) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL,
  `house` int(11) DEFAULT NULL,
  `house_entry` varchar(10) DEFAULT NULL,
  `flat` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unknown_voter_phones`
--

CREATE TABLE `unknown_voter_phones` (
  `id` int(11) NOT NULL,
  `phone_type_id` int(11) NOT NULL,
  `phone_number` varchar(10) DEFAULT '',
  `unknown_voter_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `user_metadata_id` int(11) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `password_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `initial_password` tinyint(4) NOT NULL DEFAULT '0',
  `two_step_authentication` tinyint(4) NOT NULL DEFAULT '1',
  `sms_code` varchar(6) DEFAULT NULL,
  `sms_code_date` datetime DEFAULT NULL,
  `permission_group_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `team_department_id` int(11) DEFAULT NULL,
  `work_city_id` int(11) DEFAULT NULL,
  `work_neighborhood` varchar(50) DEFAULT NULL,
  `work_street` varchar(50) DEFAULT NULL,
  `work_street_id` int(11) DEFAULT NULL,
  `work_house` int(11) DEFAULT NULL,
  `work_house_entry` varchar(50) DEFAULT NULL,
  `work_flat` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `reset_password_token` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_extensions`
--

CREATE TABLE `user_extensions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dialer_user_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `extension_id` varchar(24) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_phones`
--

CREATE TABLE `user_phones` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `phone_type_id` int(11) NOT NULL,
  `phone_number` varchar(10) DEFAULT '',
  `user_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `team_leader` tinyint(4) NOT NULL DEFAULT '0',
  `permission_group_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `personal_identity` varchar(9) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `previous_last_name` varchar(50) DEFAULT NULL,
  `voter_title_id` int(11) DEFAULT NULL,
  `voter_ending_id` int(11) DEFAULT NULL,
  `mi_city` varchar(50) DEFAULT NULL,
  `mi_city_id` int(11) DEFAULT NULL,
  `mi_neighborhood` varchar(50) DEFAULT NULL,
  `mi_street` varchar(50) DEFAULT NULL,
  `mi_street_id` int(11) DEFAULT NULL,
  `mi_house` varchar(50) DEFAULT NULL,
  `mi_house_entry` varchar(50) DEFAULT NULL,
  `mi_flat` varchar(50) DEFAULT NULL,
  `mi_mark` varchar(50) DEFAULT NULL,
  `mi_zip` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `house_entry` varchar(50) DEFAULT NULL,
  `flat` varchar(50) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `distribution_code` varchar(9) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_date_type` tinyint(4) DEFAULT NULL,
  `origin_country_id` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `ethnic_group_id` int(11) DEFAULT NULL,
  `sephardi` tinyint(4) DEFAULT NULL,
  `strictly_orthodox` tinyint(4) DEFAULT NULL,
  `deceased` tinyint(4) DEFAULT NULL,
  `deceased_date` date DEFAULT NULL,
  `can_vote` tinyint(4) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `father_personal_identity` varchar(10) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `mother_personal_identity` varchar(10) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `household_id` int(11) DEFAULT NULL,
  `household_update` tinyint(4) NOT NULL DEFAULT '0',
  `phone_from_table` tinyint(4) NOT NULL DEFAULT '0',
  `verified_address` tinyint(4) NOT NULL DEFAULT '0',
  `wrong_address` tinyint(4) NOT NULL DEFAULT '0',
  `actual_address_correct` tinyint(4) DEFAULT NULL,
  `actual_address_update_date` datetime DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `contact_via_email` tinyint(4) NOT NULL DEFAULT '0',
  `sms` tinyint(4) NOT NULL DEFAULT '0',
  `main_voter_phone_id` int(11) DEFAULT NULL,
  `shas_representative` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(2000) DEFAULT NULL,
  `not_at_home` tinyint(4) NOT NULL DEFAULT '0',
  `additional_care` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters_answers`
--

CREATE TABLE `voters_answers` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `possible_answer_id` int(11) DEFAULT NULL,
  `answer_text` varchar(500) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT '1',
  `call_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters_in_election_campaigns`
--

CREATE TABLE `voters_in_election_campaigns` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `ballot_box_id` int(11) DEFAULT NULL,
  `voter_serial_number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters_in_groups`
--

CREATE TABLE `voters_in_groups` (
  `id` int(11) NOT NULL,
  `voter_group_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters_update_by_household_support_status_chnages`
--

CREATE TABLE `voters_update_by_household_support_status_chnages` (
  `id` int(11) NOT NULL,
  `household_support_status_change_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `old_support_status_id` int(11) DEFAULT NULL,
  `new_support_status_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voters_with_captains_of_fifty`
--

CREATE TABLE `voters_with_captains_of_fifty` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `captain_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_books`
--

CREATE TABLE `voter_books` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_name` varchar(10) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `row_count` int(11) NOT NULL DEFAULT '0',
  `current_row` int(11) NOT NULL DEFAULT '0',
  `voter_count` int(11) NOT NULL DEFAULT '0',
  `new_voter_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `execution_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_book_2018`
--

CREATE TABLE `voter_book_2018` (
  `id` int(11) NOT NULL,
  `personal_identity` varchar(9) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `father_name` varchar(20) NOT NULL,
  `ballot_box_city_mi_id` int(11) NOT NULL,
  `ballot_box_mi_id` int(11) NOT NULL,
  `zip` varchar(7) DEFAULT NULL,
  `city_mi_id` int(11) DEFAULT NULL,
  `city_name` varchar(20) DEFAULT NULL,
  `street_mi_id` int(11) DEFAULT NULL,
  `street_name` varchar(19) DEFAULT NULL,
  `house` varchar(5) DEFAULT NULL,
  `house_entry` varchar(2) DEFAULT NULL,
  `flat` varchar(4) DEFAULT NULL,
  `ot` varchar(1) DEFAULT NULL,
  `ballot_box_serial_number` int(11) NOT NULL,
  `voter_updated` tinyint(4) NOT NULL DEFAULT '0',
  `ballot_updated` tinyint(4) NOT NULL DEFAULT '0',
  `missing_ballot_box` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_book_rows`
--

CREATE TABLE `voter_book_rows` (
  `id` int(11) NOT NULL,
  `voter_book_id` int(11) NOT NULL,
  `row_number` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `voter_id` int(11) DEFAULT NULL,
  `ballot_box_city_id` int(11) DEFAULT NULL,
  `ballot_box_mi_id` int(11) DEFAULT NULL,
  `ballot_box_serial_number` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_endings`
--

CREATE TABLE `voter_endings` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filters`
--

CREATE TABLE `voter_filters` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `voters_count` int(11) DEFAULT NULL,
  `unique_voters_count` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_definitions`
--

CREATE TABLE `voter_filter_definitions` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `model` varchar(30) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `multiselect` tinyint(4) NOT NULL,
  `model_list_function` varchar(30) DEFAULT NULL,
  `model_list_dependency_id` varchar(50) DEFAULT NULL,
  `selected_values_function` varchar(30) DEFAULT NULL,
  `join` text,
  `aggregates` varchar(1024) DEFAULT NULL,
  `where_by_value` text,
  `where_type` tinyint(4) NOT NULL,
  `field` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_definition_values`
--

CREATE TABLE `voter_filter_definition_values` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_filter_definition_id` int(11) NOT NULL,
  `numeric_value` int(11) NOT NULL,
  `label` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_groups`
--

CREATE TABLE `voter_filter_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `voter_filter_type` tinyint(4) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_or` tinyint(4) NOT NULL DEFAULT '0',
  `per_election_campaign` tinyint(4) NOT NULL DEFAULT '0',
  `combined_definitions` tinyint(4) NOT NULL DEFAULT '0',
  `order` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_group_definitions`
--

CREATE TABLE `voter_filter_group_definitions` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_filter_group_id` int(11) NOT NULL,
  `voter_filter_definition_id` int(11) NOT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_items`
--

CREATE TABLE `voter_filter_items` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_filter_id` int(11) NOT NULL,
  `voter_filter_definition_id` int(11) NOT NULL,
  `numeric_value` int(11) DEFAULT NULL,
  `string_value` varchar(50) DEFAULT NULL,
  `time_value` time DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `election_campaign_id` int(11) DEFAULT NULL,
  `combined_definitions` int(11) DEFAULT NULL,
  `is_or_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_item_values`
--

CREATE TABLE `voter_filter_item_values` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_filter_item_id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_filter_module_groups`
--

CREATE TABLE `voter_filter_module_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_filter_group_id` int(11) NOT NULL,
  `voter_filter_module` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_groups`
--

CREATE TABLE `voter_groups` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_create_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL,
  `group_order` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_group_permissions`
--

CREATE TABLE `voter_group_permissions` (
  `id` int(11) NOT NULL,
  `voter_group_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entity_type` tinyint(4) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_metas`
--

CREATE TABLE `voter_metas` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `voter_meta_key_id` int(11) NOT NULL,
  `voter_meta_value_id` int(11) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `election_campaign_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_meta_keys`
--

CREATE TABLE `voter_meta_keys` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `key_type` tinyint(4) NOT NULL,
  `max` int(11) DEFAULT NULL,
  `key_name` varchar(30) NOT NULL,
  `per_campaign` tinyint(4) NOT NULL DEFAULT '0',
  `key_system_name` varchar(30) DEFAULT NULL,
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_meta_values`
--

CREATE TABLE `voter_meta_values` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `voter_meta_key_id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_phones`
--

CREATE TABLE `voter_phones` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `phone_type_id` int(11) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `call_via_tm` tinyint(4) NOT NULL DEFAULT '1',
  `call_via_phone` tinyint(4) NOT NULL DEFAULT '1',
  `sms` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_phones_log`
--

CREATE TABLE `voter_phones_log` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `phone_count` int(11) NOT NULL,
  `result` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_support_status`
--

CREATE TABLE `voter_support_status` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `support_status_id` int(11) NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_titles`
--

CREATE TABLE `voter_titles` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voter_transportations`
--

CREATE TABLE `voter_transportations` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `cripple` tinyint(4) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `voter_driver_id` int(11) DEFAULT NULL,
  `executed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `vote_date` datetime DEFAULT NULL,
  `vote_source_id` int(11) NOT NULL,
  `user_create_id` int(11) DEFAULT NULL,
  `reporting_voter_id` int(11) DEFAULT NULL,
  `notify_captain_fifty` tinyint(4) NOT NULL DEFAULT '0',
  `notify_cluster_leader` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vote_files`
--

CREATE TABLE `vote_files` (
  `id` int(11) NOT NULL,
  `key` varchar(10) NOT NULL,
  `election_campaign_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_name` varchar(10) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `row_count` int(11) NOT NULL DEFAULT '0',
  `current_row` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `execution_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vote_sources`
--

CREATE TABLE `vote_sources` (
  `id` int(11) NOT NULL,
  `key` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `system_name` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `action_history`
--
ALTER TABLE `action_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `reference_model_type_and_id` (`referenced_model`,`referenced_model_action_type`,`referenced_id`),
  ADD KEY `history_id` (`history_id`);

--
-- Indexes for table `action_history_details`
--
ALTER TABLE `action_history_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `action_history_id` (`action_history_id`);

--
-- Indexes for table `action_history_topics`
--
ALTER TABLE `action_history_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `action_status`
--
ALTER TABLE `action_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `action_topics`
--
ALTER TABLE `action_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `ballot_boxes`
--
ALTER TABLE `ballot_boxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `crippled` (`crippled`),
  ADD KEY `strictly_orthodox` (`strictly_orthodox`);

--
-- Indexes for table `ballot_boxes_files`
--
ALTER TABLE `ballot_boxes_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `ballot_box_roles`
--
ALTER TABLE `ballot_box_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `budget_files`
--
ALTER TABLE `budget_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `calls_log`
--
ALTER TABLE `calls_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `call_notes`
--
ALTER TABLE `call_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_active_times`
--
ALTER TABLE `campaign_active_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaign_break_times`
--
ALTER TABLE `campaign_break_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `campaign_messages`
--
ALTER TABLE `campaign_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `share_key` (`share_key`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaign_portion_progress`
--
ALTER TABLE `campaign_portion_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portion_id` (`portion_id`);

--
-- Indexes for table `campaign_waiting_times`
--
ALTER TABLE `campaign_waiting_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `campaign_and_user` (`campaign_id`,`user_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `sub_area_id` (`sub_area_id`);

--
-- Indexes for table `city_budget`
--
ALTER TABLE `city_budget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_and_city` (`election_campaign_id`,`city_id`),
  ADD KEY `system_name` (`system_name`);

--
-- Indexes for table `city_budget_activist_expected_expenses`
--
ALTER TABLE `city_budget_activist_expected_expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_budget_id` (`city_budget_id`);

--
-- Indexes for table `city_budget_ongoing_activity_expenses`
--
ALTER TABLE `city_budget_ongoing_activity_expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_budget_id` (`city_budget_id`);

--
-- Indexes for table `city_council_members`
--
ALTER TABLE `city_council_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`,`order`) USING BTREE;

--
-- Indexes for table `city_departments`
--
ALTER TABLE `city_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `city_roles_by_voters`
--
ALTER TABLE `city_roles_by_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `city_shas_roles`
--
ALTER TABLE `city_shas_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `city_shas_roles_by_voters`
--
ALTER TABLE `city_shas_roles_by_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `neighborhood_id` (`neighborhood_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `csv_files`
--
ALTER TABLE `csv_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `csv_file_fields`
--
ALTER TABLE `csv_file_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `csv_file_rows`
--
ALTER TABLE `csv_file_rows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `csv_sources`
--
ALTER TABLE `csv_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `cti_permissions`
--
ALTER TABLE `cti_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cti_permissions_in_campaigns`
--
ALTER TABLE `cti_permissions_in_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `documents_in_entities`
--
ALTER TABLE `documents_in_entities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `election_campaigns`
--
ALTER TABLE `election_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `election_campaign_party_lists`
--
ALTER TABLE `election_campaign_party_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `shas` (`shas`);

--
-- Indexes for table `election_campaign_party_list_votes`
--
ALTER TABLE `election_campaign_party_list_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `ballot_box_id` (`ballot_box_id`);

--
-- Indexes for table `election_day_reporting_wrong_messages`
--
ALTER TABLE `election_day_reporting_wrong_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id_not_deleted` (`election_campaign_id`,`deleted`);

--
-- Indexes for table `election_roles`
--
ALTER TABLE `election_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `election_roles_base_budget`
--
ALTER TABLE `election_roles_base_budget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `election_role_id` (`election_role_id`);

--
-- Indexes for table `election_roles_by_voters`
--
ALTER TABLE `election_roles_by_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `vote_reporting_key` (`vote_reporting_key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `election_role_id` (`election_role_id`),
  ADD KEY `phone_number` (`phone_number`),
  ADD KEY `verified_status` (`verified_status`);

--
-- Indexes for table `election_role_by_voter_geographic_areas`
--
ALTER TABLE `election_role_by_voter_geographic_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_role_by_voter_id` (`election_role_by_voter_id`),
  ADD KEY `entity` (`entity_type`,`entity_id`) USING BTREE,
  ADD KEY `arrival_date` (`arrival_date`),
  ADD KEY `current_reporting` (`current_reporting`),
  ADD KEY `correct_reporting` (`correct_reporting`);

--
-- Indexes for table `election_role_by_voter_messages`
--
ALTER TABLE `election_role_by_voter_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_role_by_voter_id` (`election_role_by_voter_id`);

--
-- Indexes for table `election_role_shifts`
--
ALTER TABLE `election_role_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `ethnic_groups`
--
ALTER TABLE `ethnic_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `external_users`
--
ALTER TABLE `external_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `file_groups`
--
ALTER TABLE `file_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `finished_voters_in_campaign`
--
ALTER TABLE `finished_voters_in_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `general_report_system_reserved`
--
ALTER TABLE `general_report_system_reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `system_name` (`system_name`);

--
-- Indexes for table `geographic_filters`
--
ALTER TABLE `geographic_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `geographic_filter_templates`
--
ALTER TABLE `geographic_filter_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `geographic_voter_filters`
--
ALTER TABLE `geographic_voter_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `headquarter_geographic_areas`
--
ALTER TABLE `headquarter_geographic_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `history_topics`
--
ALTER TABLE `history_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `households_with_captains_of_fifty`
--
ALTER TABLE `households_with_captains_of_fifty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `household_support_status_changes`
--
ALTER TABLE `household_support_status_changes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `household_updates`
--
ALTER TABLE `household_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `household_update_parts`
--
ALTER TABLE `household_update_parts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `household_update_id` (`household_update_id`);

--
-- Indexes for table `incoming_ivr`
--
ALTER TABLE `incoming_ivr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `incoming_sms`
--
ALTER TABLE `incoming_sms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `institutes`
--
ALTER TABLE `institutes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `institute_groups`
--
ALTER TABLE `institute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `institute_networks`
--
ALTER TABLE `institute_networks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `institute_roles`
--
ALTER TABLE `institute_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `institute_roles_by_voters`
--
ALTER TABLE `institute_roles_by_voters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `institute_id` (`institute_id`),
  ADD KEY `institute_role_id` (`institute_role_id`);

--
-- Indexes for table `institute_types`
--
ALTER TABLE `institute_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `languages_by_users`
--
ALTER TABLE `languages_by_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `last_viewed_voters`
--
ALTER TABLE `last_viewed_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `manual_voter_updates`
--
ALTER TABLE `manual_voter_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_in_file_groups`
--
ALTER TABLE `modules_in_file_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `municipal_election_cities`
--
ALTER TABLE `municipal_election_cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `election_campaign_and_city` (`election_campaign_id`,`city_id`);

--
-- Indexes for table `municipal_election_council_candidates`
--
ALTER TABLE `municipal_election_council_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_and_city` (`election_campaign_id`,`city_id`),
  ADD KEY `order` (`order`) USING BTREE;

--
-- Indexes for table `municipal_election_mayor_candidates`
--
ALTER TABLE `municipal_election_mayor_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_and_city` (`election_campaign_id`,`city_id`);

--
-- Indexes for table `municipal_election_parties`
--
ALTER TABLE `municipal_election_parties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_and_city` (`election_campaign_id`,`city_id`);

--
-- Indexes for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `number_test`
--
ALTER TABLE `number_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_ballot_boxes`
--
ALTER TABLE `old_ballot_boxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `crippled` (`crippled`),
  ADD KEY `strictly_orthodox` (`strictly_orthodox`);

--
-- Indexes for table `old_ballot_boxes_reference_duplicate_clusters`
--
ALTER TABLE `old_ballot_boxes_reference_duplicate_clusters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `crippled` (`crippled`),
  ADD KEY `strictly_orthodox` (`strictly_orthodox`);

--
-- Indexes for table `old_clusters`
--
ALTER TABLE `old_clusters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `neighborhood_id` (`neighborhood_id`);

--
-- Indexes for table `old_clusters_with_duplicates`
--
ALTER TABLE `old_clusters_with_duplicates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `neighborhood_id` (`neighborhood_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `operation_name` (`operation_name`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `permissions_in_group`
--
ALTER TABLE `permissions_in_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `phone_types`
--
ALTER TABLE `phone_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `possible_answers`
--
ALTER TABLE `possible_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `predicted_votes_percentages`
--
ALTER TABLE `predicted_votes_percentages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`);

--
-- Indexes for table `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `redial_voter_phones`
--
ALTER TABLE `redial_voter_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `religious_council_members`
--
ALTER TABLE `religious_council_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `religious_council_roles`
--
ALTER TABLE `religious_council_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `reported_hourly_votes`
--
ALTER TABLE `reported_hourly_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hourly_vote` (`election_campaign_id`,`entity_type`,`entity_id`,`hour`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `request_callbiz`
--
ALTER TABLE `request_callbiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `callbiz_id` (`callbiz_id`);

--
-- Indexes for table `request_closure_reason`
--
ALTER TABLE `request_closure_reason`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `request_details`
--
ALTER TABLE `request_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_priority`
--
ALTER TABLE `request_priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_source`
--
ALTER TABLE `request_source`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `request_status_type`
--
ALTER TABLE `request_status_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_topics`
--
ALTER TABLE `request_topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `roles_by_users`
--
ALTER TABLE `roles_by_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sectorial_filters`
--
ALTER TABLE `sectorial_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_definitions`
--
ALTER TABLE `sectorial_filter_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_definition_groups`
--
ALTER TABLE `sectorial_filter_definition_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_definition_values`
--
ALTER TABLE `sectorial_filter_definition_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_items`
--
ALTER TABLE `sectorial_filter_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_item_values`
--
ALTER TABLE `sectorial_filter_item_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sectorial_filter_templates`
--
ALTER TABLE `sectorial_filter_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shas_representatives`
--
ALTER TABLE `shas_representatives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `shas_representative_roles`
--
ALTER TABLE `shas_representative_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `side_menus`
--
ALTER TABLE `side_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `mi_id` (`mi_id`);

--
-- Indexes for table `sub_areas`
--
ALTER TABLE `sub_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_status`
--
ALTER TABLE `support_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `support_status_updates`
--
ALTER TABLE `support_status_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `process_id` (`process_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `team_departments`
--
ALTER TABLE `team_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_leader_history`
--
ALTER TABLE `team_leader_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `team_users`
--
ALTER TABLE `team_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_voters`
--
ALTER TABLE `temp_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `transportation_cars`
--
ALTER TABLE `transportation_cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `election_role_by_voter_id` (`election_role_by_voter_id`);

--
-- Indexes for table `unknown_voters`
--
ALTER TABLE `unknown_voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `unknown_voter_phones`
--
ALTER TABLE `unknown_voter_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unknown_voter_id` (`unknown_voter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `sms_code` (`sms_code`);

--
-- Indexes for table `user_extensions`
--
ALTER TABLE `user_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dialer_user_id` (`dialer_user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_phones`
--
ALTER TABLE `user_phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `personal_identity` (`personal_identity`),
  ADD KEY `shas_representative` (`shas_representative`),
  ADD KEY `mi_city_id` (`mi_city_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `father_name` (`father_name`,`father_id`),
  ADD KEY `mother_name` (`mother_name`,`mother_id`),
  ADD KEY `household_id` (`household_id`),
  ADD KEY `voter_name` (`last_name`,`first_name`),
  ADD KEY `birth_date` (`birth_date`),
  ADD KEY `street` (`mi_street`,`street`),
  ADD KEY `street_id` (`street_id`),
  ADD KEY `ethnic_group_id` (`ethnic_group_id`),
  ADD KEY `strictly_orthodox` (`strictly_orthodox`),
  ADD KEY `household_update` (`household_update`);
ALTER TABLE `voters` ADD FULLTEXT KEY `full_text_name` (`first_name`,`last_name`);

--
-- Indexes for table `voters_answers`
--
ALTER TABLE `voters_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voters_in_election_campaigns`
--
ALTER TABLE `voters_in_election_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `election_campaign_and_voter` (`election_campaign_id`,`voter_id`) USING BTREE,
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `ballot_box_id` (`ballot_box_id`);

--
-- Indexes for table `voters_in_groups`
--
ALTER TABLE `voters_in_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `voter_group_id` (`voter_group_id`);

--
-- Indexes for table `voters_update_by_household_support_status_chnages`
--
ALTER TABLE `voters_update_by_household_support_status_chnages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `household_status_change_id` (`household_support_status_change_id`);

--
-- Indexes for table `voters_with_captains_of_fifty`
--
ALTER TABLE `voters_with_captains_of_fifty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`,`captain_id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `voter_books`
--
ALTER TABLE `voter_books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`);

--
-- Indexes for table `voter_book_2018`
--
ALTER TABLE `voter_book_2018`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_identity` (`personal_identity`),
  ADD KEY `voter_updated` (`voter_updated`),
  ADD KEY `ballot_updated` (`ballot_updated`),
  ADD KEY `missing_ballot_box` (`missing_ballot_box`);

--
-- Indexes for table `voter_book_rows`
--
ALTER TABLE `voter_book_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voter_endings`
--
ALTER TABLE `voter_endings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_filters`
--
ALTER TABLE `voter_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_filter_definitions`
--
ALTER TABLE `voter_filter_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_filter_definition_values`
--
ALTER TABLE `voter_filter_definition_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_filter_definition_id` (`voter_filter_definition_id`);

--
-- Indexes for table `voter_filter_groups`
--
ALTER TABLE `voter_filter_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_filter_type` (`voter_filter_type`);

--
-- Indexes for table `voter_filter_group_definitions`
--
ALTER TABLE `voter_filter_group_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_filter_items`
--
ALTER TABLE `voter_filter_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_filter_definition_id` (`voter_filter_definition_id`),
  ADD KEY `voter_filter_id` (`voter_filter_id`);

--
-- Indexes for table `voter_filter_item_values`
--
ALTER TABLE `voter_filter_item_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_filter_item_id` (`voter_filter_item_id`);

--
-- Indexes for table `voter_filter_module_groups`
--
ALTER TABLE `voter_filter_module_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `voter_filter_group_id` (`voter_filter_group_id`),
  ADD KEY `voter_filter_module` (`voter_filter_module`);

--
-- Indexes for table `voter_groups`
--
ALTER TABLE `voter_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_group_permissions`
--
ALTER TABLE `voter_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voter_group_id` (`voter_group_id`);

--
-- Indexes for table `voter_metas`
--
ALTER TABLE `voter_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voter_meta_keys`
--
ALTER TABLE `voter_meta_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_meta_values`
--
ALTER TABLE `voter_meta_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_phones`
--
ALTER TABLE `voter_phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `phone_number` (`phone_number`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `phone_type_id` (`phone_type_id`),
  ADD KEY `call_via_tm` (`call_via_tm`),
  ADD KEY `call_via_phone` (`call_via_phone`),
  ADD KEY `sms` (`sms`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Indexes for table `voter_phones_log`
--
ALTER TABLE `voter_phones_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `voter_support_status`
--
ALTER TABLE `voter_support_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `voter_id` (`voter_id`,`deleted`) USING BTREE,
  ADD KEY `support_status_id` (`support_status_id`);

--
-- Indexes for table `voter_titles`
--
ALTER TABLE `voter_titles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `voter_transportations`
--
ALTER TABLE `voter_transportations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `total_votes` (`voter_id`,`election_campaign_id`,`vote_date`),
  ADD KEY `election_campaign_id` (`election_campaign_id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `reporting_voters` (`election_campaign_id`,`reporting_voter_id`),
  ADD KEY `notify_captain_fifty` (`notify_captain_fifty`),
  ADD KEY `notify_cluster_leader` (`notify_cluster_leader`);

--
-- Indexes for table `vote_files`
--
ALTER TABLE `vote_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `vote_sources`
--
ALTER TABLE `vote_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5221;
--
-- AUTO_INCREMENT for table `action_history`
--
ALTER TABLE `action_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16331137;
--
-- AUTO_INCREMENT for table `action_history_details`
--
ALTER TABLE `action_history_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44660890;
--
-- AUTO_INCREMENT for table `action_history_topics`
--
ALTER TABLE `action_history_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;
--
-- AUTO_INCREMENT for table `action_status`
--
ALTER TABLE `action_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `action_topics`
--
ALTER TABLE `action_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ballot_boxes`
--
ALTER TABLE `ballot_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50299;
--
-- AUTO_INCREMENT for table `ballot_boxes_files`
--
ALTER TABLE `ballot_boxes_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `ballot_box_roles`
--
ALTER TABLE `ballot_box_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `budget_files`
--
ALTER TABLE `budget_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2536;
--
-- AUTO_INCREMENT for table `calls_log`
--
ALTER TABLE `calls_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `call_notes`
--
ALTER TABLE `call_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `campaign_active_times`
--
ALTER TABLE `campaign_active_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;
--
-- AUTO_INCREMENT for table `campaign_break_times`
--
ALTER TABLE `campaign_break_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=660;
--
-- AUTO_INCREMENT for table `campaign_messages`
--
ALTER TABLE `campaign_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_portion_progress`
--
ALTER TABLE `campaign_portion_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `campaign_waiting_times`
--
ALTER TABLE `campaign_waiting_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1301;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1291;
--
-- AUTO_INCREMENT for table `city_budget`
--
ALTER TABLE `city_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `city_budget_activist_expected_expenses`
--
ALTER TABLE `city_budget_activist_expected_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `city_budget_ongoing_activity_expenses`
--
ALTER TABLE `city_budget_ongoing_activity_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city_council_members`
--
ALTER TABLE `city_council_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `city_departments`
--
ALTER TABLE `city_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `city_roles_by_voters`
--
ALTER TABLE `city_roles_by_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `city_shas_roles`
--
ALTER TABLE `city_shas_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `city_shas_roles_by_voters`
--
ALTER TABLE `city_shas_roles_by_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22167;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT for table `csv_files`
--
ALTER TABLE `csv_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=931;
--
-- AUTO_INCREMENT for table `csv_file_fields`
--
ALTER TABLE `csv_file_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1172;
--
-- AUTO_INCREMENT for table `csv_file_rows`
--
ALTER TABLE `csv_file_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496067;
--
-- AUTO_INCREMENT for table `csv_sources`
--
ALTER TABLE `csv_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cti_permissions`
--
ALTER TABLE `cti_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `cti_permissions_in_campaigns`
--
ALTER TABLE `cti_permissions_in_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;
--
-- AUTO_INCREMENT for table `documents_in_entities`
--
ALTER TABLE `documents_in_entities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;
--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `election_campaigns`
--
ALTER TABLE `election_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `election_campaign_party_lists`
--
ALTER TABLE `election_campaign_party_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `election_campaign_party_list_votes`
--
ALTER TABLE `election_campaign_party_list_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21404;
--
-- AUTO_INCREMENT for table `election_day_reporting_wrong_messages`
--
ALTER TABLE `election_day_reporting_wrong_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `election_roles`
--
ALTER TABLE `election_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `election_roles_base_budget`
--
ALTER TABLE `election_roles_base_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `election_roles_by_voters`
--
ALTER TABLE `election_roles_by_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4033;
--
-- AUTO_INCREMENT for table `election_role_by_voter_geographic_areas`
--
ALTER TABLE `election_role_by_voter_geographic_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2794;
--
-- AUTO_INCREMENT for table `election_role_by_voter_messages`
--
ALTER TABLE `election_role_by_voter_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32906;
--
-- AUTO_INCREMENT for table `election_role_shifts`
--
ALTER TABLE `election_role_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ethnic_groups`
--
ALTER TABLE `ethnic_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `external_users`
--
ALTER TABLE `external_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_groups`
--
ALTER TABLE `file_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `finished_voters_in_campaign`
--
ALTER TABLE `finished_voters_in_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;
--
-- AUTO_INCREMENT for table `general_report_system_reserved`
--
ALTER TABLE `general_report_system_reserved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `geographic_filters`
--
ALTER TABLE `geographic_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=809;
--
-- AUTO_INCREMENT for table `geographic_filter_templates`
--
ALTER TABLE `geographic_filter_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `geographic_voter_filters`
--
ALTER TABLE `geographic_voter_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `headquarters`
--
ALTER TABLE `headquarters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `headquarter_geographic_areas`
--
ALTER TABLE `headquarter_geographic_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14259635;
--
-- AUTO_INCREMENT for table `history_topics`
--
ALTER TABLE `history_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=519;
--
-- AUTO_INCREMENT for table `households_with_captains_of_fifty`
--
ALTER TABLE `households_with_captains_of_fifty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8335;
--
-- AUTO_INCREMENT for table `household_support_status_changes`
--
ALTER TABLE `household_support_status_changes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `household_updates`
--
ALTER TABLE `household_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `household_update_parts`
--
ALTER TABLE `household_update_parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `incoming_ivr`
--
ALTER TABLE `incoming_ivr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `incoming_sms`
--
ALTER TABLE `incoming_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26775;
--
-- AUTO_INCREMENT for table `institutes`
--
ALTER TABLE `institutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;
--
-- AUTO_INCREMENT for table `institute_groups`
--
ALTER TABLE `institute_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `institute_networks`
--
ALTER TABLE `institute_networks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `institute_roles`
--
ALTER TABLE `institute_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `institute_roles_by_voters`
--
ALTER TABLE `institute_roles_by_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40258;
--
-- AUTO_INCREMENT for table `institute_types`
--
ALTER TABLE `institute_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `languages_by_users`
--
ALTER TABLE `languages_by_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `last_viewed_voters`
--
ALTER TABLE `last_viewed_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287450;
--
-- AUTO_INCREMENT for table `manual_voter_updates`
--
ALTER TABLE `manual_voter_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375506;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `modules_in_file_groups`
--
ALTER TABLE `modules_in_file_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `municipal_election_cities`
--
ALTER TABLE `municipal_election_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `municipal_election_council_candidates`
--
ALTER TABLE `municipal_election_council_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=558;
--
-- AUTO_INCREMENT for table `municipal_election_mayor_candidates`
--
ALTER TABLE `municipal_election_mayor_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `municipal_election_parties`
--
ALTER TABLE `municipal_election_parties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;
--
-- AUTO_INCREMENT for table `number_test`
--
ALTER TABLE `number_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28181;
--
-- AUTO_INCREMENT for table `old_ballot_boxes`
--
ALTER TABLE `old_ballot_boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40686;
--
-- AUTO_INCREMENT for table `old_ballot_boxes_reference_duplicate_clusters`
--
ALTER TABLE `old_ballot_boxes_reference_duplicate_clusters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50299;
--
-- AUTO_INCREMENT for table `old_clusters`
--
ALTER TABLE `old_clusters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14499;
--
-- AUTO_INCREMENT for table `old_clusters_with_duplicates`
--
ALTER TABLE `old_clusters_with_duplicates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22167;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=519;
--
-- AUTO_INCREMENT for table `permissions_in_group`
--
ALTER TABLE `permissions_in_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5248;
--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `phone_types`
--
ALTER TABLE `phone_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `possible_answers`
--
ALTER TABLE `possible_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `predicted_votes_percentages`
--
ALTER TABLE `predicted_votes_percentages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `questionnaires`
--
ALTER TABLE `questionnaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `redial_voter_phones`
--
ALTER TABLE `redial_voter_phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1610;
--
-- AUTO_INCREMENT for table `religious_council_members`
--
ALTER TABLE `religious_council_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `religious_council_roles`
--
ALTER TABLE `religious_council_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `reported_hourly_votes`
--
ALTER TABLE `reported_hourly_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31065;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2906;
--
-- AUTO_INCREMENT for table `request_callbiz`
--
ALTER TABLE `request_callbiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;
--
-- AUTO_INCREMENT for table `request_closure_reason`
--
ALTER TABLE `request_closure_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `request_details`
--
ALTER TABLE `request_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request_priority`
--
ALTER TABLE `request_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `request_source`
--
ALTER TABLE `request_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `request_status_type`
--
ALTER TABLE `request_status_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `request_topics`
--
ALTER TABLE `request_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `roles_by_users`
--
ALTER TABLE `roles_by_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;
--
-- AUTO_INCREMENT for table `sectorial_filters`
--
ALTER TABLE `sectorial_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
--
-- AUTO_INCREMENT for table `sectorial_filter_definitions`
--
ALTER TABLE `sectorial_filter_definitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sectorial_filter_definition_groups`
--
ALTER TABLE `sectorial_filter_definition_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sectorial_filter_definition_values`
--
ALTER TABLE `sectorial_filter_definition_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `sectorial_filter_items`
--
ALTER TABLE `sectorial_filter_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;
--
-- AUTO_INCREMENT for table `sectorial_filter_item_values`
--
ALTER TABLE `sectorial_filter_item_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `sectorial_filter_templates`
--
ALTER TABLE `sectorial_filter_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shas_representatives`
--
ALTER TABLE `shas_representatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `shas_representative_roles`
--
ALTER TABLE `shas_representative_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `side_menus`
--
ALTER TABLE `side_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34246;
--
-- AUTO_INCREMENT for table `sub_areas`
--
ALTER TABLE `sub_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `support_status`
--
ALTER TABLE `support_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `support_status_updates`
--
ALTER TABLE `support_status_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `team_departments`
--
ALTER TABLE `team_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `team_leader_history`
--
ALTER TABLE `team_leader_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;
--
-- AUTO_INCREMENT for table `team_users`
--
ALTER TABLE `team_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `temp_voters`
--
ALTER TABLE `temp_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transportation_cars`
--
ALTER TABLE `transportation_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `unknown_voters`
--
ALTER TABLE `unknown_voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
--
-- AUTO_INCREMENT for table `unknown_voter_phones`
--
ALTER TABLE `unknown_voter_phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=764;
--
-- AUTO_INCREMENT for table `user_extensions`
--
ALTER TABLE `user_extensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT for table `user_phones`
--
ALTER TABLE `user_phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8246965;
--
-- AUTO_INCREMENT for table `voters_answers`
--
ALTER TABLE `voters_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;
--
-- AUTO_INCREMENT for table `voters_in_election_campaigns`
--
ALTER TABLE `voters_in_election_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34997149;
--
-- AUTO_INCREMENT for table `voters_in_groups`
--
ALTER TABLE `voters_in_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111819;
--
-- AUTO_INCREMENT for table `voters_update_by_household_support_status_chnages`
--
ALTER TABLE `voters_update_by_household_support_status_chnages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `voters_with_captains_of_fifty`
--
ALTER TABLE `voters_with_captains_of_fifty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47431;
--
-- AUTO_INCREMENT for table `voter_books`
--
ALTER TABLE `voter_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `voter_book_2018`
--
ALTER TABLE `voter_book_2018`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6029657;
--
-- AUTO_INCREMENT for table `voter_book_rows`
--
ALTER TABLE `voter_book_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6031784;
--
-- AUTO_INCREMENT for table `voter_endings`
--
ALTER TABLE `voter_endings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `voter_filters`
--
ALTER TABLE `voter_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `voter_filter_definitions`
--
ALTER TABLE `voter_filter_definitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `voter_filter_definition_values`
--
ALTER TABLE `voter_filter_definition_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `voter_filter_groups`
--
ALTER TABLE `voter_filter_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `voter_filter_group_definitions`
--
ALTER TABLE `voter_filter_group_definitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `voter_filter_items`
--
ALTER TABLE `voter_filter_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `voter_filter_item_values`
--
ALTER TABLE `voter_filter_item_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `voter_filter_module_groups`
--
ALTER TABLE `voter_filter_module_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `voter_groups`
--
ALTER TABLE `voter_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=951;
--
-- AUTO_INCREMENT for table `voter_group_permissions`
--
ALTER TABLE `voter_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;
--
-- AUTO_INCREMENT for table `voter_metas`
--
ALTER TABLE `voter_metas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;
--
-- AUTO_INCREMENT for table `voter_meta_keys`
--
ALTER TABLE `voter_meta_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `voter_meta_values`
--
ALTER TABLE `voter_meta_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `voter_phones`
--
ALTER TABLE `voter_phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4205081;
--
-- AUTO_INCREMENT for table `voter_phones_log`
--
ALTER TABLE `voter_phones_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `voter_support_status`
--
ALTER TABLE `voter_support_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3891912;
--
-- AUTO_INCREMENT for table `voter_titles`
--
ALTER TABLE `voter_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `voter_transportations`
--
ALTER TABLE `voter_transportations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3051765;
--
-- AUTO_INCREMENT for table `vote_files`
--
ALTER TABLE `vote_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vote_sources`
--
ALTER TABLE `vote_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
