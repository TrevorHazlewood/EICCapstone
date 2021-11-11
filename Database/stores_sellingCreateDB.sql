DROP DATABASE IF EXISTS Stores_Selling;
CREATE DATABASE Stores_Selling;
USE Stores_Selling;
DROP TABLE IF EXISTS Customer; 
CREATE TABLE Customer(customer_id varchar(25) NOT NULL,
                      PRIMARY KEY(customer_id),
					  first_name varchar(25),
					  middle_name varchar(25),
                      last_name varchar(25),
					  phone_country_code int(3),
					  phone int(11),
                      email varchar(30),
                      customer_notes varchar(200),
                      address_line_1 varchar(50),
                      address_line_2 varchar(50),
                      city varchar(30),
                      zip_code varchar(10),
                      country varchar(30)
					);
DROP TABLE IF EXISTS Products;
CREATE TABLE Products(product_id varchar(25),
					  PRIMARY KEY(product_id),
                      product_sku char(8),
                      product_price float,
                      product_name varchar(25),
                      product_quantity int,
                      product_description varchar(100),
                      image_url varchar(250)
                      );
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(order_id varchar(25) NOT NULL,
					PRIMARY KEY(order_id),
                    customer_id varchar(25),
                    order_status int,
                    datetime_order_placed datetime,
                    total_order_price float,
                    order_notes varchar(100),
					CONSTRAINT fk_cust FOREIGN KEY(customer_id)
						REFERENCES customer(customer_id)
                    );
DROP TABLE IF EXISTS Order_detail;
CREATE TABLE Order_detail(detail_id varchar(25),
						  PRIMARY KEY(detail_id),
                          order_id varchar(25),
                          product_id varchar(25),
                          quantity_purchased int,
                          CONSTRAINT fk_ords FOREIGN KEY(order_id)
							REFERENCES orders(order_id),
                          CONSTRAINT fk_prod FOREIGN KEY(product_id)
							REFERENCES products(product_id)
                          );


