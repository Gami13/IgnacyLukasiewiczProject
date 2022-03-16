-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 01:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ignacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imageLink` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `imageLink`) VALUES
(1, 'Ignacy Łukasiewicz', 'https://polishhistory.pl/wp-content/uploads/2021/03/%C5%82ukasiewicz.jpg'),
(2, 'Pomnik Ignacego we Lwowie', 'https://fotoforum.gazeta.pl/photo/4/le/ja/pcrw/ZVMEPfb6WVpdxBnfZB.jpg'),
(3, 'Pomnik Ignacego w Poznaniu', 'https://upload.wikimedia.org/wikipedia/commons/9/98/Laweczka_Ignacego_Lukasiewicza_Poznan_01.jpg'),
(4, 'Pierwsza uliczna Lampa Naftowa', 'https://d-art.ppstatic.pl/kadry/k/r/b9/1c/5cc205abbc97a_o_full.jpg'),
(5, 'Pomnik w Zielonej Górze', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Pomnik_Ignacego_%C5%81ukasiewicza_w_Zielonej_G%C3%B3rze.jpg'),
(6, 'Pomnik w Krośnie', 'https://www.severovychod.sk/content/images/p/pamatnik-ignaca-lukasiewicza-v-krosne-1_full.JPG'),
(7, 'Pomnik Ignacego w Gorlicach', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/%C5%81aweczka_%C5%81ukasiewicza_w_Gorlicach.jpg'),
(8, 'Pomnik Ignacego w Bóbrce', 'https://pomnikiorganizacji.files.wordpress.com/2018/07/bc3b3brka-3.jpg'),
(9, 'moneta Łukasiewicz', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Ignacy_%C5%81ukasiewicz_%28coin%29.jpg/440px-Ignacy_%C5%81ukasiewicz_%28coin%29.jpg'),
(10, 'Kopalnia ropy naftowej w Bóbrce', 'https://kpu.krosno.pl/wp-content/uploads/2020/05/Kopalnia-B%C3%B3brka-1.jpg'),
(11, 'Lampa naftowa', 'https://gfx.dlastudenta.pl/fotoalbum/77c/f00/96c/0fa/1415000'),
(12, 'Do destylacji ropy naftowej', 'https://i1.wp.com/polishnews.com/wp-content/uploads/2019/10/narzedzia.jpg'),
(13, 'Muzeum ropy naftowej', 'https://static.polityka.pl/_resource/res/path/3b/a9/3ba92ef9-eba0-4f11-a374-696df9382f95_f1400x900'),
(14, 'Apteka Łukasiewicza w Jaśle', 'https://citik.jaslo.pl/wp-content/uploads/2017/06/apteka_lukasiewicza-1.jpg'),
(15, 'Honorata Łukasiewicz', 'https://wynalazca.tv/wp-content/uploads/2018/12/Zona-Przedsiebiorcy-Honorata-Lukasiewicz.jpg'),
(16, 'Grób Ignacego Łukasiewicza', 'https://upload.wikimedia.org/wikipedia/commons/5/50/Grob_Honoraty_i_Ignacego_%C5%81ukasiewicz.jpg'),
(17, 'Makieta lampy w Zręcinie', 'https://www.terazkrosno.pl/images/rrrcontent/images/xxls/makieta-lapmy-naftowe-stanela-w-zrecinie_12479_Ae9djf.jpg'),
(18, 'Tablica na grobie Honoraty', 'https://www.odleglosci.pl/galeria-081324/Tablica-na-grobie-Honoraty-Lukasiewicz.jpg'),
(19, 'Zespół Szkół nr 1 w Gorlicach', 'https://scontent.fpoz4-1.fna.fbcdn.net/v/t31.18172-8/12970917_1067808246594318_8745342345819755348_o.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=CJIhRnj-pzwAX9EANu-&_nc_ht=scontent.fpoz4-1.fna&oh=00_AT8BV6oC6bRM5Vxr2wohjVuUtijDXFPX3KDgqTIPadbthA&oe=6245D031');

-- --------------------------------------------------------

--
-- Table structure for table `quizattempts`
--

CREATE TABLE `quizattempts` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quizattempts`
--

INSERT INTO `quizattempts` (`id`, `userId`, `date`, `points`) VALUES
(1, 4, '2022-03-03 09:23:46', 25000),
(7, 5, '2022-03-03 10:03:43', 7500),
(8, 5, '2022-03-03 10:05:33', 10000),
(9, 6, '2022-03-03 10:06:33', 5000),
(10, 7, '2022-03-03 10:08:11', 5000),
(11, 5, '2022-03-03 10:20:07', 17500),
(12, 8, '2022-03-03 12:45:50', 22500),
(13, 7, '2022-03-03 13:51:41', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(48) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `token` varchar(255) NOT NULL,
  `banStatus` tinyint(1) NOT NULL DEFAULT 0,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `salt`, `token`, `banStatus`, `creationDate`, `avatar`) VALUES
(4, 'Frytak', 'frytak2855@gmail.com', '$2y$10$L/x39WRIMyD/Gq1ECxnpguESxNcB86USHGWg2yYwwqmnOBWSdaPoe', 'qUGjuQ==', 'ffQJNuiv/jxlPsUsZglzScfn4/cIqMwe6eZr5ngUSyjDBZ77lvotJrNFqfoMZzXZczS0e6DfWkanfcC0SnBDMs8sWijjrJtPFcluAujNl4tq9Xokpdwi69R4SOkBxoHpRIYdXUoTgC4BWdAThRzyrHIgQv5E8ef4T+Ucksq2QzcfkzLwvuHCbCtLxtaOvQiYIvRBYJXahWUb9aGwfDfFTUMsH0vxiud4Bhp0ETVH6Cr/7JXXTBNwWyWiutbL', 0, '2022-03-02 13:19:04', NULL),
(5, 'Gami', 'marcinczechowicz@gmail.com', '$2y$10$ekAkqH.X0f5rywYSXz6Q4eQc5EsQ1hD.5A87BGCh5s7cmsEqbMBoK', '7KGWHQ==', 'OozlLTLZJPdwyhiBAjhxPQIDv0b1U1+dCmuZVNlxqXBHyOqXAbPl4MesvSmrxRRLr/28zj8Absq788KDFzHlm6zeCQJVWsIQY+WUkX0cI67C/bn0tSlJ8+cs3/cCaqMquvv3qh9AvqB3Rq8rUdf4f4g83lxUQ/4RMfq8M+s5kTvabvmsERDHpOgJh0EhQSO/RP+R6xA/EuW4E+HyEsBuV2XuCSPefAaQ9QA6PwftlOxSMPOpKo5RsY9rk2Ed', 0, '2022-03-02 14:02:30', NULL),
(6, 'Mateusz Kiełtyka', 'mateo.pl@gmail.com', '$2y$10$N9uG/WRnhtBEQZG2/4KjBOdEtsrOqhNvn3zMt8Y/WNMcAvasXzQqS', 'co3DaA==', 'RHfjR+yIrB7D6n9Z5NMU7C7zqeddzussWbAu24N5fnSp/du6h2YIFN2dAGzJ/bH8LeVy1DpBs67h0J1ZCrwgqedDhMXAIb8ffxf7lvKzW8V+lED3JHCfpH5vhof8ZS6LgvMgnButpde+/rDPEexeq+UOapYJLkYSEskFp8x853UokRBwy7Weu4kVvAYN5MuXgYcAM9yK535I+Zyhk7IJSlpCFWbd6A5F2HvQnTP3uYb032ub5l0vk7u9PHxl', 0, '2022-03-03 09:04:53', NULL),
(7, 'Marcin Czechowicz', 'gamingpl01@gmail.com', '$2y$10$WN4AjnmaF2gvGvUi33DV2OjngfOEdErYGK/PQzBlUQxU17O3iz2wK', '7y8CNA==', 'wIO9xBJ/CvSE1yR829gBSMGYPQTKB3u+r4AkW/B64yPdy9xszjqnFZje8PFceRWBeQYvdP/JwSt4EggPDagDRff2scNdkz5JZgHP7w7tW+3hsvhb1QO5xh0NsmW3ce/zCYZr/LP+Sks81Gdpzb4v7fquraeqbM1DBuHosn3YQ56aXqPNiF152sgfVthLP9wkNYwukhjcw+iP+HAWSGXDLEqNU1JTYV+cKYL0kEavc3UFRZ/2KhHE/plia7gu', 0, '2022-03-03 09:07:22', NULL),
(8, 'Gaba', 'gabagaba@gmail.com', '$2y$10$Nf7RXltOHlH/R/8EUHpV3eA6/6qp3WrMqg1edwoOYVdcCm1xoik8.', 'PvjQyQ==', '+R+qD1MU6YDEWojXj0SA94Jx/sVBK9eHpFf3+T8ZCQTPDNWiYtaYPQjhZsU/bmv/QgYhDM0qm7njijx8SpzBwqkc3bQdSlFGMjBbJpnA8TJHQ/Kfl5VOQuzqrp1jLmir6iCvMHWEWnI5w/zH8e/T1HaD8Vw5c6V+1rFgDdF8/HQ8YvJ9ZgbKQYAZTtgY2stFRROXZ4MHE//SIr9+NBymuxJlIAWNSMQyUlpZPDwOTTJWirs8eGDAr3v3/1XI', 0, '2022-03-03 11:44:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizattempts`
--
ALTER TABLE `quizattempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `quizattempts`
--
ALTER TABLE `quizattempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
