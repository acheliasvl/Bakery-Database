create database bakerydb;
drop table SweetProducts;
drop table SaltyProducts;
drop table Orders;
drop table Customers;
drop table SweetOrderItems;
drop table SaltyOrderItems;

create table SweetProducts(
	ProductID int,
	Name varchar(50),
	Price float(2),
	flavor varchar(50),
	primary key(ProductID) 
); 

create table SaltyProducts(
	ProductID int,
	Name varchar(50),
	Price float(2),
	Filling varchar(50),
	primary key(ProductID)
);

create table Orders(
	OrderID int,
	CustomerID int,
	Date char(10),
	primary key(OrderID)
);


create table Customers(
	CustomerID int,
	FirstName varchar(15),
	LastName varchar(15),
	Contact varchar(50),
	primary key(CustomerID)
);

create table SweetOrderItems(
    OrderID int,
    ProductID int,
    Quantity int,
    primary key(OrderID, ProductID),
    foreign key (OrderID) references Orders(OrderID)
);

create table SaltyOrderItems(
    OrderID int,
    ProductID int,
    Quantity int,
    primary key(OrderID, ProductID),
    foreign key (OrderID) references Orders(OrderID)
);

