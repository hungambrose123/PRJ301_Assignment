create table Account(
	id int identity(1,1) primary key not null,
	username nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(50)
)

create table Account_session(
	id int identity(1,1) primary key not null,
	account_id int foreign key references Account(id) not null
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

create table Shopping_cart(
	id int identity(1,1) primary key not null,
	session_id int,
	product_id int,
	constraint Shopping_session foreign key (session_id)  references Account_session(id),
	constraint Product_info foreign key (product_id) references Product(id)
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
	constraint order_belong_to foreign key (order_id) references Order_details(id),
	constraint order_products foreign key (product_id) references Product(id)
)