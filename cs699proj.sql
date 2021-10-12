-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2021 at 09:27 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs699proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_status`) VALUES
(1, 'admin', 'admin@admin.com', 'admin@1234', 1),
(2, 'kamal', 'kkakadiya153@gmail.com', 'kamal@1234', 1),
(3, 'darshan', 'darshan@gmail.com', '123456789', 1),
(6, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 1),
(8, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 0),
(9, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 1),
(11, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 0),
(13, 'demo@demo.com10', 'demo@demo.com', 'demo@demo.com', 0),
(16, 'parth', 'parthkaka@bscfh.fcbhjc', 'parthkaka', 1),
(18, 'parthkakadiya', 'parthkakadiya@gmail.com', 'parth@1234', 1),
(19, 'demnnc', 'ndcmg@nhknm.ngv', 'ndcmg@nhknm.ngv', 1),
(21, 'kamal153', 'kkakadiya153@gmail.com', 'kamal153', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_title_img` text NOT NULL,
  `article_title` text NOT NULL,
  `article_category` text NOT NULL,
  `article_desc` text NOT NULL,
  `article_visit` int(11) NOT NULL DEFAULT 0,
  `article_like` int(11) NOT NULL DEFAULT 0,
  `article_dislike` int(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL,
  `article_img1` text DEFAULT '',
  `article_img2` text DEFAULT '',
  `article_img3` text DEFAULT '',
  `article_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_title_img`, `article_title`, `article_category`, `article_desc`, `article_visit`, `article_like`, `article_dislike`, `admin_id`, `article_img1`, `article_img2`, `article_img3`, `article_status`) VALUES
(1, '1633943963622_71_mumbai.jpeg-16339400903x2.webp', 'Maharashtra Bandh LIVE Updates: Reports of Shops Being Shut Forcibly Trigger War of Words Between BJP, Uddhav Govt; Local Trains on Time', 'India', 'Maharashtra Bandh Today LIVE Updates: Bus services were affected in Mumbai and neighbouring areas today and most of the shops and commercial establishments remained closed in the wake of the bandh called across Maharashtra by three partners in the Maha Vikas Aghadi (MVA) government to protest the killing of four farmers in Uttar Pradesh’s Lakhimpur Kheri district. As buses of the Brihanmumbai Electric Supply and Transport (BEST- the transport undertaking of the city civic body) and many of the traditional ‘black-yellow cabs’ remained off roads, there were huge crowds on suburban railway stations to commute by local trains, which were running as per schedule. The three partners in the MVA government in Maharashtra have appealed to the people to wholeheartedly support Monday’s state-wide bandh. The workers of Shiv Sena, NCP and Congress are meeting citizens with an appeal to participate in the bandh wholeheartedly and express their solidarity with farmers, he said.\r\n\r\nSeveral trade organisations in Pune have expressed support for Monday’s Maharashtra bandh called by the ruling MVA constituents and other outfits to protest against the October 3 killing of farmers in Lakhimpur Kheri in Uttar Pradesh.\r\n\r\nMumbai Police has said that strict patrolling will be held in view of statewide bandh. “Striking reserves to be deployed at strategic points, with 3 companies of SRPF, 500 Home Guards and 700 men from Local Arms units,” said the cops.', 0, 0, 0, 1, '', '', '', 1),
(2, '1633944192795_95_islamic-state-16316975303x2.webp', '\'Those at Serena Should Leave Immediately\': US, UK Warn Citizens of ISIS Threat to Kabul Hotels', 'World', 'New Delhi: Issuing a fresh travel advisory, the United States and Britain have advised their citizens to stay away from hotels in the Afghan capital Kabul, particularly from Serena, a luxury hotel that had been the target of attacks by the Taliban in the past. “US citizens who are at or near the Serena Hotel should leave immediately,” the US State Department said, citing ‘security threats’ in the area.Also Read - New Covid Travel Rules in UK from Today. What it Means For Travellers From India?\r\n\r\nBritain’s Foreign, Commonwealth and Development Office on the other hand stated,”In light of the increased risks you are advised not to stay in hotels, particularly in Kabul (such as the Serena Hotel). Also Read - Viral Video: ‘Dancing Dad’ Ricky Pond Performs Garba With His Kids, Grooves to \'Chogada\' to Celebrate Navratri | Watch\r\n\r\nSince the Taliban, a hardline Islamist group seized control of Afghanistan, the US and other foreign citizens have left Afghanistan but some journalists still residing in the capital owing to their work. Also Read - Afghanistan Preparing to Participate in T20 World Cup: ICC Acting CEO Geoff Allardice\r\n\r\nThe advisories by US and Britain come days after the suicide bombing at a mosque in Afghanistan’s Kunduz province. Local security officials said over 300 hundred people were at the mosque during the time of the blast. Witnesses had said over 100 worshippers were killed and wounded in the attack.\r\n\r\nThe deadly blast the Shia mosque has received widespread condemnation. UN Secretary-General Antonio Guterres strongly condemned the “horrific” attack, saying: “Attacks that deliberately target civilians exercising the right to freely practice their religion are violations of fundamental human rights and international humanitarian law… The perpetrators must be brought to justice.”\r\n\r\nThe Afghanistan Independent Human Rights Commission (AIHRC) called the attack against human rights values, saying it was a continued sting of deliberately targeting the country’s Hazara and Shia community.', 0, 0, 0, 1, '', '', '', 1),
(3, '1633944334915_76_apple-ipad-mini-6-review-16336958143x2.webp', 'Apple iPad Mini 6 (2021) Review: A Near-Perfect Tablet That Fills a Market Gap', 'Tech', 'I have often been confused about owning an iPad. Back when the first generation iPad Pro was released, I was excited about the prospect of a slim tablet replacing my rather bulky work laptop. In about a year that I used it, I tried to overlook its flaws for the benefits, but software wise, tablets just weren’t ready to replace a full-scale desktop OS. Since then, a lot has changed – the world has seen a pandemic, Cristiano Ronaldo has returned to Manchester United, and I have come to realise that my perspective towards tablets might have been skewered. The latter, in large part, has happened in the past two weeks, thanks to the Apple iPad Mini 6, or iPad Mini 2021 – whatever you’d like to call it.\r\n\r\nThe iPad Mini 6 is a balance of screen size, form factor and portability, an important formula that frequent travellers would prioritise once the pandemic recedes. It has also made me realise that the purpose of a tablet is not just to replace a laptop, but fill its absence. Before you jump to conclusions, I also believe that Apple should have made a keyboard for the iPad Mini 6 to fill the laptop’s absence better, but once you start spending time with it, you’d realise that this does you more good than bad. Here’s why.\r\n\r\nFORM FACTOR AND PORTABILITY: ALMOST POCKETABLE\r\nTo state that the iPad Mini 6 is compact is to state the obvious – it is, after all, from the ‘Mini’ family of Apple’s hardware. You get an 8.3-inch display on a tablet that is 7.7 inches in height, and 5.3 inches in width. It is also 6.3mm thick, and weighs 297 grams for the cellular version, which is what we have with us. In comparison, the new Apple iPhone 13 Pro is 7.7mm thick and weighs 205 grams. The latter feels heavier in-hand because on the iPad, the weight is not proportionately higher, and is better distributed too.\r\nAll of this makes the iPad Mini 6 one of the easiest to carry, and you can stow it anywhere in your bag without worrying. It is easy to grip and operate with one hand, especially with an Apple Smart Folio cover slapped on. On desks, the iPad Mini 6 is a good second display to add to compact laptops without it taking up a lot of space, helping you to avoid switching between windows and tabs constantly, when writing. This actually helps reduce distractions, and its compact footprint means it’s great for small or loaded desks.\r\n', 0, 0, 0, 1, '', '', '', 1),
(4, '1633944492486_92_morgan-kohli-1600-ipl-16338705743x2.webp', 'IPL 2021 Eliminator, RCB vs KKR Preview: Battle of Two Captains as Royal Challengers Bangalore Take on Kolkata Knight Riders', 'Sports', 'It will be a test of Virat Kohli’s tactical acumen against the ice-cool demeanour of Eoin Morgan when perennial underachievers Royal Challengers Bangalore clash with former champions Kolkata Knight Riders in the IPL Eliminator in Sharjah on Monday. Kohli, who has decided to step down from captaincy after this edition, has led RCB to the finals in 2016 besides reaching the play-offs twice in 2015 and 2020, and he would like to end things on a high in his last hurrah as captain.<br>For Morgan, it is about regaining the lost glory for KKR, a team which achieved great success under Gautam Gambhir, who had led them to two IPL titles in a space of three years in 2012 and 2014. On paper, it would be a battle between two evenly-poised teams, but overall, KKR has a slight edge, having won 15 out of 28 matches they played over the years.<br><br>But past records will count for little and it will boil down to winning small moments in the match, something which Kohli and Morgan would know pretty well. Both the captains have enough ammunition in their disposal and it will be all about managing the resources.', 0, 0, 0, 1, '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_auther` varchar(40) NOT NULL,
  `comment_desc` text NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `email`) VALUES
(1, 'kkakadiya153@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
