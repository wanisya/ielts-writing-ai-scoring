-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2026 at 10:23 AM
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
-- Database: `ielts_writing_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `writing_answers`
--

CREATE TABLE `writing_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `task_type` enum('task1','task2') DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `writing_answers`
--

INSERT INTO `writing_answers` (`id`, `user_id`, `task_type`, `answer`, `created_at`) VALUES
(1, NULL, 'task1', 'The bar chart illustrates the percentage contribution of three sectors—agriculture, manufacturing, and business and financial services—to the UK economy in four different years: 1900, 1950, 1975, and 2000.\r\n\r\nOverall, it is clear that agriculture and manufacturing experienced a significant decline over the century, while business and financial services showed a steady and substantial increase, eventually becoming the dominant sector.\r\n\r\nIn 1900, agriculture accounted for the largest share, at just under 50%, followed by manufacturing at approximately 45%. In contrast, business and financial services contributed only a small proportion, at around 5%. By 1950, agriculture remained the leading sector, increasing slightly to just over 50%, whereas manufacturing declined moderately to about 38%. Meanwhile, the business sector grew modestly to roughly 10%.\r\n\r\nHowever, by 1975, there was a noticeable shift. Manufacturing became the leading contributor at around 33%, while agriculture dropped sharply to just over 10%. Business and financial services also rose significantly to approximately 20%.\r\n\r\nBy 2000, the trend had reversed completely. Business and financial services became the dominant sector, contributing about 35%, while manufacturing fell to around 15%, and agriculture declined dramatically to below 5%.', '2026-04-06 07:59:06'),
(2, NULL, 'task2', 'It is often argued that children who grow up in less wealthy families are better equipped to handle the challenges of adult life compared to those raised in more affluent households. While both perspectives have merit, I largely agree that financial hardship can foster greater resilience and independence.\r\n\r\nOn the one hand, children from poorer backgrounds often face difficulties from an early age, such as limited access to resources and opportunities. As a result, they tend to develop problem-solving skills and adaptability. For example, they may learn to manage finances carefully or take on responsibilities at a younger age, which can prepare them for real-life challenges in adulthood.\r\n\r\nOn the other hand, children raised in wealthy families benefit from better education, healthcare, and social connections. These advantages can provide them with a strong foundation for future success. However, in some cases, excessive comfort may lead to a lack of independence or an inability to cope with failure.\r\n\r\nIn my opinion, while financial stability offers important advantages, experiencing some level of hardship is crucial for personal development. It teaches individuals how to overcome obstacles and builds mental strength, which are essential qualities in adult life.\r\n\r\nIn conclusion, although both groups have their strengths, children who grow up with fewer financial resources are often better prepared to deal with the realities of adulthood due to the resilience they develop.', '2026-04-06 07:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `writing_evaluations`
--

CREATE TABLE `writing_evaluations` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `band` decimal(2,1) DEFAULT NULL,
  `task_response` decimal(2,1) DEFAULT NULL,
  `coherence` decimal(2,1) DEFAULT NULL,
  `lexical` decimal(2,1) DEFAULT NULL,
  `grammar` decimal(2,1) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `writing_evaluations`
--

INSERT INTO `writing_evaluations` (`id`, `answer_id`, `band`, `task_response`, `coherence`, `lexical`, `grammar`, `feedback`, `created_at`) VALUES
(1, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:04:08'),
(2, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:04:08'),
(3, 1, 6.5, NULL, NULL, NULL, NULL, 'Your essay presents clear ideas and is generally well-organized. There is a good attempt to use a range of vocabulary and sentence structures. However, some grammatical errors and minor inconsistencies are still present. Development of ideas could be more detailed and precise. Overall, this is a solid performance, but further refinement is needed to reach a higher band. Your response is underdeveloped and should be longer.', '2026-04-06 08:09:09'),
(4, 2, 6.5, NULL, NULL, NULL, NULL, 'Your essay presents clear ideas and is generally well-organized. There is a good attempt to use a range of vocabulary and sentence structures. However, some grammatical errors and minor inconsistencies are still present. Development of ideas could be more detailed and precise. Overall, this is a solid performance, but further refinement is needed to reach a higher band. Your response is underdeveloped and should be longer.', '2026-04-06 08:09:09'),
(5, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:09:24'),
(6, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:09:24'),
(7, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:19'),
(8, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:19'),
(9, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:23'),
(10, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:23'),
(11, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:40'),
(12, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:10:40'),
(13, 1, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:11:06'),
(14, 2, 6.5, NULL, NULL, NULL, NULL, 'Essay too short. Good vocabulary. Sentence structure good.', '2026-04-06 08:11:06'),
(15, 1, 6.5, NULL, NULL, NULL, NULL, 'Your essay presents clear ideas and is generally well-organized. There is a good attempt to use a range of vocabulary and sentence structures. However, some grammatical errors and minor inconsistencies are still present. Development of ideas could be more detailed and precise. Overall, this is a solid performance, but further refinement is needed to reach a higher band. Your response is underdeveloped and should be longer.', '2026-04-06 08:11:22'),
(16, 2, 6.5, NULL, NULL, NULL, NULL, 'Your essay presents clear ideas and is generally well-organized. There is a good attempt to use a range of vocabulary and sentence structures. However, some grammatical errors and minor inconsistencies are still present. Development of ideas could be more detailed and precise. Overall, this is a solid performance, but further refinement is needed to reach a higher band. Your response is underdeveloped and should be longer.', '2026-04-06 08:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `writing_questions`
--

CREATE TABLE `writing_questions` (
  `id` int(11) NOT NULL,
  `task_type` enum('task1','task2') DEFAULT NULL,
  `question` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `writing_answers`
--
ALTER TABLE `writing_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writing_evaluations`
--
ALTER TABLE `writing_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writing_questions`
--
ALTER TABLE `writing_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `writing_answers`
--
ALTER TABLE `writing_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `writing_evaluations`
--
ALTER TABLE `writing_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `writing_questions`
--
ALTER TABLE `writing_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
