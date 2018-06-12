create database libruary_db;
 
use libruary_db;
 
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(225) NOT NULL,
  `book_name` varchar(225) NOT NULL unique,
  `lang` varchar(45) NOT NULL,
  `year_of_publication` varchar(45) NOT NULL,
  `volume` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `city_of_publication` varchar(45) NOT NULL,
  `description` longtext,
  `photo1` varchar(225),
  PRIMARY KEY (`book_id`)
);
 
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(225) NOT NULL,
  `author_name` varchar(100) NOT NULL unique,
  `description` longtext,
  `photo1` varchar(100),
  PRIMARY KEY (`author_id`)
);
 
CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_book` (`book_id`),
  KEY `fk_author` (`author_id`),
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
);

insert into book (book_name, url, city_of_publication, lang, publisher, volume, year_of_publication, photo1, description) values 
('Clean Code: A Handbook of Agile Software Craftsmanship', 'clean-code-a', 'Upper Saddle River, USA', 'English', 'Prentice Hall', '464', '2008', 'books/clean-code-a.jpg', 'Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way');
insert into author (author_name, url, description, photo1) values 
('Robert C. Martin', 'Robert-C-Martin', 'Robert Cecil Martin (colloquially known as Uncle Bob) is an American software engineer and author. He is a co-author of the Agile Manifesto.', 'authors/Robert-C-Martin.jpg');
insert into book_author (book_id, author_id) values ('1', '1');

insert into book (book_name, url, city_of_publication, lang, publisher, volume, year_of_publication, photo1, description) values 
('Thinking in Java (4th Edition)', 'thinking-in-java', 'Upper Saddle River, USA', 'English', 'Prentice Hall', '1150', '2006', 'books/thinking-in-java.jpg', '“Thinking in Java should be read cover to cover by every Java programmer, then kept close at hand for frequent reference. The exercises are challenging, and the chapter on Collections is superb! Not only did this book help me to pass the Sun Certified Java Programmer exam; it’s also the first book I turn to whenever I have a Java question.” —Jim Pleger, Loudoun County (Virginia) Government');
insert into author (author_name, url, description, photo1) values 
('Bruce Eckel', 'Bruce-Eckel', 'Bruce Eckel is president of MindView, Inc. (www.MindView.net), which provides public and private training seminars, consulting, mentoring, and design reviews in object-oriented technology and design patterns. He is the author of several books, has written more than fifty articles, and has given lectures and seminars throughout the world for more than twenty years. Bruce has served as a voting member of the C++ Standards Committee. He holds a B.S. in applied physics and an M.S. in computer engineering.', 'authors/Bruce-Eckel.jpg');
insert into book_author (book_id, author_id) values ('2', '2');