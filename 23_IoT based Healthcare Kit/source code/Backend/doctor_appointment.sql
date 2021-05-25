-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 06:32 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `hospital_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_email_address`, `admin_password`, `admin_name`, `hospital_name`, `hospital_address`, `hospital_contact_no`, `hospital_logo`) VALUES
(1, 'purvika@gmail.com', '123456', 'Purvika', 'Mount Hospital', '115, Last Lane, NYC', '741287410', '../images/306153661.png');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_schedule_id` int(11) NOT NULL,
  `appointment_number` int(11) NOT NULL,
  `reason_for_appointment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_come_into_hospital` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `analysis` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `doctor_id`, `patient_id`, `doctor_schedule_id`, `appointment_number`, `reason_for_appointment`, `appointment_time`, `status`, `patient_come_into_hospital`, `doctor_comment`, `analysis`) VALUES
(3, 1, 3, 2, 1000, 'Pain in Stomach', '09:00:00', 'Cancel', 'No', '', ''),
(4, 1, 3, 2, 1001, 'Paint in stomach', '09:00:00', 'Booked', 'No', '', ''),
(5, 1, 4, 2, 1002, 'For Delivery', '09:30:00', 'Completed', 'Yes', 'She gave birth to boy baby.', ''),
(6, 5, 3, 7, 1003, 'Fever and cold.', '18:00:00', 'In Process', 'Yes', '', ''),
(7, 6, 5, 13, 1004, 'Pain in Stomach.', '15:30:00', 'Completed', 'Yes', 'Acidity Problem. ', ''),
(8, 7, 6, 15, 1005, 'I am having stomache', '11:10:00', 'Completed', 'Yes', 'qwer', ''),
(9, 7, 7, 15, 1006, 'Headache', '11:25:00', 'Cancel', 'No', '', ''),
(10, 9, 6, 17, 1007, 'Health checkup\r\n', '16:44:00', 'Booked', 'No', '', ''),
(11, 10, 8, 18, 1008, 'Not feeling well', '09:50:00', 'Booked', 'No', '', ''),
(12, 7, 12, 21, 1009, 'Severe headache', '20:52:00', 'Completed', 'Yes', 'Saradon 0-0-1 ( 5days )\r\nTake steam (Twice a day)', '');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule_table`
--

CREATE TABLE `doctor_schedule_table` (
  `doctor_schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_schedule_date` date NOT NULL,
  `doctor_schedule_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_start_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_end_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `average_consulting_time` int(5) NOT NULL,
  `doctor_schedule_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_schedule_table`
--

INSERT INTO `doctor_schedule_table` (`doctor_schedule_id`, `doctor_id`, `doctor_schedule_date`, `doctor_schedule_day`, `doctor_schedule_start_time`, `doctor_schedule_end_time`, `average_consulting_time`, `doctor_schedule_status`) VALUES
(2, 1, '2021-02-19', 'Friday', '09:00', '14:00', 15, 'Active'),
(3, 2, '2021-02-19', 'Friday', '09:00', '12:00', 15, 'Active'),
(4, 5, '2021-02-19', 'Friday', '10:00', '14:00', 10, 'Active'),
(5, 3, '2021-02-19', 'Friday', '13:00', '17:00', 20, 'Active'),
(6, 4, '2021-02-19', 'Friday', '15:00', '18:00', 5, 'Active'),
(7, 5, '2021-02-22', 'Monday', '18:00', '20:00', 10, 'Active'),
(8, 2, '2021-02-24', 'Wednesday', '09:30', '12:30', 10, 'Active'),
(9, 5, '2021-02-24', 'Wednesday', '11:00', '15:00', 10, 'Active'),
(10, 1, '2021-02-24', 'Wednesday', '12:00', '15:00', 10, 'Active'),
(11, 3, '2021-02-24', 'Wednesday', '14:00', '17:00', 15, 'Active'),
(12, 4, '2021-02-24', 'Wednesday', '16:00', '20:00', 10, 'Active'),
(13, 6, '2021-02-24', 'Wednesday', '15:30', '18:30', 10, 'Active'),
(14, 6, '2021-02-25', 'Thursday', '10:00', '13:30', 10, 'Active'),
(15, 7, '2021-05-13', 'Thursday', '11:10', '14:00', 15, 'Active'),
(16, 8, '2021-05-14', 'Friday', '14:43', '20:43', 10, 'Active'),
(17, 9, '2021-05-13', 'Thursday', '16:44', '16:44', 15, 'Active'),
(18, 10, '2021-05-13', 'Thursday', '09:50', '19:50', 15, 'Active'),
(19, 11, '2021-05-13', 'Thursday', '09:00', '18:00', 20, 'Active'),
(21, 7, '2021-05-22', 'Saturday', '20:52', '22:00', 10, 'Active'),
(22, 7, '2021-05-24', 'Monday', '21:08', '22:08', 15, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_table`
--

CREATE TABLE `doctor_table` (
  `doctor_id` int(11) NOT NULL,
  `doctor_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_profile_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_date_of_birth` date NOT NULL,
  `doctor_degree` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_expert_in` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_table`
--

INSERT INTO `doctor_table` (`doctor_id`, `doctor_email_address`, `doctor_password`, `doctor_name`, `doctor_profile_image`, `doctor_phone_no`, `doctor_address`, `doctor_date_of_birth`, `doctor_degree`, `doctor_expert_in`, `doctor_status`, `doctor_added_on`) VALUES
(7, 'shreya@gmail.com', '123456', 'Dr. Shreya Bhutada', '../images/834513519.jpg', '123456789', 'thane', '1999-12-14', 'MBBS', 'Cardiologist', 'Active', '2021-05-13 10:55:29'),
(8, 'ayushi@gmail.com', '123456', 'Dr. Ayushi Singh', '../images/1404889906.jpg', '1234567899', 'Thane', '1994-01-11', 'PhD', 'Clinical Nutrition', 'Active', '2021-05-13 14:36:57'),
(9, 'shweta@gmail.com', '123456', 'Dr. Shweta Chaudhari', '../images/1227106223.jpg', '1234567899', 'Mulund', '1994-01-29', 'MSc', 'Physiotherapy', 'Active', '2021-05-13 14:38:15'),
(10, 'harshit@gmail.com', '123456', 'Dr. Harshit Chandak', '../images/656853781.jpg', '1234567899', 'Kalwa', '2021-05-13', 'MD', 'Physician', 'Active', '2021-05-13 14:48:56'),
(11, 'suyash@gmail.com', '123456', 'Dr. Suyash Jain', '../images/1364603498.jpg', '1234567899', 'Bhiwandi', '2021-04-27', 'MSc', 'Surgeon', 'Active', '2021-05-13 14:49:53');

-- --------------------------------------------------------

--
-- Table structure for table `patient_table`
--

CREATE TABLE `patient_table` (
  `patient_id` int(11) NOT NULL,
  `patient_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `patient_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_date_of_birth` date NOT NULL,
  `patient_gender` enum('Male','Female','Other') COLLATE utf8_unicode_ci NOT NULL,
  `patient_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_maritial_status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_added_on` datetime NOT NULL,
  `patient_verification_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_verify` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_table`
--

INSERT INTO `patient_table` (`patient_id`, `patient_email_address`, `patient_password`, `patient_first_name`, `patient_last_name`, `patient_date_of_birth`, `patient_gender`, `patient_address`, `patient_phone_no`, `patient_maritial_status`, `patient_added_on`, `patient_verification_code`, `email_verify`) VALUES
(6, 'a@gmail.com', '123456', 'Anita', 'Yadav', '2021-02-17', 'Female', 'hello', '1111111111', 'Single', '2021-05-11 15:26:26', '152eeeebb0f1adcf977b9f7c315e990c', 'Yes'),
(7, 'anotherakshu@gmail.com', '123456', 'Akshita', 'Das', '2021-02-17', 'Female', 'Dadar, Maharashtra', '8887776665', 'Single', '2021-05-11 15:27:16', '40b55eb1dbb6ff1a81c0c54c5b358526', 'Yes'),
(8, 'ajay@gmail.com', '123456', 'Ajay', 'Yadav', '1974-05-08', 'Male', 'Thane, India', '1234567899', 'Married', '2021-05-13 13:47:12', '0701e0bf47aabcef3c15394bbea4ead7', 'Yes'),
(12, 'akshata@gmail.com', '123456', 'Akshata', 'Singh', '1998-03-15', 'Female', 'Thane, Ghodbunder Road', '9998887770', 'Single', '2021-05-22 20:50:05', '582e800913af2e2f2be1a23157eec9f2', 'Yes'),
(13, 'sanskriti@gmail.com', '654321', 'Sanskriti', 'Patil', '1995-01-15', 'Female', 'Waghbil, Thane-400615', '8989898989', 'Single', '2021-05-24 17:53:31', 'e58f52eaaacaba7ffa6763344a6757ac', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  ADD PRIMARY KEY (`doctor_schedule_id`);

--
-- Indexes for table `doctor_table`
--
ALTER TABLE `doctor_table`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `patient_table`
--
ALTER TABLE `patient_table`
  ADD PRIMARY KEY (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  MODIFY `doctor_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `doctor_table`
--
ALTER TABLE `doctor_table`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient_table`
--
ALTER TABLE `patient_table`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
