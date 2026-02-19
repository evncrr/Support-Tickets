-- Create database
CREATE DATABASE IF NOT EXISTS support_tickets;
USE support_tickets;

-- Drop table if exists
DROP TABLE IF EXISTS tickets;

-- Create table
CREATE TABLE tickets (
    Ticket_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Customer_Email VARCHAR(100),
    Customer_Age INT,
    Customer_Gender VARCHAR(20),
    Product_Purchased VARCHAR(100),
    Date_of_Purchase DATE,
    Ticket_Type VARCHAR(50),
    Ticket_Subject VARCHAR(255),
    Ticket_Description TEXT,
    Ticket_Status VARCHAR(50),
    Resolution TEXT,
    Ticket_Priority VARCHAR(50),
    Ticket_Channel VARCHAR(50),
    First_Response_Time DATETIME NULL,
    Time_to_Resolution DATETIME NULL,
    Customer_Satisfaction_Rating FLOAT NULL
);

-- Optional: create indexes for performance
CREATE INDEX idx_customer_email ON tickets(Customer_Email);
CREATE INDEX idx_ticket_priority ON tickets(Ticket_Priority);
CREATE INDEX idx_ticket_channel ON tickets(Ticket_Channel);
CREATE INDEX idx_product ON tickets(Product_Purchased);
CREATE INDEX idx_ticket_status ON tickets(Ticket_Status);
CREATE INDEX idx_date_of_purchase ON tickets(Date_of_Purchase);
