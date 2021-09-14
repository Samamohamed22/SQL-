create database Malaysia_Airlines_Reservation_System;
use Malaysia_Airlines_Reservation_System;

create table AIRLINE(
Airline_No nvarchar(10) not null primary key,
Airline_Name varchar(30),
NO_Of_Flights int
);
insert into  AIRLINE values 

('PA2098','peak Airways',1),
('EA1709','Echo Airline',4),
('CA8760', 'Core Airways',7),
('SA1865','Spark Airways',8);



select * from AIRLINE 

create table STATE(
State_code varchar(20) not null primary key,
State_name varchar(20),
Airport_name varchar(30)
);

insert into  STATE values 

('PE01','Perak','Kuala Lumpur'),
('NE02','Negeri Sembilan','Kuala Lumpur'),
('PA03','Pahang','Alor Setar airport'),
('SA04','Sarawak','Bintiulo airport'),
('WL05','Wilayah','Kuantan airport'),
('SA06','Sabah','Kuchang airport'),
('SL07','Selangor','Kuala Lumpur'),
('AL08','Alaska','Virginia Airport'),
('ALB09','Alabama','Alabama Airport'),
('CA010','california','California airport'),
('CO011','Colarado','Colarado Airport');


select * from STATE

create table Pilot
(
Pilot_ID varchar(20) not null primary key,
Airline_No nvarchar(10),
Pilot_First_Name nvarchar(20),
Pilot_Last_Name nvarchar(20),
DOB date,
Experience_in_HRS int ,
Current_age int ,
Position varchar(20),
Flying_hours varchar(20),
Pilot_Salary int,

foreign key (Airline_No) references AIRLINE (Airline_No),
);


insert into PILOT values 

('00F','CA8760','Sayed','Magdy','May 25 ,1999',30000 ,37,'Pilot','30,000 HRS',10000 ),
('002','SA1865','Michal ','Faris','April 4,1998',40000 ,34,'Pilot','12,000 HRS',11000),
('005','PA2098','Jushwa','Sanuel','May 5,1997',50000 ,45,'Pilot','40,000 HRS',14000),
('00N','SA1865','Noor','Hafizah','June 6,1997',20000 ,45,'Pilot','11,000 HRS',10000 ),
('006','EA1709','Hassan','Nemir','May 13,1997',10000,34,'Pilot','50,000 HRS',8000 ),
('001','SA1865','John','Nemir','July 3,1998',10000,28,'Pilot','11,000 HRS',8000 ),
('003','CA8760','Ramy','Michal','April 12,1999',11000 ,50,'Pilot','25,000 HRS',7000 ),
('00G','PA2098','Fahd','Nemir','june 6,1995',10000 ,45,'Pilot','11,000 HRS',16000 ),
('009','SA1865','ismail','Hany','March 6,1999',50000 ,23,'Pilot','17000 HRS',10000 ),
('010','EA1709','Mohamed','Hany','August 8,1999',10000,45,'Pilot','23000 HRS',7000 ),
('012','SA1865','Mohamed','Ahmed','July 7 ,1999',10000,25,'Pilot','15,000 HRS',14000 );


select * from PILOT

create table FLIGHT
(
Flight_No varchar(20) not null primary key,
Airline_No nvarchar(10),
Pilot_ID varchar(20),
Economy_seats varchar(30),
Business_seats varchar(30),
Arrival_time varchar(20), 
Arrival_date varchar(20),
Departure_time varchar(20),
Departure_date varchar(20),
Origin varchar(30),
Destination varchar(30),
Distance varchar(40),
foreign key (Airline_No) references AIRLINE (Airline_No),
foreign key (Pilot_ID) references PILOT (Pilot_ID),
);

insert into FLIGHT values

('00R','PA2098','00F',15,7, '12 AM ','30 May' ,'5 PM','2 june','Kuala Lumpur','Virginia','5000 KM'),
('00L','EA1709','002',17,9,  '3 AM', '4 june', '3 PM','7 june','Selangor','Spain','4500 KM'),
('00H','PA2098','005',18,16,'4 AM ','5 june','5 PM','7 june','Kuala Lumpur','New York','5600 KM'),
('00M','PA2098','00N',15,7, '6 AM ','9 May','5 PM','10 may','Selangor','New York','6600 KM'),
('00J','CA8760','006',20,12, '9 AM ','9 april','9 PM','11 april','Selangor','New York','9600 KM'),
('00U','SA1865','001',19,13,'5 AM', '7 june','10 PM','9 june', 'Selangor','New York','5600 KM'),
('00P','PA2098','003',18,17,'8 AM', '9 june','4 PM','11 june','Selangor','New York','7000 KM'),
('00T','EA1709','00G',17,9,'6 AM', '4 july', '3 PM','7 july','Selangor','Spain','9500 KM'),
('00G','EA1709','009',20,16, '3 AM', '4 june', '3 PM',' 5 june','Selangor','Spain','7500 KM'),
('010','SA1865','010',15,13,'5 AM', '9 june','11 PM','10 june','Selangor','New York','5600 KM');

select * from FLIGHT


create table BOOKING(

Booking_No nvarchar(10) not null primary key,
Cust_ID nvarchar(20),
Booking_state varchar(20),
Booking_date date,
Flight_No varchar(20),
Seat_booked int,
Total_charges int,
Departure_state varchar(20),
foreign key (Cust_ID) references CUSTOMER (Cust_ID),
foreign key (Flight_No) references FLIGHT (Flight_No)
);

insert into BOOKING values
('B01','TP061180','Perak','12 May ,2021','00R',279,2000,'Pahang' ),
('B02','TP567887','Negeri Sembilan','13 may,2021','00L',200,4000 ,'Perak'),
('B03','TP087998','Sarawak','14 April,2013 ','00H',258,4500 ,'Pahang'),
('B04','TP876555','Wilayah','15 September,2021','00M',289,2000,'Negeri Sembilan' ),
('B05','TP876585','Sarawak','12 october,2021','00J',280,3000 ,'Selangor'),
('B06','TP098765','Selangor','5 august,2021','00U',290,3000,'Negeri Sembilan'),
('B07','TP098874','Perak','12 april ,2021','00P',289,1000,'Pahang' ),
('B08','TP098873','Selangor','1 May,2021','00T',250,4000,'Wilayah' ),
('B09','TP098872','Wilayah','3 April,2021','00G',289,5000 ,'Negeri Sembilan'),
('B10','TP098871','Sarawak','6 May,2021','010',300,6000,'Pahang' );


select * from BOOKING 

create table CUSTOMER(
Cust_ID nvarchar(20) not null primary key,
Cust_Email nvarchar(30),
State_code varchar(20),
First_name varchar(30),
Last_name varchar(30),
Phone_no int,
Street varchar(20),
City varchar(20),
Postal_code varchar(20),
Country varchar(20),
Total_cust_booking int,
foreign key (State_code) references STATE (State_code)
);

Insert into CUSTOMER values 

('TP061180','sama@gmail.com','PE01', 'Sama ','Mohamed',0182629145,'one South','QueenTown','43300','KL',1),
('TP567887','Mohamed@hotmail.com','AL08', 'Mohamed','Fawzy',01223193186,'5th settelment','Wingston','43355','Cyberjaya',2),
('TP087998','Gamal@gmail.com','PE01','Gamal','Willy',01224356789,'ParkHill','Arkney','87790','kl','3'),
('TP876555','Ismail_Hany@gmail.com','SA04','Ismail','Hany',01226768987,'first settelment','Wingston','43300','Cyberjaya',1),
('TP876585','Mohamed_Hany@gmail.com','PE01','Mohamed','Hany',01223187987,'Flexis','QueenTown','65577','KL',3),
('TP098765','Jushwa_Samuel@gmail.com','AL08','Jushua','Samuel',0122765678,'one south ','Arkney','43300','KL',2),
('TP098874','Marry@gmail.com','PE01','Marry','Mark',0122657876,'ParkHill','Azmar','87790','kl',3),
('TP098873','Mohamed_Samy@gmail.com','PE01','Mohamed','Sany',088765678,'5th settelment','Aramoor','43355','Cyberjaya',4),
('TP098872','Dewi@gmail.com','SA04', 'Dewi ','Mohamed',0766545678,'one South','QueenTown','43300','KL',1),
('TP098871','jamila_Mohamed@gmail.com','WL05','Jamila','Willy',0988767890,'ParkHill','Arkney','87790','kl',2);

select * from CUSTOMER 


create table FLIGHT_ATTTENDANT
(
Attendant_ID varchar(20) not null primary key,
Airline_No nvarchar(10),
Att_First_name varchar(30),
Att_Last_name varchar(30),
Att_position varchar(20),
Att_salary int,
Att_phone_no int,
Street varchar(20),
City varchar(20),
Postal_code varchar(20),
Country	varchar(20),
foreign key (Airline_No) references airline (airline_no)
);

insert into FLIGHT_ATTTENDANT values 

('G0G','CA8760','Hassan','Nemir','Flight Attendant',2349,01223617876,'one south','Spring Feild','43300','Malaysia'),
('P0P','EA1709','Callie','Mourad','Flight Attendant',2348,01223678765,'Frying Pan','Franklin','43300','US'),
('H0H','CA8760','Moataz','Magdy','Flight Attendant',3349,01227478987,'ParkHill','GreenVile','43300','Malaysia'),
('T0T','PA2098','Badr','Islam','Flight Attendant',8349,01264664776 ,'Flexis','Washington','45500','US'),
('I0I','EA1709','Mariam','Hassan','Flight Attendant',9349,01336767689 ,'TPM','NewYork City','43800','NewYork'),
('Y0Y','PA2098','Ramy','Gamal','Flight Attendant',7349,01266575678 ,'Senderson','Moscow','43300','France'),
('l0l','PA2098','Sara','Mohamed','Flight Attendant',7349,0126636398, 'Flexis ','Tokyo','43300','Japan'),
('U0U','CA8760','Noha','Magdy','Flight Attendant',6349,01223736738 ,'Garden','Barcelona','6575','Spain'),
('R0R','PA2098','Ramy','Ahmed','Flight Attendant',4349,0127377654 ,'Senderson','Paris','43300','France'),
('E0E','EA1709','Barbara','Kamil','Flight Attendant',2349,097555546 , 'one south','Dubai','43300','Dubai');

select * from FLIGHT_ATTTENDANT



create table PAYMENT(
Payment_id int,
payment_type varchar(10),
Cust_ID nvarchar(20),
foreign key (Cust_ID) references CUSTOMER (Cust_ID)
);

insert into PAYMENT values
(456,'Visa','TP061180'),
(987,'Visa','TP087998'),
(345,'Debit Card','TP098765'),
(864,'Cash','TP098871'),
(789,'Cash','TP098872'),
(098,'Visa','TP098873'),
(567,'Debit','TP098874'),
(024,'Visa','TP567887'),
(865,'Visa','TP876555'),
(586,'Visa','TP876585');

select * from PAYMENT 


/*create table Captain(
Pilot_ID varchar(20) not null primary key,
Promotion_year INT,
foreign key (Pilot_ID) references PILOT (Pilot_ID)
);*/

/*insert into Captain values */


create table CO_PILOT(
CO_Pilot_ID varchar(20) not null primary key,
Pilot_ID varchar(20) ,
Year_employeed INT,

foreign key (Pilot_ID) references PILOT (Pilot_ID)
);

insert into CO_PILOT values 
('TP01','001', 2014),
('TP02','002',2015),
('TP03','003',2016),
('TP04','005',2018),
('TP05','006',2014),
('TP06','009',2018),
('TP07','00F',2014),
('TP08','00G',2019),
('TP010','00N',2020),
('TP09','010',2021);

select * from CO_PILOT

select avg(Pilot_Salary) as "The averege salary for The pilots who have exceeded 20000"
from PILOT where Experience_in_HRS > 20000;


select Pilot_Salary from PILOT; 
select Experience_in_HRS  from PILOT;


select Pilot_First_Name,Pilot_Last_Name,Experience_in_HRS 
,PILOT.Airline_No ,Current_age from PILOT  inner join FLIGHT  on PILOT.Pilot_ID=FLIGHT.Pilot_ID 
where PILOT.Airline_No ='SA1865';
 
select* from AIRLINE;


select Airline_Name, No_of_Flights from AIRLINE where No_of_Flights = (select max (No_of_Flights) from AIRLINE)
group by No_of_Flights,Airline_Name;

select * from AIRLINE


select First_name,Last_name from CUSTOMER  where Total_cust_booking>2  


select* from CUSTOMER

select *  from FLIGHT  where Business_seats=(select max(Business_seats)from FLIGHT);


select FLIGHT.Airline_No,Airline_Name, COUNT(*) AS Totalflight  from  FLIGHT, AIRLINE  where FLIGHT.Airline_No = AIRLINE.Airline_No 

group by FLIGHT.Airline_No,Airline_Name; 



select MAX(Att_salary) AS highest_salary  from FLIGHT_ATTTENDANT;  


select Att_First_name,Att_Last_name,Att_position from FLIGHT_ATTTENDANT where Att_salary!= 2800 AND Att_salary!= 3500; 


select First_name,Last_name from  CUSTOMER  where  Total_cust_booking = (select max(Total_cust_booking) from CUSTOMER); 


 


 