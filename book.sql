-- Consider a book management operational database that tracks different book types, cost, quantity, profit, location, authors and their ages and countries, publication name, and their country and year. 
-- You have to design a data warehouse that will be updated from the above operational database and should support decision-making by helping to answer analytical questions about the quantity and profit 
-- made per book type, location, author, and publication.
-- 1.	Draw the star schema(s) showing the main attributes, including primary keys, foreign keys, and facts.
-- 2.	Insert appropriate values in the database. Write SQL statements that run on your schema and return the 
-- quantity and profit made per book type, location, author, and publication. 
create database book;
use book;
create table dim_book(
book_id int primary key,
book_type varchar(50) ,
book_cost int,
book_quan int,
book_profit int

);

create table dim_location(
locationid int primary key,
locationname varchar(100)
);

create table dim_author(
authorid int primary key,
authorname varchar(100),
authorage int,
authorcountry varchar(50)
);

create table dim_publication(
publicationid int primary key,
publicationcountry varchar(50),
publicationyear int,
publicationname varchar(50)
);

create table factbooksales(
salesid int primary key,
book_id int,
locationid int,
authorid int,
publicationid int,
dateid int,
quantity int,
cost decimal,
profit decimal,

foreign key (book_id) references  dim_book(book_id),
foreign key (locationid) references dim_location(locationid),
foreign key (authorid) references dim_author(authorid),
foreign key (publicationid) references dim_publication(publicationid)

);


insert into dim_book(book_id,book_type) values
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction'),
(4, 'Biography');

insert into dim_location(locationid,locationname) values
(1, 'New York City'),
(2, 'London'),
(3, 'Tokyo'),
(4, 'Bogotá');

insert into dim_author(authorid,authorname,authorage,authorcountry) values
(1, 'Jane Austen', 41, 'United Kingdom'),
(2, 'Mark Twain', 74, 'United States'),
(3, 'Haruki Murakami', 75, 'Japan'),
(4, 'Gabriel García Márquez', 87, 'Colombia');

INSERT INTO dim_Publication (PublicationiD, Publicationname, Publicationcountry, Publicationyear) VALUES
(1, 'Penguin Books', 'United Kingdom', 1935),
(2, 'Random House', 'United States', 1927),
(3, 'Shueisha', 'Japan', 1925),
(4, 'Editorial Norma', 'Colombia', 1963);





