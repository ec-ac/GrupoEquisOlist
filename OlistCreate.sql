--Grupo Equis - Ernesto Alaniz y Gabriel Chang
BEGIN
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Olist') 
CREATE DATABASE Olist;
END


BEGIN
	USE Olist;
END


BEGIN
	DROP TABLE IF EXISTS order_payments;
	DROP TABLE IF EXISTS orders;
	DROP TABLE IF EXISTS order_reviews;
	DROP TABLE IF EXISTS leads_qualified;
	DROP TABLE IF EXISTS leads_closed;
	DROP TABLE IF EXISTS customers;
	DROP TABLE IF EXISTS order_items;
	DROP TABLE IF EXISTS sellers;
	DROP TABLE IF EXISTS geolocation;
	DROP TABLE IF EXISTS products;
	DROP TABLE IF EXISTS product_category_name_translation;
END


BEGIN
		CREATE TABLE order_payments (
		order_id INT,
		payment_sequential INT,
		product_id INT,
		payment_type NVARCHAR(50),
		payment_value DECIMAL(10, 2),
		payment_installments INT
	);

	CREATE TABLE orders (
		order_id INT,
		customer_id INT,
		order_status NVARCHAR(50),
		order_purchase_timestamp DATETIME,
		order_approved_at DATETIME,
		order_delivered_carrier_date DATETIME,
		order_delivered_customer_date DATETIME,
		order_estimated_delivery_date DATETIME,
		price DECIMAL(10, 2),
		freight_value DECIMAL(10, 2)
	);

	CREATE TABLE order_reviews (
		review_id INT,
		order_id INT,
		review_score INT,
		review_comment_title NVARCHAR(50),
		review_comment_message NVARCHAR(200),
		review_creation_date DATETIME,
		review_answer_timestamp DATETIME,
		geolocation_zip_code_prefix NVARCHAR(10),
		geolocation_lat DECIMAL(10, 8),
		customer_city NVARCHAR(50),
		customer_state NVARCHAR(50),
		sr_id INT,
		won_date DATETIME,
		business_segment NVARCHAR(50),
		lead_type NVARCHAR(50),
		lead_behaviour_profile NVARCHAR(50),
		has_company BIT,
		has_gtin BIT,
		average_stock DECIMAL(10, 2),
		business_type NVARCHAR(50),
		declared_product_catalog_size INT,
		declared_monthly_revenue DECIMAL(10, 2)
	);

	CREATE TABLE leads_qualified (
		mql_id INT,
		first_contact_date DATETIME,
		landing_page_id NVARCHAR(50),
		origin NVARCHAR(50)
	);

	CREATE TABLE leads_closed (
		seller_id INT,
		seller_zip_code_prefix NVARCHAR(10),
		mql_id INT,
		seller_city NVARCHAR(50),
		seller_state NVARCHAR(50),
		sdr_id INT
	);

	CREATE TABLE customers (
		customer_id INT,
		customer_unique_id NVARCHAR(50),
		customer_zip_code_prefix NVARCHAR(10)
	);

	CREATE TABLE order_items (
		order_id INT,
		order_item_id INT,
		product_id INT,
		seller_id INT,
		shipping_limit_date DATETIME
	);

	CREATE TABLE sellers (
		seller_id INT,
		seller_zip_code_prefix NVARCHAR(10),
		seller_city NVARCHAR(50),
		seller_state NVARCHAR(50),
        CONSTRAINT PK_seller_id PRIMARY KEY (seller_id)
	);

	CREATE TABLE geolocation (
		geolocation_zip_code_prefix NVARCHAR(10),
		geolocation_lat DECIMAL(10, 8),
		geolocation_Ing NVARCHAR(50),
		geolocation_city NVARCHAR(50),
		geolocation_state NVARCHAR(50)
	);

	CREATE TABLE products (
		product_id INT,
		product_category_name NVARCHAR(50),
		product_name_lenght INT,
		product_description_lenght INT,
		product_photos_qty INT,
		product_weight_g DECIMAL(10, 2),
		product_length_cm DECIMAL(10, 2),
		product_height_cm DECIMAL(10, 2),
		product_width_cm DECIMAL(10, 2),
		product_category_name_translation NVARCHAR(50),
		product_category_name_english NVARCHAR(50)
	);

	CREATE TABLE product_category_name_translation (
		product_category_name NVARCHAR(50),
		product_category_name_english NVARCHAR(50)
	);
END
