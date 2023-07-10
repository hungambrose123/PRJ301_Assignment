go master
create database VanPhongPham

create table Account(
	id int identity(1,1) primary key not null,
	username nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(50)
)

create table Product_category(
	id int primary key not null,
	name nvarchar(50) not null
)

create table Product(
	id int identity(1,1) primary key not null,
	name nvarchar(50),
	price int,
	image nvarchar(200),
	description nvarchar(200),
	category_id int foreign key references  Product_category(id) not null
)

create table Order_details(
	id int identity(1,1) primary key not null,
	total int,
	payment_id int,
	account_id int foreign key references Account(id)
)

create table Payment_details(
	id int identity(1,1) primary key not null,
	amount int,
	status int,
	order_id int foreign key references Order_details(id) not null
)

create table Order_items(
	id int identity(1,1) primary key not null, 
	order_id int not null,
	product_id int not null,
	quantity int,
	constraint order_belong_to foreign key (order_id) references Order_details(id),
	constraint order_products foreign key (product_id) references Product(id)
)