-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Maj 2022, 13:01
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ignacy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imageLink` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `gallery`
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
(18, 'Tablica na grobie Honoraty', 'https://www.odleglosci.pl/galeria-081324/Tablica-na-grobie-Honoraty-Lukasiewicz.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `quizattempts`
--

CREATE TABLE `quizattempts` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `quizattempts`
--

INSERT INTO `quizattempts` (`id`, `userId`, `date`, `points`) VALUES
(9, 6, '2022-03-03 10:06:33', 5000),
(14, 10, '2022-05-31 09:35:32', 12500),
(15, 12, '2022-05-31 09:42:43', 10000),
(16, 11, '2022-05-31 09:43:01', 2500),
(17, 14, '2022-05-31 09:44:37', 10000),
(18, 11, '2022-05-31 09:44:46', 5000),
(19, 13, '2022-05-31 09:44:54', 7500),
(20, 15, '2022-05-31 09:45:20', 12500),
(21, 12, '2022-05-31 09:45:37', 22500),
(22, 14, '2022-05-31 09:46:16', 12500),
(23, 21, '2022-05-31 09:55:13', 10000),
(24, 17, '2022-05-31 09:55:38', 2500),
(25, 23, '2022-05-31 09:55:50', 5000),
(26, 28, '2022-05-31 10:01:32', 10000),
(27, 29, '2022-05-31 10:02:38', 15000),
(28, 31, '2022-05-31 10:02:52', 15000),
(29, 28, '2022-05-31 10:02:58', 10000),
(30, 30, '2022-05-31 10:03:31', 15000),
(31, 29, '2022-05-31 10:04:02', 12500),
(32, 34, '2022-05-31 10:07:11', 12500),
(33, 35, '2022-05-31 10:09:05', 15000),
(34, 38, '2022-05-31 10:12:52', 7500),
(35, 36, '2022-05-31 10:13:35', 0),
(36, 37, '2022-05-31 10:13:45', 10000),
(37, 39, '2022-05-31 10:14:19', 10000),
(38, 40, '2022-05-31 10:14:22', 10000),
(40, 44, '2022-05-31 10:21:42', 10000),
(41, 45, '2022-05-31 10:22:18', 7500),
(42, 47, '2022-05-31 10:22:24', 15000),
(43, 46, '2022-05-31 10:22:34', 5000),
(44, 43, '2022-05-31 10:22:34', 10000),
(45, 9, '2022-05-31 10:32:53', 10000),
(46, 52, '2022-05-31 10:42:43', 5000),
(47, 48, '2022-05-31 10:42:45', 5000),
(48, 54, '2022-05-31 10:43:59', 5000),
(49, 53, '2022-05-31 10:44:09', 10000),
(50, 62, '2022-05-31 10:57:07', 10000),
(51, 57, '2022-05-31 10:57:21', 12500),
(52, 60, '2022-05-31 10:57:24', 7500),
(53, 55, '2022-05-31 10:57:28', 10000),
(54, 58, '2022-05-31 10:57:30', 2500),
(55, 61, '2022-05-31 10:57:59', 7500),
(56, 56, '2022-05-31 10:58:13', 7500),
(57, 67, '2022-05-31 11:05:07', 7500),
(58, 68, '2022-05-31 11:05:10', 5000),
(59, 66, '2022-05-31 11:05:14', 7500),
(60, 69, '2022-05-31 11:05:27', 12500),
(61, 76, '2022-05-31 11:20:22', 15000),
(62, 77, '2022-05-31 11:20:33', 5000),
(63, 79, '2022-05-31 11:22:01', 12500),
(64, 78, '2022-05-31 11:22:41', 10000),
(65, 82, '2022-05-31 11:24:18', 10000),
(66, 80, '2022-05-31 11:24:38', 7500),
(67, 83, '2022-05-31 11:24:45', 7500),
(68, 77, '2022-05-31 11:25:00', 15000),
(69, 86, '2022-05-31 11:25:10', 12500),
(70, 85, '2022-05-31 11:25:12', 10000),
(71, 84, '2022-05-31 11:25:13', 12500),
(72, 87, '2022-05-31 11:26:14', 10000),
(73, 93, '2022-05-31 11:46:53', 7500),
(74, 90, '2022-05-31 11:47:07', 5000),
(75, 89, '2022-05-31 11:47:11', 12500),
(76, 92, '2022-05-31 11:47:18', 7500),
(77, 94, '2022-05-31 11:47:56', 12500),
(78, 91, '2022-05-31 11:48:02', 12500),
(79, 95, '2022-05-31 11:48:34', 20000),
(80, 96, '2022-05-31 11:50:00', 15000),
(81, 96, '2022-05-31 11:52:13', 25000),
(82, 107, '2022-05-31 12:10:32', 12500),
(83, 102, '2022-05-31 12:10:51', 5000),
(84, 98, '2022-05-31 12:11:07', 15000),
(85, 104, '2022-05-31 12:11:17', 7500),
(86, 108, '2022-05-31 12:11:34', 15000),
(87, 99, '2022-05-31 12:11:34', 10000),
(88, 107, '2022-05-31 12:12:44', 17500),
(89, 109, '2022-05-31 12:12:53', 15000),
(90, 105, '2022-05-31 12:13:18', 7500),
(91, 99, '2022-05-31 12:13:50', 17500),
(92, 113, '2022-05-31 12:25:07', 12500),
(93, 112, '2022-05-31 12:25:11', 10000),
(94, 115, '2022-05-31 12:25:30', 10000),
(95, 114, '2022-05-31 12:25:37', 7500),
(96, 117, '2022-05-31 12:25:42', 2500),
(97, 116, '2022-05-31 12:25:47', 12500),
(98, 121, '2022-05-31 12:30:17', 17500),
(99, 122, '2022-05-31 12:32:59', 12500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
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
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `salt`, `token`, `banStatus`, `creationDate`, `avatar`) VALUES
(4, 'Frytak', 'frytak2855@gmail.com', '$2y$10$L/x39WRIMyD/Gq1ECxnpguESxNcB86USHGWg2yYwwqmnOBWSdaPoe', 'qUGjuQ==', 'ffQJNuiv/jxlPsUsZglzScfn4/cIqMwe6eZr5ngUSyjDBZ77lvotJrNFqfoMZzXZczS0e6DfWkanfcC0SnBDMs8sWijjrJtPFcluAujNl4tq9Xokpdwi69R4SOkBxoHpRIYdXUoTgC4BWdAThRzyrHIgQv5E8ef4T+Ucksq2QzcfkzLwvuHCbCtLxtaOvQiYIvRBYJXahWUb9aGwfDfFTUMsH0vxiud4Bhp0ETVH6Cr/7JXXTBNwWyWiutbL', 0, '2022-03-02 13:19:04', NULL),
(5, 'Gami', 'marcinczechowicz@gmail.com', '$2y$10$ekAkqH.X0f5rywYSXz6Q4eQc5EsQ1hD.5A87BGCh5s7cmsEqbMBoK', '7KGWHQ==', 'OozlLTLZJPdwyhiBAjhxPQIDv0b1U1+dCmuZVNlxqXBHyOqXAbPl4MesvSmrxRRLr/28zj8Absq788KDFzHlm6zeCQJVWsIQY+WUkX0cI67C/bn0tSlJ8+cs3/cCaqMquvv3qh9AvqB3Rq8rUdf4f4g83lxUQ/4RMfq8M+s5kTvabvmsERDHpOgJh0EhQSO/RP+R6xA/EuW4E+HyEsBuV2XuCSPefAaQ9QA6PwftlOxSMPOpKo5RsY9rk2Ed', 0, '2022-03-02 14:02:30', NULL),
(6, 'Mateusz Kiełtyka', 'mateo.pl@gmail.com', '$2y$10$N9uG/WRnhtBEQZG2/4KjBOdEtsrOqhNvn3zMt8Y/WNMcAvasXzQqS', 'co3DaA==', 'RHfjR+yIrB7D6n9Z5NMU7C7zqeddzussWbAu24N5fnSp/du6h2YIFN2dAGzJ/bH8LeVy1DpBs67h0J1ZCrwgqedDhMXAIb8ffxf7lvKzW8V+lED3JHCfpH5vhof8ZS6LgvMgnButpde+/rDPEexeq+UOapYJLkYSEskFp8x853UokRBwy7Weu4kVvAYN5MuXgYcAM9yK535I+Zyhk7IJSlpCFWbd6A5F2HvQnTP3uYb032ub5l0vk7u9PHxl', 0, '2022-03-03 09:04:53', NULL),
(7, 'Marcin Czechowicz', 'gamingpl01@gmail.com', '$2y$10$WN4AjnmaF2gvGvUi33DV2OjngfOEdErYGK/PQzBlUQxU17O3iz2wK', '7y8CNA==', 'wIO9xBJ/CvSE1yR829gBSMGYPQTKB3u+r4AkW/B64yPdy9xszjqnFZje8PFceRWBeQYvdP/JwSt4EggPDagDRff2scNdkz5JZgHP7w7tW+3hsvhb1QO5xh0NsmW3ce/zCYZr/LP+Sks81Gdpzb4v7fquraeqbM1DBuHosn3YQ56aXqPNiF152sgfVthLP9wkNYwukhjcw+iP+HAWSGXDLEqNU1JTYV+cKYL0kEavc3UFRZ/2KhHE/plia7gu', 0, '2022-03-03 09:07:22', NULL),
(8, 'Gaba', 'gabagaba@gmail.com', '$2y$10$Nf7RXltOHlH/R/8EUHpV3eA6/6qp3WrMqg1edwoOYVdcCm1xoik8.', 'PvjQyQ==', '+R+qD1MU6YDEWojXj0SA94Jx/sVBK9eHpFf3+T8ZCQTPDNWiYtaYPQjhZsU/bmv/QgYhDM0qm7njijx8SpzBwqkc3bQdSlFGMjBbJpnA8TJHQ/Kfl5VOQuzqrp1jLmir6iCvMHWEWnI5w/zH8e/T1HaD8Vw5c6V+1rFgDdF8/HQ8YvJ9ZgbKQYAZTtgY2stFRROXZ4MHE//SIr9+NBymuxJlIAWNSMQyUlpZPDwOTTJWirs8eGDAr3v3/1XI', 0, '2022-03-03 11:44:10', NULL),
(9, 'szkola', 'szkola.dni@otwarte.com', '$2y$10$EbByNVZIC0wzOKTruRbgNOq2neDr.EF9NJwTxdr7XE.1nDPZdHHou', 'a8tpew==', 'IpHf63PRpHrKHWiappvRpg/dELU26E8BK6pHICeuGJNgrwxEXIo1xmb1I5LnXSOiY+jQWuw9M7+ZUOGBZ4rNG8AXX4at/az8+PFTA2ajxLG51sWcXjgcb8ry9iFLFiyEIjCAQ/qhwq2HBo8fnQ/cZyXEAxTg1hxyz+ugKyisT4xF7lPdiDeo58Ngs6mf2DDqeNMrLCM3u7Jwzx6XjYfMIFxc5fuEsOXReloFJc1AAB2obkqKKl1opRph6Vk/', 0, '2022-05-31 07:28:57', NULL),
(10, 'dzesa', 'szkola.dni77@otwarte.com', '$2y$10$f5X.OMyfvc.a4JRUcnAIT.q0e9zbMmrL0LOYiXRL4buZ1jYzFeEBy', 'Xf7RRg==', 'nCciOOa4oIA+f01JXbgMMH9G5M+KqUGUCsCu9QaXXtRHKd1is9asDGBy8lDpEcaOxKep4sOsXfiQcq40cJSO/hoBgy11i4V8to3rVucQuimw7iyBf+YWs55z16+AtzJHka5dL60sLNjP2pBfBVk0NyD2hcZCd0sqUP0GhqNlHkLHgEWeTsf9G9s/wcEtlNYodVeWkUDGYmXS81kZznvhJ+XMgEA6B1k5yCakL1JhtJCjFbGq+rldTP75dJ6o', 0, '2022-05-31 07:32:52', NULL),
(11, 'Patrick', 'kacper@gmail.com', '$2y$10$ESnZaoaCkWccz37bhKM.2un7B5J27c6JoZYJBdJ6lWE6JZOJ6q8pG', 'hlGttw==', 'mIe8KMyERR8FnOWV41ZwtXYmc+uNU0OYbfgv8zvqb+VnJ4bIolMl6ubdjVk0T17zZluxagBd2MpMdJvFtmxOcRUyjAOcGQdEvlEtu5gtCNjY1fI+pGYxlUDf9jYq+hEBwGThVVcB3gD/TOtE4NxHIhT93vyTBgbjKBgu+tiAUMXqDu75FMd7S/DaHwQtYgqv8mMQgESse0+EM8ndee3STgyNAQtufLm82/PGYg9t4yx19cDsKdSyjl5A8iDk', 0, '2022-05-31 07:40:15', NULL),
(12, 'Kamil', 'adam.nowak@gmail.com', '$2y$10$22aCOTPMCItfC2HFnuyLLeand1SPq.UKxh8Mb25sIf1OnxX7RQYxC', 'YmkwFw==', 'mUjRfrP4e4q9inedwydvEaX6nbDSTIc1gN5ZEZZ1EMGKmtmq8OWswb8d3IWKsZlCykMEL5xPZFV2Mj2GA+90zh6K5lSQB+YaQ7eQhZbw78M98nSPPh1P24QCtdltuCKoUyNcTdHyWWNxPdOReX5YyN9JOq3Foi8LOCHKgTvm2OBIXMEGT8f1oMojy2qbyCcA3fKhIMbF3o5WGuKwUP9+JT5NhRkBvv+oKZO9/UNL+BypIfLP42eeY6S+vqUE', 0, '2022-05-31 07:40:20', NULL),
(13, 'piotrek', 'musialpiotr45@gmail.com', '$2y$10$zUT3JXM1Oqd89fPlW.W1HevSoosxtn3T9GZnjkHXLgqk0u1e.xjrm', 'JlQyyg==', 'ZzIvd6K0nJUebXySD5Aucm35+bdranExK5Xzt0/HzaLEPEvbnAIsUJNuUEgZtgRFs6qPDE0DKlmXNUdEEwFHzpH5rB691iaYjQIqOr3t7E0L+MDmspaJtf0K+sGkjH2XtHOICjTS7y8S3bRtwsdRGvIploAKX3x6F06IadnwfN6sMkcO2ND24h5IdthYYWl92JkqA8SsWmAyAKmMXmP3NyyPv+cxLiuidvT6o9fMQ/r+/975QnewDSFJxXBW', 0, '2022-05-31 07:42:20', NULL),
(14, 'KamilS', 'kamilgorlice@wp.pl', '$2y$10$daR/x5PzPdfawL/N0CNtu.9KwtxJQRsXkofhYTVbMgtEzGJ9nWquq', 'R/0qsg==', 'JYRtJWgGydQk9nKtYGBkvnavzXWke5gAfSUyY62Ca8qyu1VAUY6mt4QQ4xNYpIC8P1Ov5IGralLBASQ1qnZkhrM39mXxnyeqDS04zGFcD7aofEVV0Ui7T+hWdVSObzo+WsiE77/+eEqJ4qX0oSyU+Wt8erqs+rzae8EglckbN8//oKCz47o40y1OoVOOyh2uvHlF0Okj0Tg6upxZcxoJaXws5doiESkh1V009ShiHoypLEIOdd6kF8ON9aCE', 0, '2022-05-31 07:42:45', NULL),
(15, 'Z3rtaX', 'datakacper@gmail.com', '$2y$10$qBmkuO1oNaggfYeM1e1Gu.xMhZgST2hDY6g16xmCgqb.HPHdABjEi', 'sSlnxQ==', 't02Gp0Ql61yL7RDFUFi1sqQu+5Wn3Dzz/j5Ya9gvhb7Nrb/OVcJYL234TtopYV7ny0OqB14pKNQgT65gayREeOqbIj/4TqtKtuyG+fw16G3mfGgVFcdlIiZajHqnAWLdOdV5I5GeJrsrE/wXugw2GG75WTKE5Z7D+NuWhNr9NxSrHP5rGbs3wp/AosIxJktm/RigrUQ0W5ogVJg/tOdnza0C+Ql2yjCdCG+oX3LnP7P6yaM8ccX4BEm/E3Zh', 0, '2022-05-31 07:43:11', NULL),
(16, 'abcd', 'abcd@gmail.com', '$2y$10$HUgHcJ7IfpU.U6HAzGprAeiZhNee7zBN7ljRIu6yx3K6c6TOSkqhi', 'MaDysw==', 'wOxDmJgvauB1K16/zIJWtEmD+Pa1NdrNgNEH73+LgOi1TmJGdepTzkB8vJIVPAW/kOeft+uFJZvBixGGW8q9PwkVBDCKI601W2UrXXwn1DbsTuP/Exc7L143RvC11REWMEDPZy6l/jFWfBwiDAGZw7wu4NISPTprDwWAYxBIiWd43SsEUuPPpI21IcDeZ0ApCoaIwCiwHk1BH4ywDZHQkrLw9KlrquQpv+EfBUjAZCcYNCSOdolpLUJDp/bh', 0, '2022-05-31 07:52:24', NULL),
(17, 'FJAOPFJ', 'dakndlan@gmail.com', '$2y$10$dY6gAKotIM6nbfNeaO.2Fe1nDzmzCpt6eFLCw9j9J7OqDXZxaaj3u', 'RnFfDQ==', 'Cdw8QM2UwFPHzx3PnKpZvwMRClGYry9Dh2rc9LtPg8OF6l0aLyrQgUS2AmzHubV1/3P0aVNFJm+c79U3eBThFQ+fDX2OEo8lBnvp+xTd2SBRn1cyeKHJLsYmQ3YNzETMOdSm3zYARQIbooabxWTVq8+TS6FvOWa63/5PdccwjVOEOO/it5YWd9XS0T2+kFWvbVx5rq4muTsc39Bn8osozplNeyYCHs0v8OHMHll8YF7bgxk3qb9myFORhyTn', 0, '2022-05-31 07:52:37', NULL),
(18, 'lisu', 'joker13313@interia.pl', '$2y$10$RlMUCos3DaIsP6xUhiGczOBZ49zb2ghDQAyqRWkIKg9hAUj50M5zS', 'Gz51tQ==', 'U0tXV5pmcXcZFYMoiAkrXa9N1PAAWHrqO+lzo8VnMXnD8y/TQoTuozBh9s0Uk300lXEsluOiG59g8X8NTptlrxWSnS445HeOeXU9y6YllS+HKrx162VzF6zXr15gln41PNLwNpuonlYtuT0Vezs2wlwXomFQHdn/ihJ8yGE/wwbF0rdTJl5I/CB71ZA2NiXAWpniGeHm4/PRPiijTtYHra4fzZApT609Uyj9YyvAmpPqpPPOXDDsPF0/E4Gt', 0, '2022-05-31 07:52:38', NULL),
(19, 'serafin', 'gfhdgnodfnhogsd@gmail.com', '$2y$10$O2TXp2oPZd2AuAf0z9YrvuNJ/Xl/wlv9RVl.AhQXDZcMnifdC4r06', 'cV6OtQ==', 'AtZk7B2G2ckXzckHZROx/BPYvd+YuOvaI4l23KlewElvx2DtIIvOqufyjYCHkWu7TH2ZlB5lt5CBMtEGd+yd4NI0AalVu0cM1H+M9lvP9k1X9K3CkfH0u0Ih+yA59+R/aoy9/omuXPd0dUnur79lunr6T2g6317Cu4MBZbRKa0OLVs7gg+IcQTCAPg/mpn8wuE3MsPCOw/2fo6dJkae0UuHiTUASs2cc3qGmudLYXlU9PvrDkqOdUAYwlAzv', 0, '2022-05-31 07:52:46', NULL),
(20, 'Nikki', 'niki1609@gmail.com', '$2y$10$Q.PHMUeLI1YTrseV5fPFNekAoxlEwzYkcL9JdTk.0iI6z0tPbGWEm', 'hoxnQw==', 'YCxG6VxxdCfBjWLfmdRmrCe16CWffiySC8fd61nDjSIKEQtsrdcpVZ+5t9k4QiUATbWKD0JjjXplM5spfTZAsvpSqnRar2hD+rt1jPK0HIkgLMrR394qZCv5w3ID1a8PaAe7v85lR00+EU4f2njNiQnVZJlwQc6wufq2RcohKfqq818rrTl+gf8RTk7ZqOtu0IQKy1k7ZEhVsfrM54/yXBr0J5fyoo1mFaQ5pP1TsdIn9zgVoW9yUmh/2ttV', 0, '2022-05-31 07:52:56', NULL),
(21, 'abcder', 'abcdeer@gmail.com', '$2y$10$qOpTBsNI.ygiXCHRzcl8MuceXJ1oGvWE7m/e5BxgrzbeDI07QSM56', 'nq57Fw==', 'WDswUMLA3R5tAdsPXfUeNyDznW0XWSGtmIvyqMyWuAKySHNZqjs6uo7cSKrUTcvYzsZQ5m0EsoWxdsAsEgyaanT048Cat+lFqJL/1IIQdvn2kRQgtDgIQgZhjgQZYYpzsV20LXqeo8LOmIShr+hspRGvwl1+6r01XNGjlR+hwQWELlmF6t99Utk+22b2WOHShtkhQ2c0nw0Vc87/hEtucGtYXIxf9qvZ+tZbT0wtyEumYDQy7gRTRGVajJ9z', 0, '2022-05-31 07:53:01', NULL),
(22, 'DanianK.kulki', 'fsduagyf@wp.pl', '$2y$10$zpI6PuEDYrnAhA7Pyv9lV.8PTrqW09.rE3UZ9r8AEE2RayO1UAOYO', '+BoMpg==', 'tzSWVEJ9wvuA5zIKSh7pJwA0HLLnD34IrJ8D7iA+Sjb4ZurX3jkGzmtZbl3ZLXvWNg4yQh8lGNb5vjPi5tL4PfEGEYR+/kdawptaR/cozcnbVAuL4kcPpBVXHBoEsgRtMt/c9c7GoB5cB9O9f5Z36AkjqtVJjzxE8xRsjEwVDzBLCJW+h1nZ92xK6R949NSlHYozR59QjhZhaxRly0zFiVqvXz7lHiEbeJ5FUgw8DZPFunGbyn3Aw0VqKjXo', 0, '2022-05-31 07:53:12', NULL),
(23, 'Heja', 'cosbotak@gmail.com', '$2y$10$n4ja2.weL5vaPtBkLwPqwu8uOFeEF5jrKwUyexZxN5soukDhYHq2u', 'I/64nQ==', 'tnk58AtC7UKNe/g1tNGl4aIYkCym86eI3dUfpSdK83wubZeJWg42cEJ7Qgbl8xUUQAjNsclliBuRHXiuOhkLbIuxQACDOOepCXWfSqWAA51D8dL+IFBKmM0ONe/Ibq7MNHe/h1gY6LCai0SLY9fKvBGNYmelJ7exPhQuDOb+9BHC0E8+Hg25PRfBTdGfJROZVptO/2gdYc/e2rTiGaj5x5d2rrEtE9STYdAxXlyy5AErlAIyxAoGVNNm3Jlp', 0, '2022-05-31 07:53:21', NULL),
(24, 'K.jaja', 'djfjjd@gmail.com', '$2y$10$XWh3c9XL2h/5stCXLhJM0ee8c9sSeZG3PUjOnf256JnDu3b5ef5fy', '1FfsEQ==', 'B2zbjPXTsdq1zgefF9U+/Ai1w96UxLH0jseoft20SaTg6nWsyIk8+ED/cdFCGujTp0aaXG8idiRPcnAH21NUBvFPJAmnsBZshAgtG+I7s5jb8AT2XtyeK02jJZ1UjUTjiELg3PLTpiqhWR2KvP9o+38Ft50UEkcsFys9rwKxd7Uv/pzLU9aGApBlazwLS3yYte8dyz+nD1RiAzr9uJG/RWTCiz0K2VsS30q9ZOXCczWD4WJdejDXPeiIyM5G', 0, '2022-05-31 07:53:22', NULL),
(25, '9684956745', 'iojlhkfrhlfr@gmail.com', '$2y$10$DwRKdnSn.LSLmb3Z79TBQ./xAQwzewIa9/fpILCyxO9INv.6nheZC', 'bAlAiA==', 'nM/sNV6Ig1SIlb449K/qd+U6xErFrTWeTsBny9L/9mKGhKl8/46kEqq42njhkekQJno/QZSHON1u78cGoFHYxt68D35VQRAvwE7tniZ1i0ZE82eovLUwW8joOWeMOTwWii51fdOnfJoCK1gi22VHjZ2OJLEbZYBd0xqfg5R6tWVLCbXBc6L8H82Q0w22PAwPDZDGQnsA3omC5FZV//XHtbr7EX6fnRzNRGcxmR92HE/sy6V2JrcTQjNiyjEJ', 0, '2022-05-31 07:53:39', NULL),
(26, 'Klaaziola', 'dsgrtgth@interia.pl', '$2y$10$VkMpfp3uovcWbxWZ3x3mZux1e4Quuwhhr6WbLhxFqt3ap6Npd1IbK', 'BZbomg==', 'z4Mc/cp9tkZqyrZ9iKM6J1dMK8swkXJQmdQDurXi0pcLIWnY/foRBTBQu3sqSZPWkb30f01OkM0zOdoEEC40tjbFEvVargE+5okHhpUiArDSE/WtemWrlRlVcfywdUvkfIurSrIM7lzJfOAzjJkY1TL0NgmhO7nkz1As7qVsVzh7dDTiI/ljDfrVnLbeJm3Wq6jmkK5aOYlT61fSBVjNcM3rL+G+0h45bA9s8+qFxjO/0TvtpHaZ4tsvK/Wi', 0, '2022-05-31 07:53:58', NULL),
(27, 'kascbhlh abc', 'kapucyna2115@gmail.com', '$2y$10$a4EqhBcE8oQfJBiKfHJITe33flDgeLw82hkGZn.rwupq8SBJnq9iq', 'WpmGnA==', '953KT9A3kZ64RVzddds05JxvP+r4woDEAhOiqrojryrjSjSrORpr+3APxTkXwXFkdvymBZVvogQK8JTmQo2LTuOaTOro68/3fb4r8BYj64Pikht5hOrD2LwliJNtWhBiROtcAgVYlDGhMkfwShfpBMXKMOo1iiku5hcmfYA/ZcmVZtIdKQiisxV+LJsTYJCfZrxTsejkgoSm8Pgd4RtEVrW82wq2gbb2qM/OD0nQ5fnkhH4+6QZWuJLWeTTL', 0, '2022-05-31 07:54:58', NULL),
(28, 'toster', 'tak@tak.com', '$2y$10$xUEWcUrRUoRYqyCGUXBPMuKGRTcq1tSrrStGtaxiN3IWPn7mSOltu', 'JoAN+w==', 'hh3PUuFMxPHXGgQjUbncsAFiYaFTXQxaHL1+ObqiBiL/m+qOti4ptiibSHj+TroajAzN06nlCZCY4Zj5raD6hBo4By4murVJiJpHe5FQApx7QGT6OHzXeVhjNIa/uN6XRGa60//Oa7w1nkxYtKsRPVLZBiQSv5ljCsFyH/nQiUD+XupHDXOREo7bFb4VPJMvyQLhFZFMgZh9e8ljTJIeFE64xmUeGlrcrJDxblyqtQshq6TsaptPkYT9MsZf', 0, '2022-05-31 07:59:57', NULL),
(29, 'micky', 'zofiastokes@gmail.com', '$2y$10$gMHlXN7e8y80Ju2gH6y8keCkEQBMf4uPyTw4oMVWE4J.dH4jxWtcO', 'hoS2DQ==', 'Ez8A+wiErsQFFx3JOASC7/94EhVyPueJq59VQr6zle+JJuYC049W9ldovQp2FWGa2H/m0felRc3/voQVF4VWqb8llPFs2iGp37/8Ko3i2eWRjUFSeEjg781loxOaHlZYaPAKM8x1pauODdJwk2f+T+TJp5IoyPdk8koOmwCL/d7piPX/NW3X6O9HqKG1ycOdCqoa75a438rU5/uLc0GDd4JrBV4mRHuU3KYVJFYn5BjOL/OfsOPMYnNMh7vq', 0, '2022-05-31 08:00:32', NULL),
(30, 'HanEczkahaha', 'k.krupa289@gmail.com', '$2y$10$OOm3T6z9NETbN.syF0pzhOvJOszomrjx.FAYOhF7ldLCa1T0MWmGG', '9mi+dg==', 'EgVMVdGgqgmybLDdVl/kReZzoDNBh6LAIT0+sEOqif4cvQIOxkQhmTfRFYcq4kH63VtZH3qYH6e/QNXCOoZDu4ES0CM7XcRNMSUneV0MiAQD0JJpjrGxBa6yMuMN3173ffhaZKlkSjFjJ7qNFgSt4WafxgolGoObATDA9dxpFIgcA9z3uj9AZpyCt5oa3nThBsJknlit3MPXEzFV4JOE0LkUTM4Et1GQLkRBf99a/dRNeiAkMuKGu0x/DVRi', 0, '2022-05-31 08:00:57', NULL),
(31, 'pat', 'pat.flo@gmail.com', '$2y$10$80ac5NtnsrZ/1vfQoI8FBOIYA1jRxdpqjN0MkSxSbwSi/xpwSDqTm', '/y6gGA==', 'rvYrhA/4OXZ+wIOQ9QwcgfLar4atfo4jAkXd9nElO4xsbIOJ6N8PkkXBEAxmq0ILa9cmOoyyJGc38GiYfw7zaFD1DQNcfps2aVa5ENeOgYd7b2ltuFXSF+vOIDDIdkpw9DaI5CSpWsBX475CVkKVMWDsyOYEyKz2I+jK4Hy2QDsk9pM67gz8HlwkQHAbAliVH8JBM0VvjyUJ/jltnQVIFggfWg2FtZX0xg+f2wWiX0PskS1mKGRbt+TAios0', 0, '2022-05-31 08:01:07', NULL),
(32, 'Mateusz', 'mat.kro@gmail.com', '$2y$10$2l6NFHOUgX0ioJ211dq14umSGXL91aETnvZjeZCSmV/ef6Jc3osK6', 'BBSzGw==', '9mlF7bUO++4Xzd4NhmtMwTaBJwM4q2CkaOzQhbfOmNtIY490fsPHYWdmA4pvfrO6APUM3ci0iaFLi95fqukYiZvi/DlgdkZyUqG4KpgPEZ0ZT3eMiwaCcN4CfEXw7C9eZaUBOJynKTLR0HMDL0HWNg+znGOMEzZAMXFHy+vA6bFO4/LXteoLjEYV+WKHwWoOqwNINq3tw3E024YvoubudpOGR0jkpj0otMvf7rcBQ+yipbVUa2V0UlWc9GQV', 0, '2022-05-31 08:01:47', NULL),
(33, 'oooo55', 'marta@gmail.com', '$2y$10$KCirP8g5u3oP/EUbUpcxMe83aVu5QYLqRt4NXs7aTICANYRxRKgDy', 'E8xKZg==', 'fBNwLkwksIw8FdLDbIc1kmophqeRfWQ3xM/Ncbe9DHka6wm0NPNmlyqfj2uDRA4KWz4gA733uzc60/A9+IwAbl9cpIHedlLCnFq0Qa/0JWSllesI6Ej8OxL24q8+JJUF7+X3nBLHiXxvOh8QGssC7x8kx8dEqpumZdK4i7Om69qWjpaHw2MFqQ8aaNuxBu1Y5lbJh1ckksIB4jS74/aFWmiY+JWLWCddRQtfd1+gV6P0PLvXXRnYvGAuvisq', 0, '2022-05-31 08:02:13', NULL),
(34, 'dominik123', 'wioafjwiavnwavwava@interia.pl', '$2y$10$1hIYO7zsofe9snvrfHPuseL3MCUn5vW2JHEEkVo9Hw8gadLz.LVdi', '3tsvlg==', '3N+jbgtirY9oeScBjUJPn39D0CPK6Zf/9DZ5G/IRA6GWDbf/9FWHxAkN7Xf3YSON+ntZxpjUQRIiUQM4ojbDZj3VWr5Ey3FCy+a9iw9+QxmnGtqi8Iz+klGlQviuLPqe2ycojkNsTbjiGrinSX33j76NNaPAr8D8pDd+YZ3t6ZjBShSavj5a3U6lMA12WjxiKug6bVq5bErik+haBkL19Q7owh6PIX4XTiX3jr2qNnAo/doM2vmUtB0aHBLA', 0, '2022-05-31 08:05:40', NULL),
(35, 'master', 'asdasdasdas@gmail.com', '$2y$10$HaW/axVTcsMWrUUjgxacJO74chvyhXXvRLU6gYMDt50friGL0m.pG', 'Q3FKXQ==', 'uC7gTVh41cjormJX2S7IHf3Faei0Mg75oqcFHqSM5jn9AxADFPpKZm5zyBVGbZOZF2FGbqzsZ6yx3tF7wDc8SgGCKjE3J7NJu2afj3PLlSLkSyE3dWDcfYWmMoiaUeREUKjPww86TgspCkutk+RM3fDHFLeZaYEQXvRytoVHgmalzuyjlwG7RP7LaWJg6CKcGWU6KqF/GXt3voaRtcr0Kmi7vZEVQkEC2xAlNgW2hGNB9amamatMHYkxZ6dM', 0, '2022-05-31 08:06:47', NULL),
(36, 'klakier', 'szymon.firszt@wp.pl', '$2y$10$DIpFSKNVlQPQvAx4GEi2tuZ040WxnQSxgtbyaMB6.vN9lr5qTEiKW', 'F7ytGQ==', 'YihWCNWI5eM2cQjhakOX+FtPWv7fQlrRLsIFx5OWuTQiSnTU6sPij9w30944qn76qhj2vn0W6HeR9PrFdXGSID8FH3p0JmQr5TSLjUTPODC7lfu+Na/llYtJ4ix/FnXu1qzQi87O+eKEOK3mdttD4YVs8w8uh8tZ7mdxMZHZnZejlCGvfQQ4ur5r3egih7yj66mAvpNl3aIdYdgnlBrtkJST8GuY/ErPSH/2eipOGRF+Rwl8IDJ3jKbi3PF8', 0, '2022-05-31 08:11:27', NULL),
(37, 'PanDobrodziej', 'bary749@wp.pl', '$2y$10$7vkykn84fgkHIv8D9SPULeWIFRmIbk31l/HQIVrwlHvlSljZsZa0G', 'YMWDrQ==', 'HUBK7cRwucYGpU2fUlK1bq/k0Y0djREWnGEz3awfmza/+Ua1EamBxEVte1XJV7xucLPJoWOTne69oovupGiFBiTzaFfghwpHc3TAv/1cvLzgPzxnijzZYT6qTB9qJdPkdb7oiCB0L+wykq4iXUPxylJ2zS7GRuKHzLchwY63CB6axmFGodYoc5pnaH/+S/LKOgFFUoF288VcyIdNkMrmog8Ko127O5/eP9HrcVMkeY6EMLXBvSnUo3pNNUur', 0, '2022-05-31 08:11:31', NULL),
(38, 'Sylwek', 'karamba@wp.pl', '$2y$10$mAdGS3/u2JXLCCKyCvi/hOBKVOuDdTxUIohG/b2jFbTBvkmOJSSb6', '7PKjaA==', 'M/ee3h+db23JTg+AnSxDsGJNHp826fH9vOKkII8OO76k/7P9Z+cu0/KwX5Ayt+e5TiN+BpjZXxbncZHwGVokDpwsutrFrUkxJGaHSINxT+0yVnbG/DmkSRIT12zzt2Yzx4dqm2be20JKKdJwUy9f2k7rImeHPnh+UW1oo8b2rUgCFtAL8RAnnHBX+G5tiBPreGX5C4deluDlSCpmjujQ6ehQBoUJZA4wv+VBNQmdEom6odwgx6BotxftmKH3', 0, '2022-05-31 08:11:35', NULL),
(39, 'T1G3R', 'putinpaten5@gmail.com', '$2y$10$blUFsCD.xUxsdtrojEPzQeC/nxp6yXGltKoojkwAqZ6Rk6mmwjDkK', 'w9QUmQ==', 'NQdb/AeVlyo7E+hX4RWTg/nV9oGuD49/OIlkZpvpnNjQaC2Y8+x/47Cy/xb1sJ5vqyt/aNxweLWtgcJ7IrP1RNGHsgyCNUYTA/Z5mjr6z9FjyCMbY3UBryUoPWFqE/iV1wduYyf2OruYgZ471cm4wJNhrfkcJ3inDFMgkEdyWu44KjrzsBzsEMCrryqIqBTfkn94xI3pPTO8rs8ou0w0p2Evx1mMVuR1MNKFRhsbxyjOVQz3Eboh9ZatBCx0', 0, '2022-05-31 08:11:43', NULL),
(40, 'Wiktoria0816', 'dutkawiktoria1@gmail.com', '$2y$10$bOfeFeH9EX7V5FzlPuVD8.3mLsfffUS3vCaD4Qn73DHuYwy57vOZq', 'mAog0A==', 'XdRKMz00IEqbhnCWXn8ewZBfd/6Y9qBR4CXiAtr270/bBMTV8gSrOErhCBDhyvoJVZKfTX8L+ihBrjnb1yoqUXOef98YC/W7QpP374Wo8dzxuka3hArHBXvzKqDA9Z1Oyb50X8XCWXw9IU+Xlq/1k6lz3pXyTgfjinAxfIHVNs3Lo9BOgLmHE/arDSlttPYn8fROhEdfRLlX4JMBums7GKpMktS6CJDUhlilwVdUjQjdpzdmqroqkpEpUALA', 0, '2022-05-31 08:12:06', NULL),
(41, 'milciopolcio', 'milenka776@gmail.com', '$2y$10$FUDEZT3giEZZQXT0ezlRnOEHayV4fHVWsqfMPGAl4RjNEJOsVrMYq', 'GlFn8Q==', '4Yu9qwR3RCpukgaPfDvotSGTBgVFOzvbhvL01WLTKY9i1SfKrKmEc4TJFZoSTk5SZYNldgzRO3JSNcssI+WE8NtZhzX5fH4EN+juLd/eKvrQERC2HxEFsTNv610Qvi621gW0O9XIuovmNEj3NRNVxL2Z38yo2Pz5w999wDTJqIxAOJ+g0JCQOT4NEJKo4btLlwi1aCNegqABX7WX6LwHHkzxhTAYhaNMk37cttAz2eQZ2Xauj+tWdrxs0uBn', 0, '2022-05-31 08:12:15', NULL),
(42, 'chuj', 'jebacdisa69@chuj.com', '$2y$10$egPAwmlF.6d4cZovOQSxEOZUZCvIDHoBnd37gvV3q29/HkpfS3lKu', '9Jo1qA==', 'uVVrYFdS8nIgTIA5a9fBJrnHQlqM1PQjVyNUneu5jNwSNXiGXHKo7mRkQeQhoFyG+Z6GlVvb9IwpyvoaEFAQRrvGXbLcB74/fMAq/lREwIdUTfbm144enJl6B58X/2FNt23q9yvZx+X/LV9UlzJDDVzdDRfqFnjCAM7vYcDqDUmNfsrsjSLWq7ttebG8d5ZqkTbS8zpWeSDULSmAhCkttl3thlsc5+1Yl0/qKiTbKwhdo+nnMnMZEbueSI5Q', 0, '2022-05-31 08:13:58', NULL),
(43, 'Emil ', 'emilspolnik221@wp.pl', '$2y$10$tnxTNg6OGbHVPWghhHcsXu/79k3rzSfZiu1Ka0dkyR454IsDItUtG', 'IR3/KA==', '+y8Gk/YTWo8+/+y6khHCrPKQ6MCa76EfAvgZBUgdR8x1DKUzpvXYh4ngpDxPF3d9faji38qW3C21A8+AnG1Yzk+Y0QP95seyg7QMbRC78MTmotyedtMbSDZkpqUNllZyIQkmDGwT1BXj1dGzX7m9Yu1zxHZa1fKq7nQo0NkHhV3Oc6zVM82HYIAnVYOQrOExx7zXFyDEjontWTF+kOr1psGSJ5dHSS0mOk4VbCpuF+UUQd2E5FqGywDBtYJ2', 0, '2022-05-31 08:18:59', NULL),
(44, 'Martyna', 'martynaswies4@wp.pl', '$2y$10$3.D7OVeq8Op6tI4KLKnFO.PZnufo8JIE6IMX69DQW2qhGMW3fuCtC', '/Wnq2Q==', 'YeqRIkFXmIjiLzPNvMAP18vdT+eFVcKRfkDllJQQvfRjmj2fjBbkcx2lq/5P8p+yeAgK9IAyHt2ur+kk8DE4KDmD3GST14gpPb9s3QXKotByArio+iIVDid/DtOiSFbujeiJGVQVOU5gACZcIj9zRRXjCNFjQ3O9M+NkvtX47KKlNa/KdpqsuPP8w5uPMuFi49VJ/zmMz7mTFZSOprFwU6P3dza8107bJSajB1QKnzdkpkgcNKr6fKi1L7BK', 0, '2022-05-31 08:19:11', NULL),
(45, 'Sajmon', 'szymonstachurski1@wp.pl', '$2y$10$TTMDH2JfXrrNcg9xOme/rOzDPXoZD0WCnxXroCuQG58HZ5nZm8i/C', 'pXIinQ==', 'dQFUbBWYCVgBfen6h+/hNaj7YO7NiKaMdxTVCE+w9HcBFQPP4cHET3w8Ni4uRYxrUsOtg30zo9/PJI4voRfgV0kJq/h3sgd/R5DTuteC4H9T0qdkwx4WW84/eK8VYXT4ie0skbrsvkPecOX1VzziTQ+P4UF3RcmYb+ew7QNCQavtKqZf3x5k9MHNYyg7bkIfrcLyqyD0wl6L8PgJCLm/ealWSQWtgVIKP3zamNaXoNf26CPV4kvHYz8EBL29', 0, '2022-05-31 08:19:19', NULL),
(46, 'Amelia', 'amela.margraf@gmail.com', '$2y$10$SmJ7HhTzjD3b.o/mCceOAOgmCUoU0mu1eoKtG3f0AQpFWpUQp9UGu', 'qviRZA==', 'k2sMdXGYjZWJlkvmLdGloOGZ1+FwhxV5H0vEReakLVOhMySi88ALZV5EhWLmnny/Yo1Jnr6J3D1XHqPm6ILtXg+LxyDgUlv4FPL6tS/xKQSV3H4X2fxH+R0ge1XBpfgRcipcaTouWSHj9Ey3hm7Eov+LBhI6ekSWyRXuLT3TcM1wpHpraLfWPSrpxXYCQ2yQRhuaK1PWrMq21piruP4f18d3THdI4cxvZ48V3drHYZSJPSaOGKRjWVng3L/h', 0, '2022-05-31 08:19:30', NULL),
(47, 'filipo', 'filip072007@icloud.com', '$2y$10$An6uQkeBTbWkqh2yawoQqeAaR4Apvu/mwxe3RIQNl7RuCnDUUHYj6', 'Hr3Cjw==', 'hNYBYQTLtlomwAhf0QGFrPkvpp4jdNcwK0BTkk9r2UKV2C0MeXoyBi4hQbVJ7+wsrTFcIi+j6W00KOXi5mhGqJLttq6uVsxMgTp5RI/+Phe8DWTsT3tPZUunTsALY6iDu7mPlzkcmm8SerKqSX8D2Ku2gAcHZ+21C54mP7cYf6BPuzW8iJ9DRivw0LhFWBOHNdJjHKJUYneXrCskOl8T34KbKpn67tucI6qc7DcFzTe+seF/bta8sjnGIbch', 0, '2022-05-31 08:20:40', NULL),
(48, 'xd', 'take@tak.com', '$2y$10$Ggc9cj/MiIoOMxAqaaCALeguqq6JHXfDL4bE2GxpHieUp.jdybcuG', 'pMs+9w==', 'plLGX5+Kqg8YXxAejLIeghCMGv/ARuE/scDZ9ve33RYQryo6XKx9ziyg8nAkQi5r7RvZCB7Bq/7Lk1SKwyrfof0kgtPPxMDtiBkN0PXjiQDOufOiTmy7irbHxYYHr9wUcuybalztloySSFDcSWqWmK8AtbgAfZnrIzmYF2vPMWC+C2ZPizfbYyj5PaO3+jPp96mehSdkH+kvcwdcD/sIvVTyDyqOhImmTod3AzXluihTAFVBi9vvDUXXTXqS', 0, '2022-05-31 08:40:19', NULL),
(49, 'asdw', 'joker15613@interia.pl', '$2y$10$tKpydnxKPVqJBJw72EBxAeH6VtsvB112xFUjf5CKT.ycPa6cvfmFG', '8PG5Wg==', 'ex63rSrZSinJmag6KZVJ+eP3VqBk3n87OJhI9ZAY3k393APffhhLvAPYsXSs+GO5YxiXUufm+LDg1FeVCppzw2N5D+I1LuOoqsUKj2n7X5eWUdQcJ5Doh41ho6yaj+DR4WJ8fg9OVhjtV5nX2qtbbMdBMajAlxmub3fWfV9Ja84QzbxJCs2nqUNk8mIryTBTSteMr18emv2iAyWSlP8gsC8jfw6ldbioPW7V62j+sP9hCPAHQAOUcVYRzwAU', 0, '2022-05-31 08:40:24', NULL),
(50, 'gdgsa', 'kamiluyorlice@wp.pl', '$2y$10$C1.UpZ2zhSiWq3opnHtMhe/KkG5FPbic.UVDKYVIwp12skdzQ2.Vq', 'XF9gUA==', 'WWX445tDoKDGh9mLBQjnaPC5EFUynK3UUO820JvFaaDQ2AfBVZlztLS1UVxGcgtUCMYc2oZh6RgDAF1UDOfV4f5dVqFTmEjEI/y3ge7s08RIK8Q65r7/ikH3h4h4Cx2hXPINlNYm18tsqNJYGbJRVZgpUqTkXr3cJZUvGPEEz/RvGu9EwtboGmX2KKLLzqqvebSLjOghoGhfei/1NGo4SLMpUoDFm8GJ7GXgfvTRBjbiXrHhV5ac9BT4q8+3', 0, '2022-05-31 08:40:32', NULL),
(51, 'ade', 'joker17654@interia.pl', '$2y$10$knKWNH1VKksvPOQ2BBXmS.gGSTXFlL5.XcuO0AcbPkVdBikyMTg0G', 'cNJQaw==', 'mqGKH9y0MBfXujXJXDHWkjSm0JeM3u3NZ+ELrGGJ6oXVkokraFtrMLCYVvdm4J+Voif7EMUWxppi/01cY0i0+jUw/F03pv0Y/aqeCL6hTXANJKjdf7d2+5IMKG4X+ALDfGBrcUbw2F1WGn7fMrvhco+pcPAKH03g9Bfefs/cyOx5DEEDsEOvRjlFwIbcGM9TDAg3sTRyxgyhmG/GBChCwIbaqOWMooj9OAKpEuqGRSaBaLuRvkX6YdWFdrmL', 0, '2022-05-31 08:40:53', NULL),
(52, 'oskar', 'kamilgorlicee@wp.pl', '$2y$10$QKmfkrEf0f7CNpBDVGLqXOPkxzY2lRm/DQF/bGwzMJlsRXfaZZxwS', 'VxhtTQ==', 'VrrT6EWOVqXLt8mExZrbrwy78nf0ZuJBf+OKJ6hO6rt0n8ggPMp7Sas4Hbpcfq3wymu51aMpJZI//V5wo63rc812+ayoFun7wac6FGwC/brLmVK0MsFbic+sk23qYnZ+PvzEOd9ADYrKrYeyn1T5qOtq7JbGCqJaEGoc+cXx67DQiK7wF3zAOCSc23QfQmZFQ5/sefIIPtcFpVKfZpMVyFsJYkxDdKp4s5cNG+z18z14+IiImjezrr5DXmAO', 0, '2022-05-31 08:41:01', NULL),
(53, 'darek1234', 'edekmarek@gmail.com', '$2y$10$L.KWoRbKoTN67gYAzUuuweM9WisktdOMLusR7Q4DwiKdzj.GDMW5y', 'qY3aPA==', 'RUA886p8QsJhH8O204r1zRCz74AJsOfZSlnpBFfTG0GI1iFi9bSfAjqDq2hNETE7AZnqMI23CxEuEsJ0sRBbNsX4yCYA1vsad4ILTU5fu4xhjRrzFwqO6gCnDgpD11Vh+Q5qcEdkPSGrxF052dSNdKZ4Glwh1BMxNB2Uteoy5bd5B9LA1LHF7fjXgu7jAeYILc6Gx0dgfPBZRA/+W2rm3YmmRi4QH+JNhLJvCaPP8IoveEmTtxdfq19FjnjR', 0, '2022-05-31 08:41:38', NULL),
(54, 'wert', 'joker19000@mail.com', '$2y$10$qnFBAdANSBwIldGcJ90PMuDvJkqnbkwagT9Vxc5aMwdQOsBoUbdWG', 'tc7Eqg==', 'CDtnjYlpvuD1DdxpJLWoUV2lt/MEtRO+DpBsXq4RRAkY5PgsLvZbzxTyA4wny1Z4yZ95KdSPj9Df4Ax7g8B4pE8TjguU0QcQezveblpYQHUlhPzdu+r/lvRhrQ4WaymBChCNd0lyh0WTGTEVf/cGgUgoqyc0FMCULsF84PrwE0T1AGnZyH9/WHSeFkRkLTllSmyzPameJUCkIrNCLBbdZ1I91t7S/pYheOw2cUpE6gal8/yzJEraK5STkT3F', 0, '2022-05-31 08:41:46', NULL),
(55, 'Lavvv', 'maja1231@onet.pl', '$2y$10$JFsh9Ok0mbKrv0unB.mqa.hlyDnVlobLmfLuu5WbsLFXny36oHicK', '44JAeQ==', 'TjYB/Wr9oPVaBdd2QsNehAS0GKYbaZeO8uUFfFQMgcgSurjFy5juyOmy/HY73MdRK662NRyQ0kV4JmbJpocnin4ZOnGknTqahJ1ohFrIAxDMFyzOtAxCVm25sLEWYEhuUb0CVaZgEW8tcqA6QFb23+9dzLJwEn49nsIAgDNA0VKyseB5WcP4gZiyiXjgpxiUl1SOv0/ge4+Tq4eOK+wCe+CA1JUtLZYSQ76wgxcSMZSXboy/MxtjIjN4ZhwS', 0, '2022-05-31 08:54:34', NULL),
(56, 'Cycha', 'marcysiastec1@gmail.com', '$2y$10$aBOm8ak3H5M8kMZTKFXLy.kFrgGgZp5D6t3vccoPy0swsspjYOqyK', '2J6rYg==', 'HhPdzPgCijcbtSURt3VPd1rYlHj1WpHE/LP4FvRSiSoTRXnN2OdgabWZyJhXvJeWSfhNcqTgdSFKMqvYdk7aSjA8JkUFnmT4C4URwa1HYfFHUz7y5LRuVmnc7fI+j19Hp/6dqQET04o5AB8t25tL4ulHFjtOSExLKPJMy8VJ3ljtletAttmw3sqgBG8DrZhmCLLqZ1Y3lu2wSi4GjEpP4x4p6mkF6kJe3C8Q/IwgmUnLKb+j40M28vDX80ck', 0, '2022-05-31 08:54:47', NULL),
(57, 'okiokioki', 'ntomalska07b@szkolastrozowka.pl', '$2y$10$j2IYFJmCfP7DC1B3vRNdV./TG4EI4dhOJ8QtNM2B7bvuvV2xPlAw6', '1KNI/g==', 'cIbdXl73SV0L0siG+XhUUFRxag2B3IpwIciSCwL8kEbTdm1EijmarqOAMHwQHR5csPM1ykCvL99K7X4IBMYVR2iS1vriK/R2LgvkrjJ8DOCaGhg3aGW2rps3BeaZW7JgudYUGZdi6vc4rR1F/6NLL0//qJ9LuCDxmIte59Zl7gwymrbOYCmI0tOl1H5ams58LhpE6PcoXnC0p0h/yooqlY8SyEHxe7L7mJzpti8C0pxvZ3AXYEJjG1He/syj', 0, '2022-05-31 08:54:49', NULL),
(58, 'jula', 'juliatacyn@gmail.com', '$2y$10$Fs4wEftgS5SoZG/zz3Ahs.3Q7QVDf39sUMU0DvAn.RhaQxhxUj7bm', 'MMgH2A==', 'kpcmdPCepaaFRLW/1jrJwGds/MCoRt911s54Q97pjnuCVTglEms6HJGo8IkRBPYgao66J5IgxQwvanZaFYw4fe6agYi55wZPNQgjNHprGWeDPIzUi+VeEMKNC9BgHPXiGK46MRULCtWI/yd6o50+x8m3gTTJC2zagxiYs84jNnnqOQIxfrYwcAYsTe67Q7qKA5toxb08V8/2y6G/hFYCmJxyQPbZ35fAzOBXk/If+RAhA4z9vSBNdo/dJ7BN', 0, '2022-05-31 08:54:51', NULL),
(59, 'JDB', 'kaspelek6@gmial.com', '$2y$10$2xOY7Mvw8630uGd5q0BjXeAK0/M6xYt5xEMmtNflQU.As9kI6jg2C', 'pQ4wvQ==', 'uGP2AAA03fgQsdFvbO6TFC4vmJByhI5waeJbw+xbXW5pGKD9YopYE/Dpw8m/YQZUeCvUH5alsQLALS17Nbonf5MNND7dBFpaHaLEfOXcrXKL3vdS/i4zrSNP9XRjgJFnETWnBH/LdRgrgBDPmdpBJsM/icOp3iNIaBeVSDow1WJb25ADjZx4+FWGGLmDS2dvBsyUkw9iz9VP5exlRDPmAqFdSZlBUvXhkiOJ2FMhnouNa7Tu0oCnMQFMW7FW', 0, '2022-05-31 08:54:52', NULL),
(60, 'pata', 'patrycjamachowska0@gmail.com', '$2y$10$QYKV7/h/.b5uOCR6wA5V3.88Pd9C/Yax7P8pLrE09XqM88yvQXOMS', 'VAHYPQ==', 'vh/tyujnUIfmBEUzq4Ms9LcNwOGqznKUwxB6DKmVCnZNN2Ix/7CtWkYkhFqpojo+u0etnfsBzA5uQRs+UdipYEYZy5iuGTowNi9wbuxxWvhlOJ9dVgp+3jnht9xPR2WIT4cuDS4JXvgTN3oS8MZZG+Z0L0LAznQ7PzlBA8bI5sdLfG6R/n2edlcXpImt+UZLpb2/taLgtF8aMb1lAHSa8lVxGgq/k8BU4vsRD+1Pt6kBeFOD3RNbvHhDrSTu', 0, '2022-05-31 08:54:57', NULL),
(61, 'ljm', 'laura123@poczta.onet.pl', '$2y$10$x05yzq1R7TnFfH.b2WjfZubDXi5dDZHKEsboRhCYS7hrDUuTV9Sv6', 'Tq/twQ==', 'yV3/kX4xLGxeP6/QtcFOhxAv7i4QVivMqK1AgJKVrcgdRWIV19+uG8QbRkJ3kN+p34kDHhyupAOdnl41pKtSu8+J7a4ufixkgpSQVHukvuZRb4094eNRAThjG2SwHyNfxlQZtmd/mZ0sjbE/nScSuX9pxpBxr3BrPAe+w0hFfc2pV0l91JI0BPnsuQDA8mmTq2PaU46hz9CaYou3R94lkm2V3IG5J6b20qQSwyS6S3kOVLnQxLdQpGbTeABA', 0, '2022-05-31 08:55:01', NULL),
(62, 'ju', 'kotek221@onet.eu', '$2y$10$Y2jGyfPB8mjUQ8LKgWUP/O100n7PNWJfB.FGzPgbBqu0wbhLm.bSa', '+f/Vew==', 'G7lsBeHYPwCQWpq2oTqx5g1ElYMm5rP8fdGCIx28Uwf3IW1DQRinNZrwAMFAPNw8TBROyIT5GdcNxI3H2Lbl5EjSYSo9ojCwafaSdfFu7u04WtuLCxs5+d3z/XHmMsIOEu9obgSqgqfOUUMVKuMjgrbtvYg+6u0jT0YMkjkMMlYtY9Ur+nOihvBtBBdGdhLaI4uULpF1wMkjChZp0dcMiswk4jB4hQMkyRlw38TTfoIWnI0kbdWA9RqL3hsV', 0, '2022-05-31 08:55:04', NULL),
(63, 'ovi', 'mitus80@onet.pl', '$2y$10$XvYDjum3ECXZeo9tm3ujfuwf/TNSyL2RGA0Ryx4MnN/.uoxXrLR1S', 'NtCM5Q==', 'GC8w7XXQKMmt2ALvHdtVgtYlzMz/hQGfGTZr6qKZAtpaJTQUgOv+G+ken7ej8KIjMrO5ec6NOYaL/6Uam98+PTVyX8JIToX7tgjD2h1zCHEPA5qPQEtdUVTZRMocTpfv4yazg8GrqDyBX7XsNzuvZSIuhKT42N7UtWwc2m6lc94F2vnJXmEuXTJu15VSXKY+z9RH9174GuhdBS/INepLc21akg7ZwXuzxDm8IM+2pfM1GU72yepMwRS/M/IU', 0, '2022-05-31 08:55:08', NULL),
(64, 'xxx', 'gwaclawik@szkolastrozowka.pl', '$2y$10$cJDld8ZJZ9Szx5xGwrkAY.iMRXTTf1v2Cx9riaCAfCYlo3xJt4Zdu', '+ygReA==', 'qUvDiwTzkN8vg5GC58TGx00yZdIob/BJr4GXZqf2MgWz3eaRWrx77rUlplG2qY7oEc4k1GFM4Yq3s16ukpNtlL28pwx2rmPWLR8KDasmQGuJHtHWXvpokbKlAANta1OaCHmTGd80MBqcXkcD28yU1lS5+J1OmpryvkvmMzqrwMEKezDQWag82CuJw5cesgKO+KOegR8d6k98zaq2TlRSAQxZ6JTX2p8B75V5FTskvy/GPyp+7HIyY1QmcT+P', 0, '2022-05-31 08:56:26', NULL),
(65, 'lioelmessi2009', 'rafirybk@gmai.com', '$2y$10$kKSNCfetnsrNPEz6aP4vVO8of1bnYHlaW9ak.8sXV8jJpwl7msjXK', 'Sec32w==', 'NyDfEcQWqVw0a+BYPV+Ypypg/fE4KDxeBkRAgmlyEdQyOlMZJIjemRpzEK3NcWcMMuds0LSeAaQ3PmOPvdofZTU6pBkrrirl+V5vbQHFZv8RNQRKerEMSkY48Y/Pp2DjiszHOQqof2NvG5qxkoGMul0xHorvANI0oUBz8Spnx6D2I4bL4WXvRgMxeCfJ4J3bdg4D2AXEy0yXMLwrHfdHhmyKJJW2Bgq0alXa+hYDxlsERnHeWyHjUJ1fLWny', 0, '2022-05-31 09:03:11', NULL),
(66, 'roman korba 2137', 'bartekbolek444@gmail.com', '$2y$10$EmfySn6nkaLL.tNFUutW2unCt6jd46NjaemhJRTKsBa5H5ydgaksW', 'YUUcqg==', 'byhipTD2pEaNzdZRx/6Eqv5z0h9OEhuqB2SyMwuYXolukJvqHfddHnKL/dIQN6sJG7KP+1/5KqtUp0FPRlQidzC+J7pqa5pCT0BItchaE5ACKEJ5iyGOMfgDkpYUwFFa/JseakhoKwDVpwHGGeRa9JwKhqgAgIlxbCSpYfKJkabgIsjmFRfW/n13u5XQ0PbigoqqokI9foZQiXxT8rlfuk4DthwHR9hDZz3Yb7fCbvNDEv4OUAbLYdgo47DW', 0, '2022-05-31 09:03:19', NULL),
(67, 'romankorbiszon', 'hohnor69@gmail.com', '$2y$10$26SPFM6LECKAtS7S7pcJiOf..uWjHxYfIacn4pYWwATuguGvNKpfu', 'F71RYg==', 'uGWfgGyIfHZJ4xUeopTxOeXrPOUuBu82uiOFeg2qfTePerXSMZKJ19Vz6CXxf/M8tNzsA16Psa9YDix7vb8lyekgzsj7rqKjaYPxXK1IaOxEkqXkwUAYnsoDAXQMKafpdbhc1FVjEwCJSUIooXjN0i1EdbR96A3L3WMRk4MlIuhu/Nsy8EcP3Ud5i0cr+49FgD4RWJHOExwtuZvpODCVDd1DlxGd//8NXb0jmy2GP/O7zotcdg20i6Q2DNl5', 0, '2022-05-31 09:03:23', NULL),
(68, 'dsaduysadao', 'dasidodya@gmail.com', '$2y$10$jKwsFpbMhpF/EvfUrWgfa.TMSSvJz27dT97RLqd3qMLyJ7St1xQxS', 'LEg+Rw==', 'ARpzS6iDqOGqwczB50zIdIdWbsjsqF1r3L8y9FSVjJxUQLYnfSi5YoJN/qRgdIW+PzsRoPUD0lmYeeEAXOgTtXEAq5tnm/G2cgoLvHnUERq1GV1hENkQq1osSN5Dq5j+PVOaexMH7xcuZfibFhGA4tdr899Jjzk1k3WQI3S1hDCaLRNplUxlujOBS8YTZo2jinFBNZ8TpMOBBLXxczo0AIMZDquAd0biPZnZmZBlOJJFmGcRKK6yjmz49RN2', 0, '2022-05-31 09:03:47', NULL),
(69, 'gigachad', 'dsadasdas@gmail.com', '$2y$10$XlXgo2IW10IBthxeSsw/wO6KAAYY1TMmg1f8Z40qq7hvKO9FaaG2a', 'UJAuOA==', 'K+Ew3SMOgyk5/ZudYySR9N7C1rMjjhQ9JOd3dkQ8H98poDQWKXWYj97IzrdD+STp9YZ/m4O0GkWdVEFLd0rRQ3+SVYCQbD7jEc3fIwM2V6XqPPo0NW0V/zl+EP9s+Kc5B/NRWbsOwB6Dddkbt84BYrtj3i9djrVfIyiY2RuOlCq/QPd0fCXnJdPxLgYPRl+J7Vmjnhb8n7RoKmpvsYgJ+wX60CKoXcBDxPRjDuujddFEkhDJ7iDhiigTOoMe', 0, '2022-05-31 09:04:09', NULL),
(70, 'misiek434', 'ppowroznik07a@szkolastrozowka.pl', '$2y$10$/GLpv6iMz8nOvMIXyu2w3.Wlxf6sABJFRv/qMS7UMNviaru2NFaNC', '8zymwA==', 'DwDYU6tMNJH1yuT1F3s3FbEefTeMZZ7J2diiw1rOG0odopkof/fvSZ6rRH+fZgz8EohUupunHldCiD8NhEiCcnGcmARIKdY/vkQ1wcaRtED4Fk1E9AZSvG7/9/Sze/HM0ufnaGkfqg4vqyOlmQh3zva2Tqeg7869qyRbAT2Yv7YpNmw5gq/FYiL1155V8xcnjgxs4cmn3MaZEEIxmYVM6/IoNvAvWGM8+JfEAjJ653jI44UmA5jyVzGZM8tm', 0, '2022-05-31 09:14:53', NULL),
(71, 'xBurtos', 'bjerzak07a@szkolastrozowka.pl', '$2y$10$VsTJYZHdpaNUcdRlevSzcewwZz8X9j3/4QQuwN8./MoHuE9PTTKRK', 'nZla4Q==', '2x4F+gu2GnXvaUCRfJFITHM0uPmVB4PeB/jH2IvPQBNjZDcuUiGtcHYsarkIGwvjBao7VQkuZbC+zuEwHMK6u9h9d+R2Au5luzuA5ieOFYCUmQ7rS3anuj4VFjgSuDOXlSm8dclnhhlJygLHELuJj1oSAGPLdrZY1eIarq0IIYibsIByff6fv0QuwTDuWcDWQLDnh48yOijGCUOjrQE7WQ26QYBaOnzUnI3SA7R3PkJmbLLFQ3JIPfXn1TzP', 0, '2022-05-31 09:14:59', NULL),
(72, 'yytiryujfujyrf', 'yjrtfjyrft@interia.pl', '$2y$10$ZVe1DjMTn59tgvEXDxXrw.uJZp8Gn9Qsrm/whVVO9bVZrvQthvfv6', 'jlVcGA==', 'n/SZtRKbfxJzC6dZdogwWZMai8NAqzzmFhqqDyFNb5DytNv3KWiuPCpE9QABjtJAsavl0RkRE8jMpzzmba52sLYElbKHJGrQdZyMxIxPFGlrtOB5ckyKQsv2QeMHOWQ22U+2whJdFz97EfAHF3h/HCAQxuSz452bqbVXQGKdF35OUtpug6BbFaPtabtAItRhfXI5q7da+88eEwmvh2u36YiwivUu7C/vhVf4lzhChCr4Z1Wa1XbYMulAA9Uk', 0, '2022-05-31 09:15:02', NULL),
(73, 'Patrixx', 'ptokarski07a@szkolastrozowka.pl', '$2y$10$dcymIo0Bb3drKRNcPg/nrOeGSrFu.6wAH7/1MEizW.84OxNGNAR2C', '0cQwRg==', 'yh2VAv64Y0u9oHmL9aYUMjxAmiEYcnX8tCeKgh37wikvkLQ2xxNaRgTfSpHKIcxu9W5oT6l/ewhrd0U3p35KvoVv6utf6+qZGam6QdlJkFi5tdRDff103JxFykI1hTjYJmgVM2NaVd3WDfVtITpk6NW1dvdT6YCCANjYGKLsTDMfYh9kVQJEtaUUyDXNPeaLy548CMDWhZmRhj9FAyouspVIwc/JzBP4OwrCv2HWwoHpWgJFQJfdOncROQfo', 0, '2022-05-31 09:15:13', NULL),
(74, 'wrobel', 'maciekwrobel18@gmail.com', '$2y$10$qTaGqw9gTMJgR5A6xpGcgujAtycvTtrvpJ98QMcnewoJRyb5PO2zu', 'zLTdVw==', 'BTjUHKNr7NJL01w6t3cltM7bUC33Eyz/3ceAlWHE0a9hlkyfT2km4EzYecs3wINBe7BN6SpsrGyrK1lSdyX8i3z5Osfx6mHPxkXcJB+YAi9PXexOGCXajIuyfjT+m8llWgtzjGVv8ui0Qpl5cPs0apx9dMmKUD0ptM6hYNbHI1k9ehgjUwfp5T7kKMbe0dtz1RlP8W70bGdOPkZriD3KEI7ux5wjQuTD2E7fRPqnePh/5ItWq5Ui8GrgcD/p', 0, '2022-05-31 09:15:13', NULL),
(75, 'karo', 'moskalinka2007@gmail.com', '$2y$10$OrPqUe2Z5cKpMcOzpHtAKej97LmGmzBVMrbZ8GBotNIM.Vyst4CmG', 'OQfMEQ==', 'bPGAcQGPn8oyZmQcI5uLWkBm2SzHnuOviGGp3le38lsFPamG8JEi5cSOO7bWFH1H4WrtnaEao4jDSxlISMiq5EnOC3XkEMaKrDPj8cDIzacUhPBwBkgEByn4Dyb30ipdqvfmqzZEJEZ3CXx3ZxhWO9m2nS/WM/VaFMXYQpMGHbwrvnkIwTtqJNwl5OXXPTO3fcZzaVJLQr4oFeSmRAHbrv+OeuVD5oAtgmb7Sq8LIRn8aoJOB8oo8QiJbDrF', 0, '2022-05-31 09:17:32', NULL),
(76, 'abarbjab', 'sbjsbj@gmail.com', '$2y$10$.JrCtz/Trwnogzf9am9M4.jV7hG8MpHQXZ587MXsfQV.EjgXjRR1G', 'Zk+jVA==', 'EOeMm1O+O+6KWPqy59EQC9rklW9J/3AvmtPTqYiLAEn+nj9wZnHOqe4sLHTsa2TAo4BuOQOpBe9wZXfKaOBJgVQXmAR7VU6oBPNgIIZauT1KIgg1RR0s4tFJs3b6Wcvcw/Pt0AqNF8fGk4IkbNtnaP5BreWolHpzTSbKX6pptqAuEQsNGiYPq4LOxfOvjO+JJ0+snS8zPUa7GRO99hG23mVpPYA8SgpptHHJj1wzEzc2GyC8lLM20Vlw5CMm', 0, '2022-05-31 09:17:41', NULL),
(77, 'paapaja', 'hjfgkxc@gmail.com', '$2y$10$zL2LYeqlBrrMW8LNp8lIfu9.ldiJtYts/OSV64T76.9zoFhnK1cNK', 'I7dfvw==', 'wI/tb6LCFGI3jxUlngqfe32bPRlBF7eldvwVd4kicgJP0JB34ykdPrMJ9uqqbEnl7++Qm598/7gxPVrMS65XvEHfdvK0FSOM0nAwvMj1kkvg4N4/MyQPkgi57C4tJCKwAek+rho6imXiQYIL1PV4sz0V0nimKnUO0XK/fb2Ho0qRB9gKnzZfcwV52jBcOUQLhTW9GmPRe1F+ZFmLHvPm+Ya/By+O8KfY2THEKa6115Oy9wBSMs7+1brdYq42', 0, '2022-05-31 09:18:06', NULL),
(78, 'mampo', 'ray132.1@was.pl', '$2y$10$VfX2y0Rm10wjEDxpsODv5uQXYRWUHgUrYLFjDig9Mt4ooYD2H5KNG', '5X9muw==', 'q7bQOwfVYd8AQdWvqp2R+rs+8CmvJT0nXZ4GE/E/oBro/Tu2frqGVBUsTZQABlqKLNLFURCfTbdhcjWnwLCAEEnpBYq9hvq721guHoJw4lsRRMY7drrgtlYfTVPSgOwYLjXfATZkVB+aRgez0Egdw0HFOR9sGlHfmdUFEWltHhYbrpzot+BCYpKBypBVDvF8bbo/GbNW5DJZ+fC8y4j3vL0doLNp0ZCGPPwJBeycA+KBAtU0W0PlRcMRE1zX', 0, '2022-05-31 09:19:21', NULL),
(79, 'kalos', 'kamapka@gmail.com', '$2y$10$dCY8vsdCq9om7cPVGFrYgebhmr7SfZoHpUSGbP6a9FuuM7c6LZA.S', 'jKpY4g==', 'zfNY06eNaugrsM+42I1sICiUlxeEA//URFVXgdAvplxvGh1KCcb4SvG2d9FKuJN5TZApsWwRUS6Q+yNiPgM8jecOnzZrForxkYai6tBwwggy8XzrdIUlP68P7EF6o/schs1GpfXn5ZWTbKRuuhr7s6ecwtNAlPXfDjKdqOMM4SM55DA1+is0K3gTIJ8yjT6gCcgEiSKvwgxRi8IMY6g8M+o6SZbJKHVSmpkRDElCuq9/zN/yiJbEPhxIV4XJ', 0, '2022-05-31 09:19:52', NULL),
(80, 'bladyna', 'bladyna123@onet.pl', '$2y$10$rwE.JC7Hk1D/n7h.054E0ePinAIIHnh3lVkt2kpnDcouoLcQs5aAy', 'cEuN5w==', 'pe7WUTSELh+0G1pFxbczTQrWKw5boRxyqTr68jXcgpm7HpqexhhafNbJO92rPI2w7PbZF4lAQlQIL3pizFZtfTYIuk3AZf4BU5vuiFw9t4EBJj4bv1HSVT7sDgDgq9hFUQoUiazHlCtb9rBkG2lgIZi+82Kx9W3jC9qWlvo+sGo9QmB7lJAvokk+MxdhFI2O+Xq46UAtzQSlNqy1O7UZN+s2fVhqDYKk1BGWk6kKfTPUtFsBKB0+++NAGnd3', 0, '2022-05-31 09:21:58', NULL),
(81, 'ktoś', 'ktos@gmail.com', '$2y$10$Y/OJsIbAD53xicPqaBbNTeQWaAHONSmxmg1VsV.QoxVK6cFOBr.KO', 'M40EIQ==', '6XU4N+shnOekgOgnkj8mLOY7sFuXTjasZTJeATlG82V7wN9DXBLLRTqmnUdLef/NELC1S8jHdyW+sP6TwfrMRl1isoV5vOAIKi9wrrOHt+Ld77pwUtSw1f2TJo6p3wAxNMqf0XvJpPPcwrk9V8/+VlSSUoFc9ajbKyq3P+uXquPWbyiEK+WL3USNw2bv2sS58jcB7yjVNrBj4/NM4FZ8GvWvo/EYBNGYB9ZsqqWs6LZFzBYbUKNCn5w1G5pJ', 0, '2022-05-31 09:22:24', NULL),
(82, 'fhtc', '1234@gmail.com', '$2y$10$0W5VdWJHPIoYrXkXO5bIkOVDRx1LquOu1fHvLfZAG7Zh.uoxjb/ky', 'Gx2amA==', 'Ftu7Jq0XXqQbmVftmOLiRGumuoETCG9/3H1OQzG2IL4CJ+AhTX8A/6mRCEhDayOygFeDEJRQ6AK2Yfgfk/PSircVvUJlpGXHbWOawmrwQ2yvmQERoUCLcJfK777P9RdveRd1la8j0Ovw54ZJ2HUGbbelM9d/HCG0/uyYnZPLjHm4CoA/vJXAq6vRjA060WAR89RtI55NKyl++kCkEvCCQ6+C7wrzLmoBm+b7K9ghLtKuF2sK3xTomjyttEbs', 0, '2022-05-31 09:22:29', NULL),
(83, 'twoja stara', '2137papiez@gmail.com', '$2y$10$.On6g71cJlwpip7uB/z1m.Plg/OwAkXbeosR41gK6IEBkk.D0tDA.', '4hlCUw==', '0gP2PdgyNqqW9JcUw1sYlCkWHO61Y3M/Z6Osm2m15d42Lo2WMOq1qkkQ2ICMl7HKgqYSIyFkoOPRfdKFhKbS++v4GtU9Oxg6/8Lsc9jW4/Kv015MqR14Vrf4U1tCRlDDI3hLkx68ecRwW49q6l2Fe4bQpdxYs33buLsncHzH23hvHkz7EDtU/VW9jngFL5QCm9vcyRHFlekXbdkiLIAOaXDwAkjvnkyJTXVQqWGjbfZDZTfDMKfgrVcgcFC1', 0, '2022-05-31 09:22:48', NULL),
(84, 'papiez', 'papiez2137@gmail.com', '$2y$10$Sul85S4W4BX79W.TjBP3Nu5b71sK2f0HlzlBig3CZhIJyg2GLs.R6', 'vjRKXw==', 'IhTwRLW/oI9PgQ75MKQMZOcjCWAGG6UEQgYGySwX0JjZdygunu2mCejYjqFIWuzFqqIl7ZM+lrThE7brHYS5SbYKkbrnV9JxqSyQRsAE1WT+QXcMIP/wDeGtRqhnpEtXLstuXh8qlqCYTCtN7VAo2hjeAlMA5B4I5f8aN+9UcBcvQN1ihs6Qz+a7AlbN8b+Q20ZhGtGbLM1DbtCF1qakjaGwMyBcpc2cmRsUY98w85fD6rucGr4SAjijv0CO', 0, '2022-05-31 09:22:50', NULL),
(85, 'ola', 'ola@gfh.pl', '$2y$10$6owDH2FN0dsNuI5e8Tam2eZIwuQBh8332HyyuajXcqJZ5UyBNBnEC', 'h1HzmQ==', 'dofVmX3g5aA9CkvAshtAcGk1Wlz6JPK6DjrrRD/fJ1ArfZmqxo3VR+LtLThUXdP65IsL3N5IjNhnq+qyPdeWxLg6yJNxz4Z5B4zBBHLg8TljKjuO7RNaShd9dEeFX2kd0AnLrNyhYxbhQPOVfSPobc9qd3uBg7tTjpq+EhQ2wx5AowvEqw8ImdAU0yDxow+3PU4ftrR86dmpbRwTC1v8Gb4wxBg5pb8k1LQc6i6WuTbiAa/nfQyfrFJep1H8', 0, '2022-05-31 09:23:05', NULL),
(86, 'ewa muller', 'uuu@huj.com', '$2y$10$xkROdOCdkmF1QkD6xsAJQ.FObDQucHq1M8k0lG7qhLM9PUQ7wrflq', 'OFytGw==', 'FyyRUvV5pdKCFjBRyDXHOdN1uq1k1C0Jl5b9jnbLahkryHwE8n/bk23NuH0CsJeq7OZczlGo4mvlHMVXKL90+wJmLRUX11NFJfMSJexy8ZJB6WKYNj3wLHQu9+UiMBudHN/W6BwDgUQ0rj6fpcFxzvKW59l1ofkPIILDA1kui1Rgv8MkE2oU7lHNC2vegit5m06Yl95xjs8tqV6NkVVZO/iEszy3IaB3/TQVFh16QxomLc6YTaOVAbxeFx9d', 0, '2022-05-31 09:23:21', NULL),
(87, 'dawid', 'dawid@gmail.com', '$2y$10$KmQ9O0g.7JA7ujN.63vleOLLwRoquW0lLVsSN/mUMVvw/54j4bBRC', 'fmWXdQ==', 'FxlMvgFTfbNLbr46+kp8XZ3+XCYCUuI2sasHbGW8wvWlw/K3X/e6wjtm3f9f4uDh56Q3oPEPtArCBV2BPewqGsCm8UKYG6c6IRC0mzJWhCSosUVIZVcHld8d/S9j8Pve+yrEqde6DjhSdUghKrMMXJB4/pk/tHFUIODJ++wKCVYq51xrlzrvDyqp/aHAlpXaCnF75c3VwETW7Flrd6CmfbIpRIgnHI3sU/pq1b22OStWk/a5BztXfLvEgtmS', 0, '2022-05-31 09:23:55', NULL),
(88, 'jebackromeraonlygorka', 'kromertosyf@gorkaonly.pl', '$2y$10$ZTmP2WRlINzZ39C1U4enpem84AtnIHvreaGEbu3GiAdFirdbn5Q96', 'JrzDOQ==', 'g2zET4iLHjHaRZRx8YMrBKPbbfpbtGBUOq+uqwNg2CjSKkE/Htnj1B8slu5lkB/9TIesuY5Je4drEwvbBuBzh4FZaMm35OM3Qw9kL+/Df6tgvv33t7OKkn2puZMFiqkPBoyndVkAqffRvKoMyhZqySiuhGM7b0TZKUfMwOfWMwUsE45cHMSycTMV0puRAmyAvkv+8FShvOiz/eVYBKExqeJ3NXftgnPJ07z/Sny5J8i1tfi/ytHP1T0Njycr', 0, '2022-05-31 09:31:10', NULL),
(89, 'ada', 'ada789@gmail.com', '$2y$10$kEa833dSxPAxLpDSvnlph.ezDEqA5.LEFATeHU5Sr3SueRzy70Z5u', 'ELetxg==', 'MF5UClaLyS2xjfkn32mLQv+FkpkWjqqFldqD5KRFyyXbVKDoOAK2CcMdd1U7Hk0JCxcOyeblZ/iwnxg5pdv14OG7NmMXqmkZJQN9j7hukYxuPILo7cFLOmLgMGIfoOBMIT7YlOGBPfWADzbIzxedYKm47olf2mHuG3XtjdorptHXUIormiTFW2BGVazbWuyAV57KGJZe0TXh1tZQyhfaLKae0fjCiINWAo2O21dsc7OZW23y49iZOuc9pcWz', 0, '2022-05-31 09:45:06', NULL),
(90, 'kacha', 'kasia@gmail.com', '$2y$10$cIzZVYnt52AI17nd1f2G4ul6pEC6qjfRC8PibGXqUnpmgKxHN65Ra', '+Ug/Hg==', 'HbjOLJVzllLkwAJWgYgnBWg9cSjifZFhwrks5XhB2nmXJWeN9lbF6Q6Rdv23VnbV+aJ5gIfpNVwIzSJjhqkv3fFmZL9rfxKI9nwmO91W0bM5oLjb/xJascpOnJOrbeyj8CKhAlplKk2z216upsTX4p2FMYqkxsyypiGd6DBZJwu9BWP8JmoS+qi07g4zXfvNySHJKfhqmiCftX5xWZxwmcU1+qRNWbua2P6yi474Phb2Lt8yoW6Udtdqm541', 0, '2022-05-31 09:45:09', NULL),
(91, 'hajduk', 'hajduk@gmail.com', '$2y$10$heAqWHlbOkxttzV328JglOuS7NTOGmADrtCu7f38g.tI7wZsDuRx.', 'K9Y7kw==', 'Z8SytTp6jsrwKIXrC9WuAmTlvEsoq4GqeOgRnRs0Y2PtDpNFm2Lcb55fVAzHTcptw1Jk3EjLXotbuIHiByTI3m2ZG0y4XOCT3EGgMfyJSlYPmNa/d5UgEH3K9geK9eY8adRWje9p+1SVf9nDSNgW6PYGxxXIqyAk56PVNy71f9ZZ6pkr5xAfO0jHni0rwqc+wTEG4+E5wrw8wANQyREkvsGS7vvXK+tYIK3IDsAGAdgO44tBBoDrthQKXzVr', 0, '2022-05-31 09:45:12', NULL),
(92, 'Daria', 'daria48@gmail.com', '$2y$10$2M43lQBHKudQd/lzEk8RfefBj4NBxODQAdqIlpTdAEelUu92yZk4m', '6O2QEw==', 'ESFRCCmSv5+wSWBah2NGx1TJriGTpMaqAC2L7zVi5mjHyK/JPpx+SIPQbuWySTm/+FVpuqNrqISYf/JFoEEioxq/orVaWHVyl56+Lt3jC3obK8DmPnqdB2OOEx/EJfnk5KnAQyVTwviLIkDEuUWu8L9B7SDoM1qxervh+N9xnZsjMP1uPg30CuiTwN3qnYk28ipKvau4qZSM3BOc67mMK3HA2Fuw3KTLZ4KHXJUwcyJwXHEIM0SIalLmwgLq', 0, '2022-05-31 09:45:18', NULL),
(93, 'technik informatyk', 'kamila@gmail.com', '$2y$10$iFqnzpdmGgqZT5A7ybz4E.jHmdpMcNddj/J3I82spAPdxaKXb7AsG', 'N58T8Q==', 'A50b+r68TjPObXkuQS/WA5maboa7e/oLLAV9DIL11kznoOyNYyc8iBhzSR9YLYSbdvcgAuvOF2jBNGhjTLx6DUQScnnbRlENewaiu8zrMOkwByeC+n0blkOUccKADP9SIlJCJomsOMhVvRzdquXd/DCQXrsM6jopLbpqlx7lonbV79KPmkpVM0mkwDqMz5WxBn8LPAPk1ZKl+HWPtSr4m6uvJnyVNhWkx7D9qVqRFBnJjtaSH7tJWK2Pu4q2', 0, '2022-05-31 09:45:19', NULL),
(94, 'wydra', 'milena@gmail.com', '$2y$10$suM128eoUrNIVBzuYZ7yBelqYos7q1Rv7JifqW10Mcw/3YNRECjEe', 'SubeOg==', 'WwVbjNQiX16mRHsNg4x8PQkdcqXJtd4iB2Tsh3ygKMGJki/6xPJbcTxEnurfS8/U4GlK3Nvpy4WbAvrptpPJV9OvZpByRUC6l4hiGixfec0qsk7tiR9fcQ0GObqe4hXJkX8f+vtNxkklQALdD8UZxSOTrFANkbhoafO3ONTvQa/ilhx/QxwS/z5kq82Pruvnr9GwCi17OeLWRgGKnzX/gD0FGJmYwLVw2Zx+frU1TN1JuKBc739GsqD4SSxX', 0, '2022-05-31 09:45:27', NULL),
(95, 'Skuni ', 'erghiinoi@bgterui.pl', '$2y$10$0JRS5JTya5fjFiVoLSwla.KvxQ9GIfu6jKOxlw8SqF7h4QvpX3rqq', 'eRk3/A==', 'mkM+lOD0tZbws2iK0tkZGAPSnTWlxeymmyyWrLAX1mH2u322m5yoO/1WFvRJC6jRxzerg4ynI/qdDwY64PjOGJ0Tl15roTKMypxHp9TyXLklCTv0lqTZhiSGVi2WYO57ZKAL38Bhlus2d7yZ4F2zCoVVgiE8macP7v5zeWwmuL7AfXs4kKFCiMMBUqFDc3SSF4UQ3G0GSmwl+rgy4nhOaB64YxuEHyLuSmFFTDks6FFHYxq2IpoP80+Lnwo8', 0, '2022-05-31 09:46:42', NULL),
(96, 'krzysiek', 'aaaaa@aagmail.com', '$2y$10$bt4YMreSoRVEn6OaZFTlDerFndqCGQQCgp9WPqT6Pg99N4PfnuO.G', 'R4Ugfw==', 'Eztj0c3hBqymtkWUL3MJoSy+SQaFdByhQS5zQQWfG3aMcTw7q22qUk0ejTI81WUhO2j08H0ydQE2ALE7jl6u+6oxUlFf3UGFsfq8JtFO5qQGu+UjlsTbQj1hODQKuW6FvPZQX9JTSgpU1Ub3c6GdldCjfVSe9cq5iLGj+n55HEceJEDPc40ONpzhflhzjmxOfAR/2DfMaw0XilZLNFGc3coQsv9d6mIvWPxzav0LutTJ7w8PKTB5jK5S6fxH', 0, '2022-05-31 09:47:06', NULL),
(97, 'Robak', 'xd2137@gmail.com', '$2y$10$2S46Xz92s1uaIQWJPrJiX.uY2gmWCaRCoRa1XN.Qr/t3Rx1FXBx56', 'zZOk1w==', 'JN6/p9DL/zkeYDU3sNPRN1q7LPSKBEti1TzmGPVrrakpX8wZSqVxYsnJFPs2mRMcyWH07hYleXjmQTHCzqBwDkt8kODkyP2QHUKV5mEDE/X4oMZHCI8JsVS+WppC+F0RF8AP/PaalY7KWdiRaVd7pPTdXCGxZEBOV3gNpmKrwc965TSK9tKtGYEraQpVabp5IVA+CZC3ezAWK/Ev+RXI01pR2CqIHY5DDBXBNRLvkk23FRyXs815qz7UO/5p', 0, '2022-05-31 10:02:47', NULL),
(98, 'Klaudia', 'klaudia@gmail.com', '$2y$10$P/wbk/MGrwgj2s3NDeSLfua1E7c/lhspHUoFnQGqcNRBxWompnGvu', 'cwLFUw==', 'byMDcGHicwvn82lEhZGVyyZPQ95S6SCJXhFAZQw46kgcTL83cfeHT+Bjex8Y668t/8mf4wYJLlyxtREIviCFwdxDc6okqLGJnh4TymPN2e32JerPgM7FTDYnD4EJD1CBnkmElxm1EoqBd6+R7UqLziaxfGJt7JxTD8kp6ZtN4lB5efhI9ksw06QDeU/KTPL11acWlHSd8TCkYS//o/8n7YrSxekOc9OOawtuCfeXr0RpDjfYgy9hP9v+9awl', 0, '2022-05-31 10:05:54', NULL),
(99, 'Anna', 'anna@gmail.com', '$2y$10$olzYgqPEs567cvd26srss.qyF8zcttZ224HGWbe0.6tsFAH5WGgC.', '9Fn4pA==', 'GvnpMq9ZzBOoqSybikqbXDKgbm/pl3F/Pl+Fe/yshNPD7m85qZfjqDsSCd+q7kf/MxaQcZAgl1ndLx100AWH4XA4FTMB45xhSdtzXzFxul0XY3oBh9U6oPRSrU1/KwqH0ojKTWcwceXDVQYvOaIERhyGgTKQAB7mTYHguXBuWb4Mb6fyZ5cOR+dzNTuBxZnkXEuOd/wv30TLXo4cFvqEv49MDDPrTgYEUCI0u9CZwkdQad1zUme2bIuyUttM', 0, '2022-05-31 10:06:06', NULL),
(100, 'ja', 'shgtqgya@vdlhgsuhg.pl', '$2y$10$5avwj/Xpk/8Fa2pgjjDOu.nuE.TCHluXCF.CVRk63BwVasqfjzFYW', 'l4k5sw==', 'toz6fvy+3eXK3S4MYG7ORlgsCxC3/tJBkdZELnx4YMCHOs/6b6XA55fB4Zt1c5tTSV1MWcoWm00V3nnjWqdxSebzTgfZDHL9KLAZs/TbjiLmvXKzMbMLQ1bmx1P1sj1ttprrknsOKJ2ABvEpJlRvY0WwE7PWVF5X9mktrUK1Lfu4/UxMJq+OqSeiTWjFXUiG2FqcziTMeYIGsWqtiBlB6h9rjarV4evkIrO81rGS52g6CzzEkd7K7FYvt7B8', 0, '2022-05-31 10:06:16', NULL),
(101, 'ronaldino gaucho', 'ronaldinio@op.pl', '$2y$10$JRltrLxCX2nqbFgOXd6W5u85X9WvEvEvZE29wEpOVMZmEY.hN4oyC', 'oFwhng==', 'CWt/ZN9aldlQmZg6xot1TdmHx44B07fKOlbGNflv7mvkoDx+xM/LDAYDAOPjVWxoN09z+fe6YQi1BTobwNMdQtPSo6TsjhLwf/vLsmmYjMnYlwz+9yy5KFRGdWs6DaTVH+VFpEi0D1xF477FHfyqLMBGz1exd906Tl6RRzggyxbvIkK4zK8boldcfvTdB9LucZ/a96Y2muy71dV8HmwayQC9Wz7d8sP71MlgQyUalrxE6RpmHTeXxsPcFbCJ', 0, '2022-05-31 10:08:10', NULL),
(102, 'Fortniteplayer1', 'kacperro@gmail.com', '$2y$10$RHvSnmBQcfsaJ58NUJIzwOZ6QY1OHX6KR0fEbhn/cBIfGPF6Mf38y', '/1pWzQ==', '9W4B0FMG9edYorI5Wq8GQAkKLAKgdztC2iMpZRDjkN5V0dM0GBRK3eK/ITv4CGXpbo1hd9jb+tqHTpE1D/Gn3fuJJQre7cgBSKr2+wX+LN6fDc7ky5hF1lz0AZnGrMmYvtpJG26SUggQ0V4RCY3twDk7UZ59iOtx5U6ZmMOjQRoqV5Une0nCTHl0wnLWyFH+Au/ejpm2jpkpVyTgnWPfcMZjc2H/mncBs4hvgy4gEdDJifmN+tB7sO3gyUSH', 0, '2022-05-31 10:08:28', NULL),
(103, 'olaf', '32546@gmail.com', '$2y$10$Z9odzFTeJnLN2cUZMpnuPuVfvzCxcsCSJUe.vt6jQyCdaDtq67sbe', 'kfqztg==', 'n838CvUBXDW6xVn2HiWtWLJWd3dHpsuZeuTyfVA1z3aLrey9PRrpq+5TdnFFABK9x1NjJ438mgDGDWXVxsOHk7MaAVGK+Awqe+VV+XWXmfNDh4DQeZaR2JumLXqdGp+3fvJ408agrirxze+SbysTzX8bPp8ishv45ddWmOKWH1P9okB61lXM9IUjGMkvZxP2xjXY6DniqMBxgLLkakRFtSDhyyGEzidsAFuC06z4aAylp5ddDEquqCiROrNH', 0, '2022-05-31 10:08:33', NULL),
(104, 'dejvidek', 'dejvid@gmail.com', '$2y$10$mqDrOVHS6eGM9EPw0rt5JOsvvYpdAu.81aueXlDVb0leUoSz5X.Z.', '4IrJGQ==', 'gP0kUTwnpMMejF2+qcYE1KwVcLVI4msZtBd5x0UuDwFyMi7DlaQahNz6wRcWVxKOzvmyTR4y+0YmCvbj08ioWQrEM4+1PWk45xWFNt+oNmycrGuyuuN4AmB0tLV4AljCrJzJ82H7RpPPizRfZmoTp2lDPs0Cr56GteasuKa4TL+r8UfCuLaCeRbuWFAR0NSHRA0vE3r7TNOrqKfwqo5i7IUwI+E3WtfLTXI21nnEKH7pH5bmCFpjeVuREi1f', 0, '2022-05-31 10:08:45', NULL),
(105, 'Jacobini', 'jacob@gmail.com', '$2y$10$hGyPhSJIudWpF81p1Bl3bu0DId0urdp7L4u8xO3bZhSvT9fHmA2YG', '6cVhrw==', 'D/kCfPFJNrgqUrFp+aptbDUXHcJlAXn5N3+AiqQ45aWEbDBL/rVhH78OakDXwlxvlHPTrkxnrm33Ic7+ZiPYZOokQqF814KNI9o3MATsiC2BlLPIywCSJbSl2p0GZXlGkamGrJfRu6YA3U0nWaD5G5wXlovZn16MW+Mzp540H6IP4WFGiX62fx2VF0Omq+ae6XzfhammwshML4Ozb9ZdGfSvuq2qSs1CNZcoeQh0qI6ctKlwIeA8bxomd/T3', 0, '2022-05-31 10:08:46', NULL),
(106, 'Bilek ', 'szef@gmail.com', '$2y$10$Fe4lMAwL9QPPCcxVMERjzeuUoBa1DI1fc865OZz3BD/gcrtXHxtCu', 'IUC+tA==', 'xeSx30XVLlqBoIR32kTp1T2Gy2An0lukAu2U27hGWTSZblycCB29eOFz2syWSN9WpHopIg1w0FfJgEb9co9UCtO9e/SvrdsscXPAE/mWJCQ/fLjjeX+CNQNq1f80Mdpxr5wocsv8kfVU41+M5OWpJKFTheqA4TC1oYYOYR6aJLCCG8rzJLNhDd75JGJY3i7liUFzvS15sKpyItLn04gapdtTW3PLp3+dcrsKMHglCFFlmUKSQw9IMuNrZ0nY', 0, '2022-05-31 10:08:57', NULL),
(107, 'spasionymarcinek2', 'jd100%@gmail.com', '$2y$10$Mv6jvcESWjUHdZ9QRFLJAeEQSZtqgly5b2Tiy57SjGHUxptRhBh/a', '+twjBA==', 'RkQ7moGJMstXqOIEcQAUlKXdsOl7jZ9rjtCL2gU7Pxxf6ONN8hOEjNWVnx1lhY5cZ3olt05QukpyHGS2dRlaEEoPY+z4i2/vRMKVvs+BApVnZb5L4reNZIkBuTbcj1xSrA9m+IsfPLAo8nb64T3NycKYK0r3degToVlZcbn32H/4kmaU7aUnxt2EEd33G2qHuL3fKlwDSLIvQdRdpGm2W9iY65rWLOnbZv6ISekRSlVCcu7+Z5UEm058E9dY', 0, '2022-05-31 10:09:01', NULL),
(108, 'robert lewandowski', 'imie@gmail.com', '$2y$10$JWwyoDfofUz8kByatxz6ueUAF3rqjWFRhCHScPweAsX7CwTLfxJGi', '0xxbUw==', 'G3VJnLvmh7ehAqa2JlE60K4GQ6I3lIF6YVMQfk2U+ojZA6ixE64ZVHuEaHvtuhrWQGzb7P7wFyxhomCjU9f7PIUDuFMU0SKqPl/rOAbDrFgdeAOX9Ai2+KerQ0H0dQlNJVvckSMfOEWGx1/6X1LoI97DM5VyDSaDuhHHLSvjsnFMEOMEJNad7rWZjl251jfBZaxIcVEdOw0aa6KJRobMwQ/W//4Xj1P+vBRl9M8xGpgKmypbih9pmVXTL63Q', 0, '2022-05-31 10:09:12', NULL),
(109, 'Bil', 'szef@onet.pl', '$2y$10$a9RABw6b19H/Q8ivn9HGm.3VSb8H3YYwUUynfG.fjJwWrezlwFmKS', 'gEM7Vw==', 'o3uvTRCubUZnot91zk7Wj3w43KqzOF9B9AOj5L0FZ3q4zQtWCXN31s+aq+zWrzFUc4kw/Q+KD0e8ds6Fjdm2MZ0TZV4boTmzJoaUhET2gcCabOcVuNEo3UN5t4Ku8t4wCCM2T7XzASAMW+TIJYyADM1KaTC8Bgg8eygFI+WsnfFkJUolRON9jhyRjyMFXJL1qEFUodgyzunY3SN/td714UOqwi3Op78zcTI5dHlJqi3EjIPK72DfvkSw+5fz', 0, '2022-05-31 10:09:44', NULL),
(110, 'Damian', 'adad@adad.pl', '$2y$10$GbmnL8iJZHayxVq63Zb16.tiKq/rd/0qaTwKybKXZ.BpXRqxl5OTO', 'nLUvYw==', '3+bkn9XN7r+IVl3ITHGsHQzti5aWEMCOt45AZKJIgoHl5DMrxH6khVDQyjtBMy8uyIb2joN1w4UHUystN0Cz/0L/R4hcQ0EBaMpZlmnSn8k4SxS5i+u/63IoHVegkXxBrC8USGHSckLfpfW9MpR99w+ZLyvYQRR/4bB1DhanTfk6udXw+YVMMmQ695CsGCdNWO8ERz/laXkrUfr2chhIJdP4N2K1FW+n7jhnHADeFYi+mxYvQsgSXY1rKHsL', 0, '2022-05-31 10:11:01', NULL),
(111, 'sarka', 'mojemail@gmail.com', '$2y$10$gdK5RY9oN8.S.5rcoYzqE.67ADw1OiCjPcRYcRV.z.TU5.D43..z.', '6vcdFg==', '2ZzdM+7n3sSQ235gDHRncmefbdl+b/P7gGUeeRKXqW12QrUXi1D3nalHsPxx5U9wAw3ryFiI+kD9lWxh6lMumhIv9VsTBODdUqK9QMP+ZkgwG1isSLsIxEJXtPLfR2vdRqUWBPlyUuwQ68P1NfjbBY2TjbDhLDIhSme0V/LCFCQW3DOoFITsPSUh35UH245lGwZ2gGglrUEPUmby+Zbh/HjCeaTQ/YgKQVsmwdsM9EjhlZ/73E284XetO26/', 0, '2022-05-31 10:21:58', NULL),
(112, 'ppppppp', '7575@gmail.com', '$2y$10$mNb7.uwiu.50IDdrSKaMyeYTgd/R8GMjtVrkkODAlJY5Auf6OKwsW', 'niUWFw==', 'PZgUztB/ko0GxLSG6ugPF4Nj531K5pt0VtQDHYxXtBkwKwX4/Dy7nqIfc2G9mVsmVPdvhEgz29qkwyaQ8OFApBLj+GARjuGaZUnlKgxozHTPagk8Pb/kAweq7C86bcTTLmuB1Yer1l0IB9lqYiGyj1pNZPIK5aWQ/FakfxcLwWCpAnsBL591xM0hou3QSSXRomZ0vL2TeQm5XKs3KJx9WBYZfHFgse9ZO40wUPjCI/4uVM9ueMdqrgkYEReh', 0, '2022-05-31 10:22:37', NULL),
(113, 'gocha', 'elomordo123@gmail.com', '$2y$10$M2B.kciQb0l24zZVX3QOy.QaigTjQ1/a3sSHoL6rlLcmBZTqIPMxC', '1qg2xw==', '/A9hiVDNkV3LA23B+o6YwVGUwo4hWx/XPzmZIYEykNWBCDDwnBHF1cju4DE0sP/ExBZMxAfz3R3fG+hJ6k0d50j3rOWb5zUSUtlqjg+e2mWCw54TeRZdccitLGR9n6vwua/JLpTUCgCQbCqNRkwAbShYAKNcgqhig1OjVrQWFYplmXhVFfp55e/2+FLAQ7julYsE7R/QbmhgsZWn1ZUM2h0AOH+s4FQv2Ky5RCkKl8+4zoRJ2ljd6vdbTLkZ', 0, '2022-05-31 10:22:46', NULL),
(114, 'kinga123', 'mikolajsowa908@gmail.com', '$2y$10$6/gguOLAPqh41f5NoGovAeJi.8a9zFXPoje3BPy18EOJvoQtKxRMO', 'ofYXGA==', 'UTP7xwUadA6KQxrOsPpPvVxxJdZNb+xVAeirV22AQ2s/fRSRyjrdtrZxD054iZcox5fj0XVstHWvEkpfMtysX8F+Oedmw23oqL3kJux9XlhawPHPjv9JhRjrF2wnxi5ivLgGMel77Ko0FFhWEC+QWRjxuSQKXP7LcfNnn632aCEQfgVNfRMUAuPGVUnRlP7uEFvhlTWv75e7lZY6ojK/vNZXXVqZDUojJLKatZKJc283rS9TNFsbBaYQ45Js', 0, '2022-05-31 10:22:50', NULL),
(115, 'zielle', 'wiktornowaczek22@gmail.com', '$2y$10$9F2vuv2yIM5F2Qb16jHK.eYvLxgkXIZibkjE1qvs9Wtc0sTpWDvLC', 'VgMvIQ==', 'wc1y/udXNFA3Tw5cacuUWvgZPE3DYBIfGVGQa3pf3D0B4QnIliqaNXLf8FgJPXGU/IkEuPZ71/9Gi9SyZ6a9YOBx8yY+XjeNb+YR/95lRVJ4SJSWHbiUc3f+q2ZJB1RbvVQ1hSY6uLM3XbBEAA/FZ4Dh2GP71ZincZTnwr6cyIGFPbHR88dNlnHvlamAeeww8F+Naisc7kWNpCF2bBGezItdv3HysYkvzGSmXpXzsTFL//cg3IoJvScIfAA1', 0, '2022-05-31 10:23:08', NULL),
(116, 'ankajestem', 'lolloltak.213@gamil.com', '$2y$10$p9v3MGjHIVbXkjZR03DssuA.mFzJw48YNjrA35NLXmpUiRLA0u7Gu', 'mszHHQ==', 'i53+jf5GrVnnx+PRikI/E/Tdfq9nYbLKdIJkjTWs2LZFvYEbpnhUHUOHv02znDaIqypjPHpiCKa8LzzS2bEyHY61oeCKfPN4lX+H5jssBWpkWN9KVSLRTO+fFbiVpYRee1czz2dlGylFO7Afvpf04cxDo7Ch3QlWuF9CcYNTQkg/8m1e+9BdMIDr64ekR3L6LM7pfkeUAFXe4Ud8opeOPFgP+kG0B8QYLhc1DblfQivZDT2qs+EmYDByRgjr', 0, '2022-05-31 10:23:26', NULL),
(117, 'Szym_An_on', 'pisarnetow@gmail.com', '$2y$10$BT69lQVqY2qYyKMec2kcKutSESsuLN2ocqrEsqjuDr/aEqEC9SjZu', 'YnjNng==', '8aOO3YtnGF9aqHrhyCSmBhlLuSzmPd53FHMPk8kTbBr/BwzsCEoFDI9x2+YsXrSNnGjIyngq35a+GyYU0ST8/QMQ1vWlSwV9ggvF1bXkvAk9n8MyRiO1nHyKeQ1GirxBYtJuZtWfg3nTvt3WJ46cbzK3uYZqXFzO6e9XWaRkmcSGrsoW10EkRregJTYs7rks3FvhQ4dNBdxzYPFXXiwkDXLVGtAZBx3iJCSTEF76MO8cB9utxrpMupI4x/hr', 0, '2022-05-31 10:23:33', NULL),
(118, '12312321', 'bladyn123@onet.pl', '$2y$10$qvBP6Acm3.6KymVmkMp3XOJ1kjMk6i9PkmqmjrMFVaSeQ29dV7Z2i', 'AIbqZA==', 'mgi0qDyzhjueTvueZWk1/KVT+VU3/IdKRZVbsd/2B6Wm7SB6HYCClT9nCFDcIX47qE6oCuAiXNgL0XEmcnntwOCpgrws8yNV+CXsGPQ7VWorvje4Un/pdXA26rt3WfpCeTkfr5J8DWKk0iz0HjwP0clIWCfpxEdTtlnNdfIIwJwZm1UIKiPOsG/PJu4W5PLmq5nGcjjWutFLdfnbP3KMd9gquflzCdB92GY34Ob4s5P9qfYU8LwSFOmYCMw3', 0, '2022-05-31 10:24:20', NULL),
(119, 'Prismo', 'prismoventrue@gmail.com', '$2y$10$8lp81dizkcjRE7FyW19nXOK1lzvga3Ocz.PH37LHpG.jHMLbwAuYq', 't+Z+Iw==', 'xGVoJEF/iMuCtEpG+hxMuHkGRSeKaos4WCcUv/ASiJHk6HR6eKZrn6AIE27LraVQt9xW4CkgEHOKTyBexEXB6nE2K/y48vBRAtNgWgNDpOVZi9XWc/5/iS0JAUqf7IV08DpPoHLREO2vt6xSqF+kclzt0DKvwzHUatQyeOB5Sc/F/K76WORZVfdO6PhkVdBfAZsAObdSwkNGREY/dDLvzsF3qb7C4MqYZ0yP62dP1LFYxuKDMvQxwLNibadf', 0, '2022-05-31 10:24:55', NULL),
(120, 'ASIA', 'joannagurba07@gmail.com', '$2y$10$Zyjq6EqzZQnDhhLz9MIe7.1JTmlV1lW/cbGddzwa0XQ2TNNoxhWcG', 'pouhlw==', '21yTopV4MqnNp4bRyTny4cKO7Cn3teGY+PktMhAJWnPnyLsnwzOO8vPjr1Lz9Zbc/7eXeNpRhNmTlD6cvqnLcTC0AbheLDlJhhs3Blmq6IW6BDF4YQiVrWmaXzAVWF/sgVIfgUl+G6v13qBM8VJIk5Ih+IfDPSakxFXcvYbnMG/Mt1Kv1z9VTXKYt2hpb+QpikCPxSjJQKTyJThGSq0jFtVXedsyqLQspaWG2NriLFvkB902YUAf3a8qXirm', 0, '2022-05-31 10:25:13', NULL),
(121, 'sinda debil', 'bary74shyaerhsd9@wp.pl', '$2y$10$qRysIdnqUaacZCOY2v.kIOZGaRPuMpufXHI6Uw/NP2yH1Wt9Ra7Sq', 'XsBw1g==', 'Px7Pk9MuAOZOWxGp+IjVNuSZ+/S5wB0GeCkhbS0WMzBLwhNwGYkauFnrcYgN8O3htbOk8G8De+9I4zejXBnNl6ccIPmJQWiyz7WqD19GJiB64mfdyk2q101sEhe/hakNiM7pNXLEVf7Hcp6/tRqjKC/qMDTV1EgFbh3QJwfYaWsDfP6CG6n7wScVOffL4lmfb2mphTTnrC7ROg0l0DmKTxm2dtoAtVQjfZPjp0oIzt/mAMjcR1Sr0Vlyh30f', 0, '2022-05-31 10:28:37', NULL),
(122, 'Tosiek', 'bartektomalski152@gmail.com', '$2y$10$Zs7y86X7grui56ygFvhI1.UQzOAulH475fzPdcXKaf21QvHZULX5i', 'ggpHAA==', 'pgmjFX+YlfwwG3VIO5GSrjcJ8ia9CQqO4Pk7uMcYyES49RHGOHChNxH6GH2ufqOu/4oUIYteqDwSvJr+gxtEd1dlK/zGUG7Mb7uLJC95jUUlm2lZsz/Ngo9NmMZVAy/dNE3YkRFBKDujj3J3mjJncCchWJ86EYg8FHOrsFd6EKVAaBK1MlBjszDOAsLQ9DoBoK9QR0exRrBnyoA0xVl132FBCunBjaMTXCG1v2Xx0xIY5QR+twsxvgGM3XSP', 0, '2022-05-31 10:28:40', NULL),
(123, 'rekut', 'djksajdsad@gmail.com', '$2y$10$7V9Ge1NJuMfYUvjSPouYve65QG8TlaSt1IuU3gjP.lrrD52iRrBcG', 'uJYDxQ==', 'Wf5dFycviYP1e5KxNRetYy4sbwi1qAjshMye28Q8YF63B3saziTGowOfmqn68n+tL3wUyEgzLlQj6Ck58V/gkquV/a1Ao+BTBTd4o/6joZHF0bzb9Eoan42NaH7hPuc5GulFoK1BOII7d3wmrr5/HYXW2b+H36sSreQgM3BigIeedpWjuL3WOmdAJCuOSNhlB7oERuKPdm2dzTbLJxdWWRjpsaZhs6E8JsDQLJVsksmTwIL7nSkOuBOWMpzj', 0, '2022-05-31 10:30:03', NULL),
(124, 'maf ', 'mafmaf@gmail.com', '$2y$10$IcZcJ8cAICLkdgHVnyjTl.0QTq.qNx23b76G1kNxZcufASmZo2aa2', 'SJzYIg==', 'lGFJHcsBfawVGZEWjKNogIWyq7Y115MBAYgYwn6n+Gp8M9Mg3PFAF2+sc4gnyH64t2nFTBT4X+SvI8r+SokWSbqAC2qKOX7yBNbDfQh8DqlOIzYKx2qv96Hwz3asHLVyIL8USbPDzpxFMbKEK+mRJC0ewA2f1LHnNVVca84QGKTkvLy/kE/FvUouQtiuyXPWSaESHQ96QjEIIED7K4RKFrouiA+3uyFvRsNQEtOM2D3H8XMSr5TfiNKT1EuE', 0, '2022-05-31 10:30:05', NULL),
(125, 'Mafgigachad123', 'rekit@onet.pl', '$2y$10$Kpbn7HKn/gRsyHhHNegM.eGR.jyequyfCbzAJdMuzANfiPT1AmmBC', 'EamQkA==', 'hLKPAV1dDH+38lrUam6Qqwmthxz2s2r4WAjFPLAck0uMQaPDhyYGB6Uih/odPM/OmE9EG00DG56o6ok+7S2HxvjLNP1RYAq4acXSht98HxnFTfFmg3nONNA3Ej4e+iWuZaL/D/he/6lUwhXRrSJxGIrbI5/CtmCeb463nfgGRFzk7CJkym1gHbrlQ49tAFQ+GvZ4ou6B/PUNthRGaxO3PiG36uzhd6i7tymQKdpHSK1sUQNNiYlmyH8EJmTy', 0, '2022-05-31 10:30:17', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `quizattempts`
--
ALTER TABLE `quizattempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `quizattempts`
--
ALTER TABLE `quizattempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
