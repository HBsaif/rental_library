-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2019 at 06:48 PM
-- Server version: 10.2.10-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_no` varchar(10) NOT NULL,
  `book_name` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_no`, `book_name`, `author`) VALUES
('B01', 'Pather Panchali', 'Bibhutivushon'),
('B02', 'Shesher Kabita', 'Rabindranath'),
('B03', 'Singhabahini', 'Somoresh'),
('B04', 'Aranyak', 'Bibhutivushon'),
('B05', 'Deyal', 'Humayun Ahmed'),
('B06', 'Srikanta', 'Sarat Chandra'),
('B07', 'Computer Networks', 'Tanenbum'),
('B08', 'Lalsalu', 'Waliullah'),
('B09', 'Chokher Bali', 'Rabindranath'),
('B10', 'Parimeeta', 'Sarat Chandra'),
('B11', 'Feluda', 'Saytajit Roy'),
('B14', 'ygyg', 'iui');

-- --------------------------------------------------------

--
-- Table structure for table `iss_rec`
--

CREATE TABLE `iss_rec` (
  `iss_no` int(11) NOT NULL,
  `iss_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Mem_no` varchar(10) DEFAULT NULL,
  `book_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iss_rec`
--

INSERT INTO `iss_rec` (`iss_no`, `iss_date`, `Mem_no`, `book_no`) VALUES
(1, '2019-08-02 17:20:50', '103', 'B03'),
(2, '2019-08-02 17:20:50', '102', 'B02'),
(3, '2019-08-02 17:20:50', '102', 'B07'),
(4, '2019-08-02 17:20:50', '105', 'B10'),
(5, '2019-08-02 17:20:50', '107', 'B09'),
(6, '2019-08-02 17:20:50', '103', 'B08'),
(7, '2019-08-02 17:20:50', '110', 'B05'),
(8, '2019-08-07 05:55:41', '106', 'B07'),
(9, '2019-08-07 05:56:23', '102', 'B03'),
(10, '2019-08-07 05:56:37', '110', 'B05'),
(11, '2019-08-25 05:00:13', '106', 'B07'),
(12, '2019-08-25 05:00:52', '104', 'B01'),
(13, '2019-08-25 05:01:11', '103', 'B10'),
(14, '2019-08-25 05:03:04', '108', 'B06'),
(15, '2019-08-25 05:06:07', '105', 'B07'),
(16, '2019-08-25 05:07:49', '101', 'B03'),
(17, '2019-08-25 05:07:49', '109', 'B02'),
(18, '2019-08-25 05:12:05', '101', 'B09'),
(19, '2019-09-09 05:02:17', '104', 'B07'),
(20, '2019-09-09 05:02:27', '110', 'B09'),
(21, '2019-09-10 04:22:39', '111', 'B07'),
(22, '2019-09-10 15:22:56', '112', 'B06'),
(23, '2019-09-10 15:35:53', '113', 'B08'),
(24, '2019-09-13 18:45:32', '111', 'B05');

--
-- Triggers `iss_rec`
--
DELIMITER $$
CREATE TRIGGER `book_limit` BEFORE INSERT ON `iss_rec` FOR EACH ROW BEGIN 
    IF ( SELECT COUNT(*) FROM iss_rec WHERE NEW.Mem_no = Mem_no ) = 3
    THEN SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Borrow limit reached !!!' ;
            END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `Mem_no` varchar(10) NOT NULL,
  `Stud_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`Mem_no`, `Stud_no`) VALUES
('108', 'C031012'),
('101', 'C033002'),
('111', 'C034023'),
('103', 'C034102'),
('105', 'C035094'),
('102', 'C042056'),
('106', 'C042067'),
('104', 'C046034'),
('112', 'C050303'),
('107', 'C052110'),
('110', 'C054038'),
('109', 'C062102'),
('113', 'C075536');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Stud_no` varchar(10) NOT NULL,
  `Stud_name` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Stud_no`, `Stud_name`) VALUES
('C031012', 'Wahab'),
('C033002', 'Tamim'),
('C034023', 'Albab'),
('C034102', 'Shakib'),
('C035094', 'Hafeez'),
('C042056', 'Finch'),
('C042067', 'Virat'),
('C046034', 'Rohit'),
('C050303', 'Himel'),
('C052110', 'Root'),
('C054038', 'Amir'),
('C062102', 'Malinga'),
('C075536', 'Anik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_no`);

--
-- Indexes for table `iss_rec`
--
ALTER TABLE `iss_rec`
  ADD PRIMARY KEY (`iss_no`),
  ADD KEY `Mem_no` (`Mem_no`),
  ADD KEY `book_no` (`book_no`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`Mem_no`),
  ADD KEY `Stud_no` (`Stud_no`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Stud_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iss_rec`
--
ALTER TABLE `iss_rec`
  MODIFY `iss_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `iss_rec`
--
ALTER TABLE `iss_rec`
  ADD CONSTRAINT `iss_rec_ibfk_1` FOREIGN KEY (`Mem_no`) REFERENCES `membership` (`Mem_no`),
  ADD CONSTRAINT `iss_rec_ibfk_2` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`);

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`Stud_no`) REFERENCES `student` (`Stud_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
