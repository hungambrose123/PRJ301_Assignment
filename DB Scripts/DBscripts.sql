create table Account(
	id int primary key,
	username nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(50)
)

create table Account_session(
	id int primary key,
	account_id int foreign key references Account(id)
)

create table Product_category(
	id int primary key,
	name nvarchar(10)
)

create table Product(
	id int primary key,
	name nvarchar(50),
	price int,
	image nvarchar(200),
	description nvarchar(200),
	category_id int foreign key references  Product_category(id)
)

create table Shopping_cart(
	id int primary key,
	session_id int,
	product_id int,
	constraint Shopping_session foreign key (session_id)  references Account_session(id),
	constraint Product_info foreign key (product_id) references Product(id)
)

create table Order_details(
	id int primary key,
	total int,
	payment_id int,
	account_id int foreign key references Account(id)
)

create table Payment_details(
	id int primary key,
	amount int,
	status int,
	order_id int foreign key references Order_details(id)
)

create table Order_items(
	id int primary key,
	order_id int,
	product_id int,
	constraint order_belong_to foreign key (order_id) references Order_details(id),
	constraint order_products foreign key (product_id) references Product(id)
)