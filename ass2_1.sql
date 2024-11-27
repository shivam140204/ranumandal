-- Consider a book management operational database that tracks different book types, cost, quantity, profit, location, authors and their ages and countries, publication name, and their country and year. 
-- You have to design a data warehouse that will be updated from the above operational database and should support decision-making by helping to answer analytical questions about the quantity and profit 
-- made per book type, location, author, and publication.
-- 1.	Draw the star schema(s) showing the main attributes, including primary keys, foreign keys, and facts.
-- 2.	Insert appropriate values in the database. Write SQL statements that run on your schema and return the 
-- quantity and profit made per book type, location, author, and publication. 


create database ass2_1;
use ass2_1;

create table dim_booktype(
booktypeid int primary key,
booktype varchar(10)
);

insert into dim_booktype(booktypeid,booktype)
values (1,"fiction"),
		(2,"non-fiction");

create table dim_location(
locationid int primary key,
location varchar(50)
);

insert into dim_location(locationid,location)
values (3,"pune"),
(4,"nanded");

create table dim_author(
authorid int primary key,
authorname varchar(50),
authorage int,
authorcountry varchar(50)
);

insert into dim_author(authorid,authorname,authorage,authorcountry)
values (5,"bochya",25,"india"),
(6,"om",58,"india");

create table dim_publication(
publicationid int primary key,
publicationname varchar(50),
publicationcountry varchar(50),
publicationyear int
);

insert into dim_publication(publicationid,publicationname,publicationcountry,publicationyear)
values(7,"vu","india",2007),
(8,"viit","india",2009);

-- fact table
create table booksales(
booksalesid int primary key, 
booktypeid int,					-- from  dim_booktype
locationid int,					-- from dim_location
authorid int,					-- from dim_author
publicationid int,				-- from dim_publication
quantitysold int,				
profit decimal(10,2),
foreign key (booktypeid) references dim_booktype(booktypeid),
foreign key (locationid) references dim_location(locationid),
foreign key (authorid) references dim_author(authorid),
foreign key (publicationid) references dim_publication(publicationid)
);

INSERT INTO BookSales (BookSalesID, BookTypeID, LocationID, AuthorID, PublicationID, QuantitySold, Profit)
VALUES
  (1, 1, 1, 1, 1, 100, 5000),
  (2, 2, 2, 2, 2, 50, 2000),
  (3, 1, 1, 3, 3, 75, 3750),
  (4, 2, 2, 4, 4, 30, 1200),
  (5, 1, 1, 1, 1, 80, 4000),
  (6, 2, 2, 2, 2, 60, 2400),
  (7, 1, 1, 3, 3, 90, 4500),
  (8, 2, 2, 4, 4, 40, 1600),
  (9, 1, 2, 1, 1, 25, 1250),
  (10, 2, 1, 2, 2, 15, 600);
  
  select * from FactOrder;
  
  