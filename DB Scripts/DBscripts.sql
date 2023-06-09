create table Account(
	id int primary key,
	username nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(50)
)