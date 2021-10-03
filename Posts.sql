-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 03, 2021 at 07:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpBlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`id`, `title`, `body`, `author`, `created_at`, `category`) VALUES
(1, 'Post 1', 'This is the first post on this awesome blog.', 'Animesh', '2021-10-02 10:10:55', 'National'),
(2, 'Post 2', 'This is the second test blog for this php website. I am just checking the database connection.', 'Amish Tripathi', '2021-10-02 10:10:55', 'Business'),
(3, 'Post 3', 'This is the post three, new post added.', 'Rohit', '2021-10-02 11:16:17', 'World'),
(4, 'Post 4', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Chetan Bhagat', '2021-10-02 11:16:17', 'National'),
(5, 'Post 5', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Virginia Wolf', '2021-10-02 11:16:17', 'Entertainment'),
(6, 'Post 6', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Roald Dahl', '2021-10-02 11:16:17', 'Business'),
(7, 'Post 7', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'William Shakespear', '2021-10-02 11:16:17', 'Sports'),
(8, 'Post 8', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Anne Frank', '2021-10-02 11:16:17', 'National'),
(9, 'Post 9', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'George R.R. Martin', '2021-10-02 11:16:17', 'National'),
(10, 'Post 10', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Sir Aurthor Conan Doyle', '2021-10-02 11:16:17', 'Technology'),
(11, 'Post 11', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Richard Fyenmenn', '2021-10-02 11:16:17', 'Entertainment'),
(12, 'Post 12', 'This is another post in this great mix of posts which I am displaying on the webpage using bootstrap.', 'Black Crouch', '2021-10-02 11:16:17', 'Social Media'),
(13, 'Post 13', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Simon Dough', '2021-10-03 07:12:22', 'Social Media'),
(14, 'Post 14', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Richard Dawkins', '2021-10-03 07:12:22', 'World'),
(15, 'Post 15', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Jason Statham', '2021-10-03 07:12:22', 'World'),
(16, 'Post 16', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'William Rockfellar', '2021-10-03 07:12:22', 'Sports'),
(17, 'Post 17', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Kurt Cobain', '2021-10-03 07:12:22', 'Entertainment'),
(18, 'Post 18', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Jason Mamoa', '2021-10-03 07:12:22', 'Socail Media'),
(19, 'Post 19', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Steven Steve Smite', '2021-10-03 07:12:22', 'National'),
(20, 'Post 20', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Kong Zurck', '2021-10-03 07:12:22', 'Business'),
(21, 'Post 21', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Stuart Little JR.', '2021-10-03 07:12:22', 'National'),
(22, 'Post 22', 'This is another post added to test the functioning of the PHP elements and the view and look of the landing page.', 'Walter White', '2021-10-03 07:12:22', 'Technology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
