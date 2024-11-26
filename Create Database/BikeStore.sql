-- Create bike store's database
CREATE DATABASE BikeStore;

-- Select bike store's database
USE BikeStore;

-- Create several database schemas
CREATE SCHEMA sales;
CREATE SCHEMA production;

-- Create brand's table
CREATE TABLE production.brands
(
	brand_id INT NOT NULL PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL
);

-- Create categories table
CREATE TABLE production.categories
(
	category_id INT NOT NULL PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

-- Create customer's table
CREATE TABLE sales.customers (
	customer_id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (255),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (255),
	[state] VARCHAR (255),
	zip_code VARCHAR (255)
);

-- Create order item's table
CREATE TABLE sales.order_items(
	order_id INT NOT NULL,
	item_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL
);

-- Create order's table
CREATE TABLE sales.orders (
	order_id INT NOT NULL PRIMARY KEY,
	customer_id INT,
	order_status tinyint NOT NULL, -- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date VARCHAR (255) NOT NULL,
	required_date VARCHAR (255) NOT NULL,
	shipped_date VARCHAR (255),
	store_id INT NOT NULL,
	staff_id INT NOT NULL
);

-- Create product's table
CREATE TABLE production.products (
	product_id INT NOT NULL PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year INT NOT NULL,
	list_price VARCHAR (255) NOT NULL
);

-- Create staff's table
CREATE TABLE sales.staffs (
	staff_id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (255),
	active INT NOT NULL,
	store_id INT NOT NULL,
	manager_id INT
);

-- Create stock's table
CREATE TABLE production.stocks (
	store_id INT,
	product_id INT,
	quantity INT
);

-- Create store's table
CREATE TABLE sales.stores (
	store_id INT NOT NULL PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (255),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	[state] VARCHAR (255),
	zip_code VARCHAR (255)
);
