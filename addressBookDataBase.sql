# UC1: create database and show database
create database address_book;
show databases;
use address_book;
select database();
#=====================================================================================#
# UC2: create table
create table address_book_service(
     first_name varchar(30) not null,
     last_name varchar(30) not null,
     address varchar(150) not null,
     city varchar(20) not null,
     state varchar(20) not null,
     zip varchar(10) not null,
     phone_no varchar(12) not null,
     email varchar(50) not null);
#=====================================================================================#
# UC3: insert contacts
insert into address_book_service(first_name, last_name, address, city, state, zip,phone_no, email) values
			('Nilesh','Kotkar','Bhadgaon','Jalgaon','maharastra','424105','8766483622','nilesh46@gmail.com'),
            ('manoj','patil','lamkani','dhule','maharastra','422521','9652314568','manoj56@gmail.com'),
            ('ravi','sharma','malegaon','nashik','maharastra','452365','8745662315','rs@gmail.com');
select * from address_book_service;
#=====================================================================================#
# UC4: Edit Contact using name
update address_book_service set last_name = 'patel'
       where first_name = 'kunal';
select * from address_book_service;
#=====================================================================================#
# UC5: delete contact using person name
delete from address_book_service 
       where first_name = 'ravi';
select * from address_book_service;
#=====================================================================================#
#UC6: Retrieve Person belonging to a City or State from the Address Book
select * from address_book_service where 
         city = 'Bhadgaon' or state = 'maharastra';
#=====================================================================================#        
#UC7: size of address book by City and State
select count(city),count(state) from address_book_service;
#=====================================================================================#
#UC8: retrieve entries sorted alphabetically by Person’s name for a given city
select * from address_book_service order by first_name;
select * from address_book_service order by first_name desc;
#=====================================================================================#
# UC9: identify address book with name and type
CREATE TABLE Address_book_details(
srNo int AUTO_INCREMENT,
type varchar(30),
PRIMARY KEY(srNo)
);

insert into Address_book_details (type) values
			('Family'),('Friend'),('Profession');
            
SELECT * FROM Address_book_details;

CREATE TABLE relation(
book_name varchar(30) ,
srNo int, 
PRIMARY KEY(book_name)
);

insert into relation (book_name,srNo) values
	         ('book_no.1',2),('book_no.2',1),('book_no.3',3);
alter table relation add foreign key(srNo) references Address_Book(srNo);

alter table address_book_service add book_name varchar(30) first;
SELECT * FROM address_book_service;
alter table address_book_service add foreign key(book_name) references relation(book_name);