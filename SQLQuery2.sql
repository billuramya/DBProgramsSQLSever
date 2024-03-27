CREATE DATABASE Address_Book;

USE Address_Book;
Create Table AddressBooks(
FirstName varchar(255),
LastName varchar(255),
_Address varchar(255),
City varchar(100),
_State varchar(100),
Zip varchar(255) ,
PhoneNumber varchar(255) ,
Email varchar(255));

drop table AddressBook;

insert Into AddressBooks(FirstName,LastName,_Address,City,_State,Zip,PhoneNumber,Email)
Values('Ramya','Billu','Tirupathi','Chittoor','AP','517620','6304796656','billuramya@gmail.com'),
       ('Jayanth','Ram','Vampalli','Guntur','AP','517345','8897799387','jayanthram@gmail.com'),
       ('Siva','Macha','Proddutur','Kadapa','AP','518520','9110349698','sivamach@gmail.com'),
       ('Ganesh','Macha','Tirupathi','Anamthapur','AP','517450','6303255718','ganesh234@gmail.com'); 

	   --inser new contact to the address book 

	insert into AddressBooks(FirstName,LastName,_Address,City,_State,Zip,PhoneNumber,Email)
	values ('Prasanna','Gunuguru','IBM','Vijayawada','AP',654784,87654897654,'gunuguruprasanna@gmail.com');

	-- Availability bo exist contact person using their name 

	update AddressBooks 
	set _State = 'Karnataka'
	where FirstName = 'Ganesh';

	-- Availability to delect person using person name 

	delete From AddressBooks 
	where FirstName ='Ramya'; 

	-- Availability to retrive the Person Belongs to a city or state from the address book 
	select *
	From AddressBooks 
	where City = 'Tirupathi' OR _State = 'AP'; 

	-- Availability to understand the size of address book by city and state (count)

	select count(City) as City_Count,
	count(_State) as StateCount
	from AddressBooks 
	where City ='Kadapa' and _State='AP';

	-- Availability to retrive the entities sorted Alphabeticaly by person's name by a given city
	select *
	from AddressBooks
	where City='Kadapa'
	order by FirstName ASC;


