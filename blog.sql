-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2019 at 07:31 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'News'),
(2, 'Tutorials'),
(3, 'Practice'),
(4, 'Jobs'),
(5, 'Resources');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(10000) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category`, `title`, `body`, `author`, `tags`, `date`) VALUES
(1, 5, 'Getting Ready for PHP 7', '2015 has been an important year for PHP. Eleven years after its 5.0 release, a new major version is finally coming our way! PHP 7 is scheduled for release before the end of the year, bringing many new language features and an impressive performance boost.\r\nBackwards Compatibility Pitfalls\r\nLet\'s talk about the few things that could potentially break a legacy application running on older versions of PHP.\r\n\r\nDeprecated Items Removed\r\nA number of deprecated items have been removed. Because they\'ve been deprecated for some time now, hopefully you aren\'t using them! This might, however, have an impact on legacy applications.\r\n\r\nIn particular, ASP-style tags ( <%, <%= and %> ), were removed along with script tags. Make sure you are using the recommended tag instead. Other functions that were previously deprecated, like split, have also been removed in PHP 7.\r\n\r\nThe ereg extension (and all ereg_* functions) have been deprecated since PHP 5.3. It should be replaced with the PCRE extension (preg_* functions), which offers many more features. The mysql extension (and the mysql_* functions) have been deprecated since PHP 5.5. For a direct migration, you can use the mysqli extension and the mysqli_* functions instead.\r\n\r\nBut how will this impact your current PHP codebase? What really changed? How safe is it to update? This post will answer these questions and give you a taste of what\'s to come with PHP 7.\r\n\r\nPerformance Improvements\r\nPerformance is undoubtedly the biggest reason why you should upgrade your servers as soon as a stable version is released. The core refactoring introduced by the phpng RFC makes PHP 7 as fast as (or faster than) HHVM. The official benchmarks are impressive: most real world applications running on PHP 5.6 will run at least twice as fast on PHP 7.', 'Erika Heidi ', 'php7, news', '2019-12-28 15:05:59'),
(2, 1, 'The first annual PHP Wales Conference', 'A 2 day event full of talks and workshops, inside Cardiffs City Hall on the 3rd and 4th June 2020.\r\nHeld in the picturesque setting of Central Cardiff, accessible from local airports and train stations - PHP Wales will be bringing together around 400 PHP developers from around the world.\r\nWith your help we can put on our inaugural conference at PHPWales, bringing together 400 developers from around the world. Spread over 2 days in the capital city of Wales (Cardiff). Hosted in the Cardiff City Hall be sure to come along for the chance to learn from some of the best in the industry. With this being our first run, we wanted to set the theme to ensure the message was clear. Our theme is community, inclusion, and the importance of these. We have all seen when a community goes bad, or individuals are excluded from a community for one reason or another. We want to remind people that we are all one community of developers - but for these 2 days we are uniting under the banner of PHP.\r\n\r\nOur Tracks\r\nAPI Track\r\nThe API track is dedicated to all things API, from OpenAPI specifications, to JSON:API schema to how to build a microservice with the beautiful Slim4 this track is for your\r\n\r\nTooling and Language Track\r\nThe Tooling and Language Track is the track that covers pretty much anything not covered in the other track, something of a catch all. From MySQL8 to how to utilise PHP7.4 and beyond. If you want to give a more general tech talk, or a talk that doesn’t fall into the unConf or API track this is the track for you.\r\n\r\nunConf Track\r\nThe unConf track is a track dedicated to lightning talks and panel discussions, this is where we will hear a lot of different talks (on any technology subject) and have discussions on larger subjects.', 'Brain Dog', 'php conference', '2019-12-29 17:32:53'),
(3, 3, 'php[tek] 2020', 'We are excited to announce the Call for Speakers is open for php[tek] 2020, the longest-running web developer conference in the United States that has a focus on the PHP programming language. We combine leadership, expertise, and networking in one event. Creating a relaxing atmosphere for tech leaders and developers to share, learn and grow professionally while also providing you with the knowledge to solve your everyday problems. Join us on the journey to be excited about work again!\r\n\r\nThe event will be taking place May 20-21 in Nashville, TN at The Inn at Opryland (A Gaylord Property). The conference will be broken into three tracks this year:\r\n\r\nTech Leadership\r\nPHP Development\r\nWeb Technologies\r\nThere is an optional Workshop Day on May 19 that lets attendees take two separate in-depth half-day workshops. We also offer full-day training classes on Monday (May 18th) on deep technical topics.\r\n\r\nInterested in being a part of the 15th annual php[tek]? The Call for Speakers ends on January 4th. We do offer full travel & hotel coverage for speakers that request it. Read all the details and submit your proposals to us today!', 'Alexandr Frew', 'php, tek', '2019-12-29 17:37:55'),
(4, 4, 'Senior Software Engineer, Community', 'Job description\r\nAs a key member Skillshare’s Ecosystem team, you’ll be at the helm of one our most innovative and exploratory groups at Skillshare. The team’s work draws from a deep understanding of our users’ needs and augments their experience beyond classes - how else can we provide value to our students and teachers? How can we foster and grow the learning community on the platform? The Ecosystem team builds emerging features and functionalities to answer these questions. The team’s work is pivotal to the growth of our platform and our network. As such, we’re looking for a high level engineer who will work closely with our engineers, product, and leadership stakeholders to bring these features and functionalities to life.\r\n\r\nWhat you\'ll do:\r\n\r\nParticipate in daily stand-ups, bi-weekly sprint plannings, and sprint retrospectives for the team (we work in agile here)\r\nHelp facilitate ticket assignment – you know the strengths of engineers on your team, and when to give them new challenges to help them grow\r\nCollaborate with the team’s Product Manager to determine longer-term roadmaps\r\nBuild the product! A solid portion of this role will be hands-on writing code, and we’ll look to your senior expertise to set the standard for the team.\r\nReview code and provide technical mentorship to engineers on your team (and across the company)\r\nWhy we\'re excited about you:\r\n\r\nYou’re an experienced full-stack engineer with a proven history of leading teams in this capacity.\r\nYou are motivated by technical mentorship.\r\nYou bring best practices for coding, testing and technical documentation to the table, and are ready to help us implement them.\r\nYou’re interested in emerging technologies and excited to help push the boundaries of Skillshare’s platform offerings.\r\nWhy you\'re excited about us:\r\n\r\nImpact: Innovation is at the heart of our Ecosystem team, and you’ll be leading the technical charge.\r\nOur mission: We are building a learning ecosystem for the new economy and changing millions of lives for the better.\r\nOur team: We have a passionate, smart team that is a lot of fun to work with.\r\nYour life: We take pride in our flexibility. Need flexible hours, or work a day or two remotely? No problem. We trust you to do what you need to do.', 'Dummy', 'job, php', '2019-12-29 17:39:30'),
(5, 4, 'PHP Developer for Large Public Website', 'Job description\r\nWe are seeking PHP developers with strong skills in HTML, CSS, and Javascript. You write elegant, styling code, viewable on a wide range of devices and platforms. You understand Object-Oriented Programming, applying the technique to build maintainable software.  Working with a talented team of developers you can learn from and share your knowledge with is important to you. We want people with your skills and positive attitude to join us.\r\n\r\nWe have a number of large projects in flight and in our project pipeline. A sampling of some are:\r\n\r\nUsing GIS information to create layers on maps of State camping sites\r\nTotal Drupal 8 site re-write for a State\'s Department of Transporation\r\nBuilding Community Sites to bring citizens together with public services\r\nAs a developer here at PWW, you can expect to:\r\n\r\nwork on a variety of projects ranging in both size and scope\r\ndeliver high-quality solutions across multiple industries\r\nwrite blogs and have the opportunity to do technology presentations\r\nconsult with clients on design\r\nwork in a dynamic, collaborative environment\r\npractice and mentor Agile and Continuous Development practices\r\nparticipate in peer Code Reviews\r\ncontribute to the company\'s best practices knowledge base\r\nTake part in weekly developer lunches to share new ideas and effect the change you want across a whole team\r\nTypes of problems we solve\r\n\r\n Search large datasets and display in a human-friendly manner\r\n eCommerce - catalog browsing and ordering.\r\n Large content site creation - theming, custom application integration\r\nInterface with external services like Salesforce and national job listing sites\r\nSkills you bring\r\n\r\nMastery of front-end development\r\nCSS\r\nJavascript\r\nHTML 5\r\nResponsive design\r\nAccessibility (508 compliance)\r\nCreate HTML layout based on UX wireframes and designs\r\nPHP\r\nObject-Oriented structure development\r\nBonus Skills you bring are:\r\n\r\nExperience with building Content Management Systems with Drupal or Wordpress\r\nExperience developing applications using Laraval\r\nTools Used at PWW \r\nWe believe in using the best tools to get the job done. At PWW we believe in automating as much as possible and getting new team members quickly up to speed. To achieve this, we use\r\n\r\nDrupal\r\ngit\r\ndrush\r\ndocker\r\nAmazon Web Services\r\nPHP Webstorm / IntelliJ / SublimeText / Atom\r\nApache Solr\r\nMySql\r\ninVision\r\nSketch\r\n....and much more\r\nWe offer great benefits to full-time or our on-site team members:\r\n\r\nFriday Happy Hour\r\nWeekly catered developer luncheons\r\nFull-time employees earn on average annual profit share of 16% of your base salary \r\nExcellent location in Portland\'s Old Port neighborhood\r\nIn-house weekly yoga instruction\r\nFlex scheduling', 'Trwe Igor', 'php, job', '2019-12-29 17:41:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
