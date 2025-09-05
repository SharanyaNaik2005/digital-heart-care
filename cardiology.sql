-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 17, 2025 at 08:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cardiology`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_master`
--

CREATE TABLE `admin_master` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_master`
--

INSERT INTO `admin_master` (`id`, `full_name`, `username`, `email`, `phone`, `date_created`, `status`, `image`) VALUES
(1, 'Admin User', 'SuperAdmin', 'admin@gmail.com', '9876543210', '2025-05-02 21:58:50', 1, 'user/download.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_master`
--

CREATE TABLE `doctor_master` (
  `doctor_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `doctor_status` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_master`
--

INSERT INTO `doctor_master` (`doctor_id`, `full_name`, `username`, `qualification`, `specialization`, `email`, `phone`, `created_date`, `doctor_status`, `image`) VALUES
(1, 'Kushi Shetty', 'Kushi', 'MBBS', 'General', 'rachithacharya18@gmail.com', '9876543210', '2025-05-02 22:01:15', 1, 'user/doctor_image.jpg'),
(2, 'ajay', 'ajay', 'MBBS', 'General', 'ashikbright10@gmail.com', '9639639639', '2025-05-04 16:07:09', 1, 'user/doctor_image.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ecg`
--

CREATE TABLE `ecg` (
  `ecg_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `qrs` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `p` int(11) NOT NULL,
  `rr` int(11) NOT NULL,
  `qrsv` int(11) NOT NULL,
  `qtcbd` int(11) NOT NULL,
  `sokolow` double NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ecg`
--

INSERT INTO `ecg` (`ecg_id`, `patient_id`, `qrs`, `qt`, `pr`, `p`, `rr`, `qrsv`, `qtcbd`, `sokolow`, `type`, `description`, `date`, `image`) VALUES
(1, 3, 70, 440, 150, 100, 699, -11, 45, 25, 'test', '', '2025-05-05 15:28:21', 'ecg/norm.png');

-- --------------------------------------------------------

--
-- Table structure for table `echo`
--

CREATE TABLE `echo` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `report_date` datetime NOT NULL DEFAULT current_timestamp(),
  `Order_No` varchar(50) NOT NULL,
  `IPNO` varchar(50) NOT NULL,
  `Bed_No` varchar(50) NOT NULL,
  `Aortic_root` varchar(50) NOT NULL,
  `Left_atrium` varchar(50) NOT NULL,
  `Right_ventricle` varchar(50) DEFAULT NULL,
  `IVSd` varchar(50) NOT NULL,
  `LVPWd` varchar(50) NOT NULL,
  `LVIDd` varchar(50) NOT NULL,
  `LVIDs` varchar(50) NOT NULL,
  `LVEF` varchar(50) NOT NULL,
  `Desc_details` varchar(50) DEFAULT NULL,
  `Impression` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `echo`
--

INSERT INTO `echo` (`id`, `patient_id`, `order_date`, `report_date`, `Order_No`, `IPNO`, `Bed_No`, `Aortic_root`, `Left_atrium`, `Right_ventricle`, `IVSd`, `LVPWd`, `LVIDd`, `LVIDs`, `LVEF`, `Desc_details`, `Impression`, `date`) VALUES
(1, 3, '2025-05-05 00:00:00', '2025-05-05 15:53:41', '100', '10', '10', '20', '20', NULL, '10', '10', '20', '10', '20', NULL, 'NA', '2025-05-05 15:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `medication_master`
--

CREATE TABLE `medication_master` (
  `id` int(11) NOT NULL,
  `UHID` varchar(25) NOT NULL,
  `medication` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_master`
--

INSERT INTO `medication_master` (`id`, `UHID`, `medication`, `date`, `status`) VALUES
(1, 'UHID793523', 'Treated with antihypertensive medications such as ACE inhibitors, beta-blockers, or calcium channel ', '2025-05-02 22:10:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_master`
--

CREATE TABLE `patient_master` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `username` varchar(50) NOT NULL,
  `UHID` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `injuries` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(75) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_master`
--

INSERT INTO `patient_master` (`id`, `full_name`, `username`, `UHID`, `gender`, `dob`, `age`, `phone`, `address`, `injuries`, `status`, `date_created`, `email`, `image`) VALUES
(1, 'Priya Shetty', 'Priya', 'UHID793523', 'Female', '2002-08-11', 23, '9876543211', 'Mangalore', 'No', 1, '2025-05-02 22:02:43', 'rachithaacharya9@gmail.com', 'user/patient_image.jpg'),
(3, 'Mohammad Ashik', 'ashik', 'UHID552289', 'Male', '2000-04-30', 24, '9148097564', 'Paraneerukatte House Kabaka ', 'pain in eye nerve and head ache', 1, '2025-05-04 12:42:15', 'ashiqkbk10@gmail.com', 'user/patient_image.jpg'),
(11, 'll', 'kk', 'UHID203625', 'Female', '1998-01-21', 27, '8105437372', 'kakanady', 'no', 1, '2025-05-07 12:43:40', 'll@gmail.com', 'user/patient_image.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `patient_symptoms`
--

CREATE TABLE `patient_symptoms` (
  `id` int(11) NOT NULL,
  `symptoms_id` int(11) NOT NULL,
  `UHID` varchar(25) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_symptoms`
--

INSERT INTO `patient_symptoms` (`id`, `symptoms_id`, `UHID`, `date_created`, `status`) VALUES
(1, 17, 'UHID793523', '2025-05-02 22:08:57', 1),
(3, 12, 'UHID552289', '2025-05-05 11:30:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL,
  `symptoms` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `symptoms`, `description`, `status`, `date_created`) VALUES
(1, 'Chest pain', 'Pain or pressure in the chest, often associated with heart conditions such as angina or heart attack.', 1, '2025-05-02 00:00:00'),
(2, 'Shortness of breath', 'Difficulty breathing or feeling breathless, especially during exertion or while lying down.', 1, '2025-05-02 00:00:00'),
(3, 'Palpitations', 'A sensation of rapid, fluttering, or pounding heartbeats, which may indicate arrhythmia.', 1, '2025-05-02 00:00:00'),
(4, 'Swelling in legs or ankles', 'Fluid retention in lower limbs, common in heart failure.', 1, '2025-05-02 00:00:00'),
(5, 'Fatigue', 'Extreme tiredness or weakness, especially with physical activity.', 1, '2025-05-02 00:00:00'),
(6, 'Lightheadedness', 'Feeling faint or dizzy, which can be a symptom of poor heart function.', 1, '2025-05-02 00:00:00'),
(7, 'Fainting (syncope)', 'Temporary loss of consciousness due to inadequate blood flow to the brain.', 1, '2025-05-02 00:00:00'),
(8, 'Irregular heartbeat', 'Unusual heart rhythm, such as skipped beats or arrhythmias.', 1, '2025-05-02 00:00:00'),
(9, 'Sweating (cold sweat)', 'Sudden, cold sweat that may accompany a heart attack.', 1, '2025-05-02 00:00:00'),
(10, 'Pain radiating to arm or jaw', 'Pain spreading to the left arm, neck, jaw, or back, often linked to heart attack.', 1, '2025-05-02 00:00:00'),
(11, 'Nausea with chest pain', 'Upset stomach combined with chest discomfort, may be a heart attack warning.', 1, '2025-05-02 00:00:00'),
(12, 'Cyanosis', 'Bluish discoloration of skin or lips due to poor oxygenation, linked to serious heart conditions.', 1, '2025-05-02 00:00:00'),
(13, 'Blurred vision', 'Sudden or temporary blurred vision may be a sign of reduced blood flow to the brain or eyes, possibly linked to stroke or cardiovascular issues.', 1, '2025-05-02 00:00:00'),
(14, 'Vision loss in one eye', 'Sudden loss of vision in one eye can indicate a transient ischemic attack (TIA) or mini-stroke.', 1, '2025-05-02 00:00:00'),
(15, 'Eye floaters or flashes', 'Sudden onset of floaters or flashes may suggest vascular issues affecting the retina.', 1, '2025-05-02 00:00:00'),
(16, 'Puffy eyes', 'Persistent swelling around the eyes, especially in the morning, may be linked to fluid retention in heart failure.', 1, '2025-05-02 00:00:00'),
(17, 'Retinal vessel narrowing', 'Narrowing of blood vessels in the eye may indicate chronic hypertension or cardiovascular disease.', 1, '2025-05-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tmt`
--

CREATE TABLE `tmt` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `stage` varchar(50) NOT NULL,
  `stage_time` varchar(50) NOT NULL,
  `speed_grade` varchar(50) NOT NULL,
  `hr` varchar(50) NOT NULL,
  `bp` varchar(50) NOT NULL,
  `rpp` varchar(50) NOT NULL,
  `ments` varchar(50) NOT NULL,
  `st` varchar(50) NOT NULL,
  `total_exercise_time` varchar(50) NOT NULL,
  `max_workload` varchar(50) NOT NULL,
  `max_hr` varchar(50) NOT NULL,
  `distance_covered` varchar(50) NOT NULL,
  `max_bp` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tmt`
--

INSERT INTO `tmt` (`id`, `patient_id`, `stage`, `stage_time`, `speed_grade`, `hr`, `bp`, `rpp`, `ments`, `st`, `total_exercise_time`, `max_workload`, `max_hr`, `distance_covered`, `max_bp`, `date`, `comments`) VALUES
(1, 3, 'A', '4:30', 'A', '90', '120', '110', '', '10', '10', '10', '120', '5', '130', '2025-05-05 00:00:00', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `id` int(10) NOT NULL,
  `type` varchar(25) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`id`, `type`, `username`, `password`, `date_created`, `status`) VALUES
(1, 'Admin', 'SuperAdmin', '123123', '2025-05-02 21:57:14', 1),
(2, 'Doctor', 'Kushi', 'PAss270051', '2025-05-02 22:01:15', 1),
(3, 'Patient', 'Priya', 'PAss691338', '2025-05-02 22:02:43', 1),
(5, 'Patient', 'ashik', '123123', '2025-05-04 12:42:15', 1),
(7, 'Doctor', 'ajay', '123123', '2025-05-04 16:07:09', 1),
(14, 'Patient', 'kk', 'PAss206829', '2025-05-07 12:43:40', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_master`
--
ALTER TABLE `admin_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_master`
--
ALTER TABLE `doctor_master`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `ecg`
--
ALTER TABLE `ecg`
  ADD PRIMARY KEY (`ecg_id`);

--
-- Indexes for table `echo`
--
ALTER TABLE `echo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medication_master`
--
ALTER TABLE `medication_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_master`
--
ALTER TABLE `patient_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_symptoms`
--
ALTER TABLE `patient_symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmt`
--
ALTER TABLE `tmt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_master`
--
ALTER TABLE `admin_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_master`
--
ALTER TABLE `doctor_master`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ecg`
--
ALTER TABLE `ecg`
  MODIFY `ecg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `echo`
--
ALTER TABLE `echo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medication_master`
--
ALTER TABLE `medication_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_master`
--
ALTER TABLE `patient_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient_symptoms`
--
ALTER TABLE `patient_symptoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tmt`
--
ALTER TABLE `tmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
