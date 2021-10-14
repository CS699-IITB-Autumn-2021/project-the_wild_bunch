-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 05, 2021 at 03:13 PM
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
(1, '1.63317300979E+12_64_86634126.jpeg', 'Crisis in Punjab Congress live updates: Post or no post, will stand by Rahul & Priyanka, says Navjot Singh Sidhu', 'India', 'Punjab is in safe hands, no need to create panic: Deputy CM Randhawa Making a veiled attack on former chief minister Amarinder Singh over security concerns, Punjab Deputy CM Sukhjinder Singh Randhawa on Friday assured everyone that the state is in safe hands and said there is no need to create panic. Randhawa took strong exceptions to an \"alarmist narrative\" that is being created by certain people having vested interests about peace and security in Punjab. He warned against such designs, saying it will create an unnecessary sense of fear and insecurity among the people. \n\nAmarinder hits back at Rawat, says Cong in pathetic state in Punjab Hours after Congress leader Harish Rawat questioned his secular credentials in no-holds-barred attack, former Punjab chief minister Amarinder Singh said on Friday it was prompted by the \"pathetic situation\" the party has now found itself. \"Three weeks before stepping down as CM, I had offered my resignation to Sonia Gandhi but she had asked me to continue,\" said Singh in a statement here, ridiculing Rawat\'s remarks that he seemed to be under pressure. The former chief minister said the only pressure he had been under for the past few months was that of his own loyalty to the Congress, because of which he continued to tolerate insult after insult.', 0, 0, 0, 1, '', '', '', 1),
(2, '1.63317338339E+12_23_86160612.jpeg', 'Everything you want to know about Bitcoin mining', 'Tech', 'By this broad definition, a number of things qualify as virtual currencies: while some online games such as World of Warcraft forbid the exchange of the in-game currency for any other form of money, a black market engaging in just this exists. Equally, a number of online marketplaces â€“ especially within the gaming community â€“ require the one-way exchange of legal tender for virtual currencies, e.g. Microsoft Points.\r\n\r\nOf course, a common feature of all of the currencies discussed so far is that theyâ€™re centralised: the Federal Reserve is the centralised authority and repository for US dollars, GS&R â€“ the company behind E-Gold â€“ held a centralised ledger tracking transactions, and Microsoft naturally keep track of Microsoft Points.\r\n\r\nWhile not legal tender, the value of these currencies is agreed and accepted by all of the parties involved â€“ much as people generally accept the declared value of paper money or an electronic bank transfer.\r\n\r\nThe arrival of Bitcoin in 2009 â€“ the first and, arguably, most famous decentralised virtual currency â€“ had a significant impact.\r\n\r\nA brief history\r\nCryptocurrencies are so-called because of their use of cryptographic functions to secure transactions and limit the creation of new units of the currency. While not the first cryptocurrency, Bitcoin is once arguably the most famous example and was the first to be â€˜decentralisedâ€™.\r\n\r\nInstead of a centralised ledger (as would be the case with traditional currencies/government central banks), Bitcoin uses a public ledger known as the â€˜blockchainâ€™. Bitcoin transactions are broadcast to a network of privately operated nodes running Bitcoin software, a subset of which verify and process the transactions into groups called blocks (these machines are known as miners). All nodes keep a record of these blocks (hence â€˜blockchainâ€™) once they have been processed, thus keeping a distributed record of transactions and ownership.\r\n\r\nOwing to the distributed and open nature of the blockchain, transactions and wallets are freely available to view online at sites such as blockchain.info.\r\n\r\nAs miners are rewarded with Bitcoins in the form of both newly created Bitcoins and any transaction fees included within the block, the supply of Bitcoins is slowly increasing. To temper this flow, any new block requires a â€˜proof-of-workâ€™ to be accepted by the rest of the network. In brief, this is a task that takes a long time to complete but a short time to double-check.', 0, 0, 0, 1, '', '', '', 1),
(3, '1.63317369125E+12_59_86160612.jpeg', 'demo', 'India', 'Punjab is in safe hands, no need to create panic: Deputy CM Randhawa Making a veiled attack on former chief minister Amarinder Singh over security concerns, Punjab Deputy CM Sukhjinder Singh Randhawa on Friday assured everyone that the state is in safe hands and said there is no need to create panic. Randhawa took strong exceptions to an \"alarmist narrative\" that is being created by certain people having vested interests about peace and security in Punjab. He warned against such designs, saying it will create an unnecessary sense of fear and insecurity among the people. \r\n\r\nAmarinder hits back at Rawat, says Cong in pathetic state in Punjab Hours after Congress leader Harish Rawat questioned his secular credentials in no-holds-barred attack, former Punjab chief minister Amarinder Singh said on Friday it was prompted by the \"pathetic situation\" the party has now found itself. \"Three weeks before stepping down as CM, I had offered my resignation to Sonia Gandhi but she had asked me to continue,\" said Singh in a statement here, ridiculing Rawat\'s remarks that he seemed to be under pressure. The former chief minister said the only pressure he had been under for the past few months was that of his own loyalty to the Congress, because of which he continued to tolerate insult after insult.', 0, 0, 0, 1, '1.63318969764E+12_55_download_(1).jpeg', '1.63318969764E+12_34_download.jpeg', '1.63317369125E+12_65_86634126.jpeg', 1),
(4, '1.63317379784E+12_90_86160612.jpeg', 'final', 'Entertainment', 'sxcdsg', 0, 0, 0, 1, '1.63317379784E+12_65_', '1.63317379784E+12_54_86634126.jpeg', '1.63317379784E+12_65_', 1),
(5, '1.63318913024E+12_94_Time_Table.png', 'kamal', 'World', 'kamal', 0, 0, 0, 1, '1.63318954458E+12_43_My_Visiting_Card.jpg', '1.6331739604E+12_21_86160612.jpeg', '', 1),
(9, '1.63319333972E+12_24_download.jpeg', 'The HyperText Markup Language, or HTML is the standard markup language f', 'Education', 'The HyperText Markup Language, or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets (CSS) and scripting languages such as JavaScript.\r\n\r\nWeb browsers receive HTML documents from a web server or from local storage and render the documents into multimedia web pages. HTML describes the structure of a web page semantically and originally included cues for the appearance of the document.\r\n\r\nHTML elements are the building blocks of HTML pages. With HTML constructs, images and other objects such as interactive forms may be embedded into the rendered page. HTML provides a means to create structured documents by denoting structural semantics for text such as headings, paragraphs, lists, links, quotes and other items. HTML elements are delineated by tags, written using angle brackets. Tags such as <img /> and <input /> directly introduce content into the page. Other tags such as <p> surround and provide information about document text and may include other tags as sub-elements. Browsers do not display the HTML tags, but use them to interpret the content of the page.\r\n\r\nHTML can embed programs written in a scripting language such as JavaScript, which affects the behavior and content of web pages. Inclusion of CSS defines the look and layout of content. The World Wide Web Consortium (W3C), former maintainer of the HTML and current maintainer of the CSS standards, has encouraged the use of CSS over explicit presentational HTML since 1997.[2]', 0, 0, 0, 2, '', '', '', 1);

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

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_auther`, `comment_desc`, `article_id`, `comment_status`) VALUES
(1, 'kamal', 'a person who expresses an opinion or engages in discussion of an issue or event, especially online in response to an article or blog post.\r\n\"the first commenter suggested that the story is a hoax\"', 1, 0),
(2, 'darshan', 'Commenter definition is - one who comments; especially : one who leaves a comment on an Internet site, story, page, etc.. How to use commenter in a ...', 9, 0);

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
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
