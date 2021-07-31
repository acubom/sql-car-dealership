-- SALESPERSON TABLE CREATION --

CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "office_number" VARCHAR(15),
  "email" VARCHAR(50),
  PRIMARY KEY ("salesperson_id")
);

-- CUSTOMER TABLE CREATION --

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "phone_number" VARCHAR(15),
  "address" VARCHAR(100),
  "billing_info" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

-- MECHANIC TABLE CREATION --

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("mechanic_id")
);

-- CAR PART TABLE CREATION --

CREATE TABLE "car_parts" (
  "parts_id" SERIAL,
  "part_number" INTEGER,
  "description" VARCHAR(100),
  "parts_price" NUMERIC(8,2),
  PRIMARY KEY ("parts_id")
);

-- CAR DATA TABLE CREATION --

CREATE TABLE "car" (
  "car_id" SERIAL,
  "customer_id" INTEGER,
  "vin_number" VARCHAR(17),
  "year" NUMERIC(4),
  "make" VARCHAR(50),
  "model" VARCHAR(50),
  "color" VARCHAR(50),
  "condition" VARCHAR(10),
  "price" NUMERIC(8,2),
  PRIMARY KEY ("car_id"),
  CONSTRAINT "FK_car.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
);

-- LABOR INVOICE TABLE CREATION --

CREATE TABLE "labor_invoice" (
  "labor_id" SERIAL,
  "mechanic_id" INTEGER,
  "hours" NUMERIC(20),
  "rate" NUMERIC(5,2),
  PRIMARY KEY ("labor_id"),
  CONSTRAINT "FK_labor_invoice.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id")
);

-- SALES TABLE CREATION --

CREATE TABLE "sales_invoice" (
  "invoice_id" SERIAL,
  "sale_date" DATE,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "salesperson_id" INTEGER,
  PRIMARY KEY ("invoice_id"),
  CONSTRAINT "FK_sales_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_sales_invoice.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "car"("car_id"),
  CONSTRAINT "FK_sales_invoice.salesperson_id"
    FOREIGN KEY ("salesperson_id")
      REFERENCES "salesperson"("salesperson_id")
);



-- SERVICE TICKET TABLE CREATION --

CREATE TABLE "service_ticket" (
  "service_ticket_id" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "parts_id" INTEGER,
  "labor_id" INTEGER,
  "date_recieved" DATE,
  "date_returned" DATE,
  "billing" NUMERIC(9,2),
  PRIMARY KEY ("service_ticket_id"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service_ticket.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "car"("car_id"),
  CONSTRAINT "FK_service_ticket.parts_id"
    FOREIGN KEY ("parts_id")
      REFERENCES "car_parts"("parts_id"),
  CONSTRAINT "FK_service_ticket.labor_id"
    FOREIGN KEY ("labor_id")
      REFERENCES "labor_invoice"("labor_id")
);