-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2021 at 03:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

CREATE DATABASE IF NOT EXISTS `travel`;
USE `travel`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ffirst` varchar(20) NOT NULL,
  `flast` varchar(20) NOT NULL,
  `femail` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `fphone` int(15) NOT NULL,
  `fdesti` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `booking` (`id`, `ffirst`, `flast`, `femail`, `city`, `fphone`, `fdesti`) VALUES
(1, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Goa'),
(2, 'kiran', 'Naik', 'kirannaik1@gmail.com', 'Honnavar', 845868956, 'Mumbai'),
(7, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Mysore'),
(8, 'Hitesh', 'HT', 'hitesh45jk@gmail.com', 'Udupi', 458696561, 'Kerala'),
(9, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Kerala'),
(10, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'India Gate'),
(11, 'Gajanan', 'Bhat', 'gajabhat@gmail.com', 'Kumta', 2147483647, 'Mysore'),
(12, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Kerala');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `city` varchar(10),
  `phone` bigint(12),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `customer` (`id`, `fname`, `password`, `email`, `city`, `phone`) VALUES
(34, 'admin', 'Adm12345', 'admintms@gmail.com', 'Honnavar', 8971046276),
(51, 'Ganesh', 'Gane1234', 'ganeshravinaik2001@gmail.com', 'Honnavar', 8971046276),
(72, 'Aditya', 'Adi12389', 'adityag45@gmail.com', 'Manglore', 8574968283),
(73, 'Gajanan', 'GAjju700', 'gajabhat@gmail.com', 'Kumta', 7984768581),
(74, 'Kiran', 'AJkiran1', 'kiranaj56@gmail.com', 'Honnavar', 7586949199),
(75, 'Prasad', 'Pra23444', 'prasad24@gmail.com', 'Honnavar', 7485961256),
(76, 'Mahesh', 'Mahi1233', 'maheshmm@gmail.com', 'Kumta', 9978488656),
(78, 'Nishchay', 'Nishi789', 'nishibhatt234@gmail.com', 'Udupi', 7485961236);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `feedbk` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `feedback` (`id`, `name`, `email`, `feedbk`) VALUES
(1, 'joy', 'joy123@gmail.com', 'good website'),
(2, 'amar', 'amar56@gmail.com', 'nice website'),
(3, 'adam', 'adamgray@gmail.com', 'your website looks good and nice user interface'),
(4, 'adam', 'adamgray@gmail.com', 'your website looks good and nice user interface'),
(5, 'arjun', 'arjun45@gmal.com', 'good website'),
(6, 'Hitesh', 'hitesh43jk@gmai.com', 'its good website nice user interface'),
(7, 'kiran', 'kiran35@gmail.com', 'this is a good website');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `hid` int(10) NOT NULL AUTO_INCREMENT,
  `hname` varchar(20) NOT NULL,
  `hphone` varchar(15) NOT NULL,
  `hcity` varchar(20) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `hotels` (`hid`, `hname`, `hphone`, `hcity`) VALUES
(1, 'Taj Hotel', '78869565', 'Mumbai'),
(2, 'Hotel High', '78869565', 'Benglore');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `pname` varchar(30) NOT NULL PRIMARY KEY,
  `pdescription` varchar(10000) NOT NULL,
  `pi_main` varchar(1000) NOT NULL,
  `pi1` varchar(1000) NOT NULL,
  `pi2` varchar(1000) NOT NULL,
  `pi3` varchar(1000) NOT NULL,
  `package` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `information` (`pname`, `pdescription`, `pi_main`, `pi1`, `pi2`, `pi3`, `package`) VALUES

('Pindari', 'The Pindari Glacier is located in the Kumaon Himalayas and is known for its stunning beauty and accessibility. It is approximately 9 kilometers long and serves as the source of the Pindar River. The trek to the glacier is a popular adventure, offering breathtaking views of peaks like Maiktoli and Panwali Dwar. The trail is suitable for both beginners and experienced trekkers, with a round trip distance of about 45 to 50 kilometers and a duration of 6 to 7 days. The best season to visit is September to November and March to May.', 'images//destination//pindari1.jpg', 'images//destination//pindari2.jpg', 'images//destination//pindari3.jpg', 'images//destination//pindari4.jpg', 15000),

('Kausani', 'Kausani is a picturesque hill station in Uttarakhand known as the "Switzerland of India" for its stunning panoramic views of the snow-capped Himalayan peaks. Located at 1,890 meters above sea level, it is surrounded by tea gardens and dense forests. The town offers excellent trekking opportunities to nearby peaks like Nanda Devi and Pan Peak. Visitors can enjoy bird watching, photography, and peaceful nature walks. The best time to visit is March to June and September to November.', 'images//destination//kausani1.jpg', 'images//destination//kausani2.jpg', 'images//destination//kausani3.jpg', 'images//destination//kausani4.jpg', 10000),

('kedartal', 'Kedartal, also known as Kedara Tal, is a high-altitude glacial lake located at 4,925 meters above sea level in the Himalayas. The trek to Kedartal offers stunning views of the Chorabari Glacier and surrounding peaks. This challenging trek is about 5 kilometers from Kedarnath and takes approximately 4-5 hours. The lake is sacred and surrounded by alpine meadows and glaciers. The best season to visit is June to September, when the snow melts and the trail becomes accessible.', 'images//destination//kedartal1.jpg', 'images//destination//kedartal2.jpg', 'images//destination//kedartal3.jpg', 'images//destination//kedartal4.jpg', 9000),

('Roopkund', 'Roopkund Lake, also known as the "Skeleton Lake," is a high-altitude glacial lake at 5,029 meters above sea level in the Himalayas. The trek to Roopkund is one of the most challenging and mystical treks in Uttarakhand, spanning about 10 kilometers and taking 4-5 days. The lake is surrounded by snow-capped peaks and alpine meadows. The mystery of hundreds of skeletal remains found here adds to its allure. Best visited between June and September when the snow melts and the trail is accessible.', 'images//destination//roopkund1.jpg', 'images//destination//roopkund2.jpg', 'images//destination//roopkund3.jpg', 'images//destination//roopkund4.jpg', 20000),

('Niti', 'Niti is a historic pass located at 3,654 meters above sea level in the Himalayas, connecting Uttarakhand to Tibet. The trek to Niti offers spectacular views of Himalayan peaks and vast alpine meadows. It is a sacred pilgrimage route with ancient cultural significance. The Niti Valley is known for its lush greenery during monsoon and stunning snow-covered landscapes in winter. The trek is ideal for experienced trekkers seeking adventure and cultural immersion. Best visited from June to September.', 'images//destination//niti1.jpg', 'images//destination//niti2.jpg', 'images//destination//niti3.jpg', 'images//destination//niti4.jpg', 19000),

('Ruinsara tal', 'Ruinsara Tal is a pristine glacial lake located at 4,500 meters above sea level near Chopta in Uttarakhand. The trek to Ruinsara Tal is moderately difficult and takes about 2-3 days, covering approximately 8 kilometers. The lake is surrounded by dense coniferous forests and snow-capped peaks, offering breathtaking views. It is an ideal destination for nature lovers and photographers seeking solitude and serenity. The best time to visit is July to September when the trails are clear and the lake is fully accessible.', 'images//destination//ruinsara1.jpg', 'images//destination//ruinsara2.jpg', 'images//destination//ruinsara3.jpg', 'images//destination//ruinsara4.jpg', 10000),

('Bedeni', 'Bedeni Bugyal is a stunning alpine meadow located at 3,400 meters above sea level in the Chopta region of Uttarakhand. The trek to Bedeni offers panoramic views of the Himalayas and lush green meadows. It is a moderate trek suitable for beginners and experienced trekkers alike. The meadow is ideal for camping and photography, with opportunities to spot Himalayan flora and fauna. The best season to visit is May to November, when the weather is pleasant and the meadow is in full bloom.', 'images//destination//bedeni1.jpg', 'images//destination//bedeni2.jpg', 'images//destination//bedeni3.jpg', 'images//destination//bedeni4.jpg', 5000),

('Khaliya top', 'Khaliya Top is a scenic mountain peak at 2,680 meters above sea level in the Uttarkashi district of Uttarakhand. The trek to Khaliya Top offers stunning 360-degree views of the Himalayas, including peaks like Bandarpunch and Swargarohini. The trek is about 6 kilometers and takes 2-3 days. It passes through dense forests, alpine meadows, and rocky terrain. The panoramic views at the summit are truly breathtaking. Best visited from March to November.', 'images//destination//khaliya1.jpg', 'images//destination//khaliya2.jpg', 'images//destination//khaliya3.jpg', 'images//destination//khaliya4.jpg', 16000),

('Ali-Bugyal', 'Ali Bugyal is a beautiful high-altitude meadow located at 3,600 meters above sea level in the Chopta region of Uttarakhand. The trek to Ali Bugyal offers stunning views of snow-capped peaks and vast green meadows. It is a challenging trek suitable for experienced trekkers, spanning about 8 kilometers and taking 3-4 days. The meadow is surrounded by dense forests and offers excellent camping opportunities. The best time to visit is June to September when the meadow is lush and green.', 'images//destination//alibugyal1.jpg', 'images//destination//alibugyal2.jpg', 'images//destination//alibugyal3.jpg', 'images//destination//alibugyal4.jpg', 21000),

('Ranthan trek', 'Ranthan Trek is a scenic trekking route in the Chopta region of Uttarakhand, known for its lush forests and meadows. The trek spans about 6 kilometers and takes 2-3 days to complete. It offers beautiful views of the Himalayas and opportunities for bird watching and wildlife photography. The route passes through dense coniferous forests and alpine meadows. The trek is suitable for beginners and intermediate trekkers. Best visited from May to November for pleasant weather and clear views.', 'images//destination//ranthan1.jpg', 'images//destination//ranthan2.jpg', 'images//destination//ranthan3.jpg', 'images//destination//ranthan4.jpg', 21200),

('Amritsar', 'Amritsar is a pilgrimage site in Uttarakhand known for the sacred Amritsar Lake and surrounding temples. The trek to Amritsar offers peaceful and spiritual experiences amidst nature. The lake is located at 2,500 meters above sea level and is surrounded by dense forests. The trek is moderate and takes about 1-2 days to complete. It offers scenic views of mountain peaks and opportunities for meditation and photography. Best visited from April to October for pleasant weather and accessibility.', 'images//destination//amritsar1.jpg', 'images//destination//amritsar2.jpg', 'images//destination//amritsar3.jpg', 'images//destination//amritsar4.jpg', 19000),

('Patalbhuvnasar', 'Patalbhuvaneshwar is a sacred cave temple located near Chopta in Uttarakhand. The trek to Patalbhuvaneshwar is easy and takes about 2-3 hours. The cave is dedicated to Lord Shiva and holds great spiritual significance. The journey passes through beautiful forests and offers scenic views of the surrounding hills. The cave has stalactites and stalagmites, adding to its natural beauty. Best visited from September to November and March to May for comfortable trekking conditions.', 'images//destination//patalbhuvnasar1.jpg', 'images//destination//patalbhuvnasar2.jpg', 'images//destination//patalbhuvnasar3.jpg', 'images//destination//patalbhuvnasar4.jpg', 5000),

('Harsil', 'Harsil is a serene village in the Uttarkashi district of Uttarakhand, located along the Bhagirathi River. Known for its pristine beauty and adventure activities, Harsil offers trekking, camping, and river sports. The village is surrounded by dense forests and snow-capped peaks. The trek to nearby attractions takes 1-3 days depending on the destination. It is an ideal base for exploring the surrounding Himalayan region. Best visited from May to October for pleasant weather and clear mountain views.', 'images//destination//harsil1.jpg', 'images//destination//harsil2.jpg', 'images//destination//harsil3.jpg', 'images//destination//harsil4.jpg', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `date_time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `login` (`user`, `pass`, `date_time`) VALUES
('admin', 'ad123', '2021-01-25 05:54:18am'),
('admin', 'ad123', '2021-01-25 06:07:10am'),
('admin', 'ad123', '2021-09-19 03:24:26pm');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `pcity` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `places` (`pid`, `pname`, `pcity`) VALUES
(1, 'Pindari Glacier', 'Bageshwar'),
(2, 'Kedartal Lake', 'Kedarnath'),
(3, 'Roopkund Lake', 'Chopta'),
(4, 'Nainital Lake', 'Nainital'),
(5, 'Mussoorie Ridge', 'Mussoorie'),
(6, 'Rishikesh Ashram', 'Rishikesh'),
(7, 'Chopta Meadows', 'Chopta'),
(8, 'Auli Ski Resort', 'Chopta'),
(9, 'Kedarnath Temple', 'Kedarnath'),
(10, 'Kausani Tea Garden', 'Kausani'),
(11, 'Jim Corbett Safari', 'Ramnagar'),
(12, 'Lansdowne Fort', 'Lansdowne');

-- --------------------------------------------------------

--
-- Table structure for table `travel_agent`
--

CREATE TABLE IF NOT EXISTS `travel_agent` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `afname` varchar(50) NOT NULL,
  `aemail` varchar(50) NOT NULL,
  `aphone` bigint(15) NOT NULL,
  `acity` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `travel_agent` (`aid`, `afname`, `aemail`, `aphone`, `acity`) VALUES
(1, 'Himalayan Treks', 'info@himalayantrek.com', 9876543210, 'Dehradun'),
(2, 'Uttarakhand Adventure', 'contact@uttadventure.com', 9765432109, 'Rishikesh'),
(3, 'Mountain Quest Tours', 'booking@mountainquest.com', 9654321098, 'Mussoorie'),
(4, 'Chopta Expeditions', 'trek@choptaexp.com', 9543210987, 'Chopta'),
(5, 'Nainital Holidays', 'holidays@nainitaltravel.com', 9432109876, 'Nainital'),
(6, 'Kausani Nature Trails', 'nature@kausanitrails.com', 9321098765, 'Kausani'),
(7, 'Kedarnath Pilgrim Tours', 'pilgrimage@kedartour.com', 9210987654, 'Kedarnath'),
(8, 'Corbett Wildlife Tours', 'safari@corbettwildlife.com', 9109876543, 'Ramnagar');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
