-- SALESPERSON DATA INSERT --

CREATE OR REPLACE FUNCTION add_salesperson(
    _salesperson_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR,
    _office_number VARCHAR,
    _email VARCHAR
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO salesperson(
    salesperson_id,
    first_name,
    last_name,
    office_number,
    email    
)VALUES(
	_salesperson_id,
    _first_name,
    _last_name,
    _office_number,
    _email
);
END;
$$
LANGUAGE plpgsql;


SELECT add_salesperson(1, 'Noah', 'Smith', '678-555-1234', 'nsmith@cardealership.com');
SELECT add_salesperson(2, 'Ian', 'Brown', '678-555-4321', 'ibrown@cardealership.com');
SELECT add_salesperson(3, 'Adam', 'Eisenhower', '678-555-4321', 'ibrown@cardealership.com');


SELECT * FROM salesperson

-- CUSTOMER DATA INSERT --

CREATE OR REPLACE FUNCTION add_customer(
    _customer_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR,
    _phone_number VARCHAR,
    _address VARCHAR,
    _billing_info VARCHAR
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO customer(
    customer_id,
    first_name,
    last_name,
    phone_number,
    address,
    billing_info
)VALUES(
	_customer_id,
    _first_name,
    _last_name,
    _phone_number,
    _address,
    _billing_info	
);
END;
$$
LANGUAGE plpgsql;

SELECT add_customer(
	1, 
	'Ala', 
	'Johnson', 
	'678-555-7536', 
	'987 Hwy 85 Ste 100, Riverdale, GA 30274',
	'7896-5412-3214-5864 658 05/26'
);
SELECT add_customer(
	2, 
	'Christian', 
	'Jackson', 
	'678-555-9514', 
	'451 Corners Mill Dr, Norcross, GA 30092',
	'7532-9548-7569-4123 987 02/27'
);

SELECT add_customer(
	3, 
	'Mike', 
	'Carter', 
	'678-555-3578', 
	'654 Powder Springs Rd, Powder Springs, GA 30127',
	'5519-7865-1456-1277 153 12/24'
);

SELECT add_customer(
	4,
	'Gil', 
	'Clinton', 
	'678-555-78454', 
	'153 Cedar Point Ct, Marietta, GA 30008',
	'9536-5148-9532-7523 98 06/22'
);

SELECT * FROM customer

-- MECHANIC DATA INSERT --

CREATE OR REPLACE FUNCTION add_mechanic(
    _mechanic_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO mechanic(
    mechanic_id,
    first_name,
    last_name    
)VALUES(
	_mechanic_id,
    _first_name,
    _last_name 
);
END;
$$
LANGUAGE plpgsql;

SELECT add_mechanic(1, 'Kagondu', 'Washington');
SELECT add_mechanic(2, 'Nathan', 'Hamilton');
SELECT add_mechanic(3, 'Marcus', 'Grant');

SELECT * FROM mechanic

-- CAR PART DATA INSERT --

CREATE OR REPLACE FUNCTION add_car_parts(
    _parts_id INTEGER,
    _part_number VARCHAR,
    _description VARCHAR,
    _parts_price NUMERIC
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO car_parts(
    parts_id,
    part_number,
    description,
    parts_price
)VALUES(
	_parts_id,
    _part_number,
    _description,
    _parts_price 
);
END;
$$
LANGUAGE plpgsql;

ALTER TABLE car_parts
ADD parts_price NUMERIC(8,2);

SELECT add_car_parts(1234, 'SKU123789', 'CV Joint Boot', '50.00');
SELECT add_car_parts(5678, 'SKU456321', 'Spoiler', '200.00');
SELECT add_car_parts(9876, 'SKU956214', 'Electric Motor', '7000.00');
SELECT add_car_parts(5432, 'SKU659162', 'Floor Mats', '60.00');

SELECT * FROM car_parts

-- CAR DATA INSERT --

CREATE OR REPLACE FUNCTION add_car(
    _car_id INTEGER,
	_customer_id INTEGER,
    _vin_number VARCHAR,
	_year NUMERIC,
    _make VARCHAR,
    _model VARCHAR,
    _color VARCHAR,
    _condition VARCHAR,
	_price NUMERIC
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO car(
    car_id,
	customer_id,
    vin_number,
	"year",
    make,
    model,
    color,
	"condition",
    price
)VALUES(
	_car_id,
	_customer_id,
    _vin_number,
	_year,
    _make,
    _model,
    _color,
	_condition,
    _price
);
END;
$$
LANGUAGE plpgsql;

SELECT add_car(1, 3, 'KDNSUS15636SVWU', '2021', 'BMW', 'M5', 'Blue', 'New', 76000.00);
SELECT add_car(2, 2, '9HERPARA5696199', '2021', 'Mercedes Benz', 'CLS 450', 'Silver', 'New', 70000.00);
SELECT add_car(3, 4, '7LESJH164ZDGV16', '2021', 'Tesla', 'PLAID Model S', 'Red', 'Used', 83000.00);
SELECT add_car(4, 1, '4MAXSIPKHEM3685', '2019', 'Porsche', 'Taycan Turbo S', 'White', 'Used', 92000.00);
SELECT add_car(5, NULL, 'GHBVJKR78215499', '2020', 'Audi', 'A8', 'Black', 'Used', 60000.00);
SELECT add_car(6, NULL, '9HERPARA5696199', '2021', 'Mercedes Benz', 'S AMG53', 'Gray', 'New', 95000.00);
SELECT add_car(7, NULL, 'KJMBGF634697654', '2018', 'Audi', 'R8', 'Blue', 'Used', 90000.00);
SELECT add_car(8, NULL, '1KJBGG76849H017', '2021', 'Lexus', 'LS', 'Tan', 'New', 78000.00);

SELECT * FROM car

UPDATE car
SET car_id = 5
WHERE car_id = 55;

-- LABOR INVOICE DATA INSERT --

CREATE OR REPLACE FUNCTION add_labor_invoice(
    _labor_id INTEGER,
	_mechanic_id INTEGER,
    _hours NUMERIC,
    _rate NUMERIC
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO labor_invoice(
    labor_id,
	mechanic_id,
	hours,
    rate
)VALUES(
	_labor_id,
	_mechanic_id,
    _hours,
    _rate
);
END;
$$
LANGUAGE plpgsql;

SELECT add_labor_invoice(1, 3, 3.00, 20.00);
SELECT add_labor_invoice(2, 1, 12.00, 25.00);
SELECT add_labor_invoice(3, 2, 12.00, 35.00);

SELECT * FROM labor_invoice

-- SALES DATA INSERT --

CREATE OR REPLACE FUNCTION add_sales_invoice(
    _invoice_id INTEGER,
    _sale_date DATE,
	_car_id INTEGER,
	_customer_id INTEGER,
	_salesperson_id INTEGER
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO sales_invoice(
    invoice_id,
    sale_date,
	car_id,
	customer_id,
	salesperson_id
)VALUES(
	_invoice_id,
    _sale_date,
	_car_id,
	_customer_id,
	_salesperson_id
);
END;
$$
LANGUAGE plpgsql;

SELECT add_sales_invoice(1, '2021/07/31', 2, 2, 1);
SELECT add_sales_invoice(2, '2021/03/25', 4, 1, 3);
SELECT add_sales_invoice(3, '2021/01/01', 3, 4, 2);

SELECT * FROM sales_invoice

-- SERVICE TICKET DATA INSERT --
	
CREATE OR REPLACE FUNCTION add_service_ticket(
    _service_ticket_id INTEGER,
	_car_id INTEGER,
	_customer_id INTEGER,
	_parts_id INTEGER,
	_labor_id INTEGER,
    _date_recieved DATE,
    _date_returned DATE,
	_amount NUMERIC
)
RETURNS void 
AS $$
BEGIN
	INSERT INTO service_ticket(
    service_ticket_id,
	car_id,
	customer_id,
	parts_id,
	labor_id,
    date_recieved,
    date_returned,
	amount
)VALUES(
	_service_ticket_id,
	_car_id,
	_customer_id,
	_parts_id,
	_labor_id,
    _date_recieved,
    _date_returned,
	_amount 
);
END;
$$
LANGUAGE plpgsql;

ALTER TABLE service_ticket
ADD amount NUMERIC(9,2);

SELECT add_service_ticket(1, 3, 3, 5432, NULL, NULL, NULL, 60.00);
SELECT add_service_ticket(2, 2, 2, 5678, 1, '2021/07/31', '2021/07/31', 260.00);
SELECT add_service_ticket(3, 3, 4, 9876, 2, '2021/05/15', '2021/05/16', 7000.00);
SELECT add_service_ticket(3, 3, 4, 9876, 3, '2021/05/15', '2021/05/16', 7000.00);

